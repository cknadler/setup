"""""""""""""""""""""""""
" bundle config
"""""""""""""""""""""""""
set nocompatible
filetype off

" load all bundles
source ~/.vim/bundles.vim

syntax on
filetype plugin indent on

"""""""""""""""""""""""""
" general config
""""""""""""""""""""""""

" colorscheme
set background=dark
colorscheme Tomorrow-Night

" leader
let mapleader = ","

" search
set incsearch
set hlsearch
set ignorecase
set smartcase

" folding
set nofoldenable

" navigation
set scrolloff=5

" tabs and indents
set smartindent
set autoindent
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set wrap

" fix tmux + vim + osx clipboard issues
if $TMUX == ''
  set clipboard+=unnamed
endif

" copy/paste pbcopy
vmap <C-x> :!pbcopy<cr>
vmap <C-c> :w !pbcopy<cr><cr>

" always display bottom bar
set laststatus=2

" easy-motion
let g:EasyMotion_leader_key = '<Leader>'

" quick vim config edit mappings
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>eb :vsplit $HOME/.vim/bundles.vim<cr>

" map ctrl+{h,j,k,l} to switch splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
