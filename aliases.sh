# ── dotfiles aliases ──────────────────────────────────────
CHEAT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")/cheatsheet_linux"

alias tools='cat ~/.tools.txt | fzf'

cheat() {
  if [ -z "$1" ]; then
    local sel
    sel=$(ls "$CHEAT_DIR" | sed 's/\.md$//' | fzf \
      --preview "glow '$CHEAT_DIR/{}.md'" \
      --preview-window=right:70% \
      --header "Elige un programa | Shift+↑↓ para scroll del preview")
    [ -n "$sel" ] && nvim "$CHEAT_DIR/$sel.md"
    return
  fi
  nvim "$CHEAT_DIR/$1.md"
}
# ── fin dotfiles ──────────────────────────────────────────
