#!/bin/bash

string=$1
dir=$2

grep -l -r "$string" "$dir"
