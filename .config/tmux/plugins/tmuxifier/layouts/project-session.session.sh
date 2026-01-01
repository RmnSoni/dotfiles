# Set session root path dynamically
session_root "$2"

if initialize_session "$1"; then
  # Window 1: Neovim
  new_window "code"
  run_cmd "nvim ."

  # Window 2: Execution (shell for commands)
  new_window "execute"

  # Window 3: Lazygit
  new_window "gitzz"
  run_cmd "lazygit"

  select_window 1  # Start in Neovim
fi

finalize_and_go_to_session

