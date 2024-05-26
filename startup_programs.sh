#!/bin/sh
keepassxc &
liferea &
sleep 5; #let the windows hit the screen
lr_id="$(wmctrl -l | grep Liferea | awk '{print $1}')" #window ID of keepass
wmctrl -i -r $lr_id -b toggle,hidden
kp_id="$(wmctrl -l | grep KeePass | awk '{print $1}')" #window ID of keepass
wmctrl -i -r $kp_id -t 4 && wmctrl -i -r $kp_id -b toggle,hidden
fc_id="$(wmctrl -l | grep FCast | awk '{print $1}')" #window ID of keepass
wmctrl -ic $fc_id
piper & killall piper
