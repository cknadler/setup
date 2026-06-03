#!/usr/bin/env bats

# End-to-end smoke tests that exec the actual `bootstrap` script (not just
# the sourced lib.sh functions). These catch issues like bash 4+ feature
# usage, side effects from --doctor, and state-skip behavior on --only.
#
# Bootstrap is invoked via /bin/bash explicitly so we exercise the fresh-
# macOS baseline (bash 3.2.57), not the brew bash that bats itself runs.

load test_helper

@test "bootstrap parses under /bin/bash (3.2 syntax check)" {
  run /bin/bash -n "$REPO/bootstrap"
  [ "$status" -eq 0 ]
}

@test "lib.sh parses under /bin/bash (3.2 syntax check)" {
  run /bin/bash -n "$REPO/lib.sh"
  [ "$status" -eq 0 ]
}

@test "bootstrap --help works under /bin/bash" {
  run /bin/bash "$REPO/bootstrap" --help
  [ "$status" -eq 0 ]
  [[ "$output" == *"Usage:"* ]]
}

@test "bootstrap --doctor runs under /bin/bash and creates no state" {
  # No state dir, no completed file, no log: doctor must be read-only.
  [ ! -d "$HOME/.local/state" ]
  run /bin/bash "$REPO/bootstrap" --doctor
  [ "$status" -eq 0 ]
  [ ! -d "$HOME/.local/state" ]
  [ ! -f "$HOME/.local/state/setup/completed" ]
}

@test "bootstrap --only bypasses state-skip (re-runs marked steps)" {
  # Pre-mark marta as completed. With --only, run_step should re-execute
  # rather than silently skip.
  mkdir -p "$HOME/.local/state/setup"
  echo "marta" > "$HOME/.local/state/setup/completed"
  export SHIM_STDOUT_DEFAULTS=""  # NSFileViewer unset → step does work
  run /bin/bash "$REPO/bootstrap" --only marta
  [ "$status" -eq 0 ]
  # The step should have run (not skipped), so log_step was emitted.
  [[ "$output" == *"marta"* ]]
  [[ "$output" != *"already completed"* ]]
}

@test "bootstrap --only with no arg exits non-zero" {
  run /bin/bash "$REPO/bootstrap" --only
  [ "$status" -eq 2 ]
  [[ "$output" == *"--only requires"* ]]
}

@test "bootstrap --only with empty arg exits non-zero" {
  run /bin/bash "$REPO/bootstrap" --only ""
  [ "$status" -eq 2 ]
  [[ "$output" == *"--only requires"* ]]
}

@test "bootstrap --only followed by another flag exits non-zero" {
  run /bin/bash "$REPO/bootstrap" --only --doctor
  [ "$status" -eq 2 ]
  [[ "$output" == *"--only requires"* ]]
}

@test "bootstrap --only strips empty fragments from comma list" {
  # ",marta,," resolves to a single valid step ("marta") after stripping
  # leading/trailing/doubled-comma empties. State-skip is bypassed by --only.
  export SHIM_STDOUT_DEFAULTS=""
  run /bin/bash "$REPO/bootstrap" --only ",marta,,"
  [ "$status" -eq 0 ]
  [[ "$output" == *"marta"* ]]
}

@test "bootstrap --all skips already-completed steps without --force" {
  mkdir -p "$HOME/.local/state/setup"
  echo "marta" > "$HOME/.local/state/setup/completed"
  # Mark every other --all step as also done so they no-op cleanly.
  for step in xcode homebrew brewfile claude chezmoi vim_anywhere bindings osx; do
    echo "$step" >> "$HOME/.local/state/setup/completed"
  done
  run /bin/bash "$REPO/bootstrap" --all
  [ "$status" -eq 0 ]
  [[ "$output" == *"already completed"* ]]
}

# Pre-mark the core steps (and brewfile_home for personal) so the interactive
# flow exercises selection without actually installing anything.
_mark_core_done() {
  mkdir -p "$HOME/.local/state/setup"
  for step in "$@"; do
    echo "$step" >> "$HOME/.local/state/setup/completed"
  done
}

# read -p suppresses its prompt under non-tty stdin (the heredoc), so these
# assert on selection *outcomes* — the step count in the summary and which
# Brewfiles get bundled — rather than on prompt text.

@test "interactive 'work' selects the 9 core steps, no personal extras" {
  _mark_core_done xcode homebrew brewfile claude chezmoi marta vim_anywhere bindings osx
  run /bin/bash "$REPO/bootstrap" <<< $'work'
  [ "$status" -eq 0 ]
  [[ "$output" == *"9 step(s)"* ]]
  assert_not_called 'brew bundle --file=.*Brewfile.home'
  assert_not_called 'brew bundle --file=.*Brewfile.media'
}

@test "interactive 'personal' all-no adds brewfile_home only (10 steps)" {
  _mark_core_done xcode homebrew brewfile claude chezmoi marta vim_anywhere bindings osx brewfile_home
  run /bin/bash "$REPO/bootstrap" <<< $'personal\nn\nn\nn'
  [ "$status" -eq 0 ]
  [[ "$output" == *"10 step(s)"* ]]
  assert_not_called 'brew bundle --file=.*Brewfile.music'
  assert_not_called 'brew bundle --file=.*Brewfile.media'
}

@test "interactive 'personal' with music=yes runs Brewfile.music (11 steps)" {
  _mark_core_done xcode homebrew brewfile claude chezmoi marta vim_anywhere bindings osx brewfile_home
  run /bin/bash "$REPO/bootstrap" <<< $'personal\ny\nn\nn'
  [ "$status" -eq 0 ]
  [[ "$output" == *"11 step(s)"* ]]
  assert_called 'brew bundle --file=.*Brewfile.music'
}

@test "interactive 'personal' with media=yes runs Brewfile.media" {
  _mark_core_done xcode homebrew brewfile claude chezmoi marta vim_anywhere bindings osx brewfile_home
  run /bin/bash "$REPO/bootstrap" <<< $'personal\nn\nn\ny'
  [ "$status" -eq 0 ]
  assert_called 'brew bundle --file=.*Brewfile.media'
}

@test "interactive re-prompts on an invalid machine type" {
  # The re-prompt warning is an explicit echo (not read -p), so it is visible
  # even under piped stdin.
  _mark_core_done xcode homebrew brewfile claude chezmoi marta vim_anywhere bindings osx
  run /bin/bash "$REPO/bootstrap" <<< $'maybe\nwork'
  [ "$status" -eq 0 ]
  [[ "$output" == *"please answer 'work' or 'personal'"* ]]
}
