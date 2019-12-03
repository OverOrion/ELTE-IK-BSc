#!/bin/bash

for i in `who | cut -f1 -d" " | sort -u`
do
    echo "$i" bejelentkezett
done
