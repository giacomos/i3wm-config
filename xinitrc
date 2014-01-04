#!/usr/bin/env bash

exec setxkbmap -option grp:alt_shift_toggle us,it

# Start pulse audio server
exec pulseaudio --start

exec gnome-settings-daemon &

# Sets the background image
exec feh --bg-scale '/home/jack/Pictures/wallpaper.png'

# Launch i3 window manager
exec i3
