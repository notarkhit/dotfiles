#!/bin/bash

if pgrep -x "nmtui" > /dev/null; then
    pkill -x "nmtui"
else
	nmcli device wifi rescan
	alacritty --config-file /dev/null --title nmtui -e nmtui 
fi

