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
- [Scarlett 2i2 (3rd gen) Driver](https://customer.focusrite.com/en/support/downloads?brand=Focusrite&product_by_range=1361&download_type=all)
- [iLok](https://www.ilok.com/#!license-manager)

**Plugins**

- [Neural DSP](https://neuraldsp.com/)
  - Fortin Nameless
  - Parallax
  - Nolly
- [Waves](https://www.waves.com/login)
- [Valhalla DSP](https://valhalladsp.com/my-account/) (some in account, some free below)
  - [Super Massive](https://valhalladsp.com/shop/reverb/valhalla-supermassive/)
  - [Freq Echo](https://valhalladsp.com/shop/delay/valhalla-freq-echo/)
  - [Space Mod](https://valhalladsp.com/shop/modulation/valhalla-space-modulator/)
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
- [Headcrusher](http://www.vst4free.com/free_vst.php?plugin=HeadCrusher_Free&id=2112)
- [Bittersweet](https://www.flux.audio/project/bittersweet-v3/)
- [TDR Kotelnikov](https://www.tokyodawn.net/tdr-kotelnikov/)
- [Ozone Imager](https://www.izotope.com/en/products/ozone-imager.html)
- [MAutoPitch](https://www.meldaproduction.com/MAutoPitch)
- [Tyrell N6](https://www.amazona.de/freeware-synthesizer-tyrell-n6-plugin-vst-au-win-mac/) (presets are backed up in Cubase)
- [Helm](https://tytel.org/helm/)
- [Dexed](https://asb2m10.github.io/dexed/)
- [TAL Chorus LX](https://tal-software.com/products/tal-chorus-lx)
- [Soothe](https://oeksound.com/plugins/)

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

