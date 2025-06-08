#! /bin/sh
val=$(brightnessctl -le | grep -A50 intel | grep -m 1 -o "[0-9]\+%" | grep -o "[0-9]\+")
notify-send "🔆 $val" -a brightnessNotifications -h INT:value:$val
