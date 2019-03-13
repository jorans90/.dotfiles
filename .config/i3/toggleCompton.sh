#!/usr/bin/env bash

if pgrep -x "compton" > /dev/null
then
    pkill compton
else
    compton -b
fi
