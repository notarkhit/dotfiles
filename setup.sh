#!/bin/bash

if ! cat /etc/os-release | grep archlinux > /dev/null ; then
	echo "this script was made to be run on archlinux only"
	exit 1
fi

if ! pacman -Qe | grep gum > /dev/null; then
	read -p "Install gum? (Y/n)" gumstatus
    if [[ "$gumstatus" == "y" ]] || [[ "$gumstatus" == "Y" ]] || [[ "$gumstatus" == "" ]]; then
		sudo pacman -S gum
	else
		echo "gum not installed"
		exit 1
	fi
fi

gum confirm "continue" && nvim ~/setup.sh
