#!/usr/bin/bash

if [[ $# -eq 0 ]];then
	dunstify -r 9977 -t 5000 "Battery Status" "$(cat /sys/class/power_supply/BAT1/capacity)% remaining" -i /usr/share/icons/Papirus/32x32/devices/battery.svg
	exit 1
fi

capacity=$(cat /sys/class/power_supply/BAT1/capacity)
iconpath=/home/notarkhit/.icons/custom/battery/64x64/bat-

case "$1" in
	ac|Ac|aC|AC)
		pw="AC"
		icon="${iconpath}charging.svg"
		;;
	dc|Dc|dC|DC)
		pw="DC"
		icon="${iconpath}${capacity}.svg"
		;;
	*)
		command ...
		;;
esac

echo $icon
echo $iconpath
# dunstify -r 9977 -t 5000 "USING ${pw} POWER" "capacity: ${capacity}%  remaining" -i /home/notarkhit/.icons/custom/battery/64x64/bat-${capacity}-64x64.svg

dunstify -r 9977 -t 5000 "USING ${pw} POWER" "capacity: ${capacity}%  remaining" -i $icon
