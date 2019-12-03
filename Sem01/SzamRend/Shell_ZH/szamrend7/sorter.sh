#!/bin/bash

read word
while [ "$word" != "end" ]
do
     `echo $word >> tmp`
     `sort tmp -o tmp`
     read word
done
echo "---RENDEZVE-----"
cat tmp
rm -rf tmp

