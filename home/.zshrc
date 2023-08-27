###
# oh my zsh
###

ZSH=$HOME/.oh-my-zsh
ZSH_THEME='minimal'
source $ZSH/oh-my-zsh.sh
plugins=(brew node npm)

###
# zsh config
###

bindkey -v

###
# path
###

installed() { hash $1 &> /dev/null; }

# homebrew
PATH=/usr/local/bin:$PATH
# tex
PATH=/usr/texbin:$PATH
# gnu core utils
if installed brew; then
  PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
fi
# bin
PATH=$PATH:$HOME/.bin

###
# ruby
###

# eval "$(rbenv init -)"

###
# exports
###

# Make vim the default editor
export EDITOR="vim"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
# Make some commands not show up in history
export HISTIGNORE='ls:cd:cd -:pwd:exit:date:* --help'

# Prefer US English and use UTF-8
export LANG='en_US'
export LC_ALL='en_US.UTF-8'

# Always enable colored `grep` output
export GREP_OPTIONS='--color=auto'

###
# man pages
###

# Highlight section titles in manual pages
export LESS_TERMCAP_md=$ORANGE

# Don’t clear the screen after quitting a manual page
export MANPAGER='less -X'

# tmuxinator
export DISABLE_AUTO_TITLE=true

###
# aliases
###

# general
alias l='ls -A --color'
alias ll='ls -lA --color'
alias rst='exec $SHELL -l'
alias c='clear'

# vim-anywhere
alias vim-aw-hist='ls /tmp/vim-anywhere'
alias vim-aw-last='vim $( ls /tmp/vim-anywhere | sort -r | head -n 1 )'

# brew
alias brewup='brew update && brew upgrade'

# git
alias g=git

# navigation
alias src='cd ~/src'
alias home='cd ~/.homesick/repos/dotfiles'

# ruby dev
alias bex='bundle exec'
alias bi='bundle install'
alias bu='bundle uninstall'

# core-utils
alias readlink=greadlink

# navigation aliases
if [ -f ~/.bin/gen-aliases ]; then
  eval `~/.bin/gen-aliases`
fi

# bandcamp-dl
alias bc-dl="bandcamp-dl --base-dir='Dropbox/music/music-mp3'"
