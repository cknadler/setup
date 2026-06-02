# setup

Bootstrap a fresh macOS dev environment.

## Layout

- `bootstrap` — main installer; interactive prompts choose which steps run.
- `Brewfile` — default Homebrew packages (core dev workflow).
- `Brewfile.home` — extra apps for personal machines (Dropbox, Signal, etc.).
- `Brewfile.fun` — games / media.
- `Brewfile.music` — audio production. **Out of scope** for current work.
- `.osx` — `defaults write` customizations; run last (some changes
  require a restart).
- `colors/` — terminal color theme assets.

## Workflow

```
git clone https://github.com/cknadler/setup
cd setup && ./bootstrap
```

The bootstrap will also `chezmoi init` the companion dotfiles repo:
[`cknadler/dotfiles`](https://github.com/cknadler/dotfiles).

## Status

- Stage 1 cleanup is done (oh-my-zsh removed, `.osx` pruned, vim/ruby
  configs dropped).
- Stage 2 wires up AI tooling foundations (Claude Code CLI, Brewfile adds).
- Stage 3 (planned) restructures `bootstrap` into idempotent step functions
  with tests via `bats-core`.
- Stage 4 (planned) automates the manual "Bindings / Settings" steps from
  the README via a separate `bindings` script.

See `PLAN.md` in the parent workspace for the full roadmap.
