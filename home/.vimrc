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

" editing
set hidden
set formatoptions=qrn1
set fileformats="unix,dos,mac"

" appearance
set ruler
set showmode
set cursorline     " highlight current line
set laststatus=2   " always show status line
set cmdheight=2    " use a status bar that is 2 rows high
set nonumber       " no line numbers
set nowrap
set textwidth=79
set colorcolumn=85
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set nolist         " list characters enabled for some ft (later)
set shortmess+=I   " hide the launch screen

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
set lazyredraw         " don't update the display while executing macros
set novisualbell       " no...
set noerrorbells       " ...bells

" internal
set history=1000       " remember more commands and search history
set undolevels=1000    " use many muchos levels of undo
if v:version >= 730
    set undofile       " keep a persistent backup file
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup           " no backup files
set noswapfile         " no swap files
set directory=~/.vim/.tmp,~/tmp,/tmp

""""""""""""""""""""""""
" plugin config
""""""""""""""""""""""""

" syntastic
let g:syntastic_mode_map = {
  \ 'mode': 'passive',
  \ 'active_filetypes': ['ruby', 'c']
  \ }

" vim-json
let g:vim_json_syntax_conceal = 0 " don't conceal quotes

""""""""""""""""""""""""
" wildignore
""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.swp,*.zip,*.out  " general
set wildignore+=*.so,*.dylib,*.a,*.o       " c family
set wildignore+=.git,.hg,.svn              " source control
set wildignore+=.eclipse,.settings         " eclipse
set wildignore+=*.class                    " java
set wildignore+=node_modules               " node

""""""""""""""""""""""""
" bindings
""""""""""""""""""""""""

" toggle paste mode
set pastetoggle=<F2>

" save on lost focus
au FocusLost * :wa

" sort paragraphs
vnoremap <leader>s !sort -f<CR>gv
nnoremap <leader>s vip!sort -f<CR><Esc>

" quick colon
nnoremap ; :
vnoremap ; :

" get j and k to work as expected on super long (wrapped) lines
nnoremap j gj
nnoremap k gk

" delete a line without adding it to the yank stack
nnoremap <silent> <leader>d "_d
vnoremap <silent> <leader>d "_d

" yank to the end of the line
nnoremap Y y$

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

""""""""""""""""""""""""
" filetype specific
""""""""""""""""""""""""

" only run this if autocmd is supported
if has("autocmd")

  aug invisible_chars "{{{
    au!
    " show invisible characters in all of these files
    au filetype vim setl list
    au filetype python setl list
    au filetype ruby setl list
    au filetype javascript setl list
    au filetype css setl list
  aug end "}}}

  aug java_files "{{{
    au!
    au filetype java setl ts=4 sw=4 sts=4
  aug end "}}}

  aug html_files "{{{
    au!
    au filetype html setl ts=4 sw=4 sts=4
  aug end "}}}

  aug xml_files "{{{
    au!
    au filetype xml setl ts=4 sw=4 sts=4
  aug end "}}}

endif

"""
" excercises
"""

map - ddp
map _ ddkP
