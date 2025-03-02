#!/usr/bin/env bash

# Dependencies: pactl, notify-send

# Notification ID (keeps it persistent)
NOTIFY_ID=91190

# Get current volume
get_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | awk '/Volume:/{print $5}' | tr -d '%'
}

# Send notification
send_notification() {
    local volume mute status icon
    volume=$(get_volume)
    mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

    if [[ "$mute" == "yes" ]]; then
        status="Muted 🔇"
        icon="audio-volume-muted"
    else
        status="Volume: ${volume}% 🔊"
        icon="audio-volume-high"
    fi

    notify-send -r $NOTIFY_ID -h int:value:$volume -i "$icon" "$status"
}

# Adjust volume within bounds (0-100%)
change_volume() {
    local action="$1"
    local step=5
    local current_vol new_vol

    current_vol=$(get_volume)

    case "$action" in

