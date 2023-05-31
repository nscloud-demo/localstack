#!/bin/sh
set -e

shopt -s globstar

echo -n "test_paths=[" >> $GITHUB_OUTPUT

COUNTER=0
for f in $@
do
if [[ $COUNTER -ge 1 ]]; then
    echo -n ", " >> $GITHUB_OUTPUT
fi

echo -n "'$f'" >> $GITHUB_OUTPUT

COUNTER=$((COUNTER+1))
done

echo "]" >> $GITHUB_OUTPUT