function cyber-tmux
	tmux new \; split -v \; resize-pane -t 0 -y 3 \; split -t 0 -h \; resize-pane -t 1 -x 30 \; send -t 0 "porsmo.exe" Enter \; send -t 1 "ttp" Enter \; select-pane -t 2
end
