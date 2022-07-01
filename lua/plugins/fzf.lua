local env = vim.env
local g = vim.g
local fn = vim.fn
local api = vim.api
local o = vim.o
local utils = require("utils")
local nmap = utils.nmap
local xmap = utils.xmap
local omap = utils.omap
local imap = utils.imap

function FloatingFZF()
  local lines = o.lines
  local columns = o.columns
  local buf = api.nvim_create_buf(true, true)
  local height = fn.float2nr(lines * 0.5)
  local width = fn.float2nr(columns * 0.7)
  local horizontal = fn.float2nr((columns - width) / 2)
  local vertical = 0
  local opts = {
    relative = "editor",
    row = vertical,
    col = horizontal,
    width = width,
    height = height,
    style = "minimal"
  }
  vim.api.nvim_open_win(buf, true, opts)
end

local fzf_opts = {
  env.FZF_DEFAULT_OPTS or "",
  " --layout=reverse",
  ' --pointer=" "',
  " --info=hidden",
  " --border=rounded",
  " --bind å:select-all+accept"
}

env.FZF_DEFAULT_OPTS = table.concat(fzf_opts, "")

g.fzf_preview_window = {"right:50%:hidden", "?"}
g.fzf_layout = {window = "call v:lua.FloatingFZF()"}
