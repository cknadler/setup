"""""""""""""""""""""""""
" base
"""""""""""""""""""""""""

set nocompatible
filetype off
syntax enable

"""""""""""""""""""""""""
" general
""""""""""""""""""""""""

set modelines=0     " prevent security exploit
set shell=bash      " be explicit in case we are using something like fish
set hidden
set formatoptions=qrn1
set fileformats="unix,dos,mac"
set clipboard=unnamed " system clipboard

" no error bells
set noeb vb t_vb=

" indentation
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set copyindent

" appearance
set ruler
set showmode
set cursorline     " highlight current line
set laststatus=2   " always show status line
set cmdheight=2    " use a status bar that is 2 rows high
set nonumber       " no line numbers
set nowrap         " no wrapping text lines, break at 80 chars or less yo
set textwidth=80
set colorcolumn=81
set listchars=tab:▸\ ,trail:▫
set nolist         " list characters enabled for some ft (later)
set shortmess+=I   " hide the launch screen

" movement
set scrolloff=5
set backspace=indent,eol,start

" menu
set wildmenu
set wildmode=list:longest

" search
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" spelling
set spelllang=en
set spellfile=$HOME/.vim/spell/en.utf-8.add
set nospell " spell checking enabled for some ft (later)

" folding...nope
set nofoldenable

" editor
set autoread
set encoding=utf-8
set termencoding=utf-8
set ttyfast
set lazyredraw   " don't update the display while executing macros
set novisualbell " no...
set noerrorbells " ...bells

""""""""""""""""""""""""
" bindings
""""""""""""""""""""""""

" leader bindings
let mapleader=","
nnoremap <leader>a :Ag<space>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
" kill highlighting
nnoremap <leader><space> :noh<cr>
" delete a line without adding it to the yank stack
nnoremap <silent> <leader>d "_d
vnoremap <silent> <leader>d "_d
" toggle show/hide invisible chars
nnoremap <leader>i :set list!<cr>
" sort paragraphs
vnoremap <leader>s !sort -f<cr>gv
nnoremap <leader>s vip!sort -f<cr><Esc>

" better search
nnoremap / /\v
vnoremap / /\v

" tab to move to next match
nnoremap <tab> %
vnoremap <tab> %

" save on lost focus
au FocusLost * :wa

" quick colon
nnoremap ; :
vnoremap ; :

" get j and k to work as expected on super long (wrapped) lines
nnoremap j gj
nnoremap k gk

" yank to the end of the line
nnoremap Y y$

""""""""""""""""""""""""
" unbindings
""""""""""""""""""""""""

" disable ZZ, use :wq
nnoremap ZZ <NOP>
