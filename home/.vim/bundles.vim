"""
" bundles.vim
"
" Contains bundles to be sourced in vimrc and managed by vundle.
"
" This file contains all the configuration needed to get the
" bundles installed and vundle working. Individual bundle
" configuration can be found in vimrc.
"""

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
Bundle 'vim-gitgutter'

" Colorschemes
Bundle 'tomasr/molokai'

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

" tmux
Bundle 'sjl/vitality.vim'

" vimux
Bundle 'benmills/vimux'
Bundle 'jgdavey/vim-turbux'
Bundle 'benmills/vimux-golang'

"""""
" Lanugage Specific Plugins
"""""

" Web Frontend
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-haml'
Bundle 'othree/html5.vim'

" Web Backend
Bundle 'digitaltoad/vim-jade'
Bundle 'tpope/vim-rails'

" Markdown
Bundle 'tpope/vim-markdown'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-cucumber'

" Go
Bundle 'jnwhiteh/vim-golang'

" Java
"Bundle 'vim-scripts/jcommenter.vim'
