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
	volumeicon=/usr/share/icons/Papirus/32x32/symbolic/status/audio-volume-high-symbolic.svg
elif [[ "$1" == "dec" ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ -1%
	volumeicon=/usr/share/icons/Papirus/32x32/symbolic/status/audio-volume-medium-symbolic.svg
	if [[ "$(get_current_volume)" -eq 0 ]]; then
		volumeicon=/usr/share/icons/Papirus/32x32/symbolic/status/audio-volume-low-symbolic.svg
	fi
elif [[ "$1" == "mute" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
	if [ "$(get_muted)" = "yes" ]; then
		volumeicon=/usr/share/icons/Papirus/32x32/symbolic/status/audio-volume-muted-symbolic.svg
	else 
		volumeicon=/usr/share/icons/Papirus/32x32/symbolic/status/audio-volume-medium-symbolic.svg
	fi
fi

VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//')
dunstify -r 9993 -t 3000 -a "Volume" -h int:value:"$VOLUME" "Volume: ${VOLUME}%" -i $volumeicon
