#!/usr/bin/env bats

load test_helper

@test "step_homebrew skips when brew is already installed" {
  # The brew shim is in $FIXTURES, so installed brew returns true.
  run step_homebrew
  [ "$status" -eq 0 ]
  assert_not_called '^curl '
}

@test "step_homebrew installs when brew is missing" {
  # Drop brew from PATH by pointing at a dir with only curl shimmed. Do NOT
  # symlink bash here — the shim's own shebang resolves bash via PATH and
  # a bash→_shim symlink causes recursion (Argument list too long).
  local only_curl="$BATS_TEST_TMPDIR/curl_only"
  mkdir -p "$only_curl"
  ln -s "$FIXTURES/_shim" "$only_curl/curl"
  export PATH="$only_curl:/usr/bin:/bin"
  hash -r

  run step_homebrew
  [ "$status" -eq 0 ]
  assert_called '^curl .*Homebrew/install'
}

@test "step_brewfile invokes brew bundle with the default Brewfile" {
  run step_brewfile
  [ "$status" -eq 0 ]
  assert_called 'brew bundle --file=.*Brewfile'
}

@test "step_brewfile_home invokes brew bundle with Brewfile.home" {
  run step_brewfile_home
  [ "$status" -eq 0 ]
  assert_called 'brew bundle --file=.*Brewfile.home'
}

@test "step_brewfile fails when ROOT is unset" {
  unset ROOT
  run step_brewfile
  [ "$status" -ne 0 ]
}

@test "step_marta skips when NSFileViewer already set" {
  export SHIM_STDOUT_DEFAULTS="org.yanex.marta"
  run step_marta
  [ "$status" -eq 0 ]
  # Should have called defaults read, but never defaults write.
  assert_called '^defaults read'
  assert_not_called '^defaults write'
}

@test "step_marta writes when NSFileViewer is not set" {
  # defaults read returns nothing (default shim stdout is empty).
  run step_marta
  [ "$status" -eq 0 ]
  assert_called '^defaults write -g NSFileViewer -string org.yanex.marta'
}

@test "step_claude skips when claude is on PATH" {
  ln -s "$FIXTURES/_shim" "$FIXTURES/claude"
  hash -r
  run step_claude
  [ "$status" -eq 0 ]
  assert_not_called '^curl .*claude.ai/install.sh'
  rm "$FIXTURES/claude"
}

@test "step_claude installs when claude is missing" {
  rm -f "$FIXTURES/claude"
  hash -r
  run step_claude
  [ "$status" -eq 0 ]
  assert_called '^curl .*claude.ai/install.sh'
}

@test "step_vim_anywhere skips when ~/.vim-anywhere exists" {
  mkdir -p "$HOME/.vim-anywhere"
  run step_vim_anywhere
  [ "$status" -eq 0 ]
  assert_not_called '^curl '
}

@test "step_vim_anywhere installs when ~/.vim-anywhere missing" {
  run step_vim_anywhere
  [ "$status" -eq 0 ]
  assert_called '^curl .*vim-anywhere'
}

@test "step_chezmoi applies when source state already present" {
  mkdir -p "$HOME/.local/share/chezmoi/.git"
  run step_chezmoi
  [ "$status" -eq 0 ]
  assert_called '^chezmoi -R apply'
  assert_not_called '^chezmoi init'
}

@test "step_chezmoi inits when source state absent" {
  run step_chezmoi
  [ "$status" -eq 0 ]
  assert_called '^chezmoi init'
  assert_called '^chezmoi -R apply'
}

@test "step_bindings writes the three symbolic hotkeys" {
  run step_bindings
  [ "$status" -eq 0 ]
  # Move Left A Space → cmd+shift+h (id 79, ascii 104, keycode 4, mod 1179648)
  assert_called 'defaults write com.apple.symbolichotkeys .* 79 '
  assert_called 'parameters = \(104, 4, 1179648\)'
  # Move Right A Space → cmd+shift+l (id 81, ascii 108, keycode 37)
  assert_called 'defaults write com.apple.symbolichotkeys .* 81 '
  assert_called 'parameters = \(108, 37, 1179648\)'
  # Spotlight disabled (id 64, enabled = 0)
  assert_called 'defaults write com.apple.symbolichotkeys .* 64 '
  assert_called 'enabled = 0'
}

@test "step_bindings reloads cfprefsd" {
  run step_bindings
  [ "$status" -eq 0 ]
  assert_called '^killall cfprefsd'
}

@test "step_bindings drops .metadata_never_index when target dir exists" {
  mkdir -p "$HOME/Obsidian"
  run step_bindings
  [ "$status" -eq 0 ]
  [ -f "$HOME/Obsidian/.metadata_never_index" ]
}

@test "step_bindings skips .metadata_never_index when target dir missing" {
  run step_bindings
  [ "$status" -eq 0 ]
  [ ! -f "$HOME/Obsidian/.metadata_never_index" ]
}
