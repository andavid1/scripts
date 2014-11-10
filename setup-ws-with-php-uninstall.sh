#!/bin/bash 
#uinstaller for apache and php in ubuntu only
#version 1.0
#Author David Anand <david.anands@gmail.com>

echo "Do you wish to proceed uninstalling apache and php<y or n> ? \c"
read WISH

if [ $WISH = "n" ] ; then
echo you chose no, good bye
exit
fi

if [ $WISH = "y" ]; then
echo starting installation
fi

uninstall()
{
sudo apt-get purge apache2 php5 -y
sudo rm -rf /var/www/html/
echo "$USER the application has been uninstalled"
}

uninstall;


