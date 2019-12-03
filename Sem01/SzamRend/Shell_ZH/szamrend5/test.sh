#!/bin/bash


# comment
echo "Hajrá"; echo "Fradi";

echo almafa; echo alatt # ez az első program (echo -n)

echo "a program neve: $0"
echo "a parameterek szama: $#"
echo "az osszes parameter: $*"
pr1=`expr "$#" + 1`
pr2=`expr "$#" \* 2`
echo "$pr1 es $pr2"

echo "Add meg a neved"
read name
echo "Add meg az eletkorod"
read age
echo $name
echo $age
