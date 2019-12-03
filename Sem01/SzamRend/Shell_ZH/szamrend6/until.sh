#!/bin/bash

i="1"

until [ $i -gt 5 ]
do
    echo "Hello world!"
    i=$(( i+1))
done
