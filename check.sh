#!/bin/bash

#set -x

for i in `install.log`;
do 
cat $i | awk '{ print $2 }'
done;

