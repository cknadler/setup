# Workspace Setup

Documenting how I set up my workspace. See [dotfiles here](https://github.com/cknadler/dotfiles).

## OSX

~~Most~~ Some of this is automated. Run the following:

```bash
git clone https://github.com/cknadler/setup && \
pushd setup && \
  ./bootstrap && \
popd && \
rm -r setup
```

### Bindings / Settings

- [Alfred](https://www.alfredapp.com/)
  - Preferences: `~/Dropbox/config/Alfred/preferences`
  - Workflows: `~/Dropbox/config/Alfred/workflows`
- General (Keyboard -> Shortcuts -> Mission Control -> Mission Control)
  - Move Left A Space: `cmd+shift+h`
  - Move Right A Space: `cmd+shift+l`
- Spotlight (Keyboard -> Shortcuts -> Spotlight)
  - Show Spotlight Search: `unbind` (use Alfred instead)

## Windows

### Settings

- System
  - Multitasking
    - "When I snap a window, show..." -> off
    - "When I resize a snapped window..." -> off
    - Timeline -> off

### Software

- [SharpKeys](https://github.com/randyrants/sharpkeys)
  - Left Cmd -> Left Ctrl
  - Left Ctrl -> Left Cmd
  - Caps Lock -> Escape

## Music

### General

- [Cubase](https://www.steinberg.net/en/mysteinberg/my_products.html)
  - [Symlink these folders](https://helpcenter.steinberg.de/hc/en-us/articles/360000327730-Location-file-paths-of-presets-in-Cubase-and-Nuendo-) in from `~/Dropbox/config/Cubase` (TODO: script)
- [Dorico](https://new.steinberg.net/dorico/) (TODO: script key commands)
  - Preferences -> Key Commands
    - Raise Pitch by Chromatic Step: opt+shft+K
    - Raise Pitch by Octave: opt+cmd+K
    - Raise Pitch by Step: opt+K
    - Lower Pitch by Chromatic Step: opt+shft+J
    - Lower Pitch by Octave: opt+cmd+J
    - Lower Pitch by Step: opt+J
  - Notation Options -> Accidentals
    - Notes at a different octave in the following bar: No cautionary
  - Setup
    - Layout Options: opt+shft+cmd+L

### Hardware Drivers

Pre-installed by homebrew
- Fractal Bot
- iLok

Install manually
- [Axe Edit](https://www.fractalaudio.com/axe-edit/)
- [Axe FX 2 USB Driver](https://www.fractalaudio.com/axe-fx-ii-downloads/)
- [Scarlett 18i20 (3rd gen) Driver](https://downloads.focusrite.com/focusrite/scarlett-3rd-gen/scarlett-18i20-3rd-gen)

### Plugins

Install via plugin managers, already installed by homebrew

- iZotope
- Waves
- Splice
- Native Instruments
  - Update downloads, app & content to `/SSD/native_instruments`
- Spitfire Audio
 
#### Manual

- [UAD](https://www.uaudio.com/my/account/)
- [Neural DSP](https://neuraldsp.com/)
  - Fortin Nameless
  - Parallax
  - Nolly
  - Fortin NTS
  - Plini
- [Plugin Alliance](https://www.plugin-alliance.com/en/installation-manager.html)
- [Steven Slate Drums - Trigger 2](https://my.stevenslateaudio.com/)
- [Valhalla DSP](https://valhalladsp.com/my-account/) (some in account, some free below)
  - [Super Massive](https://valhalladsp.com/shop/reverb/valhalla-supermassive/)
  - [Freq Echo](https://valhalladsp.com/shop/delay/valhalla-freq-echo/)
  - [Space Mod](https://valhalladsp.com/shop/modulation/valhalla-space-modulator/)
- [Auto Align](https://www.soundradix.com/)
- [Toontrack](https://www.toontrack.com/product-manager/)
  - Component installation path `/SSD/superior_drummer`
  - Symlink `~/Dropbox/confic/Superior\ Drummer/User\ MIDI` -> `~/Music/EZdrummer/User\ MIDI` (TODO: script)
- [FabFilter](https://www.fabfilter.com/download/)
- [Slate Digital](https://slatedigital.com/installers/)
- [TSE BOD](https://www.tseaudio.com/software/tseBOD)
- [Soothe](https://oeksound.com/plugins/)
- [boz Digital Labs](https://www.bozdigitallabs.com/my-account/downloads/)
- [Soundtoys](https://acct.soundtoys.com/acct/downloads)
- [Sonnox](https://www.sonnox.com/mysonnox)
- [OTT](https://splice.com/plugins/3788-ott-vst-au-by-xfer-records)

## Credits

* [ryanb/dotfiles](https://github.com/ryanb/dotfiles)
* [rtomayko/dotfiles](https://github.com/rtomayko/dotfiles)
* [technicalpickles/pickled-vim](https://github.com/technicalpickles/pickled-vim)
* [tpope/tpope](https://github.com/tpope/tpope)
* [sectioneight/dotfiles](https://github.com/sectioneight/dotfiles)
* [skwp/dotfiles](https://github.com/skwp/dotfiles)

If I'm using something I forgot to credit, please let me know.

## Copyright

Copyright (c) 2020 Chris Knadler. See LICENSE for details.

