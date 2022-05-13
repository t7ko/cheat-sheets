* `set print pretty on`
* `enable pretty-printer`
* Examining memory (`x/nfu address`): https://sourceware.org/gdb/current/onlinedocs/gdb/Memory.html
* 

```
break foo if x>0
commands
silent
printf "x is %d\n",x
cont
end
```

