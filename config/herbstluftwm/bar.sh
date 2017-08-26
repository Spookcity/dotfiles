cat "$PANEL_FIFO" | /home/rick/.config/herbstluftwm/lemons.sh | lemonbar -g 1600x22 -f "Source Sans Pro-9:semibold" -f "FontAwesome-10" | while read line; do eval "$line"; done &
