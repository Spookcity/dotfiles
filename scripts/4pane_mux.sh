#!/bin/sh

tmux new-session -d 'ranger'
tmux split-window -h 'nvim'
tmux split-window -v 'youtube-viewer -C'
tmux split-window -v
tmux select-layout tiled
tmux -2 attach-session -d
