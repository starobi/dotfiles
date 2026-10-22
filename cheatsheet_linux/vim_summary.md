# vim cheatsheet

Modal text editor for the terminal. Normal mode = commands, Insert mode = typing.

## Start
```bash
vim file.txt        # open (creates it if missing)
vim +42 file.txt    # open at line 42
vim -O a.cpp b.cpp  # open side by side
vimtutor            # 30-min interactive tutorial
```

## Modes
| Keys | Does |
|---|---|
| `i` | insert before cursor |
| `Esc` | back to Normal mode (do this first, always) |
| `v` / `V` / `Ctrl-v` | select chars / lines / block |
| `:` | command line |

## Save and quit
| Command | Does |
|---|---|
| `:w` | save |
| `:q` | quit |
| `:wq` / `ZZ` | save and quit |
| `:q!` | quit, discard changes (destructive) |
| `:wa` / `:qa` | save all / quit all |

## Move
| Keys | Does |
|---|---|
| `h j k l` | left, down, up, right |
| `w` / `b` | next / previous word |
| `0` / `^` / `$` | line start / first char / end |
| `gg` / `G` | file start / end |
| `42G` or `:42` | go to line 42 |
| `Ctrl-d` / `Ctrl-u` | half page down / up |
| `%` | jump to matching bracket |

## Insert
| Keys | Does |
|---|---|
| `a` / `A` | append after cursor / end of line |
| `I` | insert at start of line |
| `o` / `O` | new line below / above |

## Edit
| Keys | Does |
|---|---|
| `x` | delete char |
| `dd` | delete (cut) line |
| `yy` | copy line |
| `p` / `P` | paste after / before |
| `cw` / `ciw` | change word / whole word |
| `D` | delete to end of line |
| `u` / `Ctrl-r` | undo / redo |
| `.` | repeat last change |
| `>>` / `<<` | indent / unindent line |

Tip: prefix a number to repeat, e.g. `3dd` deletes 3 lines, `5j` moves 5 down.

## Search and replace
| Keys | Does |
|---|---|
| `/text` | search forward (`n` / `N` = next / previous) |
| `*` | search word under cursor |
| `:%s/old/new/g` | replace everywhere |
| `:%s/old/new/gc` | replace, ask each time |
| `:noh` | clear highlight |

## Files and windows
| Command | Does |
|---|---|
| `:e file` | open another file |
| `:sp` / `:vsp` | split horizontal / vertical |
| `Ctrl-w` then `h j k l` | move between splits |
| `:set number` | show line numbers |

## Typical workflow
```
vim notes.txt     # open
i                 # start typing
Esc               # stop typing
/todo             # find something
dd                # delete a line
:wq               # save and exit
```

## Troubleshooting
- **Can't exit** → `Esc`, then `:q!` (or `:wq` to keep changes)
- **Typing does weird things** → you're in Normal mode; press `i`
- **"Swap file exists" warning** → another vim has it open, or it crashed; `:recover` or delete the `.swp` file
- **"Can't open file for writing"** → no permission; `:w !sudo tee %`
- **Terminal froze** → `Ctrl-s` pauses output; press `Ctrl-q`
