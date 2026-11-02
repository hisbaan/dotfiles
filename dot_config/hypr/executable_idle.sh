#!/usr/bin/env bash

SECONDS=$1
EVENT=$2

on_battery() {
  for bat in /sys/class/power_supply/BAT*; do
    [ -f "$bat/status" ] || continue
    [ "$(cat "$bat/status")" = "Discharging" ] && return 0
  done
  return 1
}

case $SECONDS in
  300)
    if on_battery; then
      case $EVENT in
        timeout) hyprctl dispatch 'hl.dsp.dpms({ action = "off" })' ;;
        resume) hyprctl dispatch 'hl.dsp.dpms({ action = "on" })' ;;
      esac
    fi ;;
  600)
    if on_battery; then
      case $EVENT in
        timeout) systemctl suspend ;;
        resume) hyprctl dispatch 'hl.dsp.dpms({ action = "on" })' ;;
      esac
    else
      case $EVENT in
        timeout) hyprctl dispatch 'hl.dsp.dpms({ action = "off" })' ;;
        resume) hyprctl dispatch 'hl.dsp.dpms({ action = "on" })' ;;
      esac
    fi ;;
esac
