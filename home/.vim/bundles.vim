"""
" bundles.vim
"
" Contains bundles to be sourced in vimrc and managed by vundle.
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
" Bundles
"""""""""""""""""""""""

" Git
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'

" Colorschemes
Bundle 'tomasr/molokai'

" Utilities
Bundle 'scrooloose/syntastic'

" Appearance
Bundle 'tpope/vim-surround'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Valloric/MatchTagAlways'

" Editing
Bundle 'scrooloose/nerdcommenter'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'junegunn/vim-easy-align'

" Navigation
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'

" tmux
Bundle 'sjl/vitality.vim'

"""""
" Lanugage Specific Bundles
"""""

Bundle 'mustache/vim-mustache-handlebars'

" HTML
Bundle 'othree/html5.vim'

" CoffeeScript
Bundle 'kchmck/vim-coffee-script'

" JavaScript
Bundle 'pangloss/vim-javascript'
Bundle 'elzr/vim-json'

" Jade
Bundle 'digitaltoad/vim-jade'

" Markdown
Bundle 'tpope/vim-markdown'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'noprompt/vim-yardoc'

" Go
Bundle 'jnwhiteh/vim-golang'

" Mediawiki
Bundle 'chikamichi/mediawiki.vim'
