#!/bin/bash

if pgrep -x "nmtui-connect" > /dev/null; then
    pkill -x "nmtui-connect"
else
	nmcli device wifi rescan
	alacritty --config-file=/dev/null --title=nmtui -e nmtui-connect
fi

