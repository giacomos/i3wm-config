#!/bin/bash
pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 2 )) | tail -n 1| sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'
