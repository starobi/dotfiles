# find

Recursively search for files and directories.

## Syntax
```
find [path] [options]
```

## Search by name
```bash
find . -name "file.txt"           # exact match
find . -name "*.md"               # by extension
find . -iname "file.txt"          # case insensitive
```

## Search by type
```bash
find . -type f                    # files only
find . -type d                    # directories only
```

## Combine name and type
```bash
find . -type f -name "*.sh"       # .sh files
find . -type d -name "config"     # directories named config
```

## Search by size
```bash
find . -size +10M                 # larger than 10MB
find . -size -1k                  # smaller than 1KB
```

## Search by modification date
```bash
find . -mtime -7                  # modified in the last 7 days
find . -mtime +30                 # modified more than 30 days ago
```

## Search and execute a command
```bash
find . -name "*.log" -delete              # delete all .log files
find . -name "*.sh" -exec chmod +x {} \; # make scripts executable
```

## Exclude directories
```bash
find . -not -path "./.git/*" -name "*.md"
```

## Limit depth
```bash
find . -maxdepth 2 -name "*.txt"  # search up to 2 levels deep
```
