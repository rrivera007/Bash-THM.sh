#!/bin/bash
# @Author: soggyslapper
# @Date:   2021-05-23 20:45:51
# @Last Modified by:   soggyslapper
# @Last Modified time: 2021-05-24 16:58:32
#
#	TryHackMe VPN Launcher
#	======================
#	A small script that runs the open vpn to use in TryHackMe

#Internal Variables (don't change)
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
NC="$(tput sgr0)"

# compiles all functions together 
	function main()
	{
		Aesthetic

		Verify_root

		VPN 

		exit 0

	}

# Makes the program look a little nicer and lets user know its running
	function Aesthetic()
	{
		echo "$0:${YELLOW}"
		echo " ------------------------------------------------"
		echo "|                                                 |"
		echo "|                                                 |"
		echo "|                                                 |"
		echo "|${GREEN} 	TryHackMe VPN is Being Configured... ${NC}${YELLOW}	  |"
		echo "|                                        	  |"
		echo "|                                                 |"
		echo "|                                                 |"
		echo "|                                                 |"
		echo " ------------------------------------------------ ${NC}"
	}

# Handles any unknown errors and aborts the script in case
	function ErrorHandler()
	{
		echo "$0:${RED} An Error has occured aborting Script... ${NC}"
		exit -1
	}

# Makes sure script is run as root as it requires sudo privileges
	function Verify_root()
	{
		if [ "$UID" != "0" ]; then
			echo "$0:${RED} Error you must be root to run this script :( ${NC}"
			exit -1
		fi
	}

# Activates the tryhackme openvpn
	function VPN()
	{
		ErrorHandler=ErrorHandler
		sudo openvpn THM/soggyslapper.ovpn || ErrorHandler
	}

	main $0



