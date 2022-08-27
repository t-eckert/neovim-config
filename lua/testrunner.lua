local test_ns = vim.api.nvim_create_namespace("testrunner")

-- Generic function to attach a test running command to an environment.
-- The attached command will run everytime a save event happens.
local attach_testrunner = function(buffer_number, pattern, test_command, options)
	local state = {
		buffer_number = buffer_number,
		tests = {}
	}

	-- Create the autocommand
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = vim.api.nvim_create_augroup(string.format("testrunner-%s", buffer_number), { clear=true }),
		pattern = pattern,
		callback = function()
			vim.api.nvim_buf_clear_namespace(buffer_number, test_ns, 0, -1)

			state = {
				buffer_number = buffer_number,
				tests = {}
			}

			vim.fn.jobstart(test_command, options(state))
		end,
	})
end

-----------------------------------------------------------------------------------------------------------------------
-- Go -----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

-- LSP query for a Go test.
local go_test_function_query_string = [[
(
 (function_declaration
  name: (identifier) @name
  parameters:
    (parameter_list
     (parameter_declaration
      name: (identifier)
      type: (pointer_type
          (qualified_type
           package: (package_identifier) @_package_name
           name: (type_identifier) @_type_name)))))
 (#eq? @_package_name "testing")
 (#eq? @_type_name "T")
 (#eq? @name "%s")
)
]]

-- Use the LSP to find the line in the buffer matching the given test name.
local go_find_line = function(buffer_number, name)
	local query = vim.treesitter.parse_query("go", string.format([[
		(
			(function_declaration
				name: (identifier) @name
				parameters: (
					parameter_list (parameter_declaration name: (identifier) type: (pointer_type
						(qualified_type
						package: (package_identifier) @_package_name
						name: (type_identifier) @_type_name)))))

			(#eq? @_package_name "testing")
			(#eq? @_type_name "T")
			(#eq? @name "%s")	
		)
	]], name))
	local parser = vim.treesitter.get_parser(buffer_number, "go", {})
	local tree = parser:parse()[1]
	local root = tree:root()

	for id, node in query:iter_captures(root, buffer_number, 0, -1) do
		if id == 1 then
			local range = { node:range() }
			return range[1]
		end
	end
end

local go_buffer_number = 0
local go_pattern = "*.go"
local go_test_command = {"go", "test", "./...", "-v", "-json"}
local go_options = function(state)
	return {
		stdout_buffered = true,
		on_stdout = function(_, data)
			if not data then
				return
			end

			for _, line in ipairs(data) do
				local parsable, test_metadata = pcall(vim.json.decode, line)
				if parsable and test_metadata.Test then
					local test = {
						Package = test_metadata.Package,
						Name = test_metadata.Test,
						Action = test_metadata.Action,
						Line = go_find_line(state.buffer_number, test_metadata.Test),
						Message = "",
					}

					if test.Action == "output" then
						test.Message = test_metadata.Output
					elseif test.Action == "pass" then
						
					end
					put(test)


					-- if test_metadata.Action == "output" then
					-- 	if not test_metadata.Test then
					-- 		return
					-- 	end

					-- 	assert(state.tests, vim.inspect(state))
					-- 	table.insert(state.tests[go_make_key(test_metadata)].output, vim.trim(test_metadata.Output))

					-- elseif test_metadata.Action == "pass" or test_metadata.Action == "fail" then
					-- 	-- Mark the test as passing.
					-- 	state.tests[go_make_key(test_metadata)].success = test_metadata.Action == "pass"

					-- 	local test = state.tests[go_make_key(test_metadata)]
					-- 	if test.success then
					-- 		local text = {"OK"}
					-- 		put(state)
					-- 		put(test_ns)
					-- 		put(test)
					-- 		vim.api.nvim_buf_set_extmark(state.buffer_number, test_ns, test.line, 0, {
					-- 			virt_text = { text },
					-- 		})
					-- 	end
					-- elseif test_metadata.Action == "run" or test_metadata.Action == "pause" or test_metadata.Action == "cont" then
					-- 	-- Do nothing.
					-- else
					-- 	error("Failed to handle"..vim.inspect(data))
					-- end
				end
			end
		end,
		on_exit = function()
			local failed = {}
			for _, test in pairs(state.tests) do
				if test.line then
					if not test.success then
						table.insert(failed, {
							bufnr = state.buffer_number,
							lnum = test.line,
							col = 0,
							severity = vim.diagnostic.severity.ERROR,
							source = "go-test",
							message = "Test Failed",
							user_data = {},
						})
					end
				end
			end

			vim.diagnostic.set(test_ns, state.buffer_number, failed, {})
		end,
	}
end

attach_testrunner(go_buffer_number, go_pattern, go_test_command, go_options)

