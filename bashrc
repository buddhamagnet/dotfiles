# Basic bash configuration with carapace shell completion

# Path configuration
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# Carapace shell completion
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
source <(carapace _carapace)

# Worktrunk shell integration
eval "$(wt config shell init bash)"

# Zoxide (smarter cd)
eval "$(zoxide init bash)"

# fzf (fuzzy finder)
eval "$(fzf --bash)"
