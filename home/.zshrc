# Oh-My-ZSH Config
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="minimal"
source $ZSH/oh-my-zsh.sh

# Standard path
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# npm
PATH="/usr/local/share/npm/bin:$PATH"

# rbenv
PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# general
alias l='ls -a'
alias ll='ls -la'
alias c='clear'
alias rst='exec $SHELL -l'
EDITOR='vim'

# brew
alias brewup='brew update && brew upgrade'

# navigation
alias src='cd ~/src'
alias home='cd ~/.homesick/repos/cknadler/dotfiles'

# use homebrew gcc
CC=/usr/local/bin/gcc-4.2

# aliases for quick project navigation
# TODO: make this tolerant of no directories in src
for p in ~/src/*; do alias d-$(basename $p)="cd $p"; done

# git
GIT_DISCOVERY_ACROSS_FILESYSTEM=1

