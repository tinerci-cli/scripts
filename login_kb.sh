#!/bin/sh
#change functionality of capslock and esc
# /bin/setxkbmap -option "caps:swapescape" # changed in layout config /usr/share/X11/xkb/symbols/{de,us}
#activate numlock on login
numlockx
#decrease key repeat dealay to 300ms, increase repeat rate to 50 per second
xset r rate 300 50
#dont need ibus
#make a single press on super open menu, cause xfce is a little autistic
# xcape -e 'Super_L=Alt_L|F1'
# synclient shit
synclient TapButton3=0 PalmDetect=1
# shell is safer than gui settings :sunglasses_emoji:
setxkbmap us altgr-intl
