!/bin/bash

status="$(nmcli general status | grep -oh "\w*connect\w*")"

if [[ "$status" == "disconnected" ]]; then
  printf "󰤮 "
elif [[ "$status" == "connecting" ]]; then
  printf "󱍸 "
elif [[ "$status" == "connected" ]]; then
  strength="$(~/.config/scripts/signal-strength.sh)"
  if [[ "$?" == "0" ]]; then
    if [[ "$strength" -eq "0" ]]; then
      printf "󰤯 "
    elif [[ ("$strength" -ge "0") && ("$strength" -le "25") ]]; then
      printf "󰤟 "  
    elif [[ ("$strength" -ge "25") && ("$strength" -le "50") ]]; then
      printf "󰤢 "
    elif [[ ("$strength" -ge "50") && ("$strength" -le "75") ]]; then
      printf "󰤥 "
    elif [[ ("$strength" -ge "75") && ("$strength" -le "100") ]]; then
      printf "󰤨 "
    fi
  else
    printf "󰈀 "
  fi
fi
