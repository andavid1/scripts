#!/bin/bash 
#installer for apache and php in ubuntu only 
#version 1.0 
#Author David Anand <david.anands@gmail.com>
set -x 
hash -r
ulimit -H -c0
set -euf -o pipefail
#Declerations
net=`ping -c 3 yahoo.com | grep -i "loss" | awk '{ print $6 }'|  sed 's/%/ /'`
apa=apache2
php=php5


echo "CHECKING NETWORK CONNECTION PLEASE WAIT "
if [ $net > 99 ]; then
echo "NETWORK REACHABLE"
else
echo " THE INSTALLER FAILED TO FIND NETWORK CONNECTION"
exit
fi



echo "Do you wish to proceed installing and configuring apache and php<y or n> ? \c"
read WISH

if [ $WISH = "n" ] ; then
echo you chose no, good bye
exit
fi

if [ $WISH = "y" ]; then
echo starting installation 
fi


function install
{	
  sudo apt-get update >/dev/null
  sudo dpkg -l $apa > /dev/null 2>&1
  INSTALLED=$?
  if [ $INSTALLED == '0' ]; then
  echo " apache $apa installed"
  else
  echo "not installed"
  fi
    
    echo updating the system 
    sleep 200
	sudo apt-get install apache2 php5 -y >/dev/null
}

function application 
{
	if [ -d "/home/$USER/test-app" ]
    then
    echo fixing permissions...
    chown -R $USER.USER /home/$USER/test-app
    ln -s /home/$USER/test-app /var/www
    else
    echo "Error: Directory does not exists please place the files and rerun the script"
    exit 
    fi
    }

install 

