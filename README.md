# Chris Knadler Dot Files

These are my config files to set up my OSX and Windows environments.

## OSX

Most of this is automated. Run the following:

```bash
git clone https://github.com/cknadler/dotfiles && \
pushd dotfiles && \
  ./bootstrap && \
popd && \
rm -r dotfiles
```

### App Store

Software I install via the App Store:

- [Better Snap Tool](http://blog.boastr.net/bettersnaptool/)
- Metronomics HD

### Manual

Software I install manually.

**General**:

- [Chrome](https://www.google.com/chrome)
- [1Password](https://1password.com/)
- [Dropbox](https://www.dropbox.com/install)
- [Alfred](https://www.alfredapp.com/)
  - Preferences: `~/Dropbox/config/Alfred`

**Music**:

- [Guitar Pro](https://www.guitar-pro.com/en/index.php)
- [Cubase](https://www.steinberg.net/en/mysteinberg/my_products.html)
  - After installing, [symlink the following folders](https://helpcenter.steinberg.de/hc/en-us/articles/360000327730-Location-file-paths-of-presets-in-Cubase-and-Nuendo-) in from `~/Dropbox/config/*` (TODO: script)
- [Waves](https://www.waves.com/login)
- [Valhalla DSP](https://valhalladsp.com/my-account/)
- [Toontrack](https://www.toontrack.com)
- [Axe Edit](https://www.fractalaudio.com/axe-edit/)
- [Axe FX 2 USB Driver](https://www.fractalaudio.com/axe-fx-ii-downloads/)
- [Fractal Bot](https://www.fractalaudio.com/fractal-bot/)
- [iLok](https://www.ilok.com/#!license-manager)
- [Splyce](https://splice.com/plugins/your-plugins)
- [FabFilter](https://www.fabfilter.com/download/)
- [Slate Digital](https://slatedigital.com/installers/)

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
- [Reverse Mouse Scroll](https://answers.microsoft.com/en-us/windows/forum/windows_10-other_settings/reverse-the-scroll-of-mouse/334669c3-8a45-4600-830a-8df628d7415e)
- [AquaSnap](https://www.nurgo-software.com/products/aquasnap)
  - Maximize: `ctrl+win+k`
  - Left: `ctrl+win+h`
  - Right: `ctrl+win+l`

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
