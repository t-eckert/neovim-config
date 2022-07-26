local env = vim.env

local fzf_opts = {
  env.FZF_DEFAULT_OPTS or "",
  " --layout=reverse",
  ' --pointer=" "',
  " --info=inline",
  " --border=rounded",
}

env.FZF_DEFAULT_OPTS = table.concat(fzf_opts, "")

