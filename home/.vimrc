"""""""""""""""""""""""""
" base
"""""""""""""""""""""""""

set nocompatible
filetype off
syntax enable

"""""""""""""""""""""""""
" activate bundles
"""""""""""""""""""""""""

" load bundles
if filereadable(expand("~/.vim/bundles.vim"))
  source ~/.vim/bundles.vim
endif

filetype plugin indent on " after loading bundles

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

" colorscheme
set t_Co=256        " 256 colors
set background=dark
colorscheme molokai

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


" internal
set history=1000    " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
if v:version >= 730
    set undofile    " keep a persistent backup file
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup        " no backup files
set noswapfile      " no swap files
set directory=~/.vim/.tmp,~/tmp,/tmp

""""""""""""""""""""""""
" plugin config
""""""""""""""""""""""""

" syntastic
let g:syntastic_mode_map = {
  \ 'mode': 'passive',
  \ 'active_filetypes': ['ruby', 'c', 'python']
  \ }

" vim-json
let g:vim_json_syntax_conceal = 0 " don't conceal quotes

" easy-align
" start interactive easy-align in visual mode
vmap <Enter> <Plug>(EasyAlign)
" start interactive easy-align with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" vim-mustache-handlebars
let g:mustache_abbreviations = 1

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
" quick vim config edit mappings
nnoremap <leader>S :source $MYVIMRC<cr>
nnoremap <leader>E :vsplit $MYVIMRC<cr>
nnoremap <leader>B :vsplit $HOME/.vim/bundles.vim<cr>
" sort paragraphs
vnoremap <leader>s !sort -f<cr>gv
nnoremap <leader>s vip!sort -f<cr><Esc>

" better search
nnoremap / /\v
vnoremap / /\v

" tab to move to next match
nnoremap <tab> %
vnoremap <tab> %

" toggle paste mode
set pastetoggle=<F2>

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

" copy/paste pbcopy
vmap <C-x> :!pbcopy<cr>
vmap <C-c> :w !pbcopy<cr><cr>

" map ctrl+{h,j,k,l} to switch splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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
" set filetypes
""""""""""""""""""""""""

" ruby
au BufRead,BufNewFile Podfile set filetype=ruby

" JSON (Javascript for now)
au BufRead,BufNewFile *.json.schema set filetype=javascript

" Markdown
au BufRead,BufNewFile *.md set filetype=markdown

""""""""""""""""""""""""
" filetype specific
""""""""""""""""""""""""

" only run this if autocmd is supported
if has("autocmd")
  " turn on spell checking for these file types
  aug spell_checking
    au!
    au filetype text setl spell
    au filetype markdown setl spell
    au filetype gitcommit setl spell
  aug end

  " show invisible characters in these file types
  aug invisible_chars
    au!
    au filetype vim setl list
    au filetype ruby setl list
    au filetype javascript setl list
    au filetype css setl list
  aug end

  " override the default 2 space with 4 space indents in these file types
  aug alternate_spacing
    au!
    au filetype java setl ts=4 sw=4 sts=4
    au filetype xml setl ts=4 sw=4 sts=4
    au filetype python setl ts=4 sw=4 sts=4
  aug end
endif

