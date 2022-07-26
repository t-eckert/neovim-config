-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function()
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
	vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=0})
	vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
end

require('lspconfig')['gopls'].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require('lspconfig')['bashls'].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require('lspconfig')['bashls'].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require("lspconfig")["cssls"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require("lspconfig")["denols"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require("lspconfig")["dockerls"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require("lspconfig")["eslint"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require("lspconfig")["graphql"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require("lspconfig")["html"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require("lspconfig")["jsonls"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require("lspconfig")["marksman"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require("lspconfig")["pyright"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require("lspconfig")["rust_analyzer"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require("lspconfig")["sqls"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require("lspconfig")["sumneko_lua"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}

require("lspconfig")["svelte"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require("lspconfig")["tailwindcss"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require("lspconfig")["terraformls"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require("lspconfig")["tflint"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require("lspconfig")["vimls"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require("lspconfig")["yamlls"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}
