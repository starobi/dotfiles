# Git Quick Reference

> A concise daily-use cheatsheet for common Git workflows.

---

## Setup

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global core.editor "code --wait"   # Set VS Code as editor
```

---

## Repository

```bash
git init                        # Initialize a new repo
git clone <url>                 # Clone a remote repo
git clone <url> --depth 1       # Shallow clone (latest snapshot only)
```

---

## Status &amp; Log

```bash
git status                      # Working tree status
git log --oneline --graph       # Compact visual log
git log --oneline -10           # Last 10 commits
git diff                        # Unstaged changes
git diff --staged               # Staged changes
git diff <branch1>..<branch2>   # Diff between two branches
git show <hash>                 # Show a specific commit
```

---

## Staging &amp; Committing

```bash
git add <file>                  # Stage a file
git add .                       # Stage all changes
git add -p                      # Stage changes interactively (hunk by hunk)
git commit -m "message"         # Commit with message
git commit --amend              # Edit the last commit (message or content)
git commit --amend --no-edit    # Amend without changing the message
```

---

## Undoing Changes

```bash
git restore <file>              # Discard unstaged changes in a file
git restore --staged <file>     # Unstage a file (keep changes in working dir)
git reset HEAD~1                # Undo last commit, keep changes unstaged
git reset --soft HEAD~1         # Undo last commit, keep changes staged
git reset --hard HEAD~1         # Undo last commit, discard all changes ⚠️
git revert <hash>               # Create a new commit that undoes a commit (safe for shared branches)
```

### Add a commit's changes to staged without committing

```bash
git revert -n <hash>            # Apply the revert to staging only (no commit)
git cherry-pick -n <hash>       # Apply a commit's changes to staging only (no commit)
```

---

## Branches

```bash
git branch                      # List local branches
git branch -a                   # List all branches (local + remote)
git branch <name>               # Create a branch
git switch <name>               # Switch to a branch
git switch -c <name>            # Create and switch to a new branch
git branch -d <name>            # Delete a branch (safe)
git branch -D <name>            # Force delete a branch
git branch -m <old> <new>       # Rename a branch
```

### Diff between two branches

```bash
git diff <branch1>..<branch2>              # Line-level diff
git diff <branch1>..<branch2> --stat       # Summary of changed files
git log <branch1>..<branch2> --oneline    # Commits in branch2 not in branch1
```

---

## Cherry-pick

```bash
git cherry-pick <hash>                    # Apply a single commit
git cherry-pick <hash>^..<branch>         # Apply from <hash> to tip of current branch's upstream
git cherry-pick <hash>..<other-branch>    # Apply all commits from hash (exclusive) to tip of branch
git cherry-pick -n <hash>                 # Apply changes to staging only, no commit
git cherry-pick --continue                # Continue after resolving conflicts
git cherry-pick --abort                   # Abort the operation
```

> **From a hash to the end of a branch:**
>
> ```bash
> git cherry-pick <start-hash>^..<tip-of-source-branch>
> ```
>
> The `^` includes the start commit itself. Without it, the range is exclusive of `<start-hash>`.

---

## Merging &amp; Rebasing

```bash
git merge <branch>              # Merge branch into current
git merge --no-ff <branch>      # Merge with a merge commit (no fast-forward)
git merge --abort               # Abort a conflicted merge
git rebase <branch>             # Rebase current branch onto another
git rebase -i HEAD~3            # Interactive rebase of last 3 commits
git rebase --abort              # Abort a rebase
git rebase --continue           # Continue after resolving conflicts
```

---

## Remote

```bash
git remote -v                           # List remotes
git remote add origin <url>             # Add a remote
git fetch                               # Fetch all remotes
git fetch origin <branch>              # Fetch a specific branch
git pull                                # Fetch + merge
git pull --rebase                       # Fetch + rebase (cleaner history)
git push origin <branch>               # Push a branch
git push -u origin <branch>            # Push and set upstream
git push --force-with-lease            # Safe force push ⚠️
git push origin --delete <branch>      # Delete a remote branch
```

---

## Stash

```bash
git stash                       # Stash current changes
git stash push -m "label"       # Stash with a label
git stash list                  # List stashes
git stash pop                   # Apply latest stash and remove it
git stash apply stash@{2}       # Apply a specific stash (keep it)
git stash drop stash@{0}        # Delete a specific stash
git stash clear                 # Delete all stashes
```

---

## Tags

```bash
git tag                         # List tags
git tag v1.0.0                  # Create a lightweight tag
git tag -a v1.0.0 -m "msg"      # Create an annotated tag
git push origin v1.0.0          # Push a tag
git push origin --tags          # Push all tags
git tag -d v1.0.0               # Delete a local tag
```

---

## Cleanup &amp; Maintenance

```bash
git clean -fd                   # Remove untracked files and directories ⚠️
git clean -n                    # Dry run — show what would be removed
git gc                          # Run garbage collection
git bisect start                # Start a binary search for a bug
git bisect good <hash>
git bisect bad <hash>
git bisect reset                # End bisect session
```

---

## Useful Aliases (add to `~/.gitconfig`)

```ini
[alias]
  st   = status
  lg   = log --oneline --graph --decorate --all
  cp   = cherry-pick
  sw   = switch
  undo = reset HEAD~1
  save = stash push -m
```

---

> ⚠️ = destructive or potentially irreversible. Double-check before running.

