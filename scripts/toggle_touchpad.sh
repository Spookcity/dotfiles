#!/bin/bash

# together with i3wm i bound this script to the blue thinkvantage button
# using:
# bindsym XF86Launch1 exec /usr/local/bin/toggle_touchpad.sh

# extract device id
DEVICE=`xinput --list|sed -n 's/.*SynPS\/2 Synaptics TouchPad.*id=\([0-9]*\).*/\1/p'`

# check its state
xinput list-props $DEVICE|egrep ^.*Device\ Enabled.*1$ >/dev/null
RESULT=$?

# toggle
if [ $RESULT -eq 0 ]
then
    xinput disable $DEVICE
    exit 0
fi
xinput enable $DEVICE
