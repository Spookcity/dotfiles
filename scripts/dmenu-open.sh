#!/usr/bin/env bash

filemanager=sunflower

term=termite

path="$(find -H | dmenu -i -b -fn 'Hack:size=10' -nb '#1f1f1f' -nf '#A9D7F5' -sb '#535C5C' -sf '#8FCFB8' -l 25)"

[[ -d "$path" ]] && ($term -e $filemanager "$path" &) && exit

case "$(subl3 "$path")" in

text/*) ($term -e vim "$path" &);;

audio/*) cd ~/Music

mpc insert "${path#Music/}"

(( $(mpc playlist | wc -l) > 1 )) && mpc next

mpc play;;

*) xdg-open "$path";;

esac