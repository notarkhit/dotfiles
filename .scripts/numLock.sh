#! /usr/bin/bash

STATUS_FILE="$HOME/.cache/custom/numlock.status"

if [[ ! -f "$STATUS_FILE" ]];then
	exit 1
fi

status=$(<"$STATUS_FILE")

if [[ "$status" == "ON" ]];then
	status="OFF"
else
	status="ON"
fi

echo "$status" > "$STATUS_FILE"

icon="/home/notarkhit/.icons/custom/numlock/numlock-64-${status,,}.svg"
dunstify -r 9788 -t 3000 "NUMLOCK $status" "Numlock is turned $status" -i $icon

