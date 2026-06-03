# shellcheck shell=bash
#
# lib.sh — helpers and step functions for `bootstrap`.
#
# Source from bootstrap with: source "$(dirname "$0")/lib.sh"
#
# Functions are organized in three groups:
#   1. Detection + small helpers   (installed, is_macos, ...)
#   2. Logging                     (log_info, log_warn, log_error, log_step)
#   3. State tracking              (state_mark_done, state_is_done, ...)
#   4. Step functions              (step_xcode, step_homebrew, ...)
#   5. Doctor checks               (doctor_* — read-only state probes)
#
# Each step_* is idempotent: it checks current state and no-ops if the
# step is already satisfied. Steps return 0 on success / no-op, non-zero
# on failure. Steps never call `exit` — orchestration is bootstrap's job.

###
# 1. Detection + helpers
###

installed() { hash "$1" 2>/dev/null; }

is_macos() { [[ "$(uname -s)" == "Darwin" ]]; }

# brew_pkg_installed <name> — true if the package is installed via brew.
brew_pkg_installed() {
  installed brew && brew list --formula --cask "$1" &>/dev/null
}

# require_root_var — fail clearly if $ROOT (path to setup/) isn't set.
require_root_var() {
  if [[ -z "${ROOT:-}" ]]; then
    log_error "ROOT must be set to the setup repo path before calling step_*"
    return 1
  fi
}

###
# 2. Logging
#
# Writes colored output to stderr. If $BOOTSTRAP_LOG is set, also tees
# (uncolored) to that file. Steps should call these — not `echo`.
###

# ANSI colors; only enable when stderr is a TTY.
if [[ -t 2 ]]; then
  _C_RESET=$'\033[0m'
  _C_DIM=$'\033[2m'
  _C_BOLD=$'\033[1m'
  _C_RED=$'\033[31m'
  _C_GREEN=$'\033[32m'
  _C_YELLOW=$'\033[33m'
  _C_CYAN=$'\033[36m'
else
  _C_RESET=''; _C_DIM=''; _C_BOLD=''
  _C_RED=''; _C_GREEN=''; _C_YELLOW=''; _C_CYAN=''
fi

_log() {
  local color=$1 prefix=$2; shift 2
  local line="${color}${prefix}${_C_RESET} $*"
  printf '%s\n' "$line" >&2
  if [[ -n "${BOOTSTRAP_LOG:-}" ]]; then
    printf '%s %s %s\n' "$(date '+%H:%M:%S')" "$prefix" "$*" >>"$BOOTSTRAP_LOG"
  fi
}

log_info()  { _log "$_C_CYAN"   "[info]"  "$@"; }
log_warn()  { _log "$_C_YELLOW" "[warn]"  "$@"; }
log_error() { _log "$_C_RED"    "[err] "  "$@"; }
log_ok()    { _log "$_C_GREEN"  "[ok]  "  "$@"; }
log_step()  { _log "${_C_BOLD}" "==>"     "$@"; }
log_skip()  { _log "$_C_DIM"    "[skip]"  "$@"; }

###
# 3. State tracking
#
# A single file at ~/.local/state/setup/completed holds one step name per
# line. Used to skip steps on re-runs unless --force is given.
###

state_dir() { printf '%s/.local/state/setup' "$HOME"; }
state_file() { printf '%s/completed' "$(state_dir)"; }

state_init() {
  mkdir -p "$(state_dir)"
  touch "$(state_file)"
}

state_is_done() {
  local step=$1
  [[ -f "$(state_file)" ]] && grep -qxF "$step" "$(state_file)"
}

state_mark_done() {
  local step=$1
  state_init
  state_is_done "$step" || printf '%s\n' "$step" >>"$(state_file)"
}

state_clear() {
  local step=$1
  [[ -f "$(state_file)" ]] || return 0
  local tmp; tmp=$(mktemp)
  grep -vxF "$step" "$(state_file)" >"$tmp" || true
  mv "$tmp" "$(state_file)"
}

state_list() {
  [[ -f "$(state_file)" ]] && cat "$(state_file)"
}

###
# 4. Step functions
#
# Each is idempotent. Returns 0 on success or no-op, non-zero on failure.
###

step_xcode() {
  if xcode-select -p &>/dev/null; then
    log_skip "Xcode Command Line Tools already installed"
    return 0
  fi
  log_info "installing Xcode Command Line Tools (this opens a GUI dialog)..."
  xcode-select --install &>/dev/null || true
  # Wait until the CLT directory exists. Cap the wait so we don't hang
  # forever if the user cancels the prompt.
  local waited=0
  while ! xcode-select -p &>/dev/null; do
    sleep 5
    waited=$((waited + 5))
    if (( waited >= 600 )); then
      log_error "Xcode CLT install didn't complete after 10 minutes"
      return 1
    fi
    (( waited % 30 == 0 )) && log_info "still waiting for Xcode CLT (${waited}s)..."
  done
  log_ok "Xcode CLT installed"
}

step_homebrew() {
  if installed brew; then
    log_skip "Homebrew already installed"
    return 0
  fi
  log_info "installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Put brew on PATH for the rest of this run. The Homebrew installer adds
  # a shellenv line to ~/.zprofile for future shells but the current process
  # won't see /opt/homebrew/bin (M-series) or /usr/local/bin (Intel) yet.
  local brew_bin
  for brew_bin in /opt/homebrew/bin/brew /usr/local/bin/brew; do
    if [[ -x "$brew_bin" ]]; then
      eval "$($brew_bin shellenv)"
      hash -r
      break
    fi
  done
  if ! installed brew; then
    log_error "Homebrew install succeeded but brew is still not on PATH"
    return 1
  fi
}

# _brew_bundle <file-name> — common helper.
# brew bundle keeps going past per-package failures, but exits non-zero if any
# package failed; we surface that as a step failure so it isn't marked complete
# (re-running brew bundle is idempotent, so a later run retries the stragglers).
_brew_bundle() {
  local file=$1
  require_root_var || return 1
  installed brew || { log_error "Homebrew not installed"; return 1; }
  local path="$ROOT/$file"
  [[ -f "$path" ]] || { log_error "Brewfile not found: $path"; return 1; }
  log_info "brew bundle --file=$file"
  if brew bundle --file="$path" --no-lock; then
    log_ok "brew bundle ($file) clean"
  else
    log_warn "brew bundle ($file) had failures; check 'brew bundle check --file=$path'"
    return 1
  fi
}

step_brewfile()       { _brew_bundle Brewfile; }
step_brewfile_home()  { _brew_bundle Brewfile.home; }
step_brewfile_media() { _brew_bundle Brewfile.media; }
step_brewfile_music() { _brew_bundle Brewfile.music; }

step_claude() {
  # The installer drops the binary at ~/.local/bin/claude, which isn't on a
  # fresh PATH — check the path directly so the skip fires even mid-session.
  if [[ -x "$HOME/.local/bin/claude" ]] || installed claude; then
    log_skip "Claude Code CLI already installed"
    return 0
  fi
  log_info "installing Claude Code CLI to ~/.local/bin/claude..."
  curl -fsSL https://claude.ai/install.sh | bash
}

step_chezmoi() {
  installed chezmoi || { log_error "chezmoi not installed (run step_brewfile first)"; return 1; }
  if [[ -d "$HOME/.local/share/chezmoi/.git" ]]; then
    log_skip "chezmoi already initialized; running apply"
    chezmoi -R apply
  else
    log_info "initializing chezmoi from cknadler/dotfiles..."
    # Chain so a failed init doesn't fall through to apply (and get the step
    # marked complete on apply's exit code, leaving a half-initialized .git
    # that the re-run treats as "already initialized").
    chezmoi init https://github.com/cknadler/dotfiles.git && chezmoi -R apply
  fi
}

step_marta() {
  # Set Marta as the default file viewer. defaults write is idempotent.
  local current
  current=$(defaults read -g NSFileViewer 2>/dev/null || true)
  if [[ "$current" == "org.yanex.marta" ]]; then
    log_skip "Marta already set as default file viewer"
    return 0
  fi
  log_info "setting Marta as default file viewer..."
  defaults write -g NSFileViewer -string org.yanex.marta
}

step_vim_anywhere() {
  if [[ -d "$HOME/.vim-anywhere" ]]; then
    log_skip "vim-anywhere already installed"
    return 0
  fi
  log_info "installing vim-anywhere..."
  curl -fsSL https://raw.githubusercontent.com/cknadler/vim-anywhere/master/install | bash
}

# step_crawl — install Dungeon Crawl Stone Soup (Tiles) from the official
# GitHub release zip. Replaces the deprecated brew cask, which is being
# disabled 2026-09-01 because the binary isn't Apple-notarized. We strip
# com.apple.quarantine so Gatekeeper lets it launch.
#
# CRAWL_APP_PATH is overridable for tests; default is the standard
# /Applications location.
: "${CRAWL_APP_PATH:=/Applications/Dungeon Crawl Stone Soup - Tiles.app}"

step_crawl() {
  if [[ -d "$CRAWL_APP_PATH" ]]; then
    log_skip "DCSS already installed at $CRAWL_APP_PATH"
    return 0
  fi
  log_info "querying latest DCSS release..."
  local tag
  tag=$(curl -sfL https://api.github.com/repos/crawl/crawl/releases/latest \
        | grep -oE '"tag_name"[[:space:]]*:[[:space:]]*"[^"]+"' \
        | head -1 \
        | sed -E 's/.*"([^"]+)"$/\1/')
  if [[ -z "$tag" ]]; then
    log_error "couldn't determine latest DCSS release tag from GitHub API"
    return 1
  fi
  local zip_name="dcss-${tag}-macos-tiles-universal.zip"
  local url="https://github.com/crawl/crawl/releases/download/${tag}/${zip_name}"
  local tmp
  tmp=$(mktemp -d)
  log_info "downloading $zip_name..."
  if ! curl -fL "$url" -o "$tmp/$zip_name"; then
    log_error "download failed: $url"
    rm -rf "$tmp"
    return 1
  fi
  log_info "extracting..."
  if ! unzip -q "$tmp/$zip_name" -d "$tmp"; then
    log_error "unzip failed"
    rm -rf "$tmp"
    return 1
  fi
  local extracted
  extracted=$(find "$tmp" -maxdepth 3 -name '*.app' -type d | head -1)
  if [[ -z "$extracted" ]]; then
    log_error "no .app found inside $zip_name"
    rm -rf "$tmp"
    return 1
  fi
  log_info "installing to $CRAWL_APP_PATH..."
  if ! _crawl_install_app "$extracted" "$CRAWL_APP_PATH"; then
    rm -rf "$tmp"
    return 1
  fi
  rm -rf "$tmp"
  log_info "stripping com.apple.quarantine xattr..."
  xattr -dr com.apple.quarantine "$CRAWL_APP_PATH" 2>/dev/null || true
  log_ok "DCSS $tag installed"
}

# _crawl_install_app <src-app-dir> <dest-app-path>
# Atomic-ish replace: ensure parent exists, blow away any existing dest,
# cp -R the new app in, and verify it landed. Returns non-zero if cp
# failed OR cp lied and the destination isn't a directory afterwards.
_crawl_install_app() {
  local src=$1 dest=$2
  if ! mkdir -p "$(dirname "$dest")"; then
    log_error "couldn't create parent dir for $dest"
    return 1
  fi
  rm -rf "$dest"
  if ! cp -R "$src" "$dest"; then
    log_error "cp -R failed: $src → $dest"
    return 1
  fi
  if [[ ! -d "$dest" ]]; then
    log_error "cp returned 0 but $dest is not a directory"
    return 1
  fi
  return 0
}

step_osx() {
  require_root_var || return 1
  local path="$ROOT/.osx"
  [[ -x "$path" ]] || { log_error ".osx not found or not executable at $path"; return 1; }
  log_info "applying .osx defaults (some changes need restart)..."
  "$path"
}

# Symbolic hotkey IDs in com.apple.symbolichotkeys.AppleSymbolicHotKeys.
# See: https://web.archive.org/web/2019*/apple AppleSymbolicHotKeys reference
readonly SHK_SPOTLIGHT=64                # Show Spotlight Search
readonly SHK_FINDER_SEARCH=65            # Show Finder search window
readonly SHK_MOVE_LEFT_SPACE=79
readonly SHK_MOVE_RIGHT_SPACE=81

# NSEvent modifier flags
readonly MOD_CMD=1048576              # 0x100000
readonly MOD_CMD_SHIFT=1179648        # 0x120000

# _shk_write <id> <enabled 0|1> <ascii> <keycode> <modifiers>
_shk_write() {
  local id=$1 enabled=$2 ascii=$3 keycode=$4 modifiers=$5
  defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add "$id" \
    "{enabled = $enabled; value = {parameters = ($ascii, $keycode, $modifiers); type = standard;};}"
}

step_bindings() {
  # Track write failures so the step isn't marked complete on a partial apply.
  # We keep going (apply what we can) but return non-zero if anything failed.
  local rc=0
  log_info "applying Mission Control + Spotlight hotkeys..."
  # Move Left A Space → cmd+shift+h
  _shk_write $SHK_MOVE_LEFT_SPACE  1 104 4  $MOD_CMD_SHIFT || rc=1
  # Move Right A Space → cmd+shift+l
  _shk_write $SHK_MOVE_RIGHT_SPACE 1 108 37 $MOD_CMD_SHIFT || rc=1
  # Show Spotlight Search → disabled (Alfred replaces it)
  _shk_write $SHK_SPOTLIGHT        0 32  49 $MOD_CMD || rc=1
  # Show Finder search window → disabled (Alfred replaces it)
  _shk_write $SHK_FINDER_SEARCH    0 32  49 $MOD_CMD || rc=1

  # Reload preferences so changes take effect without a logout
  killall cfprefsd 2>/dev/null || true

  log_info "marking Spotlight privacy folders..."
  local p
  for p in "$HOME/Obsidian" "$HOME/Documents/Backup Projects"; do
    if [[ -d "$p" ]]; then
      if touch "$p/.metadata_never_index"; then
        log_ok "  $p/.metadata_never_index"
      else
        log_warn "  failed to write $p/.metadata_never_index"
        rc=1
      fi
    else
      log_skip "  $p doesn't exist yet; rerun after creating it"
    fi
  done

  log_info "alfred: set Alfred's Sync Folder to ~/Dropbox/config/Alfred via Alfred prefs (one-time GUI step)"
  return $rc
}

###
# 5. Doctor checks
#
# Read-only. Each returns 0 if the step is satisfied, non-zero otherwise.
# Output a short status line. Doctor never modifies state.
###

_doctor_line() {
  local name=$1 status=$2 detail=$3
  case $status in
    ok)      printf '  %s%-18s%s %sok%s    %s\n'    "$_C_BOLD" "$name" "$_C_RESET" "$_C_GREEN"  "$_C_RESET" "$detail" ;;
    missing) printf '  %s%-18s%s %smiss%s  %s\n'    "$_C_BOLD" "$name" "$_C_RESET" "$_C_YELLOW" "$_C_RESET" "$detail" ;;
    unknown) printf '  %s%-18s%s %s?%s     %s\n'    "$_C_BOLD" "$name" "$_C_RESET" "$_C_DIM"    "$_C_RESET" "$detail" ;;
  esac
}

doctor_xcode() {
  if xcode-select -p &>/dev/null; then
    _doctor_line xcode ok "$(xcode-select -p)"
  else
    _doctor_line xcode missing "run: bootstrap --only xcode"
  fi
}

doctor_homebrew() {
  if installed brew; then
    _doctor_line homebrew ok "$(brew --version | head -1)"
  else
    _doctor_line homebrew missing "run: bootstrap --only homebrew"
  fi
}

doctor_claude() {
  if installed claude; then
    _doctor_line claude ok "$(command -v claude)"
  else
    _doctor_line claude missing "run: bootstrap --only claude"
  fi
}

doctor_chezmoi() {
  if [[ -d "$HOME/.local/share/chezmoi/.git" ]]; then
    _doctor_line chezmoi ok "$HOME/.local/share/chezmoi"
  else
    _doctor_line chezmoi missing "run: bootstrap --only chezmoi"
  fi
}

doctor_marta() {
  local v
  v=$(defaults read -g NSFileViewer 2>/dev/null || true)
  if [[ "$v" == "org.yanex.marta" ]]; then
    _doctor_line marta ok "NSFileViewer=org.yanex.marta"
  else
    _doctor_line marta missing "current NSFileViewer='${v:-<unset>}'"
  fi
}

doctor_vim_anywhere() {
  if [[ -d "$HOME/.vim-anywhere" ]]; then
    _doctor_line vim_anywhere ok "$HOME/.vim-anywhere"
  else
    _doctor_line vim_anywhere missing "run: bootstrap --only vim_anywhere"
  fi
}

doctor_brewfile() {
  if ! installed brew; then
    _doctor_line brewfile unknown "homebrew missing"
    return
  fi
  require_root_var || return 1
  if brew bundle check --file="$ROOT/Brewfile" &>/dev/null; then
    _doctor_line brewfile ok "all packages installed"
  else
    local missing
    missing=$(brew bundle check --file="$ROOT/Brewfile" --verbose 2>&1 | grep -c '→' || true)
    _doctor_line brewfile missing "${missing:-some} packages missing"
  fi
}

doctor_osx() {
  # No clean signal that .osx has been run; we sentinel on the screenshot
  # location since that's one of the most distinctive flips.
  local v
  v=$(defaults read com.apple.screencapture location 2>/dev/null || true)
  if [[ "$v" == "$HOME/Desktop" ]]; then
    _doctor_line osx ok "screenshots → ~/Desktop (sentinel)"
  else
    _doctor_line osx unknown "can't reliably detect; check individual defaults"
  fi
}

# _shk_enabled <plist-text> <id> — print "0" / "1" / "" (when key absent).
# Extracts the dict for a single symbolic hotkey id (outer "    NN = {"
# to the matching "    };" at the same 4-space indent), then reads the
# `enabled = <0|1>` line within it.
_shk_enabled() {
  local plist=$1 id=$2
  printf '%s\n' "$plist" \
    | sed -n "/^    $id =/,/^    };\$/p" \
    | sed -nE 's/^[[:space:]]*enabled = ([01]);$/\1/p' \
    | head -1
}

doctor_crawl() {
  if [[ -d "$CRAWL_APP_PATH" ]]; then
    _doctor_line crawl ok "$CRAWL_APP_PATH"
  else
    _doctor_line crawl missing "run: bootstrap --only crawl"
  fi
}

doctor_bindings() {
  local plist
  plist=$(defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys 2>/dev/null || true)
  if [[ -z "$plist" ]]; then
    _doctor_line bindings unknown "no symbolic hotkeys configured"
    return
  fi
  # Expected: Spotlight (64) + Finder search (65) disabled, Mission
  # Control space-switching (79, 81) enabled.
  local bad=()
  [[ "$(_shk_enabled "$plist" 64)" == "0" ]] || bad+=("64=Spotlight")
  [[ "$(_shk_enabled "$plist" 65)" == "0" ]] || bad+=("65=Finder")
  [[ "$(_shk_enabled "$plist" 79)" == "1" ]] || bad+=("79=MoveLeft")
  [[ "$(_shk_enabled "$plist" 81)" == "1" ]] || bad+=("81=MoveRight")
  if (( ${#bad[@]} == 0 )); then
    _doctor_line bindings ok "all 4 symbolic hotkeys match"
  else
    _doctor_line bindings missing "mismatched: ${bad[*]} (run: bootstrap --only bindings)"
  fi
}

doctor_report() {
  log_step "doctor — reporting current state (read-only)"
  doctor_xcode
  doctor_homebrew
  doctor_brewfile
  doctor_claude
  doctor_chezmoi
  doctor_marta
  doctor_vim_anywhere
  doctor_bindings
  doctor_osx
  doctor_crawl
}
