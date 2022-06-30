-- init.lua
-- Neovim Configuration

-------------------------------------------------------------------------------
---- Imports and Constants ----------------------------------------------------
-------------------------------------------------------------------------------
require("globals")
require("autoreplace")
require("plugins")
local opt = vim.opt
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local fn = vim.fn
local env = vim.env
local utils = require("utils")
local termcodes = utils.termcodes
local nmap = utils.nmap
local vmap = utils.vmap
local imap = utils.imap
local xmap = utils.xmap
local omap = utils.omap
local nnoremap = utils.nnoremap
local inoremap = utils.inoremap
local vnoremap = utils.vnoremap
local colors = require("theme").colors

-- create a completion_nvim table on _G which is visible via
-- v:lua from vimscript
_G.completion_nvim = {}

function _G.completion_nvim.smart_pumvisible(vis_seq, not_vis_seq)
  if (fn.pumvisible() == 1) then
    return termcodes(vis_seq)
  else
    return termcodes(not_vis_seq)
  end
end

-------------------------------------------------------------------------------
---- General ------------------------------------------------------------------
-------------------------------------------------------------------------------
opt.backup = false -- don't use backup files
opt.writebackup = false -- don't backup the file while editing
opt.swapfile = false -- don't create swap files foro new buffers
opt.updatecount = 0 -- don't write swap files after some number of updates

opt.backupdir = {
  "~/.vim-tmp",
  "~/.tmp",
  "~/tmp",
  "/var/tmp",
  "/tmp"
}

opt.directory = {
  "~/.vim-tmp",
  "~/.tmp",
  "~/tmp",
  "/var/tmp",
  "/tmp"
}

opt.history = 1000 -- store the last 1000 commands entered

opt.inccommand = "nosplit" -- show results of substitution without a split

opt.backspace = {"indent", "eol,start"} -- make backspace behave like I want
opt.clipboard = {"unnamed", "unnamedplus"} -- use the system clipboard
opt.mouse = "a" -- set mouse mode to all modes

-- error bells
opt.errorbells = false
opt.visualbell = true
opt.timeoutlen = 500

-------------------------------------------------------------------------------
---- Searching ----------------------------------------------------------------
-------------------------------------------------------------------------------
opt.ignorecase = true -- case insensitive searching
opt.smartcase = true -- case-sensitive if expression contains a capital letter
opt.hlsearch = true -- highlight search results
opt.incsearch = true -- incremental search
opt.lazyredraw = false -- don't redraw while executing macros
opt.magic = true -- use magic for regex

if fn.executable("rg") then -- if ripgrep is installed
	opt.grepprg = "rg --vimgrep --noheading"
	opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

-------------------------------------------------------------------------------
---- Appearance ---------------------------------------------------------------
-------------------------------------------------------------------------------
opt.number = true -- show line numbers
opt.relativenumber = true -- use relative line numbers
opt.wrap = true -- use line wrapping
opt.wrapmargin = 8 -- wrap lines when n characters from the edge
opt.linebreak = true -- set softwrapping
opt.autoindent = true -- automatically set the indent of new lines
opt.ttyfast = true -- faster redrawing
table.insert(opt.diffopt, "vertical")
table.insert(opt.diffopt, "iwhite")
table.insert(opt.diffopt, "internal")
table.insert(opt.diffopt, "algorithm:patience")
table.insert(opt.diffopt, "hiddenoff")
opt.laststatus = 3 -- show the global statusline all the time
opt.scrolloff = 7 -- set 7 lines to the cursors - when moving vertical
opt.wildmenu = true -- enhanced command line completion
opt.hidden = true -- current buffer can be put into background
opt.showcmd = true -- show incomplete commands
opt.showmode = true -- don't show which mode disabled for PowerLine
opt.wildmode = {"list", "longest"} -- complete files like a shell
opt.shell = env.SHELL
opt.title = true -- set terminal title
opt.showmatch = true -- show matching braces
opt.mat = 2 -- how many tenths of a second to blink
opt.updatetime = 300
opt.signcolumn = "yes"
opt.shortmess = "atToOFc" -- prompt message options

-- tab control
opt.smarttab = true -- tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
opt.tabstop = 4 -- the visible width of tabs
opt.softtabstop = 4 -- edit as if the tabs are 4 characters wide
opt.shiftwidth = 4 -- number of spaces to use for indent and unindent
opt.shiftround = true -- round indent to a multiple of 'shiftwidth'

-- code folding settings
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99
opt.foldnestmax = 10 -- deepest fold is 10 levels
opt.foldenable = false -- don't fold by default
opt.foldlevel = 1

opt.fcs = "eob: " -- hide the ~ character on empty lines at end of buffer

-------------------------------------------------------------------------------
---- Mappings -----------------------------------------------------------------
-------------------------------------------------------------------------------
vmap("<", "<gv")
vmap(">", ">gv")
inoremap("<C-j>", [[v:lua.completion_nvim.smart_pumvisible('<C-n>', '<C-j>')]], {expr = true})
inoremap("<C-k>", [[v:lua.completion_nvim.smart_pumvisible('<C-p>', '<C-k>')]], {expr = true})
vmap(".", ":normal .<cr>")

-- Leader mappings
g.mapleader = " "
g.maplocalleader = " "
nnoremap("Q", "<nop>") -- Normal Mode: Unset Shift-Q
nmap("<leader>.", "<c-^>")
nmap("<leader>z", "<Plug>Zoom")
nnoremap("<leader>v", ":vsplit<CR>")
nnoremap("<leader>h", ":split<CR>")
nnoremap("<leader>c", ":!touch ") -- create a new file
nnoremap("<leader>w", ":w<CR>")
nnoremap("<leader>q", ":wq<CR>") -- save and quit buffer
nnoremap("<leader>Q", ":q<CR>") -- quit buffer
nmap("<leader>t", ":tab sb<CR>") -- open current buffer in a new tab
nnoremap("<leader>n", "o<esc>I- [ ] <esc>") -- create task
nnoremap("<leader>x", "^elrx<ESC>") -- cross off a task
nnoremap("<leader>-", "^elr-<ESC>") -- partially complete a task
nnoremap("<leader>>", "^elr><ESC>") -- defer a task
nnoremap("<leader>a", ":nohl<CR>") -- clear search highlight

-- save with CTRL+S
nnoremap("<silent> <C-S>", ":update<CR>")
vnoremap("<silent> <C-S>", "<C-C>:update<CR>")
inoremap("<silent> <C-S>", "<C-O>:update<CR>")

-- move panes with CTRL+direction
nnoremap("<C-J>", "<C-W>j")
nnoremap("<C-K>", "<C-W>k")
nnoremap("<C-L>", "<C-W>l")
nnoremap("<C-H>", "<C-W>h")

-- change tabs with tab
nnoremap("<TAB>", "gt")
nnoremap("<S-TAB>", "gt")

-- scroll the viewport faster
nnoremap("<C-e>", "3<c-e>")
nnoremap("<C-y>", "3<c-y>")

-- moving up and down work as you would expect
nnoremap("j", 'v:count == 0 ? "gj" : "j"', {expr = true})
nnoremap("k", 'v:count == 0 ? "gk" : "k"', {expr = true})
nnoremap("^", 'v:count == 0 ? "g^" :  "^"', {expr = true})
nnoremap("$", 'v:count == 0 ? "g$" : "$"', {expr = true})

-- custom text objects
xmap("il", ":<c-u>normal! g_v^<cr>") --inner-line
omap("il", ":<c-u>normal! g_v^<cr>")
vmap("al", ":<c-u>normal! $v0<cr>") -- around line
omap("al", ":<c-u>normal! $v0<cr>")

if utils.file_exists(fn.expand("~/.vimrc_background")) then
  g.base16colorspace = 256
  cmd [[source ~/.vimrc_background]]
end

cmd [[syntax on]]
cmd [[filetype plugin indent on]]
-- make the highlighting of tabs and other non-text less annoying
cmd [[highlight SpecialKey ctermfg=19 guifg=#333333]]
cmd [[highlight NonText ctermfg=19 guifg=#333333]]

-- make comments and HTML attributes italic
cmd [[highlight Comment cterm=italic term=italic gui=italic]]
cmd [[highlight htmlArg cterm=italic term=italic gui=italic]]
cmd [[highlight xmlAttrib cterm=italic term=italic gui=italic]]
-- highlight Type cterm=italic term=italic gui=italic
cmd [[highlight Normal ctermbg=none]]
-- make the StatusLine background match the GalaxyLine styles
cmd("hi StatusLine guibg=" .. colors.bg)
