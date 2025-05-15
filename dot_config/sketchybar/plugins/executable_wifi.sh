#!/usr/bin/env sh

LABEL="$(ipconfig getsummary "$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $NF}')" | grep '  SSID : ' | awk -F ': ' '{print $2}')"

if [[ "$LABEL" == *"You are not associated with an AirPort network."* ]]; then
   sketchybar --set wifi label="Disconnected"
else   LABEL=$(echo "$LABEL" | sed "s/Current Wi-Fi Network: //")
   sketchybar --set wifi label="$LABEL"
fi

