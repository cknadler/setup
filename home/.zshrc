# Oh-My-ZSH Config
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="minimal"
source $ZSH/oh-my-zsh.sh

# Standard path
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.bin

# os 161
# This should be removed eventually
PATH="$PATH:$HOME/sys161/bin:$HOME/sys161/tools/bin"

# npm
PATH="/usr/local/share/npm/bin:$PATH"

# rbenv
eval "$(rbenv init -)"

# general
alias l='ls -a'
alias ll='ls -la'
alias c='clear'

# brew
alias brewup='brew update && brew upgrade'

# navigation
alias code='cd $HOME/code'
alias home='cd $HOME/.homesick/repos/cknadler/dotfiles'

# use homebrew gcc
export CC=/usr/local/bin/gcc-4.2
