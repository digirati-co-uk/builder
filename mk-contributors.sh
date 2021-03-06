#!/bin/bash
# generates the 'contributors.txt' file
set -e



echo " line contributions:" > contributors.txt
{
    git ls-tree -r -z --name-only HEAD  | xargs -0 -n1 git blame --line-porcelain HEAD | grep  "^author " | sort | uniq -c | sort -nr; # >> contributors.txt
    echo
    echo " commit contributions:"
    git shortlog -sn
} >> contributors.txt

cat contributors.txt

echo
echo 'Wrote contributors.txt'
