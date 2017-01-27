This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License ](http://creativecommons.org/licenses/by-sa/4.0/).

# Config
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
  email = nico@elgolfin.net
[credential]
  helper = cache --timeout=36000
```

[![enter image description here](https://i.creativecommons.org/l/by-sa/4.0/80x15.png) ](http://creativecommons.org/licenses/by-sa/4.0/)