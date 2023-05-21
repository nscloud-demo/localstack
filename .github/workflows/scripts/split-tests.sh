#!/bin/sh
set -e

GROUP_COUNT=$1

shopt -s globstar

COUNTER=0
for f in ${@:2}
do
if [[ $COUNTER -ge $GROUP_COUNT ]]; then
    COUNTER=0
fi

echo "$f" >> "split_group_$COUNTER"

COUNTER=$((COUNTER+1))
done

echo -n "test_paths=[" >> $GITHUB_OUTPUT

COUNTER=0
for f in split_group_*
do
if [[ $COUNTER -ge 1 ]]; then
    echo -n ", " >> $GITHUB_OUTPUT
fi

GROUP=`cat "$f" | tr '\n' ' '`
echo -n "'$GROUP'" >> $GITHUB_OUTPUT
echo "test group $COUNTER is $GROUP"

COUNTER=$((COUNTER+1))
done

echo "]" >> $GITHUB_OUTPUT