#! /usr/bin/bash

status=$(hyprctl -j devices | jq -r '.keyboards[] | select(.main == true) | if .numLock then "ON" else "OFF" end')


icon="/usr/share/icons/Papirus/24x24/panel/numlock-${status,,}.svg"


dunstify -r 9788 -t 3000 "NUMLOCK $status" -i $icon

#"/usr/share/icons/Papirus/32x32/emotes/face-cool.svg"
