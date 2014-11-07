#!/bin/bash
touch /tmp/locate
curl google.com > /tmp/locate
function locain
{
egrep -i '.in|.co.in' /tmp/locate
}
function locager
{
egrep -i '.de' /tmp/locate
}
locain
locager
if [ $locain < 0 ];then
echo "india"
else 
echo "germany"
fi
