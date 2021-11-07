This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License ](http://creativecommons.org/licenses/by-sa/4.0/).

# Vim Cheatsheet

```bash
# Open vim with predefined windows
vim -O2 # Vertical split
vim -o2 # Horizontal split
vim -c "set splitright|vsp ~/.vimrc|set splitbelow|sp newfile"
```

## Buffers, Windows, Tabs

  - :tabnew                       open a new tab
  - :tabclose                     close the current tab
  - :tabs                         list all tables including their displayed windows
  - :tabn                         go to the next tab
  - :tabp                         go to the previous tab
  - :tabfirst                     go to the first tab
  - :tablast                      go to the last tab
  - :tabon                        close other tabs

  - :ls                           list the buffers (including their numbers)
  - :b[number]                    display the buffer with the given number
  
  - :vsp                          create a vertical split (left/right)
  - :sp                           create an horizontal split (top/bottom)
  - :q                            close the current split
  - Ctrl+w h/j/k/l                navigate splits left/down/up/right


## Cursor movement

  - h j k l                       (left down up right)
  - w / b                         next/previous word
  - W / B                         next/previous word (space separated)
  - 0 / $                         start/end of line
  - :[line number] [enter]        go to the line number
  - Ctrl+d                        move down half the page
  - Ctrl+u                        move up half the page
  - gg                            go to the top of the page
  - G                             go to the bottom of the page
  - }                             go forward by paragraph (the next blank line)
  - {                             go backward by paragraph (the previous blank line)

## Insert commands

  - i insert at the current position
  - I insert at the beginning of the line
  - a insert just after the current position
  - A insert at the end of the line
  - o open a new line below the current line
  - O open a new line above the current line 

## Search commands

  - /[pattern]                    forward search
  - ?[pattern]                    backward search
  - n / N                         repeat search / repeat in reverse direction
  - noh                           suppress highlight
