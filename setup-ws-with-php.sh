#!/bin/bash
#installer for apache and php in ubuntu only
#version 1.0
#Author David Anand <david.anands@gmail.com>
#set -x
hash -r
#ulimit -H -c0
#set -euf -o pipefail
#Declerations
net=`ping -c 3 yahoo.com | grep -i "loss" | awk '{ print $6 }'|  sed 's/%/ /'`
apa='apache2 php5'


echo "checking network connection please wait "
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

app ()
{
   if [ -d "/home/$USER/test-app" ]
   then
      echo "fixing permissions..."
      chown -R $USER.$USER /home/$USER/test-app
      echo "cerating symlinks..."
      sudo ln -s /home/$USER/test-app /var/www/html
   else
      echo "Error: Directory does not exists please place the files and rerun the script"
      exit
   fi
}


appinst ()
{
  sudo apt-get update >/dev/null
  sudo dpkg -l $apa > /dev/null 2>&1
  INSTALLED=$?

    if [ $INSTALLED = 0 ];then
       echo " $apa already installed skipping installation"
       else
       echo "updating the system..."
       sudo apt-get install $apa -y >/dev/null
       sudo a2enmod ssl
       sudo a2ensite default-ssl
       sudo service apache2 restart
      fi
app;
}

appinst;

