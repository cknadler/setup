# setup

Bootstrap a fresh macOS dev environment.

## Layout

- `bootstrap` — entrypoint: argument parsing, logging, step orchestration.
- `lib.sh` — step functions (`step_xcode`, `step_homebrew`, …),
  logging (`log_info`, `log_warn`, …), state tracking (`state_*`),
  and read-only doctor probes (`doctor_*`). Sourced by `bootstrap`.
- `Brewfile` — default Homebrew packages.
- `Brewfile.home` — extra apps for personal machines (Dropbox, Signal, etc.).
- `Brewfile.fun` — games / media.
- `Brewfile.music` — audio production. **Out of scope** for current work.
- `.osx` — `defaults write` customizations; run last (some changes
  require a restart).
- `Makefile` — `make test`, `make lint`, `make doctor`, `make all`.
- `tests/` — bats-core test suite (29 tests) using PATH-shim mocks under
  `tests/fixtures/bin/`. Tests source `lib.sh` directly and exercise step
  functions with isolated `$HOME` and stubbed subprocess calls.
- `colors/` — terminal color theme assets.

## Usage

```
./bootstrap                Interactive: prompt for each step.
./bootstrap --all          Non-interactive: run every step (in scope).
./bootstrap --only S1,S2   Run only named steps.
./bootstrap --doctor       Read-only state report. Installs nothing.
./bootstrap --force        Re-run completed steps.
./bootstrap --help         Usage.
```

State and logs live in `~/.local/state/setup/`:
- `completed` — newline-delimited list of finished steps; re-runs skip these.
- `bootstrap-<timestamp>.log` — every run's output, tee'd from stderr.

## Steps

In `--all` order: `xcode`, `homebrew`, `brewfile`, `claude`, `chezmoi`,
`marta`, `vim_anywhere`, `osx`.

Extra steps (interactive or `--only`): `brewfile_home`, `brewfile_fun`,
`brewfile_music`.

Every step is idempotent — re-runnable any number of times. Failures in
one step don't abort the rest of the run; check the log + state file for
what didn't complete and re-run with `--only <step>` after fixing.

## Testing

```
make test     # bats tests/
make lint     # shellcheck over bootstrap, lib.sh, fixtures
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
- Stage 4 (planned) — automate manual "Bindings / Settings" via a
  separate `bindings` script
- Stage 5 (planned) — README rewrites + tag a release

See `PLAN.md` in the parent workspace for the full roadmap.
