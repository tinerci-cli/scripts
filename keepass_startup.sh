#!/bin/sh
keepassxc &
sleep 5
id=$(xdotool search --name "KeePassXC" | tail -n1)
xdotool set_desktop_for_window "$id" 4
xdotool windowminimize "$id"
