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

" prevent security exploit
set modelines=0

" colorscheme
set background=dark
colorscheme Tomorrow-Night

" tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" general
set encoding=utf-8
set scrolloff=5
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

" leader
let mapleader = ","

" search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" wrap
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" folding
set nofoldenable

" save on lost focus
au FocusLost * :wa

" fix tmux + vim + osx clipboard issues
if $TMUX == ''
  set clipboard+=unnamed
endif

" copy/paste pbcopy
vmap <C-x> :!pbcopy<cr>
vmap <C-c> :w !pbcopy<cr><cr>

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
