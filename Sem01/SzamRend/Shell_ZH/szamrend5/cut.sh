#!/bin/bash

utolso=`echo $* | cut -f$# -d" "`
elso="$1"
echo "$*"
echo "$#"

echo `expr "$elso" + "$utolso"`
