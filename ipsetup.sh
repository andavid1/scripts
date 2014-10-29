#!/bin/bash
#IP SETTER from DHCP
#set -x

#ips=$(ifconfig -a | grep -a1 Ethernet | egrep inet | cut -d ':' -f2 | awk '{print $1}')

ipscatch =$(for ip in `ifconfig | grep -a1 Ethernet | egrep inet| cut -d ':' -f2 |awk '{print $1}'` ;do echo $ip; done)
nic=$(ifconfig -a |  awk '{print $1}' | grep eth)

ips=$(echo $ipscatch | sed -e  's/\s\+/\n/g')
echo $ips



function ethconf {
echo 
"DEVICE=$nic
TYPE=Ethernet
ONBOOT=yes
NM_CONTROLLED=no
BOOTPROTO=static
IPV6INIT=no
IPPADDR=$ips
NETMASK=$mask
GATEWAY=$gw"
}

#ethconf

#ips=$(ifconfig | awk -v RS="\n\n" '{ for (i=1; i<=NF; i++) if ($i == "inet" && $(i+1) ~ /^addr:/) address = substr($(i+1), 6); if (address != "127.0.0.1") printf "%s\t%s\n", $1, address }')
#$ips > 
