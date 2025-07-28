#! /bin/bash
#kill and restart waybar on config change
#result=$(ps -aux | grep $(basename "$0"))
#echo "$result"
#if [ -n "$result"]; 
#then 
#	logger -i "$0: Already started"
#	exit 
#fi

trap "killall waybar" EXIT
CONFIG_FILES="$HOME/.config/waybar/config $HOME/.config/waybar/style.css"

while true; do
	logger -i "$0: Starting waybar in background"
	waybar &
	logger -i "$0: Started waybar PID=$!, waiting for change"
	inotifywait -e modify ${CONFIG_FILES} 2>&1 | logger -i
	logger -i "$0: inotify returns $?, killing waybar"
	killall waybar 2>&1 | logger -i
	logger -i "$0: killall waybar returns $?"
	sleep 1
done




