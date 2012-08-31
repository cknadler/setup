# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew osx ruby rails3)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/mysql/bin:~/.bin

#aliases
alias la='ls -a'
alias ll='ls -la'
alias c='clear'

#vim
alias vim='mvim'

#git
eval "$(hub alias -s)"
alias gst="git status -sb"

#rbenv
eval "$(rbenv init -)"
