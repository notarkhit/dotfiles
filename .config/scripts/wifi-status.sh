#!/bin/bash

status="$(nmcli general status | grep -oh "\w*connect\w*")"

if [[ "$status" == "disconnected" ]]; then
  printf "󰤮 "
elif [[ "$status" == "connecting" ]]; then
  printf "󱍸 "
elif [[ "$status" == "connected" ]]; then
  bash ~/.config/scripts/signal-strength.sh
fi
