#!/bin/bash
tmux has-session -t unity
exist=$?
echo $exist

if [[ $exist -eq 0 ]];
then
	echo "session exists"
	tmux new-window -t unity nvim "$@"
else
	echo "session doesn't exist"
	kitty tmux new -s unity nvim "$@"
fi
