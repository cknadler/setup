# Chris Knadler Dot Files
These are my config files to set up my OSX development environment.

## Dependencies

Install the following:

* [rbenv][rbenv]
* [homesick][homesick] - `gem install homesick`
* [MacVim](http://code.google.com/p/macvim/) - `brew install macvim`

## Installation

I use [homesick][homesick] by Josh Nichols. It's a simple way to symlink your dotfiles into `$HOME`.

First, clone and link everything with homesick:

```
homesick clone cknadler/dotfiles &&\
homesick symlink cknadler/dotfiles
```

Next, load up the git submodule(s):

```
cd ~/.homesick/repos/cknadler/dotfiles &&\
git submodule init &&\
git submodule update
```

Finally, load all of the vim bundles. Open vim and run:

```
:BundleInstall
```

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
