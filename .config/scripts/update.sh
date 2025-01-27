#!/bin/bash

echo "which repository"

repository=$(gum choose "pacman" "yay")

echo "What do you wanna do?"

updateStatus=$(gum choose "Update system" "Synchronize package database" "Install package" "Search package")

searchPackage() {
    read -p "Enter package name: " pkgName
	$repository -Ss $pkgName
}

case "$updateStatus" in
	"Update system")
		sudo $repository -Syu
		;;
	"Synchronize package database")
		sudo $repository -Syy
		;;
	"Install package")
		echo "..."
		;;
	"Search package")
		searchPackage	
		;;
	*)
		echo "..."
		;;
esac
