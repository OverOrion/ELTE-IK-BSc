#!/bin/bash

sample_text="$1"
database_text="$2"

# read database into array
readarray -td'|' data < "$database_text"

number_of_invitations=$(wc -l < "${database_text}")

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
done
