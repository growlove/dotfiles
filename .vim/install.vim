call plug#begin('~/.vim/bundle')

" sensible vim settings
Plug 'tpope/vim-sensible'

" *---THEMES---*
Plug 'dracula/vim'

" *---QOL PLUGINS---*
Plug 'tpope/vim-unimpaired'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'xolox/vim-misc' " required for vim-session
Plug 'xolox/vim-session'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'sbdchd/neoformat'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" *---PLATFORM SPECIFIC---*
Plug 'ekalinin/Dockerfile.vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all' }
Plug 'junegunn/fzf.vim'

" *---LANG SPECIFIC---*
Plug 'rgrinberg/vim-ocaml'
Plug 'elmcast/elm-vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'rust-lang/rust.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'cakebaker/scss-syntax.vim'
Plug 'stephpy/vim-yaml'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'udalov/kotlin-vim'
Plug 'vim-scripts/groovy.vim'

" JS
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'fleischie/vim-styled-components'

call plug#end()

filetype plugin indent on
set runtimepath+=~/.vim/ultisnips_rep
filetype on

let g:UltiSnipsSnippetsDir = "~/.vim/snips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snips"]
let g:UltiSnipsEditSplit = "context"

