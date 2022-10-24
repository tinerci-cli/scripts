#!/bin/sh
#change functionality of capslock and esc
#make a single press on super open menu, cause xfce is a little autistic
setxkbmap -option "caps:swapescape"
xcape -e 'Super_L=Alt_L|F1'
