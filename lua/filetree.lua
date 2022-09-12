local tree_cb = require("nvim-tree.config").nvim_tree_callback

require("nvim-tree").setup {
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    highlight_opened_files = "name",
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "*",
      info = "i",
      warning = "!",
      error = "x",
    },
  },
  view = {
    side = "left",
    adaptive_size = true,
    width = 32,
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "u", cb = tree_cb "close_node" },
        { key = "h", cb = tree_cb "split" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
  },
}
