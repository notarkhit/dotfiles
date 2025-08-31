#!/bin/bash

# Function to get the current volume
get_current_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//'
}

get_muted() {
	pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}'
}

# Check command line arguments
if [[ "$#" != 1 || ! ("$1" == "inc" || "$1" == "dec" || "$1" == "mute" ) ]]; then
    printf "Usage: $0 [inc|dec|mute]\n"
    exit 1
fi

# Check if pactl is installed
if ! command -v pactl &> /dev/null; then
    echo "Error: pactl is not installed. Please install it and try again."
    exit 1
fi

# Perform volume adjustment
if [[ "$1" == "inc" ]]; then
    [ "$(get_current_volume)" -lt 150 ] && pactl set-sink-volume @DEFAULT_SINK@ +1%
elif [[ "$1" == "dec" ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ -1%
elif [[ "$1" == "mute" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
fi

VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//')
MUTED=$(get_muted)
ICONPATH="/home/notarkhit/.icons/custom/volume/"

# select icons
if [[ "$MUTED" == "yes" ]]; then
    volumeicon="${ICONPATH/}/muted.svg"
	display_volume="${VOLUME}% (Muted)"
else
	if [[ "$VOLUME" -gt 100 ]];then
		display_volume="${VOLUME}% (Overdrive)"
	else
		display_volume="${VOLUME}%"
	fi

	if [[ "$VOLUME" -ge 1 && "$VOLUME" -le 4 ]]; then
		roundedvol=5
	elif [[ "$VOLUME" -ge 101 && "$VOLUME" -le 104 ]]; then
		roundedvol=105
	elif [[ "$VOLUME" -eq 0 ]]; then
		roundedvol=0
	else
		roundedvol=$(( 5 * ((VOLUME + 2) / 5) ))
	fi
	volumeicon="${ICONPATH/}/vol-${roundedvol}.svg"
fi

# send notification
dunstify -r 9993 -t 3000 -a "Volume" -h int:value:"$VOLUME" "Volume: ${display_volume}" -i $volumeicon
