#!/usr/bin/bash
# Define the clock
Clock() {
		echo "$(~/.config/i3/blocks/time)"
}

Brightness() {
		echo "$(~/.config/i3/blocks/brightness)"
}

Volume() {
		echo "$(~/.config/i3/blocks/volume)"
}

Workspaces() {
		WORKSPACES="$(i3-msg -t get_workspaces)"
		echo $(~/.config/i3/workspaces.py $WORKSPACES)
}
Network() {
		echo "$(~/.config/i3/blocks/network)"
}
Lock() {
		echo "$(~/.config/i3/blocks/lock)"
}
Info() {
	echo " %{l}%{F#FFFFFF}%{B#2E343C} $(Network) $(Brightness)%{c}$(Workspaces)%{F-}%{B-}%{r}%{f#ffffff}%{B#2E343C}$(Battery) $(Volume) $(Clock)%{F-}%{B-}"
}
trap 'kill $pid' 36
trap 'exit' SIGINT
while true; do
	echo $(Info)' '
    sleep 1 & pid=$!
	wait
done
