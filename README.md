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
- Replace spotlight with Alfred (Keyboard -> Shortcuts -> Spotlight)
  - Show Spotlight Search: `unbind` (use Alfred instead)
- Don't index Obsidian files in spotlight (Spotlight -> Search Privacy)
  - Privacy
    - `~/Obsidian`
    - `~/Documents/Backup Projects` (don't index Dorico backups)

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
  - Preferences -> Transport -> "Locate when Clicked in Empty Space": enabled
  - Key Commands
    - Key Commands: `cmd+shft+K`
    - Record: `cmd+shft+R`
    - Set Left Locator to Product Cursor Position: `ctrl+A`
    - Set Right Locator to Product Cursor Position: `ctrl+D`
    - Go to Left Locator: `shft+A`
    - Go to Right Locator: `shft+D`
- [Dorico](https://new.steinberg.net/dorico/) (TODO: script key commands)
  - Preferences -> Key Commands
    - Raise Pitch by Chromatic Step: `opt+shft+K`
    - Raise Pitch by Octave: `opt+cmd+K`
    - Raise Pitch by Step: `opt+K`
    - Lower Pitch by Chromatic Step: `opt+shft+J`
    - Lower Pitch by Octave: `opt+cmd+J`
    - Lower Pitch by Step: `opt+J`
    - Filter -> Chord Symbols: `cmd+opt+shft+\`
  - Notation Options -> Accidentals
    - Notes at a different octave in the following bar: No cautionary
  - Setup
    - Layout Options: `opt+shft+cmd+L`
  - Library -> Edit playback techniques
    - Palm muting -> articulation type: Attribute

### Hardware Drivers

Pre-installed by homebrew
- iLok

Install manually
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

## Copyright

Copyright (c) 2020 Chris Knadler. See LICENSE for details.

