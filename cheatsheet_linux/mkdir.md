# mkdir

Create directories.

## Syntax
```
mkdir [options] directory
```

## Common flags
| Flag | Description |
|------|-------------|
| `-p` | Create parent directories as needed, no error if already exists |
| `-v` | Verbose — print each directory created |
| `-m` | Set permissions on creation |

## Examples
```bash
mkdir mydir                        # create a single directory
mkdir -p a/b/c                     # create nested directories
mkdir -pv ~/dotfiles/cheatsheet    # create + print what was created
mkdir -m 755 mydir                 # create with specific permissions
```

## Create multiple directories at once
```bash
mkdir dir1 dir2 dir3
mkdir -p project/{src,tests,docs}  # create several subdirs at once
```
