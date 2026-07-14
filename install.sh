#!/usr/bin/env bash
set -euo pipefail
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

have_cmd() { command -v "$1" >/dev/null 2>&1; }

is_termux() {
    [ -d "/data/data/com.termux/files/usr" ] || [[ "${PREFIX:-}" == *"com.termux"* ]]
}

# En containers se suele correr como root sin sudo; lo detectamos una sola vez
if [ "$(id -u)" = "0" ] || ! have_cmd sudo || is_termux; then
    SUDO=""
else
    SUDO="sudo"
fi

install_pkg() {
    local pkg="$1"
    if have_cmd apt-get; then
        $SUDO apt-get update -qq && $SUDO apt-get install -y "$pkg"
    elif have_cmd pacman; then
        $SUDO pacman -Sy --noconfirm "$pkg"
    elif have_cmd dnf; then
        $SUDO dnf install -y "$pkg"
    elif have_cmd zypper; then
        $SUDO zypper --non-interactive install "$pkg"
    elif have_cmd apk; then
        $SUDO apk add "$pkg"
    elif have_cmd brew; then
        brew install "$pkg"
    elif have_cmd pkg; then
        pkg install -y "$pkg"
    else
        return 1
    fi
}

install_glow()     { install_pkg glow; }
install_tmux()     { install_pkg tmux; }
install_starship() {
    install_pkg starship 2>/dev/null || {
        if have_cmd curl; then
            curl -fsSL https://starship.rs/install.sh | sh -s -- -y
        else
            return 1
        fi
    }
}

echo "→ Verificando tmux..."
if have_cmd tmux; then
    echo "  (ya instalado, no se toca nada)"
else
    echo "  tmux no está instalado. Intentando instalar..."
    if install_tmux; then
        echo "  ✓ tmux instalado"
    else
        echo "  (no se pudo instalar tmux automáticamente)"
    fi
fi

echo "→ Creando symlink de tmux..."
TMUX_SOURCE="$(readlink -f "$DOTFILES_DIR/.tmux.conf" 2>/dev/null || echo "$DOTFILES_DIR/.tmux.conf")"
TMUX_TARGET="$HOME/.tmux.conf"
TMUX_TARGET_REAL="$(readlink -f "$TMUX_TARGET" 2>/dev/null || true)"

if [ "$TMUX_SOURCE" = "$TMUX_TARGET" ] || [ "$TMUX_SOURCE" = "$TMUX_TARGET_REAL" ]; then
    echo "  (ya apunta al dotfile correcto, no se toca nada)"
else
    ln -sf "$TMUX_SOURCE" "$TMUX_TARGET"
    echo "  (symlink creado/actualizado)"
fi

echo "→ Instalando TPM..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    if have_cmd git; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    else
        echo "  (git no está disponible, se omite TPM)"
    fi
fi

echo "→ Instalando plugins de tmux..."
if [ -x "$HOME/.tmux/plugins/tpm/bin/install_plugins" ]; then
    TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins" \
        "$HOME/.tmux/plugins/tpm/bin/install_plugins"
else
    echo "  (TPM no está disponible, se omite instalación de plugins)"
fi

echo "→ Verificando Nerd Fonts..."
FONT_DIR="$HOME/.local/share/fonts"
FONT_NAME="JetBrainsMono"

if is_termux; then
    echo "  (Termux detectado: configura Nerd Font con Termux:Styling o ~/.termux/font.ttf)"
elif ! have_cmd fc-list || ! have_cmd fc-cache; then
    echo "  (fontconfig no está disponible, se omite verificación de fuentes)"
elif fc-list | grep -qi "JetBrainsMono Nerd Font"; then
    echo "  (ya instalada, no se toca nada)"
else
    echo "  Descargando $FONT_NAME Nerd Font..."
    if have_cmd wget && have_cmd unzip; then
        mkdir -p "$FONT_DIR"
        TMP=$(mktemp -d)

        wget -q --show-progress \
            "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT_NAME}.zip" \
            -O "$TMP/${FONT_NAME}.zip"

        unzip -q "$TMP/${FONT_NAME}.zip" -d "$FONT_DIR/${FONT_NAME}NerdFont"
        rm -rf "$TMP"

        fc-cache -fv > /dev/null
        echo "  ✓ $FONT_NAME Nerd Font instalada"
    else
        echo "  (faltan wget/unzip, se omite instalación de fuente)"
    fi
fi

echo "→ Verificando glow..."
if have_cmd glow; then
    echo "  (ya instalado, no se toca nada)"
else
    echo "  glow no está instalado. Intentando instalar..."
    if install_glow; then
        echo "  ✓ glow instalado"
    else
        echo "  (no se pudo instalar glow automáticamente)"
        echo "  Instálalo manualmente para tener preview en cheat()."
    fi
fi

echo "→ Verificando starship..."
if have_cmd starship; then
    echo "  (ya instalado, no se toca nada)"
else
    echo "  starship no está instalado. Intentando instalar..."
    if install_starship; then
        echo "  ✓ starship instalado"
    else
        echo "  (no se pudo instalar starship automáticamente)"
    fi
fi

echo "→ Configurando preset de starship (Gruvbox Rainbow)..."
STARSHIP_CONFIG_DIR="$HOME/.config"
STARSHIP_CONFIG_FILE="$STARSHIP_CONFIG_DIR/starship.toml"
STARSHIP_MARKER="# Managed by dotfiles install.sh (Gruvbox Rainbow Preset)"

if have_cmd starship; then
    mkdir -p "$STARSHIP_CONFIG_DIR"

    if [ -f "$STARSHIP_CONFIG_FILE" ] && ! grep -qF "$STARSHIP_MARKER" "$STARSHIP_CONFIG_FILE"; then
        cp "$STARSHIP_CONFIG_FILE" "$STARSHIP_CONFIG_FILE.pre-dotfiles.bak"
        echo "  (backup creado: $STARSHIP_CONFIG_FILE.pre-dotfiles.bak)"
    fi

    {
        echo "$STARSHIP_MARKER"
        starship preset gruvbox-rainbow
    } > "$STARSHIP_CONFIG_FILE"
    echo "  ✓ preset Gruvbox Rainbow aplicado"

    STARSHIP_BASHRC_LINE='eval "$(starship init bash)"'
    if grep -qF "$STARSHIP_BASHRC_LINE" "$HOME/.bashrc" 2>/dev/null; then
        echo "  (init de starship ya estaba en .bashrc)"
    else
        echo "$STARSHIP_BASHRC_LINE" >> "$HOME/.bashrc"
        echo "  (init de starship agregado a .bashrc)"
    fi
else
    echo "  (starship no disponible; no se pudo aplicar preset)"
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
