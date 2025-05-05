#!/bin/bash
  WIFI=(
  update_freq=10
  icon=$WIFI_CONN_ICON
  icon.color=$WHITE
  icon.padding_right=8
  script="$PLUGIN_DIR/wifi.sh"
)

sketchybar --add item wifi right   \
           --set wifi "${WIFI[@]}" \
           --subscribe wifi wifi_change
