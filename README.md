# Chris Knadler Dot Files

These are my config files to set up my OSX and Windows environments, as well as my music production environment.

## OSX

~~Most~~ Some of this is automated. Run the following:

```bash
git clone https://github.com/cknadler/dotfiles && \
pushd dotfiles && \
  ./bootstrap && \
popd && \
rm -r dotfiles
```

### App Store

- [Better Snap Tool](http://blog.boastr.net/bettersnaptool/)
- Metronomics HD

### Manual

- [Chrome](https://www.google.com/chrome)
- [1Password](https://1password.com/)
- [Dropbox](https://www.dropbox.com/install)
- [Alfred](https://www.alfredapp.com/)
  - Preferences: `~/Dropbox/config/Alfred/preferences`
  - Workflows: `~/Dropbox/config/Alfred/workflows`
- [MusicBrainz Picard](https://picard.musicbrainz.org/)
- [Plex Server](https://www.plex.tv/media-server-downloads/)

### Bindings

- General (Keyboard -> Shortcuts -> Mission Control)
  - Move Left A Space: `cmd+shift+h`
  - Move Right A Space: `cmd+shift+l`
- Spotlight (Keyboard -> Shortcuts -> Spotlight)
  - Show Spotlight Search: `unbind` (use Alfred instead)
- [Better Snap Tool](http://blog.boastr.net/bettersnaptool/)
  - Maximize: `cmd+ctrl+m`
  - Left Half: `cmd+ctrl+h`
  - Right Half: `cmd+ctrl+l`
  - Top Half: `cmd+ctrl+k`
  - Bottom Half: `cmd+ctrl+j`
  - Top Left: `cmd+ctrl+y`
  - Top Right: `cmd+ctrl+u`
  - Bottom Left: `cmd+ctrl+b`
  - Bottom Right: `cmd+ctrl+n`

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

**General**

- [Cubase](https://www.steinberg.net/en/mysteinberg/my_products.html)
  - [Symlink these folders](https://helpcenter.steinberg.de/hc/en-us/articles/360000327730-Location-file-paths-of-presets-in-Cubase-and-Nuendo-) in from `~/Dropbox/config/Cubase` (TODO: script)
- [Guitar Pro](https://www.guitar-pro.com/en/index.php)
- [Dorico](https://new.steinberg.net/dorico/) (TODO: script key commands)
  - Raise Pitch by Step: opt+k
  - Lower Pitch by Step: opt+j
  - Raise Pitch by Chromatic Step: opt+shft+k
  - Lower Pitch by Chromatic Step: opt+shft+j
  - Raise Pitch by Octave: opt+cmd+k
  - Lower Pitch by Octave: opt+cmd+j


**Hardware Drivers**

- [Axe Edit](https://www.fractalaudio.com/axe-edit/)
- [Axe FX 2 USB Driver](https://www.fractalaudio.com/axe-fx-ii-downloads/)
- [Fractal Bot](https://www.fractalaudio.com/fractal-bot/)
- [Scarlett 18i20 (3rd gen) Driver](https://downloads.focusrite.com/focusrite/scarlett-3rd-gen/scarlett-18i20-3rd-gen)
- [iLok](https://www.ilok.com/#!license-manager)

**Plugins**

- [UAD](https://www.uaudio.com/my/account/)
- [iZotope](https://www.izotope.com/en/account/overview)
- [Neural DSP](https://neuraldsp.com/)
  - Fortin Nameless
  - Parallax
  - Nolly
  - Fortin NTS
  - Plini
- [Plugin Alliance](https://www.plugin-alliance.com/)
- [Waves](https://www.waves.com/login)
- [Steven Slate Drums - Trigger 2](https://my.stevenslateaudio.com/)
- [Valhalla DSP](https://valhalladsp.com/my-account/) (some in account, some free below)
  - [Super Massive](https://valhalladsp.com/shop/reverb/valhalla-supermassive/)
  - [Freq Echo](https://valhalladsp.com/shop/delay/valhalla-freq-echo/)
  - [Space Mod](https://valhalladsp.com/shop/modulation/valhalla-space-modulator/)
- [Auto Align](https://www.soundradix.com/)
- [Toontrack](https://www.toontrack.com/product-manager/)
  - Component installation path `/SSD/superior_drummer`
  - Symlink `~/Dropbox/confic/Superior\ Drummer/User\ MIDI` -> `~/Music/EZdrummer/User\ MIDI` (TODO: script)
- [Splice](https://splice.com/plugins/your-plugins)
- [FabFilter](https://www.fabfilter.com/download/)
- [Slate Digital](https://slatedigital.com/installers/)
- [Native Instruments](https://www.native-instruments.com/en/specials/native-access/)
  - Update downloads, app & content to `/SSD/native_instruments`
- [Spitfire Audio](https://www.spitfireaudio.com/info/library-manager/)
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

