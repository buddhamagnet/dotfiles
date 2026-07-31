#!/bin/bash
# Tmux workspace setup script

SESSION="workspace"
WORK_DIR="/Users/buddhamagnet/Code/wpp/Unite"

# True if window $1's pane is sitting at a shell prompt, so it is safe to type
# a command into. Claude reports its version (e.g. "2.1.220") as the pane
# command rather than "claude", so test for a shell instead of for the command.
at_shell_prompt() {
    tmux list-panes -t "$SESSION:$1" -F "#{pane_current_command}" |
        grep -qE '^(-?zsh|-?bash|sh)$'
}

# Create session if it doesn't exist
if ! tmux has-session -t $SESSION 2>/dev/null; then
    tmux new-session -d -s $SESSION -n "CLAUDE-WORK" -c "$WORK_DIR"
fi

# Ensure window 0 (CLAUDE-WORK) exists - work Claude in the Unite repo
if ! tmux list-windows -t $SESSION | grep -q "^0:"; then
    tmux new-window -t $SESSION:0 -n "CLAUDE-WORK" -c "$WORK_DIR"
    tmux send-keys -t $SESSION:0 "claude-work" C-m
elif at_shell_prompt 0; then
    tmux send-keys -t $SESSION:0 "claude-work" C-m
fi

# Ensure window 1 (ZSH) exists
if ! tmux list-windows -t $SESSION | grep -q "^1:"; then
    tmux new-window -t $SESSION:1 -n "ZSH" -c "$HOME"
fi

# Ensure window 2 (NU) exists
if ! tmux list-windows -t $SESSION | grep -q "^2:"; then
    tmux new-window -t $SESSION:2 -n "NU" -c "$HOME"
    tmux send-keys -t $SESSION:2 "nu" C-m
fi

# Ensure window 3 (CLAUDE) exists - personal Claude in the home folder
if ! tmux list-windows -t $SESSION | grep -q "^3:"; then
    tmux new-window -t $SESSION:3 -n "CLAUDE" -c "$HOME"
    tmux send-keys -t $SESSION:3 "claude" C-m
elif at_shell_prompt 3; then
    tmux send-keys -t $SESSION:3 "claude" C-m
fi

# Select the ZSH window by default
tmux select-window -t $SESSION:1

# Attach to session
tmux attach-session -t $SESSION
