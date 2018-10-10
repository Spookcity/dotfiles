#!/bin/bash

# extract device id
DEVICE=`xinput --list|sed -n 's/.*SynPS\/2 Synaptics TouchPad.*id=\([0-9]*\).*/\1/p'`

# check its state
xinput list-props $DEVICE|egrep ^.*Device\ Enabled.*1$ >/dev/null
RESULT=$?

# toggle
if [ $RESULT -eq 0 ]
then
    xinput disable $DEVICE & notify-send "Touchpad Off"
    exit 0
fi
xinput enable $DEVICE & notify-send "Touchpad On"
