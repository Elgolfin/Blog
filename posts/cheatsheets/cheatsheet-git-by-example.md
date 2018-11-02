This work is licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

# Git by Example

## Advanced Git Tutorial Video

[Advanced Git Tutorial Video](https://www.youtube.com/watch?v=0SJCYPsef54)
by [Tim Berglund](https://github.com/tlberglund)

## .gitconfig [alias]

```bash
[alias]
  lg = !"git --no-pager log --graph --pretty=oneline --abbrev-commit --decorate --all $*"
  lg1 = !"git lg1-specific --all"
  lg2 = !"git lg2-specific --all"
  lg3 = !"git lg3-specific --all"

  lg1-specific = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'
  lg2-specific = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'
  lg3-specific = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset) %C(bold cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%n''          %C(white)%s%C(reset)%n''
```

## Useful Commands

```bash
# Display the .git tree in near real-time
while; do; clear; tree .git; sleep 2; done;
```

```bash
# Get the type of the object
git cat-file -t <hash>
# Pretty print the content of the object
git cat-file -p <hash>
```

```bash
git update-ref refs/heads/master <hash>
git update-ref HEAD <hash> --create-reflog
```

```bash
# git loglive
#!/bin/bash
while :
do
    clear
    git --no-pager log --graph --pretty=oneline --abbrev-commit --decorate --all $*
    sleep 1
done
```

```bash
# Shows all objects that aren't pointed to by another object
git fsck --full
```

```bash
# See how much space is used by a repo
git count-objects -v
```

```bash
# Find the 3 largest files in a pack
git verify-pack -v .git/objects/pack/<packfilename>.idx \
  | sort -k 3 -n \
  | tail -3
```

## Rebase and Merge Strategy by Example

```bash
git init
git commit -m "Create an empty commit #1" --allow-empty
git checkout -b features/feature-1
git commit -m "Create an empty commit #2" --allow-empty
git commit -m "Create an empty commit #3" --allow-empty
git commit -m "Create an empty commit #4" --allow-empty
git checkout HEAD^^^
git checkout -b features/feature-2
git commit -m "Create an empty commit #5" --allow-empty
git commit -m "Create an empty commit #6" --allow-empty
git commit -m "Create an empty commit #7" --allow-empty
git checkout master
git commit -m "Create an empty commit #8" --allow-empty
git commit -m "Create an empty commit #9" --allow-empty
git commit -m "Create an empty commit #10" --allow-empty

git lg

# Rebase the commits of the branch into master
git rebase master features/feature-1 --keep-empty

git lg

# Merge master with the feature branch with no fast-forward
# This way, a merge commit will be kept for historical reason with the name of the merged branch
git checkout master
git merge features/feature-1 --no-ff

git lg

# Delete the branch
git branch -d features/feature-1

git lg
```

[![creativecommons image](https://i.creativecommons.org/l/by-sa/4.0/80x15.png)](http://creativecommons.org/licenses/by-sa/4.0/)