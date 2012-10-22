# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="bira"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git brew osx ruby rails3 npm pow terminalapp vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/mysql/bin:~/.bin

#general
alias la='ls -a'
alias ll='ls -la'
alias c='clear'

#navigation
alias home='cd ~/.homesick/repos/cknadler/dotfiles'
alias p='cd ~/projects'

#vim
alias vim='mvim'

#git
eval "$(hub alias -s)"
alias gst="git status -sb"

#rbenv
eval "$(rbenv init -)"
