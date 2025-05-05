#!/bin/bash

BATTERY=(
  update_freq=120
  icon.padding_right=8
  icon.color=$WHITE
  script="$PLUGIN_DIR/battery.sh"
)

sketchybar --add item battery right \
           --set battery "${BATTERY[@]}" \
           --subscribe battery system_woke power_source_change
