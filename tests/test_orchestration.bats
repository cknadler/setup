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
