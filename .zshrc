eval "$(starship init zsh)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
export PATH="$(brew --prefix postgresql@18)/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"

if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

