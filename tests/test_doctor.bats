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

@test "doctor_bindings reports ok when all 4 keys match expected state" {
  # 64+65 disabled, 79+81 enabled
  export SHIM_STDOUT_DEFAULTS=$'{\n    64 =     {\n        enabled = 0;\n    };\n    65 =     {\n        enabled = 0;\n    };\n    79 =     {\n        enabled = 1;\n    };\n    81 =     {\n        enabled = 1;\n    };\n}'
  run doctor_bindings
  [ "$status" -eq 0 ]
  [[ "$output" == *"ok"* ]]
  [[ "$output" == *"4 symbolic hotkeys match"* ]]
}

@test "doctor_bindings reports missing when Spotlight (64) still enabled" {
  export SHIM_STDOUT_DEFAULTS=$'{\n    64 =     {\n        enabled = 1;\n    };\n    65 =     {\n        enabled = 0;\n    };\n    79 =     {\n        enabled = 1;\n    };\n    81 =     {\n        enabled = 1;\n    };\n}'
  run doctor_bindings
  [ "$status" -eq 0 ]
  [[ "$output" == *"miss"* ]]
  [[ "$output" == *"64=Spotlight"* ]]
}

@test "doctor_bindings reports missing when Mission Control (79) disabled" {
  export SHIM_STDOUT_DEFAULTS=$'{\n    64 =     {\n        enabled = 0;\n    };\n    65 =     {\n        enabled = 0;\n    };\n    79 =     {\n        enabled = 0;\n    };\n    81 =     {\n        enabled = 1;\n    };\n}'
  run doctor_bindings
  [ "$status" -eq 0 ]
  [[ "$output" == *"miss"* ]]
  [[ "$output" == *"79=MoveLeft"* ]]
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
