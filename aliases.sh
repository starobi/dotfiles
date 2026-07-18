# ── dotfiles aliases ──────────────────────────────────────
CHEAT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")/cheatsheet_linux"

tools() {
  if command -v fzf >/dev/null 2>&1 && [ -f "$HOME/.tools.txt" ]; then
    fzf < "$HOME/.tools.txt"
  elif [ -f "$HOME/.tools.txt" ]; then
    cat "$HOME/.tools.txt"
  else
    echo "No existe $HOME/.tools.txt"
  fi
}

cheat() {
  local editor="${EDITOR:-nvim}"
  command -v "$editor" >/dev/null 2>&1 || editor="vi"

  if [ -z "$1" ]; then
    local sel
    if command -v fzf >/dev/null 2>&1; then
      if command -v glow >/dev/null 2>&1; then
        sel=$(find "$CHEAT_DIR" -maxdepth 1 -type f -name '*.md' -printf '%f\n' | sed 's/\.md$//' | fzf \
          --preview "glow '$CHEAT_DIR/{}.md'" \
          --preview-window=right:70% \
          --header "Elige un programa | Shift+↑↓ para scroll del preview")
      else
        sel=$(find "$CHEAT_DIR" -maxdepth 1 -type f -name '*.md' -printf '%f\n' | sed 's/\.md$//' | fzf \
          --header "Elige un programa")
      fi
      [ -n "$sel" ] && "$editor" "$CHEAT_DIR/$sel.md"
    else
      echo "fzf no está instalado. Usa: cheat <nombre>"
      find "$CHEAT_DIR" -maxdepth 1 -type f -name '*.md' -printf ' - %f\n' | sed 's/\.md$//'
    fi
    return
  fi
  if [ -f "$CHEAT_DIR/$1.md" ]; then
    "$editor" "$CHEAT_DIR/$1.md"
  else
    echo "No existe: $CHEAT_DIR/$1.md"
  fi
}
if [[ "${PREFIX:-}" == *"com.termux"* ]]; then
    source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/termux.sh"
fi
# ── fin dotfiles ──────────────────────────────────────────
