"""
" bundles.vim
"
" Contains bundles to be sourced in vimrc and managed by vundle.
"
" This file contains all the configuration needed to get the
" bundles installed and vundle working. Individual bundle
" configuration can be found in vimrc.
"""

set nocompatible
filetype off

" Vundle required conf
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"""""""""""""""""""""""
" Bundles
"""""""""""""""""""""""

" Git
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'

" Colorscheme
Bundle 'chriskempson/vim-tomorrow-theme'

" Syntax Highlighting
Bundle 'tpope/vim-markdown'

" Utilities
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'

" Editing
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Valloric/MatchTagAlways'

" Formatting
Bundle 'bronson/vim-trailing-whitespace'

" Navigation
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-unimpaired'

" Web Frontend
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-haml'
Bundle 'othree/html5.vim'

" Web Backend
Bundle 'digitaltoad/vim-jade'
Bundle 'tpope/vim-rails'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-cucumber'
