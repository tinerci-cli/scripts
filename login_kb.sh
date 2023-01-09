#!/bin/sh
#change functionality of capslock and esc
/bin/setxkbmap -option "caps:swapescape"
#make a single press on super open menu, cause xfce is a little autistic
/bin/xcape -e 'Super_L=Alt_L|F1'
#activate numlock on login
/bin/numlockx
#decrease key repeat dealay to 300ms, increase repeat rate to 50 per second
/bin/xset r rate 300 50
#dont need ibus
ibus exit
