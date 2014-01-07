#!/usr/bin/env bash

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge "${HOME}/.Xresources"

# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

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
export TERMINAL='gnome-terminal'

gnome-settings-daemon &
gnome-volume-manager &

# Launch i3 window manager
xrandr --output DP1 --primary
exec i3

