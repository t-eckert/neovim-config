local opt = vim.opt
local cmd = vim.cmd

opt.backup = false      -- don't use backup files
opt.writebackup = false -- don't backup the file while editing
opt.swapfile = false    -- don't create swap files for new buffers
opt.updatecount = 0     -- don't write swap files after some number of updates

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

opt.history = 1000                           -- store the last 1000 commands entered

opt.inccommand = "nosplit"                   -- show results of substitution without a split

opt.backspace = { "indent", "eol,start" }    -- make backspace behave like I want
opt.clipboard = { "unnamed", "unnamedplus" } -- use the system clipboard
opt.mouse = "a"                              -- set mouse mode to all modes

-- error bells
opt.errorbells = false
opt.visualbell = true
opt.timeoutlen = 500

cmd [[syntax on]]
cmd [[filetype plugin indent on]]
-- make the highlighting of tabs and other non-text less annoying
cmd [[highlight SpecialKey ctermfg=19 guifg=#333333]]
cmd [[highlight NonText ctermfg=19 guifg=#333333]]

cmd [[set termguicolors]]

-- make comments and HTML attributes italic
cmd [[highlight Comment cterm=italic term=italic gui=italic]]
cmd [[highlight htmlArg cterm=italic term=italic gui=italic]]
cmd [[highlight xmlAttrib cterm=italic term=italic gui=italic]]
-- highlight Type cterm=italic term=italic gui=italic
cmd [[highlight Normal ctermbg=none]]

cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- see if the file exists
function FileExists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- Get the value of the module name from go.mod in PWD
function GetGoModuleName()
  if not FileExists("go.mod") then return nil end
  for line in io.lines("go.mod") do
    if vim.startswith(line, "module") then
      local items = vim.split(line, " ")
      local module_name = vim.trim(items[2])
      return module_name
    end
  end
  return nil
end

local goModule = GetGoModuleName()

local servers = {
  goals = {
    ["local"] = goModule,
  }
}
