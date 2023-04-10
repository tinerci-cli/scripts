#!/bin/sh
#this script uses the built in presentation mode of xfce to toggle it
#because caffeine doesnt work for me in xfce and having a battery symbol on a desktop pc is stupid
#you will have to create a launcher on the panel and point it to the script and adjust $iconpath after that

#where the icon for the panel is saved
iconpath="$HOME/.config/xfce4/panel/launcher-1/16679117011.desktop"

#which icon to show
onicon="caffeine-cup-full"
officon="caffeine-cup-empty"

#toggle presentation mode
/bin/xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/presentation-mode -T

#get current mode and adjust the icon and send a notification
mode=$(xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/presentation-mode)
if "$mode" == "true"
then
    /bin/sed -i "s/$officon/$onicon/g" "$iconpath"
    /bin/notify-send -i /usr/share/icons/Tela-orange-dark/symbolic/status/caffeine-cup-full-symbolic.svg Präsentationsmodus aktiviert
else
    /bin/sed -i "s/$onicon/$officon/g" "$iconpath"
    /bin/notify-send -i /usr/share/icons/Tela-orange-dark/symbolic/status/caffeine-cup-empty-symbolic.svg Präsentationsmodus deaktiviert
fi
