#!/bin/bash

for (( i=0; i<100; i++ ))
do
    for (( j=0; j<100; j++ ))
    do
        readarray -t -d',' commands < Day2_input.txt
        commands[1]=$i
        commands[2]=$j
        for (( k=0; k< "${#commands[@]}"; k+=4 ))
        do
            starter="${commands[$k]}"
            par1Pos="${commands[$k+1]}"
            par1="${commands[$par1Pos]}"
            par2Pos="${commands[$k+2]}"
            par2="${commands[$par2Pos+2]}"

            outputPos="${commands[$k+3]}"

            starter="${commands[$k]}"
            if (( "${commands[0]}" == "19690720" ))
            then
                echo "SOLUTION"
                echo "${commands[1]}"
                echo "${commands[2]}"
            elif (( "${starter}" ==1 ))
            then
                output=$((par1+par2))
                commands[$outputPos]=$output

            elif [ "$starter" -eq 2 ]
            then
                output=$((par1*par2))
                commands[$outputPos]=$output
            elif [ "$starter" -eq 99 ]
            then
                exit
            fi
        done
    done
done

