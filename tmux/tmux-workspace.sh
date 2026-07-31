#!/bin/bash
# Tmux workspace setup script

SESSION="workspace"

# Check if session already exists
tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
    # Create new session with first window (claude-work)
    tmux new-session -d -s $SESSION -n "claude-work" -c "/Users/buddhamagnet/Code/wpp/Unite"
    tmux send-keys -t $SESSION:0 "claude-work" C-m

    # Create second window (home)
    tmux new-window -t $SESSION:1 -n "home" -c "/Users/buddhamagnet"

    # Create third window (nushell)
    tmux new-window -t $SESSION:2 -n "nushell" -c "/Users/buddhamagnet"
    tmux send-keys -t $SESSION:2 "nu" C-m

    # Select the home window by default
    tmux select-window -t $SESSION:1
fi

# Attach to session
tmux attach-session -t $SESSION
