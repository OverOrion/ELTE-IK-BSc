#!/bin/bash

echo "Adja meg a forrast"
read src

echo "Adja meg a celt"
read trg

cp "$src" "$trg"
