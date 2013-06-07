# Oh-My-ZSH Config
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="minimal"
source $ZSH/oh-my-zsh.sh

# Standard path
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# os 161
# This should be removed eventually
PATH="$PATH:$HOME/sys161/bin:$HOME/sys161/tools/bin"

# npm
PATH="/usr/local/share/npm/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# general
alias l='ls -a'
alias ll='ls -la'
alias c='clear'
alias rst='exec $SHELL -l'

# brew
alias brewup='brew update && brew upgrade'

# navigation
alias src='cd ~/src'
alias home='cd ~/.homesick/repos/cknadler/dotfiles'

# use homebrew gcc
export CC=/usr/local/bin/gcc-4.2

# aliases for quick project navigation
for p in ~/src/*; do alias d-$(basename $p)="cd $p"; done
