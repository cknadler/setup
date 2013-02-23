# Chris Knadler Dot Files

These are my config files to set up my OSX development environment.

## Setup

First, install [rbenv][rbenv] and zsh:

```bash
$ brew install rbenv ruby-build zsh
```

Next, setup [Oh-My-Zsh][omzsh]:

```bash
$ wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
```

Configure [rbenv][rbenv]:

```bash
$ echo 'eval "$(rbenv init -)"' >> ~/.zshrc
$ rbenv install 1.9.3-p327 # or the latest version
$ rbenv rehash
```

Install [homesick][homesick]:

```bash
$ gem install homesick
```

Several vim plugins I use require a more up to date version of vim than ships with OSX. The easiet way to get past this is to install MacVim with brew and allow it to override system vim.

```bash
$ brew install macvim --override-system-vim
```

Finally, install a bunch of other miscelanious tools:

```bash
$ brew install the_silver_searcher tmux hub git-extras cmake
```

## Installation

I use [homesick][homesick] by Josh Nichols. It's a simple way to symlink your dotfiles into `$HOME`.

First, clone and link everything with homesick:

```bash
$ homesick clone cknadler/dotfiles &&\
homesick symlink cknadler/dotfiles
```

Compile [YouCompleteMe][ycm]:

```bash
$ cd ~/.vim/bundle/YouCompleteMe &&\
./install.sh --clang-completer
```

Finally, load all of the vim bundles. Open vim and run:

```
:BundleInstall
```

## Issues

If you run into any problems getting things setup, contact me and we will get it figured out.

Email: takeshi91k@gmail.com
Twitter: [@cknadler](https://twitter.com/cknadler)

## Credits

I made practically none of these dotfiles. They are mostly from:

* [ryanb/dotfiles](https://github.com/ryanb/dotfiles)
* [rtomayko/dotfiles](https://github.com/rtomayko/dotfiles)
* [technicalpickles/pickled-vim](https://github.com/technicalpickles/pickled-vim)
* [tpope/tpope](https://github.com/tpope/tpope)
* [sectioneight/dotfiles](https://github.com/sectioneight/dotfiles)
* [skwp/dotfiles](https://github.com/skwp/dotfiles)

If I'm using something I forgot to credit, please let me know.

## Copyright

Copyright (c) 2013 Chris Knadler. See LICENSE for details.

[rbenv]: https://github.com/sstephenson/rbenv/
[homesick]: https://github.com/technicalpickles/homesick
[omzsh]: https://github.com/robbyrussell/oh-my-zsh
[ag]: https://github.com/ggreer/the_silver_searcher
[ycm]: https://github.com/Valloric/YouCompleteMe.git
