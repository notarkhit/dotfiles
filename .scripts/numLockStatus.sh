#!/bin/bash

# Directory and file path
CACHE_DIR="$HOME/.cache/custom"
STATUS_FILE="$CACHE_DIR/numlock.status"

# Make sure the directory exists
mkdir -p "$CACHE_DIR"

status=$(hyprctl -j devices | jq -r '.keyboards[] | select(.main == true) | if .numLock then "ON" else "OFF" end')

echo -n $status > "$STATUS_FILE"



