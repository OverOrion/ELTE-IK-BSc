#!/bin/bash
file=$1
word=$2

cat "$file" | grep -w "$word"
