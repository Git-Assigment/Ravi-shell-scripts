#!/bin/bash

echo -n "Enter number of rows: "
read n

num=1  

for (( i=1; i<=n; i++ ))
do
    for (( j=1; j<=i; j++ ))
    do
        echo -n "$num "
        ((num++))
    done
    echo ""  
done

