#!/bin/bash

if pgrep -x "nmtui" > /dev/null; then
    pkill -x "nmtui"
else
	alacritty --config-file /dev/null --title nmtui -e nmtui 
fi

