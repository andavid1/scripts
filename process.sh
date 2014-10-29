#!/bin/bash
set -x
process= ps -eo pid,cmd,etime | grep httpd | grep -v grep| awk '{print $1}'
pid= $?
for i in $process;
do $i echo $pid
done
#echo $process 




