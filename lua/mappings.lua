local cmd = vim.cmd
local g = vim.g
local fn = vim.fn
local utils = require("utils")
local nmap = utils.nmap
local vmap = utils.vmap
local xmap = utils.xmap
local omap = utils.omap
local nnoremap = utils.nnoremap
local inoremap = utils.inoremap
local vnoremap = utils.vnoremap

--------------------------------------------------------------------------------
-- General Mappings ------------------------------------------------------------
--------------------------------------------------------------------------------
-- Indent/unindent 
vmap("<", "<gv")
vmap(">", ">gv")

-- Repeat last command even in visual mode
vmap(".", ":normal .<cr>")

-- Save with CTRL+S
nnoremap("<silent> <C-S>", ":update<CR>")
vnoremap("<silent> <C-S>", "<C-C>:update<CR>")
inoremap("<silent> <C-S>", "<C-O>:update<CR>")

-- Move panes with CTRL+direction
nnoremap("<C-J>", "<C-W>j")
nnoremap("<C-K>", "<C-W>k")
nnoremap("<C-L>", "<C-W>l")
nnoremap("<C-H>", "<C-W>h")

-- Change tabs with tab
nnoremap("<TAB>", "gt")
nnoremap("<S-TAB>", "gT")

-- Scroll the viewport faster
nnoremap("<C-e>", "6<c-e>")
nnoremap("<C-y>", "6<c-y>")

-- Moving up and down work as you would expect
nnoremap("j", 'v:count == 0 ? "gj" : "j"', {expr = true})
nnoremap("k", 'v:count == 0 ? "gk" : "k"', {expr = true})
nnoremap("^", 'v:count == 0 ? "g^" :  "^"', {expr = true})
nnoremap("$", 'v:count == 0 ? "g$" : "$"', {expr = true})

-- Custom text objects
xmap("il", ":<c-u>normal! g_v^<cr>") --inner-line
omap("il", ":<c-u>normal! g_v^<cr>")
vmap("al", ":<c-u>normal! $v0<cr>") -- around line
omap("al", ":<c-u>normal! $v0<cr>")

-- LSP navigation
nnoremap("K", vim.lsp.buf.hover)
nnoremap("gd", vim.lsp.buf.definition)
nnoremap("gt", vim.lsp.buf.type_definition)
nnoremap("gi", vim.lsp.buf.implementation)

nnoremap("Q", "<nop>") -- Normal Mode: Unset Shift-Q

nnoremap("K", vim.lsp.buf.hover)
nnoremap("gd", vim.lsp.buf.definition)
nnoremap("gt", vim.lsp.buf.type_definition)
nnoremap("gi", vim.lsp.buf.implementation)

if utils.file_exists(fn.expand("~/.vimrc_background")) then
  g.base16colorspace = 256
  cmd [[source ~/.vimrc_background]]
end

--------------------------------------------------------------------------------
-- Leader Mappings -------------------------------------------------------------
--------------------------------------------------------------------------------
g.mapleader = " "
g.maplocalleader = " "

nnoremap("<leader>v", ":vsplit<CR>") -- Vertical split
nnoremap("<leader>h", ":split<CR>") -- Horizontal split

nnoremap("<leader>e", ":NvimTreeToggle<CR>") -- Toggle filetree

nnoremap("<leader>w", ":w<CR>") -- Save
nnoremap("<leader>q", ":q<CR>") -- Quit buffer
nnoremap("<leader>Q", ":wq<CR>") -- Save and quit buffer

nmap("<leader>t", ":tab sb<CR>") -- Open current buffer in a new tab

nnoremap("<leader>n", "o<esc>I- [ ] <esc>") -- Create task
nnoremap("<leader>x", "^elrx<ESC>") -- Cross off a task

nnoremap("<leader>a", ":nohl<CR>") -- Clear search highlight

nmap("<leader>b", ":Buffers<cr>") -- Search buffers
nmap("<leader>p", ":Telescope find_files<CR>") -- Search files
nmap("<leader>f", ":Telescope live_grep<CR>") -- Grep files
nmap("<leader>b", ":Telescope git_branches<CR>") -- Change branches

nnoremap("<leader>dn", vim.diagnostic.goto_next)
nnoremap("<leader>dp", vim.diagnostic.goto_prev)
nnoremap("<leader>r", vim.lsp.buf.rename)

nnoremap("<leader>1", ":so %<CR>") -- Source the current file
nnoremap("<leader>9", ":ToggleColumnColor<CR>") -- Toggle highlighting columns 80 and 120
