require("nightfox").setup({
	options = {
		transparent = true
	}
})

vim.cmd("colorscheme duskfox")

require("50PH1A").setup()

vim.cmd("hi DiagnosticVirtualTextError guibg=#000000")
vim.cmd("hi DiagnosticVirtualTextWarn guibg=#000000")
vim.cmd("hi DiagnosticVirtualTextInfo guibg=#000000")
vim.cmd("hi DiagnosticVirtualTextHint guibg=#000000")
