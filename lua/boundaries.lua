-- Toggle highlighting columns 80 and 120
vim.api.nvim_create_user_command("ToggleColumnColor", function()
	local column_color = vim.api.nvim_command_output(":set colorcolumn?")
	if string.match(column_color, "[0-9]") then
		vim.cmd(":set colorcolumn=")
	else
		vim.cmd(":set colorcolumn=80,120,160")
	end
end, {})
