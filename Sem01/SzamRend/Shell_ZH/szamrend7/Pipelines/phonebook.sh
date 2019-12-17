#!/bin/bash
# set -x

PHONEBOOK="phonebook.txt"

case "$1" in
    -a)
        echo "Add meg a nevet: "
        read name
        echo "Add meg a telefonszámot: "
        read number
        ## if entry already exists in PHONEBOOK
        if [[ `grep -w "$number" "$PHONEBOOK" ` != '' ]]
        then
            echo "Hiba, "$number" már benne van."
        else
            echo ""$name","$number"" >> phonebook.txt
            echo ""$name","$number" hozzáadva."
        fi
        exit 0
        ;;
    -d)
        if [ "$2" != "" -a "$3" != "" ]
        then
            name_del="$2"
            number_del="$3"
            `sed -i "/"$2","$3"/d" "$PHONEBOOK"`
        fi
        exit 0
        ;;
    -c)
       wc -l "$PHONEBOOK" | cut -f1 -d ' '
       exit 0
        ;;
    -o)
        uniq "$PHONEBOOK" | sort | cut -f1 -d','
        exit 0
        ;;
esac
grep -w "$1" "$PHONEBOOK" | cut -f2 -d','
