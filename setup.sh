#!/bin/bash

set -e

install_yay() {
	sudo pacman -S --needed git base-devel
	git clone https://aur.archlinux.org/yay-bin.git
	cd yay-bin
	makepkg -si
}

if ! cat /etc/os-release | grep archlinux > /dev/null ; then
	echo "this script was made to be run on archlinux only"
	exit 1
fi

if ! pacman -Qe | grep gum -q ; then
	read -p "Install gum? (Y/n)" gumstatus
    if [[ "$gumstatus" == "y" ]] || [[ "$gumstatus" == "Y" ]] || [[ "$gumstatus" == "" ]]; then
		sudo pacman -S gum
	else
		echo "gum not installed"
		exit 1
	fi
fi

if ! yay -V > /dev/null; then
	gum confirm "Install yay AUR helper?" && install_yay
fi

gum confirm "continue" && nvim ~/setup.sh

