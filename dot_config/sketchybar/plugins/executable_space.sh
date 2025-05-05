#!/usr/bin/env bash

# VARS
# $SELECTED: boolean, true if the space is selected
# $SID: space id
# $DID: display id

source "$HOME/.config/sketchybar/colors.sh"

if [ "$SELECTED" = "true" ]; then
  BG_COLOR=$MAUVE
else
  BG_COLOR=$BG_PRI_COLOR
fi

readarray -t active_spaces < <(yabai -m query --windows | jq 'unique_by(.space).[].space')

if echo "${active_spaces[@]}" | grep -ow $SID > /dev/null; then
  ICON_COLOR=$MAUVE
else
  ICON_COLOR=$WHITE
fi

sketchybar --set $NAME icon.highlight=$SELECTED icon.color=$ICON_COLOR icon.highlight_color=$BG_PRI_COLOR background.color=$BG_COLOR
