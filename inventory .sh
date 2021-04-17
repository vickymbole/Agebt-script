#!/bin/bash

#Description:SCRIPT TO INVENTORY A SERVER
#Author: Vicky
#Date: April 2021

## Checking the OS version

os=$(cat /etc/*release | head -1)
echo " The OS is ${os} "

sleep 1

# Check the size of the memory

mem=$(free -m |grep Mem | awk '{print$2}')
echo " The total memory size is ${mem}"

sleep 1

## cchecking size of the hard drive
hd=$(lsblk | grep disk| awk '{print$4}')
echo " The hard drive size is ${hd}"

## The cpu speed
sp=$(lscpu | grep "CPU MHz" | awk '{print$3}')
echo " The cpu speed is ${sp} MHz"

sleep 1

## checking kernel version
kn=$(uname -r | awk -F- '{print$1}')
echo " The kernel version is ${kn}"

sleep 1

## Check system bits

echo " The system has $(arch | awk -F_ '{print$2}') bits"

sleep 1


## Checking the Hostname
echo " The hostname is $HOSTNAME "

## Checking IP Adress
ip=$(ip address show dev enp0s3 | grep inet | head -1 | awk '{print$2}')
echo " The ip address is ${ip} "

sleep 1

## Checking all opened ports
echo " Here are all the opened port 
$(ss -tulpn | grep LISTEN)"

sleep 1

## checking DNS
echo " The DNS address is 
$(cat /etc/resolv.conf | grep nameserver)"

sleep 1

## Checking the manufacturer
echo " The manufacturer is $(dmidecode -t system | grep Manufacturer | awk '{print$2}')"

## checking if server is Virtual or physical
echo " This is a $(dmidecode -t system | grep Family | awk '{print$2,$3}')"

sleep 1

## The mac address
echo " The system mac address is $(ip address show dev enp0s3 |grep ether | awk '{print$2}')"

sleep 1
exit 0
