#!/bin/bash

TIME=(
  update_freq=10
  icon.drawing=off
  padding_left=8
  script="$PLUGIN_DIR/time.sh"
)

sketchybar --add item time right \
           --set time "${TIME[@]}"
