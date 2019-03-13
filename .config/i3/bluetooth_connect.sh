#!/usr/bin/bash

echo -e 'power on' | bluetoothctl

connected=$(echo -e 'info C8:84:47:12:4E:B4' | bluetoothctl | grep Connected | cut -d " " -f2)

if [ $connected == 'no' ]
then
	bluetoothctl << EOF
	power on
	connect C8:84:47:12:4E:B4
EOF
else
	bluetoothctl << EOF
	power off
EOF
mpv /usr/share/sounds/gnome/default/alerts/drip.ogg
fi
