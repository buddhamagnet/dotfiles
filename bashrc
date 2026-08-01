# Basic bash configuration with carapace shell completion

# Path configuration
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# Carapace shell completion
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
source <(carapace _carapace)
