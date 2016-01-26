#!/bin/bash
brightness=$(cat "/sys/class/leds/asus::kbd_backlight/brightness")
a=$((brightness-1))

if [ "$brightness" -gt 0 ]
then
echo $a >> /sys/class/leds/asus\:\:kbd_backlight/brightness
fi
