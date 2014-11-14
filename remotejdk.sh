#!/bin/bash
#author david anand <david.anands@gmail.com>
#remote jdk sync and version check for large list via ssh

cp /dev/null jdk_output
for i in `cat hostlist`;
do

j=`ssh -q $i "uname -i"`

case $j in
     "i386")

echo $i $j >> jdk_output
echo $i $j >> jdk_log
ssh -q $i "mkdir -p /opt/jdk1.7.0"
rsync -vza jdk1.7.0 $i:/opt/

ssh -q $i "ln -sf  /opt/jdk1.7.0/jre/bin/java /usr/bin/java "

;;
     "x86_64")

echo $i $j >> jdk_output
echo $i $j >> jdk_log
ssh -q $i "mkdir -p /opt/jdk1.7.0"

rsync -vza jdk1.7.0 $i:/opt/
ssh -q $i "ln -sf  /opt/jdk1.7.0/jre/bin/java /usr/bin/java "
;;
      *)
        echo "unknown system type" >> jdk_output;;
esac
done

