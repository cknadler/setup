"""""""""""""""""""""""""
" pre config
"""""""""""""""""""""""""

set nocompatible
filetype off

"""""""""""""""""""""""""
" activate bundles
"""""""""""""""""""""""""

" load all bundles
source ~/.vim/bundles.vim

syntax on
filetype plugin indent on

"""""""""""""""""""""""""
" general
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
au FileType html setl ts=4 sw=4 sts=4
au FileType xml setl ts=4 sw=4 sts=4

" misc
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

" ignored files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

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

""""""""""""""""""""""""
" plugin config
""""""""""""""""""""""""
" syntastic
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['ruby', 'c'] }

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|eclipse|settings)$',
  \ 'file': '\v\.(class)$',
  \ }

" vim-json
let g:vim_json_syntax_conceal = 0 " don't conceal quotes

""""""""""""""""""""""""
" bindings
""""""""""""""""""""""""

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
" unbindings
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
