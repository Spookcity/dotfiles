#!/usr/bin/env bash

generated_output() {
    DIR=$(dirname "$0")
    conky -c /home/rick/.config/lemonbar/conky/conky.lua
}

# ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----
# parameters

# settings
position="1600x24+0+876"
background="#aaffffff"
foreground="#ff000000"

# XFT
# require lemonbar_xft_git
font_symbol="PowerlineSymbols-9"
font_awesome="FontAwesome-9"
font_monospace="monospace-9"

generated_output | lemonbar \
    -g $position -u 2 -B $background -F $foreground \
    -f $font_monospace -f $font_awesome -f $font_symbol

