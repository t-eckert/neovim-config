syntax enable  			  		" syntax highlighting
set exrc					    " read per-project .vim files
set relativenumber              " linenumbers rel to linenumber
set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir/
set undofile
set incsearch
set scrolloff=8                 " scroll offset from cursor
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set number
set linebreak
set showmatch
set visualbell
set hlsearch
set ignorecase
set smarttab
set ruler
set undolevels=1000
set backspace=indent,eol,start
set encoding=utf-8		        " Set encoding to utf-8
set pumheight=10		        " Popup menu to size 10
set iskeyword+=-		" Treat dash-separated words as a word text object
set mouse=a			" Enable use of mouse
set splitbelow			" Horizontal splits will automatically be below
set splitright			" Vertical splits will automatically be to the right
set t_Co=256			" Support 256 colors
set conceallevel=0		" So you can see `` in markdown files
set background=dark             " tell vim what the background color looks like
set showtabline=2               " Always show tabs
set nobackup                    " This is recommended by coc
set nowritebackup               " This is recommended by coc
set updatetime=300              " Faster completion
set timeoutlen=500              " By default timeoutlen is 1000 ms
