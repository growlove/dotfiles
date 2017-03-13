call plug#begin('~/.vim/bundle')

" sensible vim settings
Plug 'tpope/vim-sensible'

" *---THEMES---*
Plug 'dracula/vim'

" *---QOL PLUGINS---*
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/YouCompleteMe'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'xolox/vim-misc' " required for vim-session
Plug 'xolox/vim-session'

" *---PLATFORM SPECIFIC---*
Plug 'saltstack/salt-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf.vim'

" *---LANG SPECIFIC---*
Plug 'rgrinberg/vim-ocaml'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elmcast/elm-vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'rust-lang/rust.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'cakebaker/scss-syntax.vim'
Plug 'stephpy/vim-yaml'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'

call plug#end()

