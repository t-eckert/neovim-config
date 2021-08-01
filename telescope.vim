nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

lua << EOF
require('telescope').setup{
defaults = {
file_ignore_patterns = {"node_modules", "undodir", "__pycache__"}
}
}
EOF
