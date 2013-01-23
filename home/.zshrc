# ZSH Config
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="kennethreitz"
plugins=(git brew osx ruby rails3 npm pow terminalapp vi-mode)
source $ZSH/oh-my-zsh.sh

# Standard path
export PATH=/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/mysql/bin

# Add Postgres.app bin to path
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

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
alias go="git push origin master"
