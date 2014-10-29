#!/bin/bash

#set -x


echo "LAMP INSTALLER SCRIPT INITIATING"
echo "CHECKING NETWORK PLEASE WAIT "

net=`ping -c 3 yahoo.com | grep -i "loss" | awk '{ print $6 }'|  sed 's/%/ /'`

if [ $net > 99 ]; then
echo "NETWORK REACHABLE"
else
echo " THE INSTALLER FAILED TO FIND NETWORK CONNECTION"
exit
fi

aps=`rpm -qa | egrep -i "http|apache"| wc -l`
apa=`rpm -qa | egrep -i "http|apache"`
phpc=`rpm -qa | grep -i php | wc -l`
phpi=`rpm -qa | grep -i php`
mysc=`rpm -qa | grep -i mysql | wc -l`
mysi=`rpm -qa | grep -i mysql`


echo "Do you wish to proceed installing <y or n> ? \c"
read WISH
echo

if [ $WISH = "n" ] ; then
echo you chose no, good bye
exit

fi


if [ ! $WISH = "y" ] ; then
echo in vaild optin g - exiting
exit
fi

if [ $aps = "0" ] ; then
yum install httpd -y
sleep 200
echo "apache installed suceessfully" $apa
else
echo "apache already installed" $apa
fi

if [ $phpc =  "0" ]; then
yum install php -y
sleep 200
echo "php installed successfully" $phpi
else
echo "php already installed"  $phpi
fi

if [ $mysc =  "0" ]; then
yum install mysql -y
sleep 200
echo "mysql installed successfully" $mysc
else
echo "mysql already installed"  $mysc
exit
fi

