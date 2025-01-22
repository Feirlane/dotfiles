alias tmuxlog="tmux split-pane\; resize-pane -D 1000 \; resize-pane -U 5 \; select-pane -t 0 \; split-pane -h 'sudo htop' \; select-pane -t 0; \\sudo journalctl -f"
