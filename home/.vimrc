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

" 256 colors
set t_Co=256

" colorscheme
set background=dark
colorscheme molokai

" tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" language specific tabs
au FileType java setl ts=4 sw=4 sts=4
au FileType javascript setl ts=2 sw=2 sts=2
au FileType html setl ts=4 sw=4 sts=4

" general
set encoding=utf-8
set scrolloff=5
set autoindent
set showmode
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
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
set nowrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" folding (psh...yeah right)
set nofoldenable

" custom syntastic conf
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['ruby', 'c'] }

" turn off gitgutter by default
let g:gitgutter_enabled = 0

" save on lost focus
au FocusLost * :wa

" quick colon
nnoremap ; :
vnoremap ; :

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

""""""""""""""""""""""""
" dmenu hacks
""""""""""""""""""""""""
" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! DmenuOpen(cmd)
  let fname = Chomp(system("git ls-files | dmenu -i -l 20 -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

" open a file in a new vsplit
map <c-t> :call DmenuOpen("vs")<cr>
" open a file in the current buffer
map <c-f> :call DmenuOpen("e")<cr>

""""""""""""""""""""""""
" unbind stuff
""""""""""""""""""""""""
" disable arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" disable ZZ, use :wq yo
nnoremap ZZ <NOP>
