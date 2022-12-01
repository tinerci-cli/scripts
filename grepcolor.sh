#!/bin/sh
eval "$(xdotool getmouselocation --shell)"
IMAGE="$(import -window root -depth 8 -crop 1x1+"$X"+"$Y" txt:-)"
COLOR="$(echo "$IMAGE" | grep -om1 '#\w\+')"
printf '%s' "$COLOR" | xclip -i -selection CLIPBOARD
notify-send "Color under mouse cursor: " "$COLOR"
