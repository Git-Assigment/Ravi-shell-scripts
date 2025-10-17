#!/bin/bash

# Check if filename/directory is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 filename_or_directory"
    exit 1
fi

file="$1"

# Check if the file or directory exists
if [ ! -e "$file" ]; then
    echo "Error: '$file' does not exist."
    exit 1
fi

# Convert name to lowercase
lowercase=$(echo "$file" | tr '[:upper:]' '[:lower:]')

# Rename only if the lowercase name is different
if [ "$file" != "$lowercase" ]; then
    mv "$file" "$lowercase"
    echo "Renamed '$file' → '$lowercase'"
else
    echo "Filename is already lowercase."
fi
