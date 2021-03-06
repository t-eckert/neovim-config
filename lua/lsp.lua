local lsp = require('lsp-zero')

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = 'x',
    warn = '!',
    hint = '>',
    info = 'i'
  }
})

lsp.setup()


vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=0})
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})

require("lspconfig")["sumneko_lua"].setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}
