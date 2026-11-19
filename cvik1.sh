#!/bin/bash

search="$*"
search_a="${search// /+}"

curl -s "https://arxiv.org/search/math?query=$search_a&searchtype=all" |
    tr -d '\n' | tr '<' '\n' |
    grep '/abs/' |
#    sed -E 's/.*href="\/abs\/([^]+).*/\1/ | 
#     sed  's/.*\/abs\/([^ ]*).*/\1/'
    sed -E 's/.*\/abs\/([^"]*).*/\1/'
    sort -u
