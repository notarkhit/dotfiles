#!/usr/bin/env bash

if ! systemctl --user is-active --quiet hyprsunset.service; then
    systemctl --user start hyprsunset.service
fi


GAMMA_FILE="/tmp/hyprsunset_gamma"
[[ -f "$GAMMA_FILE" ]] || echo "100" > "$GAMMA_FILE"
MIN_GAMMA=50
MAX_GAMMA=100

function notify_brightness() {
	local BRIGHTNESS_PERCENT="$1"
	if [[ -z "$BRIGHTNESS_PERCENT" ]]; then
		BRIGHTNESS_PERCENT=$(brightnessctl | awk -F '[()]' '/Current brightness/ {print $2}' | tr -d '%')
	fi
	
	local roundedbr=$(( 5 * ((BRIGHTNESS_PERCENT + 2) / 5) ))
	local icon="/home/notarkhit/.icons/custom/brightness/br-${roundedbr}.svg"

	dunstify -r 9993 -t 3000 -a "Brightness" -h int:value:"$BRIGHTNESS_PERCENT" "Brightness: ${BRIGHTNESS_PERCENT}%" -i $icon
}

function notify_gamma() {
    local GAMMA_VAL
    GAMMA_VAL=$(cat "$GAMMA_FILE")
    dunstify -r 9993 -t 3000 -a "Gamma" -h int:value:"$GAMMA_VAL" "Gamma: ${GAMMA_VAL}" -i "/home/notarkhit/.icons/custom/brightness/br-50.svg"
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
GAMMA=$(cat "$GAMMA_FILE")


if [[ "$1" == "dec" ]]; then
    if (( BRIGHTNESS_PERCENT > 0 )); then
        # Reduce brightness first
        brightnessctl set 1%- > /dev/null
        notify_brightness
    else
        # Brightness = 0 → reduce gamma
        if (( GAMMA > MIN_GAMMA )); then
            (( GAMMA -= 1 ))
            hyprctl hyprsunset gamma -1
            echo "$GAMMA" > "$GAMMA_FILE"
            notify_gamma "$GAMMA"
        else
            # Gamma already at min → just notify
            notify_gamma "$GAMMA"
        fi
    fi
else
    # Increasing
    if (( GAMMA < MAX_GAMMA )); then
        # Increase gamma first
        (( GAMMA += 1 ))
        hyprctl hyprsunset gamma +1
        echo "$GAMMA" > "$GAMMA_FILE"
        notify_gamma "$GAMMA"
    else
        # Gamma at max → increase brightness
        brightnessctl set +1% > /dev/null
        notify_brightness
    fi
fi
