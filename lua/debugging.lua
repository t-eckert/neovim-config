require("dapui").setup() -- User interface for debugging
require("nvim-dap-virtual-text").setup() -- Show types and values while debugging

-- Automatically start the UI when debugging
local dap, ui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	ui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	ui.close()
end

-- Go
-- Requires the delve debugger to be available on $PATH
-- https://github.com/go-delve/delve
require("dap-go").setup()
