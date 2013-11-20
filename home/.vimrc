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

set modelines=0     " prevent security exploit
set shell=bash      " be explicit in case we are using something like fish
let mapleader = ","
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" colorscheme
set t_Co=256        " 256 colors
set background=dark
colorscheme molokai

" indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set copyindent

" language specific indentation
au FileType java setl ts=4 sw=4 sts=4
au FileType html setl ts=4 sw=4 sts=4
au FileType xml setl ts=4 sw=4 sts=4

" editing
set hidden
set formatoptions=qrn1
set fileformats="unix,dos,mac"

" appearance
set ruler
set showmode
set laststatus=2   " always show status line
set cmdheight=2    " use a status bar that is 2 rows high
set nonumber       " no line numbers
set nowrap
set textwidth=79
set colorcolumn=85
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set nolist         " list characters are turned on for some filetypes (later)
set shortmess+=I   " hide the launch screen

" bells
set novisualbell

" movement
set scrolloff=5
set backspace=indent,eol,start

" menu
set wildmenu
set wildmode=list:longest

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

" folding (...nope)
set nofoldenable

" editor
set encoding=utf-8
set termencoding=utf-8
set ttyfast
set lazyredraw     " don't update the display while executing macros

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

" toggle paste mode
set pastetoggle=<F2>

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

" toggle show/hide invisible chars
nnoremap <leader>i :set list!<cr>

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
