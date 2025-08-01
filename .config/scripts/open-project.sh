#!/bin/bash

# Select directory using FZF
PROJECT_DIR=$(find ~/projects ~/ia ~/dev -maxdepth 1 -type d 2>/dev/null | fzf --prompt="Select project: ")

# Exit if no directory is selected
[ -z "$PROJECT_DIR" ] && exit 1

# Extract directory name for session name
SESSION_NAME=$(basename "$PROJECT_DIR")

# Check if the session exists
tmux has-session -t "$SESSION_NAME" 2>/dev/null
SESSION_EXISTS=$?

# Create new session if it doesn't exist
if [ $SESSION_EXISTS -ne 0 ]; then
    # Create new session
    tmux new-session -d -s "$SESSION_NAME" -c "$PROJECT_DIR" -n code
    tmux send-keys -t "$SESSION_NAME:1" "code ." C-m

    # Create second window for execution
    tmux new-window -t "$SESSION_NAME" -n execute -c "$PROJECT_DIR"

    # Create third window for lazygit
    tmux new-window -t "$SESSION_NAME" -n gitzz -c "$PROJECT_DIR"
    tmux send-keys -t "$SESSION_NAME:3" "lazygit" C-m

    # Switch to the first window
    tmux select-window -t "$SESSION_NAME:2"
fi

# Handle session switching based on whether we're already in tmux
if [ -n "$TMUX" ]; then
    # We're in a tmux session - switch to the other session
    tmux switch-client -t "$SESSION_NAME"
else
    # We're not in tmux - attach to the session
    tmux attach-session -t "$SESSION_NAME"
fi
