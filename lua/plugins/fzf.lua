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

local fzf_opts = {
  env.FZF_DEFAULT_OPTS or "",
  " --layout=reverse",
  ' --pointer=" "',
  " --info=inline",
  " --border=rounded",
}

env.FZF_DEFAULT_OPTS = table.concat(fzf_opts, "")

