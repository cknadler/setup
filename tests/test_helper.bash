bats_require_minimum_version 1.5.0

# Shared bats setup. Each .bats file loads this with `load test_helper`.
#
# Provides:
#   - $REPO        absolute path to the setup repo root
#   - $FIXTURES    absolute path to tests/fixtures/bin (PATH-shim stubs)
#   - $SHIM_CALLS  per-test tmp file of "<cmd> <args>" lines (one per call)
#
# Each test runs in an isolated $HOME (so state file ops can't touch the
# real machine) and with $FIXTURES at the front of PATH (so brew, defaults,
# etc. invoke the stubs).
#
# Sources lib.sh into the bats process so step_*/log_*/state_* are callable
# directly as bash functions.

setup() {
  REPO="$(cd "$BATS_TEST_DIRNAME/.." && pwd)"
  FIXTURES="$REPO/tests/fixtures/bin"

  # Isolate the per-test environment.
  export HOME="$BATS_TEST_TMPDIR/home"
  mkdir -p "$HOME"

  # Run shims, not real tools.
  export PATH="$FIXTURES:/usr/bin:/bin"
  hash -r

  # Per-test call log.
  export SHIM_CALLS="$BATS_TEST_TMPDIR/shim-calls"
  : > "$SHIM_CALLS"

  # ROOT is what bootstrap exports to lib.sh.
  export ROOT="$REPO"

  # Silence log writes (the lib's _log writes to fd 2 — bats captures it).
  unset BOOTSTRAP_LOG

  # shellcheck disable=SC1091
  source "$REPO/lib.sh"
}

# Convenience: assert SHIM_CALLS has at least one line matching a pattern.
assert_called() {
  local pattern=$1
  grep -qE "$pattern" "$SHIM_CALLS" || {
    echo "expected a shim call matching: $pattern"
    echo "actual calls:"
    cat "$SHIM_CALLS"
    return 1
  }
}

# Convenience: assert SHIM_CALLS has NO matching lines.
assert_not_called() {
  local pattern=$1
  if grep -qE "$pattern" "$SHIM_CALLS"; then
    echo "did not expect a shim call matching: $pattern"
    echo "actual calls:"
    cat "$SHIM_CALLS"
    return 1
  fi
}
