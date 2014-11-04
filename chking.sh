#!/bin/bash
touch ipcatch
ipc=$(ifconfig -a | grep inet | awk '{print $2}'| cut -d ":" -f2|sed 's/\.//g')
echo $ipc > ipcatch

