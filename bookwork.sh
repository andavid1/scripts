#!/bin/bash
basename $0
bal=`wc -l basename $0`
if [ $bal < "10" ]; then 
exit
else
echo "chow"
fi
