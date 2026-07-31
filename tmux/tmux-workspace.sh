#!/bin/bash
# Tmux workspace setup script

SESSION="workspace"

# Create session if it doesn't exist
if ! tmux has-session -t $SESSION 2>/dev/null; then
    tmux new-session -d -s $SESSION -n "CLAUDE" -c "/Users/buddhamagnet/Code/wpp/Unite"
fi

# Ensure window 0 (CLAUDE) exists
if ! tmux list-windows -t $SESSION | grep -q "^0:"; then
    tmux new-window -t $SESSION:0 -n "CLAUDE" -c "/Users/buddhamagnet/Code/wpp/Unite"
    tmux send-keys -t $SESSION:0 "claude-work" C-m
elif ! tmux list-panes -t $SESSION:0 -F "#{pane_current_command}" | grep -q "claude"; then
    tmux send-keys -t $SESSION:0 "claude-work" C-m
fi

# Ensure window 1 (ZSH) exists
if ! tmux list-windows -t $SESSION | grep -q "^1:"; then
    tmux new-window -t $SESSION:1 -n "ZSH" -c "/Users/buddhamagnet"
fi

# Ensure window 2 (NU) exists
if ! tmux list-windows -t $SESSION | grep -q "^2:"; then
    tmux new-window -t $SESSION:2 -n "NU" -c "/Users/buddhamagnet"
    tmux send-keys -t $SESSION:2 "nu" C-m
fi

# Select the ZSH window by default
tmux select-window -t $SESSION:1

# Attach to session
tmux attach-session -t $SESSION
