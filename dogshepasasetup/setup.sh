#!/bin/bash
# Quick-start setup script for ASA 5505 version 8.3 and above
# This is not a be all end all. Do your homework.


echo "********Dogshep's ASA Setup Script********"
echo "Please remeber that you should write erase your ASA before pasting these scripts into a new ASA"

#Hostname
echo "Please enter your hostname, followed by [ENTER]:"
read hostname

#External Interface
echo "What is your external interface? (e.g. Ethernet 0/1)"
read externalinterface

#External IP Address
echo "Please enter your external IP address, followed by [ENTER]:"
read externalipaddress

#Internal Interface
echo "What is your external interface? (e.g. Ethernet 0/2)"
read internalinterface

#Internal IP Address
echo "Please enter your inside IP address, followed by [ENTER]:"
read insideipaddress

#Internal DHCP
echo "Do you want DHCP inside? (yes or no)"
read dhcpboolean
if dhcpboolean == 'yes'; then
	echo "What network range would you like to use (e.g. 192.168.1.50-192.168.1.200)?"
	read dhcpnetwork
	echo "What subnet would you like to use?"
	read dhcpsubnet
if dhcpboolean == 'no'; then
	echo "You've decided not to use DHCP inside"
else
	echo "You entered something else... not using DHCP inside"
fi

#SSH Access
echo "Do you want SSH access?"
read sshboolean
if sshboolean == 'yes'; then
	echo "Do you want SSH access internally?"
	read sshinternalboolean
	if sshinternalboolean == 'yes'; then
		echo "Which network would you like to be able to SSH from inside? (for all type 0.0.0.0)"
		read sshinsidenetwork
	fi
	echo "Do you want SSH access externally?"
	read sshexternalboolean
	if sshexternalboolean == 'yes'; then
		echo "Which network would you like to be able to SSH from outside? (for all type 0.0.0.0)"
		read sshexternalnetwork
	fi

#Tunnel
echo "Do you need to set up a tunnel?"
read tunnelboolean
if tunnelboolean == 'yes'; then
	echo "I'm sorry but tunnels are not supported at this time"
fi

#VPN
echo "Do you need to set up a VPN?"
read vpnboolean
if vpnboolean == 'yes'; then
	echo "Would you like an IPSEC vpn or SSL vpn?"
	read ipsecsslquery
	if ipsecsslquery == 'IPSEC'
		echo "I'm sorry but IPSEC tunnels are not supported at this time"
	if ipsecsslquery == 'SSL'
		echo "I'm sorry but SSL tunnels are not supported at this time"
	else
		echo "That's not supported at this time... or probably ever."
fi

echo $hostname
