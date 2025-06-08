#!/bin/bash
# NAME

# Prints current volume percentage, e.g. `60`, `95`, `20`, etc.
function get_current_volume() {
  pactl get-sink-volume @DEFAULT_SINK@ | awk -F '/' '{print $2}' | grep -o '[0-9]\+'
}

val=$(get_current_volume)
icon=""
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | grep yes)

if [ -n "$mute" ]
then
	icon=""
else
	#begin the terrible case statements!
	if [ $val -gt 65 ]
	then
		icon=""
	elif [ $val -lt 32 ]
	then
		icon=""
	fi
fi

notify-send "$icon $val " -h INT:value:$val -a audioNotifications
stuff='["", "", ""]'
