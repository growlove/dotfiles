" *---GENERIC SETTINGS---*
set nocompatible
set showcmd
set foldmethod=marker

set nobackup
set nowritebackup
set noswapfile
set history=5000
set undolevels=1000
set ruler

set scrolloff=5
set sidescrolloff=5

" watch for file changes
set autoread

" syntax settings
filetype on
filetype indent on
filetype plugin on
syntax enable
syntax on
set grepprg=grep\ -nH\ $*

" tab settings
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" vim command completion
set wildmenu
set wildmode=list:longest,full

set backspace=2

" line numbers
set number
set numberwidth=5

set ignorecase
set smartcase

set incsearch
set hlsearch

" remove buffer when closing tab
set nohidden

set colorcolumn=80

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" *---FILE LOADING---*

" Install plugins
runtime install.vim

" Add keybindings
runtime plugins.vim
runtime keybindings.vim

" *---THEME---*
let base16colorspace=256
set t_Co=256
set background=dark
colorscheme dracula

"" current line highlight
set cursorline
hi CursorLine cterm=NONE 

"" search term highlight
set hlsearch
hi Search cterm=underline ctermbg=black ctermfg=yellow

" *---LANGUAGE TAB SETTINGS---*
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype elixir setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" *---GIT COMMIT SETTINGS---*
autocmd Filetype gitcommit setlocal spell textwidth=72
