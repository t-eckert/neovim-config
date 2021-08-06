let mapleader = " "

source ~/.config/nvim/settings.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/remaps.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/onedark.vim
source ~/.config/nvim/airline.vim

lua << EOF
require('lsp')
EOF