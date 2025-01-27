#!/bin/bash

echo "which repository"

repository=$(gum choose "core/extra" "aur")

echo "What do you wanna do?"

updateStatus=$(gum choose "Update system" "Synchronize package database" "Install package" "Search package")

case "$updateStatus" in
	"Update system")
		sudo pacman -Syu
		;;
	"Synchronize package database")
		sudo pacman -Syy
		;;
	"Install package")
		echo "..."
		;;
	"Search package")
		echo "..."
		;;
	*)
		echo "..."
		;;
esac
