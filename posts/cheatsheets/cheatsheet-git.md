This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License ](http://creativecommons.org/licenses/by-sa/4.0/).

# Config

## Linux based

***.git/config***
```config
[core]
  repositoryformatversion = 0
  filemode = false
  bare = false
  logallrefupdates = true
  symlinks = false
  ignorecase = true
  editor = code --wait --new-window
[diff]
  tool = default-difftool
[difftool "default-difftool"]
  cmd = code --wait --new-window --diff $LOCAL $REMOTE
[user]
  name = Elgolfin
  email = <email>
[credential]
  helper = cache --timeout=36000
```

## Windows based

***.gitconfig***
```config
[credential]
  helper = wincred
```

# Configure multiple remote repo

```bash
git remote add all <repo_address_1>
git remote set-url --add --push all <repo_address_2>
git remote set-url --add --push all <repo_address_1>
```

[![enter image description here](https://i.creativecommons.org/l/by-sa/4.0/80x15.png) ](http://creativecommons.org/licenses/by-sa/4.0/)