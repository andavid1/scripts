#!/bin/bash
#Global installer by name for rhel centos and ubuntu
#set -x
unset $installer
fla=$(lsb_release -a | grep Distributor | awk '{print $3}');

 if [ $fla = Ubuntu ]; then
	installer="apt-get install"
else
	installer="yum install -y" 
fi

function quit
{
	exit
}

function install
{
	$installer $package
}
read -p "Enter the package to install: " package
install $package

