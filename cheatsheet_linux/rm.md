# rm

Remove files and directories.

## Syntax
```
rm [options] target
```

## Common flags
| Flag | Description |
|------|-------------|
| `-r` | Recursive — remove directories and their contents |
| `-f` | Force — ignore nonexistent files, no confirmation prompt |
| `-i` | Interactive — prompt before every removal |
| `-v` | Verbose — print each file removed |

## Examples
```bash
rm file.txt                        # remove a file
rm -i file.txt                     # ask for confirmation first
rm -rf mydir/                      # remove directory and all contents
rm -rfv mydir/                     # remove + print what was deleted
rm *.log                           # remove all .log files in current dir
```

## Remove multiple files
```bash
rm file1.txt file2.txt file3.txt
```

## Gotchas
- `rm -rf` is irreversible — there is no trash, files are gone immediately
- Never run `rm -rf /` or `rm -rf ~` — deletes everything
- `-f` skips confirmation even with `-i`, so avoid combining them
- To remove a symlink: `rm symlink` — removes the link, not the original
