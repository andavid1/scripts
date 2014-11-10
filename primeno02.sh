#!/bin/bash
#version 1.0
#Author David Anand <david.anands@gmail.com>
#set -x 
hash -r

echo enter the first value: 
read start
echo enter the last value:
read end

echo the prime numbers are 

#for i in `seq $start $end`;
#do

#if [ $(($i%2)) != 0 ] ; then
#echo $i 
#fi 
#done


function findPrime

{
	for value in `seq $start $end`;
	do
		divisor=2
		isPrime="true"

		while [[ $value -gt $divisor ]]; do

			if [ $(($value % $divisor)) == 0 ]; then
				isPrime="false"
			    exit  
			fi

		  let divisor++;
		done

		if [[ $isPrime != false ]]; then
			echo $value;
		fi
	done
}


findPrime