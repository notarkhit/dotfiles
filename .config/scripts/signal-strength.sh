#!/usr/bin/env bash

if ! command -v nmcli &>/dev/null; then
  printf "󰤮 "
  exit 1
fi

# Check if Wi-Fi is enabled
wifi_status=$(nmcli radio wifi)

if [[ "$wifi_status" == "disabled" ]]; then
  printf "󰤮 "
  exit 0
fi

wifi_info=$(nmcli -t -f active,ssid,signal dev wifi | grep "^yes")

if [[ -z "$wifi_info" ]]; then
  printf "󰤮 " # No connection
  exit 0
fi

# Extract Wi-Fi signal strength
signal=$(echo "$wifi_info" | awk -F: '{print $3}')

# Determine icon based on signal strength
if [[ "$signal" -ge 80 ]]; then
  printf "󰤨  "
elif [[ "$signal" -ge 60 ]]; then
  printf "󰤥  "
elif [[ "$signal" -ge 40 ]]; then
  printf "󰤢  "
elif [[ "$signal" -ge 20 ]]; then
  printf "󰤟  "
else
  printf "󰤮  "
fi

