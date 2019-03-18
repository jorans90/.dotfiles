#!/usr/bin/env bash

CLIP=$(xclip -o -selection clipboard)
PRIM=$(xclip -o -selection primary)

notify-send "Clipboard: $CLIP 
Primary: $PRIM"
