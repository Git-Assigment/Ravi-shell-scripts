#!/bin/bash

echo "The integer arguments are:"

for arg in "$@"
do
    if [[ $arg =~ ^-?[0-9]+$ ]]; then
        echo "$arg"
    fi
done

