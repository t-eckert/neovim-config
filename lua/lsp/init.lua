-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig')['gopls'].setup {
	capabilities = capabilities
}

require('lspconfig')['bashls'].setup {
	capabilities = capabilities
}

require('lspconfig')['bashls'].setup {
	capabilities = capabilities
}

require("lspconfig")["cssls"].setup {
	capabilities = capabilities
}

require("lspconfig")["denols"].setup {
	capabilities = capabilities
}

require("lspconfig")["dockerls"].setup {
	capabilities = capabilities
}

require("lspconfig")["eslint"].setup {
	capabilities = capabilities
}

require("lspconfig")["graphql"].setup {
	capabilities = capabilities
}

require("lspconfig")["html"].setup {
	capabilities = capabilities
}

require("lspconfig")["jsonls"].setup {
	capabilities = capabilities
}

require("lspconfig")["marksman"].setup {
	capabilities = capabilities
}

require("lspconfig")["pyright"].setup {
	capabilities = capabilities
}

require("lspconfig")["rust_analyzer"].setup {
	capabilities = capabilities
}

require("lspconfig")["sqls"].setup {
	capabilities = capabilities
}

require("lspconfig")["sumneko_lua"].setup {
	capabilities = capabilities
}

require("lspconfig")["svelte"].setup {
	capabilities = capabilities
}

require("lspconfig")["tailwindcss"].setup {
	capabilities = capabilities
}

require("lspconfig")["terraformls"].setup {
	capabilities = capabilities
}

require("lspconfig")["tflint"].setup {
	capabilities = capabilities
}

require("lspconfig")["vimls"].setup {
	capabilities = capabilities
}

require("lspconfig")["yamlls"].setup {
	capabilities = capabilities
}
