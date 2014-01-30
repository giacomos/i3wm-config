#!/bin/bash
vol=`amixer get Master | awk -F'[]%[]' '/%/ {if ($5 == "off") { print "Mute" } else { print $2"%" }}' | uniq | head -1`
echo "$vol"
