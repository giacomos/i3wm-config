#!/bin/bash
brightness=$(cat "/sys/class/backlight/intel_backlight/brightness")
a=$((brightness-10))

if [ "$brightness" -gt 20 ]
then
echo $a >> /sys/class/backlight/intel_backlight/brightness
fi
