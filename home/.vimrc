set nocompatible

call pathogen#infect()

"Standard config
syntax on
set background=dark
colorscheme solarized
filetype off
filetype plugin indent on
set gfn=Inconsolata:h16
set lines=50 columns=80

"Show command and mode
set showcmd
set showmode

"Numbers
set relativenumber
set numberwidth=2

"Search
set incsearch
set hlsearch

"Tabs and indents
set smartindent
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set wrap
set linebreak

"Nerd Tree
map <C-f> :NERDTreeToggle<CR>

"Powerline
set laststatus=2
let g:Powerline_symbols = 'fancy'

"Disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
