vim.opt.backup = false -- don't use backup files
vim.opt.writebackup = false -- don't backup the file while editing
vim.opt.swapfile = false -- don't create swap files foro new buffers
vim.opt.updatecount = 0 -- don't write swap files after some number of updates

vim.opt.backupdir = {
  "~/.vim-tmp",
  "~/.tmp",
  "~/tmp",
  "/var/tmp",
  "/tmp"
}

vim.opt.directory = {
  "~/.vim-tmp",
  "~/.tmp",
  "~/tmp",
  "/var/tmp",
  "/tmp"
}

vim.opt.history = 1000 -- store the last 1000 commands entered

vim.opt.inccommand = "nosplit" -- show results of substitution without a split

vim.opt.backspace = {"indent", "eol,start"} -- make backspace behave like I want
vim.opt.clipboard = {"unnamed", "unnamedplus"} -- use the system clipboard
vim.opt.mouse = "a" -- set mouse mode to all modes

-- error bells
vim.opt.errorbells = false
vim.opt.visualbell = true
vim.opt.timeoutlen = 500

vim.cmd [[syntax on]]
vim.cmd [[filetype plugin indent on]]
-- make the highlighting of tabs and other non-text less annoying
vim.cmd [[highlight SpecialKey ctermfg=19 guifg=#333333]]
vim.cmd [[highlight NonText ctermfg=19 guifg=#333333]]

-- make comments and HTML attributes italic
vim.cmd [[highlight Comment cterm=italic term=italic gui=italic]]
vim.cmd [[highlight htmlArg cterm=italic term=italic gui=italic]]
vim.cmd [[highlight xmlAttrib cterm=italic term=italic gui=italic]]
-- highlight Type cterm=italic term=italic gui=italic
vim.cmd [[highlight Normal ctermbg=none]]

