
[[_TOC_]]

# Syntax

<https://vim.fandom.com/wiki/Fix_syntax_highlighting>

```
:syntax sync minlines=200
:noremap <F12> <Esc>:syntax sync fromstart<CR>
:inoremap <F12> <C-o>:syntax sync fromstart<CR>
autocmd BufEnter * :syntax sync fromstart
```

