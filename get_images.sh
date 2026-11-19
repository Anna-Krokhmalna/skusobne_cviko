
#!/bin/bash


search="$*"

SERVER=$(echo "$search" | cut -d '/' -f1-3)

curl -s "$search" |
tr -d '\n' | tr '<' '\n' |
grep '<img' | grep 'src=' |
sed -E 's/.*src="([^"]+)".*/\1/' |

while read LINE
do
    if echo "$LINE" | grep '^https:' >/dev/null
    then
        img="$LINE"
    elif echo "$LINE" | grep '^/'
    then
        img="${SERVER}${LINE}"
    else
        continue
    fi
    curl -s -O "$img"
done
