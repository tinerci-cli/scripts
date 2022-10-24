#!/bin/sh
#this script uses the built in presentation mode of xfce to toggle it
#because caffeine doesnt work for me in xfce and having a battery symbol on a desktop pc is stupid
#you will have to create a launcher on the panel and point it to the script and adjust $iconpath after that

#where the icon for the panel is saved
iconpath="$HOME/.config/xfce4/panel/launcher-19/16665666232.desktop"

#which icon to show
onicon="caffeine-cup-full"
officon="caffeine-cup-empty"

#message for notification, involves argument and path for icon
onnotification="-i $HOME/.local/share/icons/Gruvbox-Dark/panel/24/$onicon.svg Präsentationsmodus aktiviert"
offnotification="-i $HOME/.local/share/icons/Gruvbox-Dark/panel/24/$officon.svg Präsentationsmodus deaktiviert"

#toggle presentation mode
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/presentation-mode -T

#get current mode and adjust the icon and send a notification
mode=`xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/presentation-mode`
if "$mode" == "true"
then
    sed -i "s/$officon/$onicon/g" $iconpath
    notify-send $onnotification
else
    sed -i "s/$onicon/$officon/g" $iconpath
    notify-send $offnotification
fi
