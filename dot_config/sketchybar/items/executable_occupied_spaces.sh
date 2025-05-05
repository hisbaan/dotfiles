#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"
readarray -t active_spaces < <(yabai -m query --windows | jq 'unique_by(.space).[].space')

# OCCUPIED_SPACES=(
#   script="$PLUGIN_DIR/occupied_spaces.sh"
# )

# if [ "$SELECTED" = "true" ]; then
#   COLOR=$MAUVE
# fi

# sid=0
# for i in "${!SPACE_ICONS[@]}"
# do
#   sid=$(($i+1))
#   if echo "${active_spaces[@]}" | grep -ow $sid > /dev/null
#   then
#     sketchybar --set "space.$sid" icon.highlight=$SELECTED icon.color=$BG_PRI_COLOR icon.highlight_color=$COLOR background.color=$COLOR
#   else
#     sketchybar --set "space.$sid" icon.highlight=$SELECTED background.color=$COLOR
#   fi
# done
