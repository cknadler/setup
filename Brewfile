# taps
tap 'caskroom/cask'
tap 'homebrew/dupes'

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew 'coreutils'
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew 'findutils'

# Install wget with IRI support
brew 'wget', args: ['with-iri']

# Install more recent versions of some OS X tools
brew 'vim', args: ['override-system-vi']
brew 'homebrew/dupes/grep'

# Install other useful binaries
brew 'ack'
brew 'curl'
brew 'git'
brew 'macvim'
brew 'objc-run'
brew 'pcre'
brew 'python'
brew 'rbenv'
brew 'reattach-to-user-namespace'
brew 'ruby-build'
brew 'sqlite'
brew 'the_silver_searcher'
brew 'tmux'
brew 'xctool'
brew 'zsh'

# install casks
cask 'dropbox'
cask 'google-chrome'
cask 'google-drive'
cask 'iterm2'
cask 'karabiner'
cask 'mactex'
cask 'pandoc'
cask 'seil'
cask 'skype'
cask 'spotify'
cask 'the-unarchiver'

# Remove outdated versions from the cellar
cleanup
