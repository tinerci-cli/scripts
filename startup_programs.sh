#!/bin/sh
xdotool key ctrl+F4
keepassxc &
sleep 1 && id=$(xdotool search --name "KeePassXC" | tail -n1)
xdotool windowminimize "$id" && xdotool key ctrl+F1

liferea &
sleep 1 && xdotool key alt+F4
