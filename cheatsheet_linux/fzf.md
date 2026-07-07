# fzf — Fuzzy Finder Cheatsheet

## KEYBOARD SHORTCUTS (interactive mode)
───────────────────────────────────────────────────────
  CTRL+J / CTRL+N    Move down
  CTRL+K / CTRL+P    Move up
  TAB                Select multiple items
  SHIFT+TAB          Deselect item
  CTRL+A             Select all
  ENTER              Confirm selection
  ESC / CTRL+C       Exit without selecting
  CTRL+/             Toggle preview panel
  CTRL+U             Clear search input
  CTRL+R             (in shell) Search command history with fzf

## SEARCH SYNTAX
───────────────────────────────────────────────────────
  text               Fuzzy match
  'text              Exact match
  ^text              Starts with "text"
  text$              Ends with "text"
  !text              Exclude lines with "text"
  !^text             Does not start with "text"
  !text$             Does not end with "text"
  text1 text2        AND (both must match)
  text1 | text2      OR

## BASIC USAGE (command line)
───────────────────────────────────────────────────────
  fzf                                  Read stdin, pick one
  ls | fzf                             Pick a file from ls
  fzf --multi                          Multi-select with TAB
  fzf --reverse                        List top-down
  fzf --height 40%                     Panel height
  fzf --border                         Border around panel
  fzf --prompt "Choose: "              Custom prompt
  fzf --header "My title"             Header text
  fzf --query "text"                   Pre-fill search query
  fzf --select-1                       Auto-select if only 1 result
  fzf --exit-0                         Exit if no results

## PREVIEW
───────────────────────────────────────────────────────
  fzf --preview 'cat {}'               Preview with cat
  fzf --preview 'bat --color=always {}' Preview with bat (syntax highlight)
  fzf --preview 'ls -la {}'            Preview directory contents
  fzf --preview-window=right:60%       Preview on right, 60% width
  fzf --preview-window=up:30%          Preview on top, 30% height
  fzf --preview-window=hidden          Hidden by default (CTRL+/ to show)

## SHELL INTEGRATION
───────────────────────────────────────────────────────
  CTRL+R             Search command history
  CTRL+T             Find file and paste path into prompt
  ALT+C              Find directory and cd into it

  # Enable shell keybindings (add to .zshrc / .bashrc):
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh

  # Termux:
  source $PREFIX/share/fzf/key-bindings.zsh

## ENVIRONMENT VARIABLES
───────────────────────────────────────────────────────
  FZF_DEFAULT_COMMAND='fd --type f'              Default command for fzf
  FZF_DEFAULT_OPTS='--height 40% --border --reverse'  Default options
  FZF_CTRL_T_COMMAND='fd --type f'               Command for CTRL+T
  FZF_ALT_C_COMMAND='fd --type d'                Command for ALT+C

## PRACTICAL EXAMPLES
───────────────────────────────────────────────────────
  # Open file in vim
  vim $(fzf)

  # Kill a process interactively
  kill -9 $(ps aux | fzf | awk '{print $2}')

  # Navigate history and execute
  eval $(history | fzf --tac | sed 's/^ *[0-9]* *//')

  # cd into a subdirectory interactively
  cd $(find . -type d | fzf)

  # Multi-select files and copy paths
  ls | fzf --multi | tr '\n' ' '

  # Browse files with bat preview
  fd -t f | fzf --preview 'bat --color=always {}'

  # Checkout a git branch interactively
  git checkout $(git branch | fzf)

## USEFUL FLAGS (quick reference)
───────────────────────────────────────────────────────
  -m / --multi          Multi-select mode
  -e / --exact          Exact match (disable fuzzy)
  -i                    Case-insensitive
  +i                    Case-sensitive
  --tac                 Reverse input order
  --cycle               Cycle at list boundaries
  --no-sort             Do not sort results
  --nth=1,2             Search only in columns 1 and 2
  --with-nth=1          Display only column 1
  --delimiter=:         Column delimiter (default: whitespace)
  --print0              Null-separated output (for xargs -0)
