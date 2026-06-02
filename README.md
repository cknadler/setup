# Workspace Setup

Bootstrap a fresh Mac dev environment. Pairs with
[dotfiles](https://github.com/cknadler/dotfiles) (chezmoi-managed).

## macOS

### Fresh machine

```bash
git clone https://github.com/cknadler/setup ~/src/setup
cd ~/src/setup && ./bootstrap --all
```

`--all` is non-interactive: it runs every step
(`xcode`, `homebrew`, `brewfile`, `claude`, `chezmoi`, `marta`,
`vim_anywhere`, `bindings`, `osx`). Steps are idempotent and re-runnable.

### Day-to-day

```bash
./bootstrap --doctor          # read-only state report
./bootstrap --only brewfile   # re-run a subset
./bootstrap --only bindings   # apply Mission Control / Spotlight hotkeys
./bootstrap --help            # all flags
```

Logs land in `~/.local/state/setup/bootstrap-<timestamp>.log`; a list of
completed steps is at `~/.local/state/setup/completed` (delete entries to
force a re-run, or use `--force`).

### Bindings / Settings

Scripted via `./bootstrap --only bindings`:

- Mission Control: Move Left/Right A Space → `cmd+shift+h` / `cmd+shift+l`
- Spotlight: `cmd+space` unbound (Alfred replaces it)
- Spotlight privacy: drops `.metadata_never_index` in `~/Obsidian` and
  `~/Documents/Backup Projects`

Still manual:

- [Alfred](https://www.alfredapp.com/) — Alfred prefs → Advanced → Set
  Sync Folder → `~/Dropbox/config/Alfred`. One-time GUI step; Alfred
  handles preferences and workflows from there.

### Development

```bash
make test     # bats tests/   (35 tests)
make lint     # shellcheck over bootstrap, lib.sh, fixtures
make doctor   # ./bootstrap --doctor
make all      # lint + test
```

See [`CLAUDE.md`](./CLAUDE.md) for repo layout and the test infrastructure.

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
- [Valhalla DSP](https://valhalladsp.com/my-account/)
- [Auto Align](https://www.soundradix.com/)
- [Toontrack](https://www.toontrack.com/product-manager/)
  - Component installation path `/SSD/superior_drummer`
  - Symlink `~/Dropbox/confic/Superior\ Drummer/User\ MIDI` -> `~/Music/EZdrummer/User\ MIDI` (TODO: script)
- [Slate Digital](https://slatedigital.com/installers/)
- [TSE BOD](https://www.tseaudio.com/software/tseBOD)
- [boz Digital Labs](https://www.bozdigitallabs.com/my-account/downloads/)
- [Soundtoys](https://acct.soundtoys.com/acct/downloads)
- [Sonnox](https://www.sonnox.com/mysonnox)
- [OTT](https://splice.com/plugins/3788-ott-vst-au-by-xfer-records)

## Copyright

Copyright (c) 2020 Chris Knadler. See LICENSE for details.

