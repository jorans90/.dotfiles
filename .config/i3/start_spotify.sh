#! /usr/bin/env bash

ws10="Spotify"
if pgrep -x "spotify" > /dev/null
then
	echo "running"
	workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name'   | cut -d"\"" -f2);
	if [ "$workspace" == "$ws10" ]
	then 
		exec i3-msg workspace back_and_forth
	else
		exec i3-msg workspace $ws10 & 
	fi
else
	echo "starting Spotify";
	spotify &
	exec i3-msg workspace $ws10 &
fi
