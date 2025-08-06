#!/bin/bash

# Checking and installing dependencies
dependencies=("slurp" "grim" "convert" "swappy")
for dep in "${dependencies[@]}"; do
    command -v "$dep" &> /dev/null || { echo "$dep not found, please install it."; exit 1; }
done

# Capture screenshot
screenshot="$(slurp -b 00000044 -c 333333ff )"

#Temp file to save the screenshot
tempimg=$(mktemp --suffix=.png)

# Process the screenshot and copy to clipboard
grim -g "$screenshot" - | magick - -shave 2x2 PNG:"$tempimg"
wl-copy < "$tempimg"

# Notify screenshot has copied to clipboard
dunstify -t 3000 -u low -a "Screenshot" -i "$tempimg" "Screenshot copied to clipboard"

# Paste to clipboard and use swappy for further processing
wl-paste | swappy -f -
