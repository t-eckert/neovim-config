if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " Language server
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'L3MON4D3/LuaSnip'

  " Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Git gutter
  Plug 'airblade/vim-gitgutter'

  " Syntax support
  Plug 'sheerun/vim-polyglot'

  " Tags
  Plug 'ludovicchabant/vim-gutentags'

  " Colorscheme
  Plug 'arcticicestudio/nord-vim'

  " Insert new UUID on <leader>u 
  Plug 'kburdett/vim-nuuid'

  " Allow for popup windows
  Plug 'nvim-lua/popup.nvim'

  " Autoclose pairings
  Plug 'jiangmiao/auto-pairs'

  " Comment out multiple lines with gcc
  Plug 'tpope/vim-commentary'

  " Fuzzy finding
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  
  " Change working directory to root on startup
  Plug 'airblade/vim-rooter'

  " Airline bottom bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Language-specific plugins
  Plug 'psf/black', { 'branch': 'stable' } 
  Plug 'evanleck/vim-svelte', {'branch': 'main'}
  Plug 'mattn/emmet-vim'
  Plug 'godlygeek/tabular'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()
