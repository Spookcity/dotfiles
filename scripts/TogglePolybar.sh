#!/bin/bash

# I know this is inefficient af but I can't find a better way
if pgrep "polybar" > /dev/null
then
    # If running, hide (kill) it
    pkill polybar  &
    bspc config top_padding 2
else
    # If it's not running, show (start) it
    polybar top &
fi
