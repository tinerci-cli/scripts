#!/bin/bash
eval "$(xdotool getmouselocation --shell)" #get position of mouse
IMAGE="$(import -window root -depth 8 -crop 1x1+"$X"+"$Y" txt:-)" #save current window, crop the pixels to where the mouse is
COLOR="$(echo "$IMAGE" | grep -om1 '#\w\+')" #grep the color
printf '%s' "$COLOR" | xclip -i -selection CLIPBOARD #copy to clipboard
notify-send "Color under mouse cursor: " "$COLOR" #send notification
