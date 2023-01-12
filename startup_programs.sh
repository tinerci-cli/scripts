#!/bin/sh
keepassxc &
liferea &
sleep 3; #let the windows hit the screen
lr_id="$(wmctrl -l | grep Liferea | awk '{print $1}')" #window ID of keepass
wmctrl -i -r $lr_id -b toggle,hidden
kp_id="$(wmctrl -l | grep KeePass | awk '{print $1}')" #window ID of keepass
wmctrl -i -r $kp_id -t 3 && wmctrl -i -r $kp_id -b toggle,hidden
