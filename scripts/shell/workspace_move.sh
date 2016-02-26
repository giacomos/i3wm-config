#!/bin/bash

XRANDR=$(which xrandr)
MONITORS=( $( ${XRANDR} | awk '( $2 == "connected" ){ print $1 }' ) )
NUM_MONITORS=${#MONITORS[@]}

function gen_monitors()
{
    for a in $(seq 0 $(( ${#MONITORS[@]} -1 )))
    do
        echo ${MONITORS[a]}
    done
}
MONITOR=$( gen_monitors | rofi -dmenu -p "Move current workspace to monitor:")

if [ x"empty" = x"${MONITOR}" ]
then
    i3_empty_workspace.sh
elif [ -n "${MONITORS}" ]
then
    i3-msg move workspace to output "${MONITOR}" > /dev/null
fi
