#!/bin/bash

echo "which repository"

repository=$(gum choose "pacman" "yay")

echo "What do you wanna do?"

updateStatus=$(gum choose "Update system" "Synchronize package database" "Install package" "Search package")

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
		echo "..."
		;;
	*)
		echo "..."
		;;
esac
