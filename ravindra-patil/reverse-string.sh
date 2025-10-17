#!/bin/bash

echo -n "Enter a string: "
read str

len=${#str}   
rev=""

i=$((len - 1))

while [ $i -ge 0 ]
do
    rev="$rev${str:$i:1}"   
    i=$((i - 1))
done

echo "Reversed string: $rev"

