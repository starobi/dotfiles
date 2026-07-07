# mv — Move & Rename Files

## BASIC SYNTAX
───────────────────────────────────────────────────────
  mv source destination        Move or rename a file
  mv file.txt newname.txt      Rename file
  mv file.txt dir/             Move file into directory
  mv file.txt dir/newname.txt  Move and rename at once
  mv dir1/ dir2/               Move entire directory into dir2/

## MOVING DIRECTORIES
───────────────────────────────────────────────────────
  mv mydir/ /path/to/dest/     Move entire directory (contents included)
  mv mydir/ newname/           Rename a directory

  # If dest/ does NOT exist → renames mydir/ to dest/
  mv mydir/ dest/

  # If dest/ ALREADY exists → moves mydir/ inside dest/ → dest/mydir/
  mv mydir/ dest/

  # To merge contents (mv can't merge — use rsync instead):
  rsync -a mydir/ dest/

## SAFETY FLAGS
───────────────────────────────────────────────────────
  mv -i source dest            Ask before overwriting (interactive)
  mv -n source dest            Never overwrite existing files
  mv -b source dest            Backup overwritten file (appends ~)
  mv -v source dest            Verbose — print each action

  # Combining flags:
  mv -iv source dest           Interactive + verbose (recommended)

## MULTIPLE FILES
───────────────────────────────────────────────────────
  mv file1 file2 file3 dir/    Move multiple files into a directory
  mv *.txt dir/                Move all .txt files into dir/
  mv *.log /var/logs/          Move all .log files to another path
  mv dir1/ dir2/ dir3/ dest/   Move multiple directories into dest/

## BULK RENAME (with loops)
───────────────────────────────────────────────────────
  # Add prefix to all .txt files:
  for f in *.txt; do mv "$f" "prefix_$f"; done

  # Change extension from .txt to .md:
  for f in *.txt; do mv "$f" "${f%.txt}.md"; done

  # Remove prefix from filenames:
  for f in prefix_*; do mv "$f" "${f#prefix_}"; done

  # Lowercase all filenames:
  for f in *; do mv "$f" "${f,,}"; done

## PRACTICAL EXAMPLES
───────────────────────────────────────────────────────
  # Rename without risking overwrite:
  mv -n old.txt new.txt

  # Move file and keep a backup if dest exists:
  mv -b report.txt archive/

  # Move all images to a folder:
  mv *.jpg *.png *.gif images/

  # Move directory to new location:
  mv ~/Downloads/project ~/Documents/project

  # Rename directory:
  mv old_name/ new_name/

## NOTES
───────────────────────────────────────────────────────
  - mv within the same filesystem is instant (just updates the path, no copy)
  - mv across filesystems copies the data then deletes the source — slower for large files
  - mv cannot merge directories — use rsync or cp for that
  - Always quote paths with spaces: mv "my file.txt" "my folder/"
