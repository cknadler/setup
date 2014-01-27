# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
install findutils

# Install wget with IRI support
install wget --enable-iri

# Install more recent versions of some OS X tools
install vim --override-system-vi
tap homebrew/dupes
install homebrew/dupes/grep

# Install other useful binaries
install ack
install appledoc
install autoconf
install automake
install curl
install git
install hub
install macvim
install node
install pcre
install python
install python3
install rbenv
install reattach-to-user-namespace
install ruby-build
install sqlite
install the_silver_searcher
install tmux
install xctool

# Remove outdated versions from the cellar
cleanup
