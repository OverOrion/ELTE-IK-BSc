#!/bin/bash

until [ "$1" -eq 3 ]
do
    case "$1" in
        1) echo "First"
            exit
            ;;
        2) echo "Second"
            exit
            ;;
    esac
done
