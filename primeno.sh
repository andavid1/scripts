#!/bin/bash
#version 1.0
#Author David Anand <david.anands@gmail.com>
#set -x 
hash -r

echo enter the first value: 
read start
echo enter the last value:
read end

echo the prime numbers are as follows:
COUNT=$start
while [ $COUNT -le $end ]; do

if [ $(($COUNT%2)) != 0 ] ; then
echo $COUNT 
fi

let COUNT++
done