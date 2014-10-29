#!/bin/bash
#set -x

touch getpage
rm getpage
wget -O getpage http://wisdomconsultancies.com/

declare -a Arr

filename="getpage"
exec 10<&0
exec < $filename

let count=0

while read Line; do
 Arr[$count]=$Line
{{count++}}
done

exec 0<10 10<&-
echo ${Arr[@]}
