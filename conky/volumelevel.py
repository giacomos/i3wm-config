#!/usr/bin/python

import alsaaudio
m = alsaaudio.Mixer()   # defined alsaaudio.Mixer to change volume
vol = m.getvolume()
print vol
##!/bin/bash
#vol=`amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "Mute" } else { print $2"%" }}' | uniq | head -1`
#echo "$vol"
