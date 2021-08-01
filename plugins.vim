if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " Syntax support
  Plug 'sheerun/vim-polyglot'

  " Autocomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Colorschemes
  Plug 'joshdick/onedark.vim'

  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'tpope/vim-surround'
  Plug 'psf/black', { 'branch': 'stable' } 
  Plug 'ray-x/go.nvim'
  Plug 'evanleck/vim-svelte', {'branch': 'main'}
  Plug 'codechips/coc-svelte', {'do': 'npm install'}
  Plug 'mattn/emmet-vim'
  Plug 'kburdett/vim-nuuid'

call plug#end()
