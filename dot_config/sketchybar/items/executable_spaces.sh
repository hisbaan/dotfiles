#!/usr/bin/env bash

SPACE_ICONS=("󰈹 1" " 2" "󰂖 3" "󰑴 4" "󰕧 5" " 6" "󰎁 7" "󰝚 8" "󰙯 9")

SPACE=(
  icon.padding_left=8
  icon.padding_right=8
  icon.color=$WHITE
  icon.highlight_color=$BG_PRI_COLOR
  icon.background.drawing=on
  background.corner_radius=4
  background.drawing=on
  label.drawing=off
  script="$PLUGIN_DIR/space.sh"
)

sid=0
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space space.$sid left \
             --set space.$sid associated_space=$sid \
             --set space.$sid icon="${SPACE_ICONS[i]}" \
             --set space.$sid click_script="yabai -m space --focus $sid" \
             --set space.$sid "${SPACE[@]}"
             # --set space.$sid click_script="skhd -k 'ctrl - $sid'" \ # SIP enabled workflow
             # --subscribe space space_windows_change space_change
done
