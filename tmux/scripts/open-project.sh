#!/bin/bash

# Select directory using FZF
PROJECT_DIR=$(find ~/projects ~/work ~/dev -maxdepth 1 -type d 2>/dev/null | fzf --prompt="Select project: ")

# Exit if no directory is selected
[ -z "$PROJECT_DIR" ] && exit 1

# Extract directory name for session name
SESSION_NAME=$(basename "$PROJECT_DIR")

# Start new tmux session or attach if it exists
tmux has-session -t "$SESSION_NAME" 2>/dev/null
if [ $? -eq 0 ]; then
    tmux attach-session -t "$SESSION_NAME"
    exit 0
fi

# Create new session
tmux new-session -d -s "$SESSION_NAME" -c "$PROJECT_DIR" -n code
tmux send-keys -t "$SESSION_NAME:1" "nvim ." C-m

# Create second window for execution
tmux new-window -t "$SESSION_NAME" -n execute -c "$PROJECT_DIR"

# Create third window for lazygit
tmux new-window -t "$SESSION_NAME" -n gitzz -c "$PROJECT_DIR"
tmux send-keys -t "$SESSION_NAME:3" "lazygit" C-m

# Attach to the session
tmux attach-session -t "$SESSION_NAME"
