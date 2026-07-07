# fd — Fast & User-Friendly Find Alternative

## BASIC USAGE
───────────────────────────────────────────────────────
  fd                           List all files recursively (respects .gitignore)
  fd pattern                   Search files matching pattern (fuzzy by default)
  fd pattern /path             Search in specific directory
  fd pattern ~ /tmp            Search in multiple directories
  fd -g "*.txt"                Glob pattern (not fuzzy)
  fd '\.txt$'                  Regex pattern

## FILE TYPE FILTERS
───────────────────────────────────────────────────────
  fd -t f                      Files only
  fd -t d                      Directories only
  fd -t l                      Symlinks only
  fd -t x                      Executable files only
  fd -t e                      Empty files/directories
  fd -t s                      Sockets only

## HIDDEN & IGNORED FILES
───────────────────────────────────────────────────────
  fd -H pattern                Include hidden files (dotfiles)
  fd -I pattern                Ignore .gitignore rules (include all)
  fd -HI pattern               Include hidden + ignored files
  fd --no-ignore-vcs pattern   Ignore only VCS rules (.gitignore), respect others

## DEPTH CONTROL
───────────────────────────────────────────────────────
  fd -d 1 pattern              Max depth: 1 (current dir only)
  fd -d 3 pattern              Max depth: 3 levels
  fd --min-depth 2 pattern     Start from depth 2
  fd --exact-depth 2 pattern   Only files exactly 2 levels deep

## EXTENSIONS & EXCLUSIONS
───────────────────────────────────────────────────────
  fd -e txt                    Files with .txt extension
  fd -e py -e js               Multiple extensions (OR)
  fd -E node_modules pattern   Exclude directory
  fd -E "*.log" pattern        Exclude pattern
  fd --exclude ".git" pattern  Exclude .git folder

## OUTPUT OPTIONS
───────────────────────────────────────────────────────
  fd -l pattern                Long listing (like ls -l)
  fd -0 pattern                Null-separated output (for xargs -0)
  fd --color always pattern    Force colored output
  fd --no-color pattern        Disable color
  fd -a pattern                Show absolute paths
  fd -1 pattern                Print only first result

## SEARCH OPTIONS
───────────────────────────────────────────────────────
  fd -i pattern                Case-insensitive search (default if pattern is lowercase)
  fd -s pattern                Case-sensitive search
  fd -F pattern                Fixed string (no regex)
  fd -p pattern                Match against full path, not just filename
  fd --follow pattern          Follow symbolic links

## SIZE & TIME FILTERS
───────────────────────────────────────────────────────
  fd --size +1mb               Files larger than 1MB
  fd --size -100kb             Files smaller than 100KB
  fd --size +1gb               Files larger than 1GB
  fd --changed-within 1d       Modified in the last day
  fd --changed-within 1h       Modified in the last hour
  fd --changed-before 2024-01-01  Modified before a date
  fd --changed-within 1week    Modified in the last week

## EXECUTE COMMANDS
───────────────────────────────────────────────────────
  fd -e txt -x wc -l           Run wc -l on each .txt file
  fd -e jpg -x convert {} {.}.png   Convert each jpg to png
  fd -t d -x rm -rf {}         Remove each directory found (careful!)
  fd pattern -X vim            Open all results in vim at once
  fd -e md -x bat              Preview all markdown files with bat

  # Placeholders for -x / -X:
  {}     Full path
  {/}    Filename only
  {//}   Parent directory
  {.}    Path without extension
  {/.}   Filename without extension

## COMMON RECIPES
───────────────────────────────────────────────────────
  # Find and delete all .DS_Store files
  fd -H -I '.DS_Store' -x rm

  # Find large files (>100MB)
  fd --size +100mb -t f

  # Find recently modified configs
  fd -e conf --changed-within 7d

  # Count files per extension
  fd -t f | sed 's/.*\.//' | sort | uniq -c | sort -rn

  # Find empty directories
  fd -t e -t d

  # Use with fzf
  fd -t f | fzf --preview 'bat --color=always {}'

  # Find and replace in all .js files
  fd -e js -x sed -i 's/oldText/newText/g' {}

## KEY DIFFERENCES FROM find
───────────────────────────────────────────────────────
  find . -name "*.txt"         →   fd -e txt
  find . -type d               →   fd -t d
  find . -maxdepth 2           →   fd -d 2
  find . -newer file.txt       →   fd --changed-within $(stat -c %y file.txt)
  find . -not -path "*/node_modules/*"  →  fd -E node_modules
