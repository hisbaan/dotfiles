#!/bin/bash
CPU=(
  update_freq=2
  icon.font="$FONT:Regular:16.0"
  icon=
  icon.color=$WHITE
  icon.padding_right=8
  script="$PLUGIN_DIR/cpu.sh"
)

sketchybar --add item cpu right \
           --set cpu "${CPU[@]}"
