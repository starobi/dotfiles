# Termux — Cheatsheet

## SESSIONS (sidebar drawer)
───────────────────────────────────────────────────────
  Swipe right                  Open session drawer
  NEW SESSION (button)         Create new session
  Long-press session name      Rename session
  Tap session                  Switch to session

  # From terminal (no drawer needed):
  tmux new -s name             Create named tmux session
  tmux ls                      List tmux sessions
  tmux attach -t name          Reattach to session
  exit                         Close current Termux session

## SPLITS — via tmux (your config)
───────────────────────────────────────────────────────
  PREFIX h                     Split horizontal (new pane below)
  PREFIX v                     Split vertical   (new pane right)
  PREFIX ↑ ↓ ← →               Navigate between panes
  PREFIX x                     Kill current pane
  PREFIX z                     Zoom pane (fullscreen toggle)

  PREFIX ,                     Rename current window
  PREFIX c                     New window
  PREFIX w                     List windows (interactive)

## SAVE & RESTORE SESSION — tmux-resurrect
───────────────────────────────────────────────────────
  PREFIX Ctrl+s                Save current session
  PREFIX Ctrl+r                Restore saved session

  # Workflow:
  # 1. Before closing Termux → PREFIX Ctrl+s
  # 2. Reopen Termux → tmux attach (or tmux new)
  # 3. Inside tmux → PREFIX Ctrl+r

## PACKAGE MANAGER (pkg)
───────────────────────────────────────────────────────
  pkg update                   Update package list
  pkg upgrade                  Upgrade all packages
  pkg install name             Install package
  pkg uninstall name           Remove package
  pkg search name              Search for package
  pkg list-installed           List installed packages
  pkg show name                Show package info

## STORAGE ACCESS
───────────────────────────────────────────────────────
  termux-setup-storage         Grant storage permission (run once)

  ~/storage/shared/            → /sdcard  (internal storage)
  ~/storage/downloads/         → Downloads folder
  ~/storage/dcim/              → Camera folder
  ~/storage/pictures/          → Pictures folder

## KEYBOARD SHORTCUTS
───────────────────────────────────────────────────────
  Volume Down + key = Ctrl modifier:
  Vol↓ + A                     Ctrl+A
  Vol↓ + C                     Ctrl+C  (interrupt)
  Vol↓ + D                     Ctrl+D  (EOF / exit shell)
  Vol↓ + L                     Ctrl+L  (clear screen)
  Vol↓ + Z                     Ctrl+Z  (suspend)
  Vol↓ + W                     Up arrow
  Vol↓ + S                     Down arrow
  Vol↓ + A                     Left arrow
  Vol↓ + D                     Right arrow

  Volume Up + key = special characters:
  Vol↑ + .                     Ctrl+\
  Vol↑ + E                     Escape key
  Vol↑ + T                     Tab key
  Vol↑ + 1                     F1 (Vol↑+2 = F2, etc.)

## EXTRA KEYS BAR
───────────────────────────────────────────────────────
  # Toggle the extra keys row:
  Long-press the keyboard icon  or  Vol↓ + Q

  # Customize in: ~/.termux/termux.properties
  extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],\
                ['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]

## USEFUL PACKAGES TO INSTALL
───────────────────────────────────────────────────────
  pkg install git              Git
  pkg install vim / neovim     Text editors
  pkg install bat              Better cat (syntax highlight)
  pkg install fzf              Fuzzy finder
  pkg install fd               Fast file finder
  pkg install tmux             Terminal multiplexer
  pkg install openssh          SSH client/server
  pkg install curl / wget      HTTP tools
  pkg install python           Python 3
  pkg install nodejs           Node.js

## TERMUX CONFIG FILE
───────────────────────────────────────────────────────
  ~/.termux/termux.properties  Main config (extra keys, font, etc.)

  # After editing, apply changes:
  termux-reload-settings

  # Useful settings:
  bell-character=ignore
  back-key=escape
  enforce-char-based-input=true
