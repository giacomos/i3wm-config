#!/bin/bash
brightness=$(cat "/sys/class/backlight/intel_backlight/brightness")
a=$((brightness+1))

if [ "$brightness" -lt 850 ]
then
echo $a >> /sys/class/backlight/intel_backlight/brightness
fi
