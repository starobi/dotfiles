#!/usr/bin/env bash
set -e
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "→ Creando symlink de tmux..."
ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"

echo "→ Instalando TPM..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "→ Instalando plugins de tmux..."
TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins" \
    ~/.tmux/plugins/tpm/bin/install_plugins

echo "→ Verificando Nerd Fonts..."
FONT_DIR="$HOME/.local/share/fonts"
FONT_NAME="JetBrainsMono"

if fc-list | grep -qi "JetBrainsMono Nerd Font"; then
    echo "  (ya instalada, no se toca nada)"
else
    echo "  Descargando $FONT_NAME Nerd Font..."
    mkdir -p "$FONT_DIR"
    TMP=$(mktemp -d)

    wget -q --show-progress \
        "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT_NAME}.zip" \
        -O "$TMP/${FONT_NAME}.zip"

    unzip -q "$TMP/${FONT_NAME}.zip" -d "$FONT_DIR/${FONT_NAME}NerdFont"
    rm -rf "$TMP"

    fc-cache -fv > /dev/null
    echo "  ✓ $FONT_NAME Nerd Font instalada"
fi

echo "→ Agregando aliases a .bashrc..."
MARKER="# ── dotfiles aliases ──"
if grep -qF "$MARKER" "$HOME/.bashrc" 2>/dev/null; then
    echo "  (ya estaban, no se toca nada)"
else
    echo "" >> "$HOME/.bashrc"
    echo "$MARKER" >> "$HOME/.bashrc"
    echo "source $DOTFILES_DIR/aliases.sh" >> "$HOME/.bashrc"
    echo "  (agregado)"
fi

echo ""
echo "✓ Listo. Ejecuta: source ~/.bashrc"
