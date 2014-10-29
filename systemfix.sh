#!/bin/bash
clear
#set -x

echo "The hostname and Ip is"
hostname
hostname -i

echo " The curunt system load and users loged in "
w

echo " The os version"
cat /etc/redhat-release

echo " The memory stats"
vmstat -s | head -n 10

echo " The I/O stats"
iostat

echo " Disk usage"
df -h

echo "  the mac address of the system is"
ifconfig -a | grep HWaddr

echo " The highest memoy utilised 15  process are as follows"
ps -eo rss,vsz,pid,cputime,cmd --width 100 --sort rss,vsz | tail --lines 10

echo -n " cleaning temp proceed y/n : "
read text
if [ $text = "y" ];then
echo "cleaning temp"
cd /tmp;
rm -r *;
else
exit
fi


