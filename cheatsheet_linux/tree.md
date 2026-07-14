# tree

Display directory structure as a tree.

## Syntax
```
tree [options] [path]
```

## Common flags
| Flag | Description |
|------|-------------|
| `-L n` | Limit depth to n levels |
| `-a` | Show hidden files (dotfiles) |
| `-d` | Directories only |
| `-f` | Print full path for each file |
| `-I pattern` | Exclude files matching pattern |
| `--gitignore` | Respect .gitignore rules |
| `-o file` | Output to a file |

## Examples
```bash
tree                               # current directory
tree ~/dotfiles                    # specific path
tree -L 2                          # max 2 levels deep
tree -L 2 -a                       # include hidden files
tree -d                            # directories only
tree -I "node_modules|.git"        # exclude node_modules and .git
tree --gitignore                   # skip files in .gitignore
tree -L 3 -o structure.txt         # save output to file
```
