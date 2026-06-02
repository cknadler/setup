#!/usr/bin/env bats

load test_helper

@test "installed returns 0 for a command in PATH" {
  run installed bash
  [ "$status" -eq 0 ]
}

@test "installed returns non-zero for a missing command" {
  run installed asdfqwe_definitely_not_a_command
  [ "$status" -ne 0 ]
}

@test "installed finds shimmed binaries" {
  # brew lives in $FIXTURES, which is at the head of PATH.
  run installed brew
  [ "$status" -eq 0 ]
}

@test "is_macos is true on Darwin" {
  if [[ "$(uname -s)" == "Darwin" ]]; then
    run is_macos
    [ "$status" -eq 0 ]
  else
    skip "not on macOS"
  fi
}

@test "log_info writes prefixed text to stderr" {
  run --separate-stderr log_info "hello"
  [ "$status" -eq 0 ]
  [[ "$stderr" == *"[info]"* ]]
  [[ "$stderr" == *"hello"* ]]
}

@test "log_warn writes prefixed text to stderr" {
  run --separate-stderr log_warn "danger"
  [ "$status" -eq 0 ]
  [[ "$stderr" == *"[warn]"* ]]
  [[ "$stderr" == *"danger"* ]]
}

@test "log lines write to BOOTSTRAP_LOG when set" {
  export BOOTSTRAP_LOG="$BATS_TEST_TMPDIR/run.log"
  : > "$BOOTSTRAP_LOG"
  log_info "tagged-line-xyz"
  grep -q "tagged-line-xyz" "$BOOTSTRAP_LOG"
}
