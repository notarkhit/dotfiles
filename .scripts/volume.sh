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
ICONPATH="/home/notarkhit/.icons/custom/audio/"

# select icons
if [[ "$MUTED" == "yes" ]]; then
    volumeicon="${ICONPATH/}/volume-muted.svg"
	display_volume="${VOLUME}% (Muted)"
else
    display_volume="${VOLUME}%"
    if [[ $VOLUME -eq 0 ]]; then
        volumeicon="${ICONPATH/}/volume-low.svg"
    elif [[ $VOLUME -le 25 ]]; then
        volumeicon="${ICONPATH/}/volume-medium.svg"
    elif [[ $VOLUME -le 50 ]]; then
        volumeicon="${ICONPATH/}/volume-high.svg"
    elif [[ $VOLUME -le 75 ]]; then
        volumeicon="${ICONPATH/}/volume-high-warning.svg"
    elif [[ $VOLUME -le 100 ]]; then
        volumeicon="${ICONPATH/}/volume-high-danger.svg"
    else
        volumeicon="${ICONPATH/}/volume-overamplified.svg"
	fi
fi

# send notification
dunstify -r 9993 -t 3000 -a "Volume" -h int:value:"$VOLUME" "Volume: ${display_volume}" -i $volumeicon
