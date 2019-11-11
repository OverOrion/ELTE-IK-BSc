#!/bin/bash

sample_text="$1"
database_text="$2"
if [ "$database_text" != "" -a "$sample_text" != "" ]
    then
    if [ ! -f $sample_text -o ! -f $database_text ]
        then
        echo "Hiba - Nem létező fájl(ok)."
        exit 3
    elif [ ! -s $sample_text -o ! -s $database_text ]
        then
        echo "Hiba - Üres fájl(ok)."
        exit 4
    elif [ ! -r $sample_text -o ! -r $database_text ]
        then
        echo "Hiba - Nem olvasható fájl(ok)."
        exit 5
    elif [ ! -w $(pwd) ] 
        then
        echo "Hiba - Nem írható könyvtár."
        exit 6
    else
    number_of_invitations=$(wc -l < "${database_text}")
    fi
else
    echo "A program használata: ./program körlevél_fájlnév adatbázis_fájlnév"
    exit 1
fi

# create temp file with all \n-s changed to delimeter character
echo $(cat "$database_text" | tr '\n' \|) > temp
database_text="temp"
# read temp database into array
readarray -t -d"|" data < "$database_text"

for (( c=0; c<$number_of_invitations; ++c ))
do
    while read line
    do
    if [[ $line =~ "<nev>" ]]
        then
        current_name=${data[0+"$c"*3]}
        echo "${line/<nev>/"${current_name}"}"
        #echo ${current_name}
    elif [[ $line =~ "<cim>" ]]
        then
        current_addr=${data[1+"$c"*3]}
        echo "${line/<cim>/"${current_addr}"}"
    elif [[ $line =~ "<idopont>" ]]
        then
        current_time=${data[2+"$c"*3]}
        echo "${line/<idopont>/"${current_time}"}"
    else
        echo "$line"
    fi
    done < "$sample_text"
echo "----------------------------------------------------------------------------------"
rm -rf temp
done
