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
require("lsp")
require("colorscheme")
require("statusline")
require("rooter")
require("cmp")

local utils = require("utils")

-- create a completion_nvim table on _G which is visible via
-- v:lua from vimscript
_G.completion_nvim = {}

function _G.completion_nvim.smart_pumvisible(vis_seq, not_vis_seq)
  if (vim.fn.pumvisible() == 1) then
    return utils.termcodes(vis_seq)
  else
    return utils.termcodes(not_vis_seq)
  end
end

