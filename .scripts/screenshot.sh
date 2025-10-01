#!/bin/bash

# Checking and installing dependencies
dependencies=("flameshot" "grim")
for dep in "${dependencies[@]}"; do
    command -v "$dep" &> /dev/null || { echo "$dep not found, please install it."; exit 1; }
done

icon="/home/notarkhit/.icons/custom/misc/screen.svg"

if [[ $# -eq 0 ]];then
	flameshot screen

	if [[ $? -ne 0 ]];then
		exit 1;
	fi
	
	dunstify -a "flameshot" "Screenshot Captured" -i $icon 
fi



