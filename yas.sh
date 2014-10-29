#!/bin/bash
set -x 
# for i in {1..255}
# do {
#  ping -c3 b$i.yasni.de >> ipstats
 # } done;
COUNTER=0
while [ $COUNTER -le 255 ]; do 
 echo "b$COUNTER.yasni.de" | xargs ping -c3  >> ipstats 
 let COUNTER=COUNTER+1
done
