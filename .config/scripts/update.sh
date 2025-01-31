#!/bin/bash

echo "which repository"

repository=$(gum choose "pacman" "yay")

echo "What do you wanna do?"

updateStatus=$(gum choose "Search package" "Install package" "Update system" "Synchronize package database")

searchPackage() {
    read -p "Enter package name: " pkgName
	$repository -Ss $pkgName
}

installPackage() {
    read -p "Enter package name: " pkgName
	if [ $repository == "pacman" ]; then
		sudo $repository -S $pkgName
	else
		$repository -S $pkgName
	fi
}

syncRepo() {
	if [ $repository == "pacman" ]; then
		sudo $repository -Syy
	else
		$repository -Syy
	fi
}

updateSystem() {
	if [ $repository == "pacman" ]; then
		sudo $repository -Syu
	else
		$repository -Sua
	fi
}

case "$updateStatus" in
	"Update system")
		updateSystem
		;;
	"Synchronize package database")
		syncRepo 	
		;;
	"Install package")
		installPackage
		;;
	"Search package")
		searchPackage	
		;;
	*)
		echo "invalid option"	
		;;
esac
