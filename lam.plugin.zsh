# LAM Zsh Plugin – self-contained loader (no PATH, optional symlink)
# Install: clone repo into $ZSH_CUSTOM/plugins/lam and add `lam` to plugins()
# It will look for an executable CLI either
#   1) next to this file:            plugin/lam            (recommended via symlink)
#   2) or one dir up in ../bin/lam:  plugin/../bin/lam
# You can override with $LAM_CLI in ~/.zshrc if you prefer a custom location.

# Resolve absolute plugin directory
typeset -g _LAM_PLUGDIR=${0:A:h}

# Decide CLI path: env override > sibling `lam` > ../bin/lam
typeset -g LAM_CLI="${LAM_CLI:-}"
if [[ -z ${LAM_CLI} ]]; then
  if [[ -x "${_LAM_PLUGDIR}/lam" ]]; then
    LAM_CLI="${_LAM_PLUGDIR}/lam"
  elif [[ -x "${_LAM_PLUGDIR}/../bin/lam" ]]; then
    LAM_CLI="${_LAM_PLUGDIR}/../bin/lam"
  else
    LAM_CLI=""
  fi
fi

# Provide a `lam` function so users can call `lam ...` without PATH edits
# Wrapper enhancement: after add/rm/global add/rm (or explicit `compile`) we auto-compile and source.
lam() {
  if [[ -n "$LAM_CLI" && -x "$LAM_CLI" ]]; then
    command zsh "$LAM_CLI" "$@"
    local st=$?
    if (( st == 0 )); then
      local a1="${1:-}" a2="${2:-}"
      if [[ "$a1" == "compile" || "$a1" == "add" || "$a1" == "rm" || ( "$a1" == "global" && ( "$a2" == "add" || "$a2" == "rm" ) ) ]]; then
        _lam_compile_and_source
      fi
    fi
    return $st
  else
    print -r -- "LAM: CLI not found. Expected ${_LAM_PLUGDIR}/lam or ${_LAM_PLUGDIR}/../bin/lam. Set \$LAM_CLI to override." >&2
    return 127
  fi
}

# Auto-compile on shell start and on each `cd`
autoload -U add-zsh-hook
_lam_compile_and_source() {
  [[ -n "$LAM_CLI" && -x "$LAM_CLI" ]] || return 0
  command zsh "$LAM_CLI" compile >/dev/null 2>&1 || return 0
  local compiled="${LAM_COMPILED_DIR:-$HOME/.lam/compiled}/current.zsh"
  [[ -f "$compiled" ]] && source "$compiled"
}

# Run once at startup, then on directory changes
_lam_compile_and_source
add-zsh-hook chpwd _lam_compile_and_source
