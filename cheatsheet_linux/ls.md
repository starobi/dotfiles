# ls

List directory contents.

## Syntax
```
ls [options] [path]
```

## Common flags
| Flag | Description |
|------|-------------|
| `-l` | Long format — permissions, size, date, owner |
| `-a` | Show hidden files (dotfiles) |
| `-h` | Human readable sizes (KB, MB) — use with `-l` |
| `-t` | Sort by modification time, newest first |
| `-r` | Reverse sort order |
| `-S` | Sort by file size, largest first |
| `-R` | Recursive — list subdirectories too |
| `-1` | One file per line |

## Examples
```bash
ls                                 # basic listing
ls -l                              # detailed listing
ls -la                             # detailed + hidden files
ls -lh                             # detailed + human readable sizes
ls -lt                             # sort by newest first
ls -ltr                            # sort by oldest first
ls -lS                             # sort by size, largest first
ls -R                              # list all files recursively
ls -1                              # one file per line
```

## Combining flags
```bash
ls -lah                            # detailed + hidden + human sizes
ls -lahtr                          # detailed + hidden + oldest first
```

## Understanding long format (`ls -l`)
```
drwxr-xr-x  2  user  group  4096  Jul 14 08:00  mydir
^            ^  ^     ^      ^     ^              ^
type+perms  links owner group size  date          name
```

- First character: `d` = directory, `-` = file, `l` = symlink
