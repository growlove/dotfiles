" Leader
let mapleader = " "

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" remap jj to escape in insert mode
inoremap jj <Esc>

"" search settings
nnoremap <leader>i :set incsearch!<CR>
nnoremap <leader>h :set hlsearch!<CR>

" easymotion bindings
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" turn off hl in insert mode
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
