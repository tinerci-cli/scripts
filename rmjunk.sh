#!/bin/sh
#remove junk files and keep ~ tidy
/bin/rm "$HOME"/.gtkrc-2.0
/bin/rm "$HOME"/.xsession-error*
/bin/rm "$HOME"/.dmrc;
while true;
do
/bin/rm -rf "$HOME"/.pki;
# /bin/rm -rf "$HOME"/.java;
/bin/rm -rf "$HOME"/.sudo_as_admin_successful;
/bin/sleep 4;
done
