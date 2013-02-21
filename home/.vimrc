" load all bundles
source ~/.vim/bundles.vim

" standard config
syntax on
filetype plugin indent on

" colorscheme
set background=dark
colorscheme base16-tomorrow

" search
set incsearch
set hlsearch
set ignorecase
set smartcase

" folding
set nofoldenable

" navigation
set scrolloff=5

" display
set showmatch
set showcmd

" tabs and indents
set smartindent
set autoindent
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set wrap

" easy-motion
let g:EasyMotion_leader_key = '<Leader>'

" nerdcommenter
let NERDSpaceDelims=1
nmap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1

" ZenCoding
let g:user_zen_expandabbr_key='<C-j>'

" powerline
let g:Powerline_symbols = 'fancy'

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
