#!/bin/bash

# Select a directory using FZF
PROJECT_DIR=$(find ~/projects ~/ia-maxdepth 1 -type d 2>/dev/null | fzf --prompt="Select project: ")

# Exit if no directory is selected
[ -z "$PROJECT_DIR" ] && exit 1

# Extract project name for the session
SESSION_NAME=$(basename "$PROJECT_DIR")

# Create a new session with Tmuxifier using the selected project dir
tmuxifier load-session project-session "$SESSION_NAME" "$PROJECT_DIR"
