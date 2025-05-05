#!/bin/bash

source "$HOME/.config/sketchybar/icons.sh"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
  9[0-9]|100) ICON="$BATTERY_100_ICON" ;;
  [6-8][0-9]) ICON="$BATTERY_75_ICON" ;;
  [3-5][0-9]) ICON="$BATTERY_50_ICON" ;;
  [1-2][0-9]) ICON="$BATTERY_25_ICON" ;;
  *) ICON="$BATTERY_0_ICON"
esac

FONT="$ICON_FONT:Regular:10.0"
if [[ $CHARGING != "" ]]; then
  ICON="$BATTERY_BOLT_ICON"
  FONT="$ICON_FONT:Regular:14.0"
fi

sketchybar --set $NAME icon="$ICON" icon.font="$FONT" label="${PERCENTAGE}%"
