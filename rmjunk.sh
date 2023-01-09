#!/bin/sh
#remove junk files and keep ~ tidy
/bin/rm "$HOME"/.gtkrc-2.0
/bin/rm "$HOME"/.xsession-error*
while true;
do
/bin/rm -rf "$HOME"/.pki;
/bin/rm "$HOME"/.dmrc;
/bin/rm "$HOME"/.sabnzbd;
/bin/sleep 4;
done
