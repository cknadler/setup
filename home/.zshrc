###
# Oh-My-ZSH
###

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="minimal"
source $ZSH/oh-my-zsh.sh
plugins=(brew node npm osx)

###
# vi mode
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

###
# config
###

# rbenv
eval "$(rbenv init -)"

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
DISABLE_AUTO_TITLE=true

# work
[[ -d $HOME/.work_bin ]] && source $HOME/.work_bin/.workrc

###
# aliases
###

# general
alias l='ls'
alias la='ls -A'
alias ll='ls -lA'
alias c='clear'
alias rst='exec $SHELL -l'

# brew
alias brewup='brew update && brew upgrade'

# navigation
alias src='cd ~/src'
alias home='cd ~/.homesick/repos/cknadler/dotfiles'

###
# general env variables
###

# general
EDITOR='vim'

# use homebrew gcc
CC=/usr/local/bin/gcc-4.2
