#!/bin/bash

sum="0"
for i in {1..5}
do
    echo "Adj meg egy szamot!"
    read num
    sum=$[$sum+$num]
done
echo "A szamok osszege: $sum"
