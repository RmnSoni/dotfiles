eval "$(starship init zsh)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
export PATH="$(brew --prefix postgresql@18)/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"

eval "$(zoxide init zsh)"

if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

#Zoxide cd 
eval "$(zoxide init zsh)"

# Added by Antigravity
export PATH="/Users/rmn/.antigravity/antigravity/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
eval "$(zoxide init zsh --cmd cd)"

. "$HOME/.local/bin/env"

# OpenClaw Completion
source "/Users/rmn/.openclaw/completions/openclaw.zsh"

# Default editor
export EDITOR=nvim
export VISUAL=nvim
