#!/usr/bin/env bash

function notify_brightness() {
	local BRIGHTNESS_PERCENT="$1"
	if [[ -z "$BRIGHTNESS_PERCENT" ]]; then
		BRIGHTNESS_PERCENT=$(brightnessctl | awk -F '[()]' '/Current brightness/ {print $2}')
	fi
	dunstify -r 9993 -t 3000 -a "  Brightness" -h int:value:"$BRIGHTNESS_PERCENT" "brightness: ${BRIGHTNESS_PERCENT}" -i "/usr/share/icons/Papirus/16x16/apps/brightness-systray.svg"
}

# Check command line arguments
if [[ "$#" != 1 || ! ("$1" == "inc" || "$1" == "dec") ]]; then
    printf "Usage: %s [inc|dec]\n" "$0" >&2
    exit 1
fi

# Check if brightnessctl is available
if ! command -v brightnessctl &> /dev/null; then
  echo "Error: brightnessctl is not installed. Please install it." >&2
  exit 1
fi
BRIGHTNESS_PERCENT=$(brightnessctl | awk -F '[()]' '/Current brightness/ {print $2}' | tr -d '%')
# Perform brightness adjustment
if [[ "$1" == "inc" ]]; then
	notify_brightness
	brightnessctl set +1% > /dev/null
elif [[ "$1" == "dec" ]]; then
	if ((BRIGHTNESS_PERCENT > 1 )); then
		brightnessctl set 1%- > /dev/null
	elif ((BRIGHTNESS_PERCENT == 1)); then
		notify_brightness 0%
		exit 0
	fi
		notify_brightness
fi

