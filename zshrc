# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# User configuration

alias deadbranch="git fetch -p && git branch -vv | awk '/: gone]/{print \$1}' | xargs git branch -D"
alias decimate="~/tmux-workspace.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

claude-work() {
  CLAUDE_CONFIG_DIR="$HOME/.claude-work" claude "$@"
}

claude() {
  echo "Syncing Claude config..."
  git -C ~/.claude pull origin main --quiet

  command claude "$@"

  echo "Saving config changes..."
  git -C ~/.claude add CLAUDE.md settings.json commands/ hooks/ agents/ rules/ 2>/dev/null
  if ! git -C ~/.claude diff --cached --quiet; then
    git -C ~/.claude commit -m "chore: sync config $(date '+%Y-%m-%d %H:%M')"
    git -C ~/.claude push origin HEAD:main --quiet
    echo "Config updated on GitHub"
  else
    echo "No changes"
  fi
}

# Entire CLI shell completion
autoload -Uz compinit && compinit && source <(entire completion zsh)

# Carapace shell completion
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# Enable vi mode
bindkey -v
# Restore Ctrl+R for history search in vi mode
bindkey '^R' history-incremental-search-backward

eval "$(starship init zsh)"

# Worktrunk shell integration
eval "$(wt config shell init zsh)"

# Qwen Code PATH block begin
export PATH='/Users/buddhamagnet/.local/bin':$PATH
# Qwen Code PATH block end
