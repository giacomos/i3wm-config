#! /bin/sh

current_brig=`pkexec /usr/lib/gnome-settings-daemon/gsd-backlight-helper --get-brightness`
max_brig=`pkexec /usr/lib/gnome-settings-daemon/gsd-backlight-helper --get-max-brightness`


case "$1" in
    "get")
        echo "$current_brig/$max_brig"
        ;;
    "set")
        pkexec /usr/lib/gnome-settings-daemon/gsd-backlight-helper --set-brightness $2
        ;;
    *)
        echo "Usage: $0 {set|get}"
        exit 2
esac

exit 0
