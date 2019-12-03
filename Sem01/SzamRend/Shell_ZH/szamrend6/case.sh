#!/bin/bash

case $1 in
    -d)
        date ;;
    -w)
        who ;;
    -l)
        ls ;;
    *)
        echo "-d, -w, -l are the parameters" ;;
esac
