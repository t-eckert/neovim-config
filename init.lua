-- init.lua
-- Neovim Configuration

-- Settings
require("general")
require("autoreplace")
require("globals")
require("search")
require("appearance")
require("mappings")

-- Plugins
require("plugins")
require("filetree")
require("mason").setup()
require("lsp")
require("colorscheme")
require("statusline")
require("rooter")
require("completion")
require("gitsigns").setup()
require("prettier")
require("terminal")
require("snippets")

-- Scripts
require("testrunner")
require("boundaries")

local utils = require("utils")

_GlobalCallbacks = _GlobalCallbacks or {}
_G.globals = {_store = _GlobalCallbacks}
_G.completion_nvim = {}

function _G.completion_nvim.smart_pumvisible(vis_seq, not_vis_seq)
  if (vim.fn.pumvisible() == 1) then
    return utils.termcodes(vis_seq)
  else
    return utils.termcodes(not_vis_seq)
  end
end

-- Useful for debugging.
function _G.put(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end


function globals._create(f)
  table.insert(globals._store, f)
  return #globals._store
end

function globals._execute(id, args)
  globals._store[id](args)
end
