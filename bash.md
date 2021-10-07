
set -euo pipefail # exit on failures
set -exuo pipefail # exit on failures, and print all commands

read -ra var <<< "$VALUE"

run specific bash function over ssh:
   - ssh user@host "$(typeset -f myfn); myfn"

export all functions:
   - ssh user@host "$(typeset -f); myfn"

peek stdin/stdout of another process:

```
ps ax | grep PATTERN
cd /proc/145348/fd
tail -f 1
```

* regex
  ```
  if [[ ! "$IP_ADDR" =~ ^[0-9]{1,3}(\.[0-9]{1,3}){3}$ ]]; then
  ```

```
t7_copy_function() {
  test -n "$(declare -f "$1")" || return
  eval "${_/$1/$2}"
}

t7_rename_function() {
  t7_copy_function "$@" || return
  unset -f "$1"
}
```
