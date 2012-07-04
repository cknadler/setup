set nocompatible

call pathogen#infect()

syntax on
set background=dark
colorscheme solarized
filetype off
filetype plugin indent on
set gfn=Inconsolata:h16
set lines=50 columns=100

set showcmd
set showmode
set number

set incsearch
set hlsearch

set wrap
set linebreak

set smartindent
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"Nerd Tree
map <C-f> :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif

map <C-j> <C-W>j<C-W><CR>
map <C-k> <C-W>k<C-W><CR>

"Disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
