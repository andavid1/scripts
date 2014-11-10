#!/bin/bash
#set -x
res1=$(date +%s)
echo enter the first value: 
read start
echo enter the last value:
read end
echo the prime valuebers are as follows:
function optimusprime
{
for value in `seq $start $end`;
 do 
  hold=$(factor $value | grep $value | cut -d ":" -f 2 | cut -d " " -f 2)
   if [[ $hold == $value ]] 
    then 
    echo $value
   fi
done
res2=$(date +%s)
DIFF=$(( $res2 - $res1 ))
echo the execution time is $DIFF seconds
}
optimusprime
