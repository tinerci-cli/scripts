#!/bin/sh
# change functionality of capslock and esc
# make a single press on super open menu, cause xfce is a little autistic
# activate numlock on login
/bin/setxkbmap -option "caps:swapescape"
/bin/xcape -e 'Super_L=Alt_L|F1'
/bin/numlockx
