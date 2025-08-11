#!/usr/bin/bash

dunstify -r 9992 -t 5000 "Battery Status" "$(cat /sys/class/power_supply/BAT1/capacity)% remaining" -i /usr/share/icons/Papirus/32x32/devices/battery.svg

