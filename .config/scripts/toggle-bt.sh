#!/bin/bash

if pgrep -x "blueman-manager" > /dev/null; then
    pkill -x "blueman-manager"
else
	blueman-manager
fi

