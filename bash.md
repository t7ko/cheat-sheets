
read -ra var <<< "$VALUE"

run specific bash function over ssh:
   - ssh user@host "$(typeset -f myfn); myfn"

export all functions:
   - ssh user@host "$(typeset -f); myfn"
