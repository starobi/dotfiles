# grep

Search for patterns inside files.

## Syntax
```
grep [options] pattern [file...]
```

## Common flags
| Flag | Description |
|------|-------------|
| `-i` | Case insensitive |
| `-r` | Recursive — search inside directories |
| `-n` | Show line numbers |
| `-l` | Show only filenames with matches |
| `-L` | Show only filenames without matches |
| `-v` | Invert — show lines that do NOT match |
| `-c` | Count matching lines |
| `-w` | Match whole words only |
| `-x` | Match whole lines only |
| `-A n` | Show n lines after match |
| `-B n` | Show n lines before match |
| `-C n` | Show n lines before and after match |
| `-E` | Extended regex (same as `egrep`) |
| `-o` | Print only the matched part |
| `--color` | Highlight matches |

## Examples
```bash
grep "error" file.txt              # basic search
grep -i "error" file.txt           # case insensitive
grep -n "error" file.txt           # show line numbers
grep -r "error" ./logs/            # search recursively in directory
grep -rl "error" ./logs/           # only filenames that match
grep -v "debug" file.txt           # lines that do NOT contain debug
grep -c "error" file.txt           # count matching lines
grep -w "log" file.txt             # match whole word only
```

## Context around matches
```bash
grep -A 3 "error" file.txt         # 3 lines after match
grep -B 3 "error" file.txt         # 3 lines before match
grep -C 3 "error" file.txt         # 3 lines before and after
```

## Using regex
```bash
grep -E "error|warning" file.txt   # match error OR warning
grep -E "^Start" file.txt          # lines starting with Start
grep -E "end$" file.txt            # lines ending with end
grep -E "[0-9]{3}" file.txt        # lines with 3 consecutive digits
```

## Combine with other commands
```bash
cat file.txt | grep "error"        # pipe input
ps aux | grep "node"               # find running processes
history | grep "git"               # search command history
grep -r "TODO" . --include="*.js"  # only search in .js files
grep -r "TODO" . --exclude-dir=".git"
```
