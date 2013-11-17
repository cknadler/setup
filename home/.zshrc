###
# Oh-My-ZSH
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
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
# npm
PATH="/usr/local/share/npm/bin:$PATH"
# rbenv
PATH="$HOME/.rbenv/bin:$PATH"
# work
PATH="$PATH:$HOME/.work_bin"

###
# general env variables
###

EDITOR='vim'
CC=/usr/local/bin/gcc-4.2 # use homebrew gcc

###
# tool loaders
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
alias l='ls -A'
alias c='clear'
alias rst='exec $SHELL -l'

# brew
alias brewup='brew update && brew upgrade'

# git
alias g=git

# navigation
alias src='cd ~/src'
alias home='cd ~/.homesick/repos/cknadler/dotfiles'
