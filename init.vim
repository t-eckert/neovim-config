let mapleader = " "

source ~/.config/nvim/providers.vim
source ~/.config/nvim/settings.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/remaps.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/rooter.vim

let g:nord_disable_background = v:true
colorscheme nord

lua << EOF
require('lsp')
EOF
