
```
awk '{print $1;}'
tr -d "[]{}:'," | awk '{print $2, "-", $4;}'
nslookup ... . | awk -F': ' 'NR==6 { print $2 } '
my_ip=$(ip a s|grep 192.168.48 | awk '{print $2;}' | awk -F/ '{print $1;}')
{ for i in *.py; do git blame $i; done } | awk '{ if ($2 ~ /^\(/ ) { print $2; } else { print $3; } }' | sed 's/[^A-Za-z]//g' | sort | uniq -c | sort -n
```
