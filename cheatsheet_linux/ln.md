# ln

Create links between files and directories.

## Syntax
```
ln [options] source destination
```

## Symbolic link (symlink)
```bash
ln -s source destination          # create a symlink
ln -sf source destination         # overwrite if destination exists
```

## Hard link
```bash
ln source destination             # create a hard link (files only)
```

## Common flags
| Flag | Description |
|------|-------------|
| `-s` | Symbolic link instead of hard link |
| `-f` | Force — overwrite destination if it exists |
| `-n` | Treat destination as a normal file if it is a symlink to a dir |
| `-v` | Verbose — print each link created |

## Examples
```bash
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf        # symlink a file
ln -s ~/dotfiles/cheatsheet_linux ~/cheatsheet  # symlink a directory
ln -sfv ~/dotfiles/.tmux.conf ~/.tmux.conf      # overwrite + verbose
```

## Check if a symlink exists
```bash
ls -la ~/.tmux.conf               # shows -> pointing to target
readlink ~/.tmux.conf             # prints the target path
```

## Remove a symlink
```bash
rm ~/.tmux.conf                   # removes the symlink, not the original
```

## Gotchas
- Symlinks in Android shared storage (`/sdcard`, `storage/shared`) are **not supported**
- Trailing `/` on destination makes `ln` place the symlink *inside* the directory instead of replacing it
- Hard links cannot point to directories or cross filesystems
