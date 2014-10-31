#!/bin/bash

function kvmcore
{
	yum update -y
	yum install kvm -y
}

function network 
{

touch nicdetails
ip=for ip in `ifconfig | grep  -w inet | cut -d ':' -f2 |awk '{print $1}'` 
do
echo  $ip > nicdetails
done
}

function kvmvm
{
virt-install --network bridge:br0 --name $vmmachine --ram=$ramsiz --vcpus=$cpu --disk path=$diskpath,size=$disksize  --cdrom=$isos
}

function buildvmdetails
{
	echo " please enter the vm details to create the vm"
	echo " enter the vm name"
	read -n $vmmachine
    echo " enter the ram size"
    read -n $ramsize
    echo " enter the no of cpu to be alloted"
    read -n $cpu
    echo 
 
}