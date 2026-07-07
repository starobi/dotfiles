# tmux — Cheatsheet (custom config)

## PREFIX
───────────────────────────────────────────────────────
  Default prefix: Ctrl+b
  All shortcuts below assume prefix first unless noted.

## SESSIONS
───────────────────────────────────────────────────────
  tmux                         Start new session
  tmux new -s name             Start named session
  tmux ls                      List sessions
  tmux attach -t name          Attach to session
  tmux kill-session -t name    Kill session

  PREFIX $                     Rename current session
  PREFIX d                     Detach from session
  PREFIX s                     List & switch sessions (interactive)
  PREFIX (                     Previous session
  PREFIX )                     Next session

## WINDOWS
───────────────────────────────────────────────────────
  PREFIX c                     Create new window
  PREFIX r                     Rename current window   ← your custom binding
  PREFIX k                     Kill current window     ← your custom binding
  PREFIX n                     Next window
  PREFIX p                     Previous window
  PREFIX w                     List all windows (interactive)
  PREFIX 0-9                   Jump to window by number
  PREFIX l                     Last (previously used) window

  # Note: auto-rename is OFF in your config (allow-rename off)
  # Windows keep the name you set manually.

## PANES  (your custom bindings)
───────────────────────────────────────────────────────
  PREFIX h                     Split horizontally (new pane below)
  PREFIX v                     Split vertically   (new pane right)
  PREFIX x                     Kill current pane
  PREFIX z                     Zoom/unzoom current pane (fullscreen toggle)
  PREFIX q                     Show pane numbers (press number to jump)
  PREFIX o                     Cycle through panes
  PREFIX {                     Swap pane with previous
  PREFIX }                     Swap pane with next
  PREFIX !                     Break pane into its own window

  # Navigate panes (arrow keys):
  PREFIX ↑ ↓ ← →               Move between panes

  # Resize panes (hold prefix, then arrow):
  PREFIX + ↑ ↓ ← →             Resize pane

## MOUSE (enabled in your config)
───────────────────────────────────────────────────────
  Click pane                   Focus pane
  Click window tab             Switch window
  Drag pane border             Resize pane
  Scroll                       Scroll through history

## COPY MODE
───────────────────────────────────────────────────────
  PREFIX [                     Enter copy mode
  q / ESC                      Exit copy mode
  Space                        Start selection
  Enter                        Copy selection
  PREFIX ]                     Paste

  # In copy mode (vi-like navigation):
  h j k l                      Move cursor
  / or ?                       Search forward / backward
  n / N                        Next / previous match
  g / G                        Go to top / bottom

## CONFIG & RELOAD
───────────────────────────────────────────────────────
  PREFIX R                     Reload ~/.tmux.conf   ← your custom binding
  ~/.tmux.conf                 Your config file

## STATUS BAR (your setup)
───────────────────────────────────────────────────────
  Position: top
  Left:  (empty)
  Right: session name + current application
  Theme: Catppuccin Mocha (rounded window style)
  Window label: shows window name (#W)

## PLUGINS (TPM)
───────────────────────────────────────────────────────
  PREFIX I                     Install plugins
  PREFIX U                     Update plugins
  PREFIX Alt+u                 Remove unused plugins

  Installed:
  - catppuccin/tmux            Theme (mocha)
  - tmux-resurrect             Save & restore sessions

  # tmux-resurrect:
  PREFIX Ctrl+s                Save session
  PREFIX Ctrl+r                Restore session

## NAMING TIPS
───────────────────────────────────────────────────────
  # Rename window from shell (no prefix needed):
  tmux rename-window "name"

  # Rename session from shell:
  tmux rename-session "name"

  # Since automatic-rename is OFF, names stay as you set them.
  # Best practice: rename windows right after creating them (PREFIX ,)
