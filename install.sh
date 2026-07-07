#!/bin/bash
set -e
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "→ Creando symlink de tmux..."
ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"

echo "→ Instalando TPM..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "→ Instalando plugins de tmux..."
~/.tmux/plugins/tpm/bin/install_plugins

echo "→ Agregando aliases a .bashrc..."
MARKER="# ── dotfiles aliases ──"
if grep -qF "$MARKER" "$HOME/.bashrc" 2>/dev/null; then
    echo "  (ya estaban, no se toca nada)"
else
    echo "" >> "$HOME/.bashrc"
    echo "source $DOTFILES_DIR/aliases.sh" >> "$HOME/.bashrc"
    echo "  (agregado)"
fi

echo "✓ Listo. Ejecuta: source ~/.bashrc"
