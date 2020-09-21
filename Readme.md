# vim-horizonbar

![show\_info](https://raw.githubusercontent.com/motephyr/vim-horizonbar/master/docs/example.gif)

### 1. Installation with [Vim-Plug](https://github.com/junegunn/vim-plug)
1. Add `Plug 'motephyr/vim-horizonbar'` to your vimrc file.
2. Reload your vimrc or restart.
3. Run `:PlugInstall`

### 2. Settings Example
```vim

set statusline=%{horizonbar#ScrollBarWidth(horizonbar#BarWidth())}
set statusline+=%=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#CursorLine#     " colour
set statusline+=\ %t\                   " short file name
set statusline+=\ %Y\                   " short file name
set statusline+=%#CursorIM#     " colour
set statusline+=\ %2l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %{line('$')}
set statusline+=\ Lines\                " percentage

autocmd User CocGitStatusChange call horizonbar#GetDiffList()

```

This is a example,
You can define your statusline by horizonbar#ScrollBarWidth(horizonbar#BarWidth())!

Cheers!
