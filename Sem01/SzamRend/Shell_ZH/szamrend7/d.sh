#!/bin/bash

counter=0
input="$1"

while read line
do
    if [ $( expr $counter % 2 ) -ne 0  ]
    then
        echo $line >> file_even
    else
        echo $line >> file_odd
    fi
    (( counter++ ))
done < $input
