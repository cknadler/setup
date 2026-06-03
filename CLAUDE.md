# setup

Bootstrap a fresh macOS dev environment.

## Layout

- `bootstrap` — entrypoint: argument parsing, logging, step orchestration.
- `lib.sh` — step functions (`step_xcode`, `step_homebrew`, …),
  logging (`log_info`, `log_warn`, …), state tracking (`state_*`),
  and read-only doctor probes (`doctor_*`). Sourced by `bootstrap`.
- `Brewfile` — default packages installed on every machine, including the
  everyday apps (Signal, Spotify, Dropbox, Obsidian, …) and `mas` HEIC.
- `Brewfile.home` — home-machine extras (Discord, VLC, Synology Drive, …);
  auto-installed when "personal" is chosen.
- `Brewfile.media` — media apps (Plex, YACReader).
- `Brewfile.music` — audio production. **Out of scope** for current work.
- `.osx` — `defaults write` customizations; run last (some changes
  require a restart).
- `Makefile` — `make test`, `make lint`, `make doctor`, `make all`.
- `tests/` — bats-core test suite (63 tests) using PATH-shim mocks under
  `tests/fixtures/bin/`. Tests source `lib.sh` directly and exercise step
  functions with isolated `$HOME` and stubbed subprocess calls.
- `colors/` — terminal color theme assets.

## Usage

```
./bootstrap                Interactive: ask machine type, then optional extras.
./bootstrap --all          Non-interactive: run every core step (in scope).
./bootstrap --only S1,S2   Run only named steps.
./bootstrap --doctor       Read-only state report. Installs nothing.
./bootstrap --force        Re-run completed steps.
./bootstrap --help         Usage.
```

State and logs live in `~/.local/state/setup/`:
- `completed` — newline-delimited list of finished steps; re-runs skip these.
- `bootstrap-<timestamp>.log` — every run's output, tee'd from stderr.

## Steps

Core steps (`--all` order, and run on every machine in the interactive flow):
`xcode`, `homebrew`, `brewfile`, `claude`, `chezmoi`, `marta`, `vim_anywhere`,
`bindings`, `osx`.

Extra steps: `brewfile_home`, `brewfile_music`, `brewfile_media`, `crawl`.
The interactive flow asks "work or personal?" — both run the core steps; a
personal machine additionally runs `brewfile_home` and is prompted (y/n) for
`brewfile_music`, `crawl` (games), and `brewfile_media`. Extras are also
reachable directly via `--only`.

Every step is idempotent — re-runnable any number of times. Failures in
one step don't abort the rest of the run; check the log + state file for
what didn't complete and re-run with `--only <step>` after fixing.

## Testing

```
make test     # bats tests/
make lint     # shellcheck (bootstrap, lib.sh, .osx, fixtures) + Brewfile syntax
make doctor   # ./bootstrap --doctor
make all      # lint + test
```

Tests use PATH-shim mocks (`tests/fixtures/bin/_shim` with per-command
symlinks). Each stub records its invocation to `$SHIM_CALLS` so tests can
assert on subprocess args; exit codes and stdout are controllable per-test
via `SHIM_EXIT_<NAME>` / `SHIM_STDOUT_<NAME>` env vars.

## Companion repo

[`cknadler/dotfiles`](https://github.com/cknadler/dotfiles) — chezmoi-managed
dotfiles. `bootstrap` runs `chezmoi init` against that repo as part of the
`chezmoi` step.

## Status

- Stage 1 ✅ — cleanup, `.osx` prune
- Stage 2 ✅ — Claude Code CLI install + AI tooling Brewfile entries
- Stage 3 ✅ — bootstrap restructured into idempotent step functions,
  CLI flags, logging, state tracking, bats tests, shellcheck
- Stage 4 ✅ — `step_bindings` automates Mission Control space-switching
  hotkeys, Spotlight unbind, and Spotlight privacy folders
- Stage 5 ✅ — READMEs rewritten, Makefile shortcuts (`make brew`,
  `make defaults`), sanity passes green
- v2 (deferred) — TPM-shaped slash commands + agents under `dot_claude/`
- Stage 6 (tail) — `dot_crawlrc` refresh

See `PLAN.md` in the parent workspace for the full roadmap.
