#!/usr/bin/env bash

# this let you toggle between different keyboard layouts
setxkbmap -option grp:alt_shift_toggle us,it

# Start pulse audio server
pulseaudio --start

# Start dropbox
dropbox start

sh ./.fehbg &

export OOO_FORCE_DESKTOP=gnome
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

gnome-settings-daemon &
gnome-volume-manager &

# Launch i3 window manager
exec i3

