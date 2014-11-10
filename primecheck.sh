#!/bin/bash
#set -x
#prime number checker with factor binary 
#version 1.0
#Author David Anand <david.anands@gmail.com>

function prime1
{   res1=$(date +%s)
     echo enter the first value: 
     read start
     echo enter the last value:
     read end
     echo the prime valuebers are as follows:
    for value in `seq $start $end`;
      do 
      hold=$(factor $value | grep $value | cut -d ":" -f 2 | awk '{print $1}')
        if [[ $hold == $value ]] 
         then 
         echo $value
        fi
    done
 res2=$(date +%s)
 DIFF1=$(( $res2 - $res1 ))
 
}


function prime2
{
    res1=$(date +%s)
     echo enter the first value: 
     read start
     echo enter the last value:
     read end
     echo the prime valuebers are as follows:
    value=$start
        while [ $value -le $end ]
          do
          hold=$(factor $value | grep $value | cut -d ":" -f 2 | awk '{print $1}')
            if [[ $hold == $value ]];then 
             echo $value
              fi
         let value++
        done
     res3=$(date +%s)
     DIFF2=$(( $res3 - $res1 ))
     
}


function prime3
{
	res1=$(date +%s)
     echo enter the first value: 
     read start
     echo enter the last value:
     read end
     echo the prime valuebers are as follows:
	value=$start
	    until [  $value -ge $end ]
	     do
	  	 hold=$(factor $value | grep $value | cut -d ":" -f 2 | awk '{print $1}')
	  	    if [[ $hold == $value ]]; then
	  		 echo $value
	  	    fi
	  	  let value++
	    done
	  res4=$(date +%s)
	  DIFF3=$(( $res4 - $res1 ))
	  

}

prime1
echo the execution time of strategy1 is $DIFF1 seconds 
prime2 
echo the execution time of strategy2 is $DIFF2 seconds
prime3 
echo the execution time of strategy3 is $DIFF3 seconds
echo please choose a strategy 1 2 or 3
read strategy
case $strategy in 1)
	prime1
	;;
	2)
	prime2
	;;
	3)
	prime3
	;;
esac


