#!/bin/bash

if [ $# -eq 0 ]; then
  echo "provide file name: $0 filename"
  exit 1
fi

file=$1

if [ ! -f "$file" ]; then
echo "Error: File not found!"
 exit 1
fi

#  print in reverse lines
awk '{ lines[NR] = $0 } END { for (i = NR; i > 0; i--) print lines[i] }' "$file"

