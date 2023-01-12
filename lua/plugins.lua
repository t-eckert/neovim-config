local fn = vim.fn
local plugLoad = fn["functions#PlugLoad"]
local plugBegin = fn["plug#begin"]
local plugEnd = fn["plug#end"]
local Plug = fn["plug#"]

plugLoad()
plugBegin("~/.config/nvim/plugged")

-- Language Support
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" }) -- Treesitter
Plug "neovim/nvim-lspconfig" -- Language server
Plug "williamboman/mason.nvim" -- Installer for LSPs
Plug "williamboman/mason-lspconfig.nvim" -- Manages LSP installations
Plug "VonHeikemen/lsp-zero.nvim" -- Configure LSPs

-- Helpers
Plug "nvim-lua/plenary.nvim" -- Lua helpers that are used by other plugins

-- UI
Plug "kyazdani42/nvim-web-devicons" -- Icons
Plug "kyazdani42/nvim-tree.lua" -- File tree
Plug "nvim-lualine/lualine.nvim" -- Status line
Plug "nanozuki/tabby.nvim" -- Tabline

-- Debugging
Plug "mfussenegger/nvim-dap" -- DAP
Plug "rcarriga/nvim-dap-ui" -- DAP UI
Plug "leoluz/nvim-dap-go" -- Go support
Plug "theHamsta/nvim-dap-virtual-text"
Plug "nvim-telescope/telescope-dap.nvim"

Plug "lewis6991/gitsigns.nvim" -- Git gutter

Plug "windwp/nvim-autopairs" -- Autoclose

Plug "tpope/vim-abolish" -- Better replacement

Plug "norcalli/nvim-colorizer.lua" -- Show hex colors

Plug "sharkdp/fd" -- Find alternative

Plug("nvim-telescope/telescope.nvim", { ["tag"] = "0.1.0" }) -- Modal search
Plug "edluffy/hologram.nvim" -- Display images
Plug "ray-x/guihua.lua" -- GUI management
Plug("akinsho/toggleterm.nvim", { ["tag"] = "v2.*" })
Plug "dhruvasagar/vim-table-mode" -- For creating great tables in md
Plug "sheerun/vim-polyglot" -- Syntax support
Plug "zbirenbaum/copilot.lua" -- Copilot
Plug "lukas-reineke/indent-blankline.nvim" -- Show vertical indent lines


Plug "hrsh7th/nvim-cmp" -- Completion
Plug "hrsh7th/cmp-nvim-lsp" -- Completion LSP
Plug "hrsh7th/cmp-buffer" -- Completion buffer
Plug "hrsh7th/cmp-path" -- Path for CMP
Plug "hrsh7th/cmp-cmdline" -- Command line for CMP
Plug "zbirenbaum/copilot-cmp" -- Copilot completion
Plug "L3MON4D3/LuaSnip" -- Snippet engine
Plug "saadparwaiz1/cmp_luasnip" -- Engine plugin for CMP
Plug "rafamadriz/friendly-snippets" -- Common, useful snippets


Plug "EdenEast/nightfox.nvim" -- Color scheme

Plug "kburdett/vim-nuuid" -- Insert new UUID on <leader>u
Plug "tpope/vim-fugitive" -- Git support
Plug "tpope/vim-commentary" -- Comment out multiple lines with gcc
Plug "notjedi/nvim-rooter.lua" -- Change working directory to root on startup
Plug "godlygeek/tabular" -- Alignment
Plug "editorconfig/editorconfig-vim" -- editorconfig file support

Plug "psf/black" -- Python formatter
Plug "ray-x/go.nvim" -- More Go support
Plug "JulesWang/css.vim" -- CSS support
Plug "alexlafroscia/postcss-syntax.vim" -- PostCSS syntax highlighting
Plug "stephenway/postcss.vim" -- PostCSS support
Plug "evanleck/vim-svelte" -- Svelte
Plug("prettier/vim-prettier",
	{ ["do"] = "yarn install --frozen-lockfile --production",
		["for"] = { "javascript", "typescript", "css", "less", "scss", "json", "graphql", "vue", "svelte", "html" } }) -- Prettier
Plug "JoosepAlviste/nvim-ts-context-commentstring" -- TS comment context
Plug "mattn/emmet-vim" -- Emmet completion
Plug("gregsexton/MatchTag", { ["for"] = "html" }) -- match tags in html
Plug("othree/html5.vim", { ["for"] = "html" }) -- html5 support
Plug "mzlogin/vim-markdown-toc"
Plug "wuelnerdotexe/vim-astro"

plugEnd()

-- Initialize the one-liner setups
require("nvim-autopairs").setup()
require("mason").setup()
require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})
require("copilot_cmp").setup()
vim.g.rustfmt_autosave = 1
