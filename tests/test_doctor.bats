#!/usr/bin/env bats

load test_helper

@test "doctor_report exits 0 even when many checks miss" {
  rm -rf "$HOME/.local/share/chezmoi"
  rm -rf "$HOME/.vim-anywhere"
  rm -f "$FIXTURES/claude"
  hash -r
  run doctor_report
  [ "$status" -eq 0 ]
}

@test "doctor never invokes an install action" {
  run doctor_report
  [ "$status" -eq 0 ]
  # `brew bundle check` is fine (read-only); `brew bundle --file=...` is not.
  assert_not_called 'brew bundle --file'
  assert_not_called 'xcode-select --install'
  assert_not_called 'curl .*install.sh'
  assert_not_called '^chezmoi init'
  assert_not_called '^defaults write'
}

@test "doctor leaves state file untouched" {
  state_init
  # Pre-mark a step so we can tell if doctor wrote to the file.
  state_mark_done some_step
  local before
  before=$(shasum "$(state_file)" | awk '{print $1}')
  doctor_report >/dev/null 2>&1
  local after
  after=$(shasum "$(state_file)" | awk '{print $1}')
  [ "$before" = "$after" ]
}
