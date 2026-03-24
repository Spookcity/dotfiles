#!/bin/bash

rofi_command="rofi -theme themes/powermenu.rasi"

### Options ###
power_off="" POWER OFF
reboot=""
# Variable passed to rofi
options="$power_off\n$reboot"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $power_off)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
esac

