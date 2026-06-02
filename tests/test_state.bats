#!/usr/bin/env bats

load test_helper

@test "state_init creates dir and file" {
  state_init
  [ -d "$HOME/.local/state/setup" ]
  [ -f "$HOME/.local/state/setup/completed" ]
}

@test "state_is_done is false on a fresh state file" {
  state_init
  run state_is_done step_foo
  [ "$status" -ne 0 ]
}

@test "state_mark_done then state_is_done returns true" {
  state_init
  state_mark_done step_foo
  run state_is_done step_foo
  [ "$status" -eq 0 ]
}

@test "state_mark_done is idempotent (no duplicate lines)" {
  state_init
  state_mark_done step_foo
  state_mark_done step_foo
  state_mark_done step_foo
  count=$(grep -c '^step_foo$' "$(state_file)")
  [ "$count" -eq 1 ]
}

@test "state_clear removes a single step" {
  state_init
  state_mark_done step_a
  state_mark_done step_b
  state_clear step_a
  run state_is_done step_a
  [ "$status" -ne 0 ]
  run state_is_done step_b
  [ "$status" -eq 0 ]
}

@test "state_list outputs the completed steps" {
  state_init
  state_mark_done step_a
  state_mark_done step_b
  run state_list
  [ "$status" -eq 0 ]
  [[ "$output" == *"step_a"* ]]
  [[ "$output" == *"step_b"* ]]
}
