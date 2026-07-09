#!/bin/bash

# Select directory using FZF
PROJECT_DIR=$(find ~/projects ~/ia ~/dev ~/dotfiles -maxdepth 1 -type d 2>/dev/null | fzf --prompt="Select project: ")

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

  #back to code window
  tmux select-window -t "$SESSION_NAME:code"
  tmux send-keys -t "$SESSION_NAME:code" "code ." C-m
  tmux send-keys -t "$SESSION_NAME:code" "nvim ." C-m

  # Create second window for execution
  tmux new-window -t "$SESSION_NAME" -n execute -c "$PROJECT_DIR"
  tmux select-window -t "$SESSION_NAME:execute"

  # Sync GitHub issues in the execution window
  if [ -d "$PROJECT_DIR/.git" ]; then
    tmux send-keys -t "$SESSION_NAME:execute" "/Users/rmn/.local/bin/gh-sync" C-m
  fi

  # run the sh script from ./scripts/dev-start-in-tmux.sh if it exists
  if [ -f "$PROJECT_DIR/scripts/dev-start-in-tmux.sh" ]; then
    tmux send-keys -t "$SESSION_NAME:execute" "bash scripts/dev-start-in-tmux.sh" C-m
  fi

  # Create third window for lazygit
  tmux new-window -t "$SESSION_NAME" -n gitzz -c "$PROJECT_DIR"
  tmux send-keys -t "$SESSION_NAME:gitzz" "lazygit" C-m

  # Switch to the first window
  tmux select-window -t "$SESSION_NAME:execute"
fi

## Handle session switching based on whether we're already in tmux
if [ -n "$TMUX" ]; then
  # We're in a tmux session - switch to the other session
  tmux switch-client -t "$SESSION_NAME"
else
  # We're not in tmux - attach to the session
  tmux attach-session -t "$SESSION_NAME"
fi
