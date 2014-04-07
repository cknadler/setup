"""
" bundles.vim
"
" Contains bundles to be sourced in .vimrc and managed by vundle.
"
" This file contains all the configuration needed to get the
" bundles installed and vundle working. Individual bundle
" configuration can be found in .vimrc.
"""

" Vundle required conf
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"""""""""""""""""""""""
" bundles
"""""""""""""""""""""""
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Valloric/MatchTagAlways'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'chikamichi/mediawiki.vim'
Bundle 'chrisbra/NrrwRgn'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'elzr/vim-json'
Bundle 'goldfeld/vim-seek'
Bundle 'jnwhiteh/vim-golang'
Bundle 'junegunn/goyo.vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'noprompt/vim-yardoc'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'sunaku/vim-ruby-minitest'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-liquid'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/applescript.vim'
Bundle 'wookiehangover/jshint.vim'
Bundle 'zaiste/tmux.vim'

