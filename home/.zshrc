###
# zsh specific
###

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="minimal"
source $ZSH/oh-my-zsh.sh
plugins=(brew node npm osx)

###
# zsh config
###

bindkey -v

###
# path
###

# standard path
PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin
# gnu core utils
PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
# homebrew
PATH=/usr/local/bin:$PATH
# npm
PATH=/usr/local/share/npm/bin:$PATH
# rbenv
PATH=$HOME/.rbenv/bin:$PATH
# work
PATH=$PATH:$HOME/.work_bin

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
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Prefer US English and use UTF-8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"

###
# setup tools
###

# rbenv
eval "$(rbenv init -)"

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
DISABLE_AUTO_TITLE=true

###
# aliases
###

# general
alias l='ls -A --color'
alias ll='ls -lA --color'
alias rst='exec $SHELL -l'

# brew
alias brewup='brew update && brew upgrade'

# git
alias g=git

# navigation
alias src='cd ~/src'
alias ws='cd ~/workspace'
alias home='cd ~/.homesick/repos/dotfiles'

# ruby dev
alias bex='bundle exec'
alias bi='bundle install'
alias bu='bundle uninstall'

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# core-utils
alias readlink=greadlink

eval `~/.packages/gen-aliases`
