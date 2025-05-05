#!/bin/bash

SOUND=(
  icon.color=$WHITE
  icon.padding_right=8
  script="$PLUGIN_DIR/sound.sh"
)

sketchybar --add item sound right \
 --set sound "${SOUND[@]}" \
 --subscribe sound volume_change
