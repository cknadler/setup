# Oh-My-ZSH Config
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="lambda"
source $ZSH/oh-my-zsh.sh

# os 161
# This should be removed eventually
PATH="$PATH:$HOME/sys161/bin:$HOME/sys161/tools/bin"

#rbenv
eval "$(rbenv init -)"

#general
alias l='ls -a'
alias ll='ls -la'
alias c='clear'

#brew
alias brewup='brew update && brew upgrade'

#navigation
alias home='cd ~/.homesick/repos/cknadler/dotfiles'
alias p='cd ~/projects'

#vim
alias vi='vim'
alias v='vim'

#git
alias gst="git status -sb"
alias go="git push origin master"
