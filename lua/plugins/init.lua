local g = vim.g
local fn = vim.fn
local utils = require("utils")
local nmap = utils.nmap
local env = vim.env
local cmd = vim.cmd

local plugLoad = fn["functions#PlugLoad"]
local plugBegin = fn["plug#begin"]
local plugEnd = fn["plug#end"]
local Plug = fn["plug#"]

plugLoad()
plugBegin("~/.config/nvim/plugged")

	Plug "EdenEast/nightfox.nvim" -- Colorscheme
	Plug "nvim-treesitter/nvim-treesitter" -- Treesitter
	Plug "neovim/nvim-lspconfig" -- Language server
	Plug "junegunn/fzf"
	Plug "hrsh7th/nvim-cmp" -- Completion
	Plug "L3MON4D3/LuaSnip" -- Common Lua snippets
	Plug "airblade/vim-gitgutter" -- Git gutter
	Plug "sheerun/vim-polyglot" -- Syntax support
	Plug "kburdett/vim-nuuid" -- Insert new UUID on <leader>u 
	Plug "nvim-lua/popup.nvim" -- Allow for popup windows
	Plug "jiangmiao/auto-pairs" -- Autoclose pairings
	Plug "tpope/vim-commentary" -- Comment out multiple lines with gcc
	Plug "airblade/vim-rooter" -- Change working directory to root on startup
	Plug "psf/black" -- Python formatter
	Plug "evanleck/vim-svelte" -- Svelte 
	Plug "mattn/emmet-vim" -- Emmet completion
	Plug "godlygeek/tabular" -- Alignment
	Plug("gregsexton/MatchTag", {["for"] = "html"}) -- match tags in html
	Plug("othree/html5.vim", {["for"] = "html"}) -- html5 support

plugEnd()

-- Once the plugins have been loaded, Lua-based plugins need to be required and started up
-- For plugins with their own configuration file, that file is loaded and is responsible for
-- starting them. Otherwise, the plugin itself is required and its `setup` method is called.
require("plugins/colorscheme")
require("plugins/fzf")
