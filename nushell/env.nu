# Nushell environment configuration

# Carapace shell completion - generate cache
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
mkdir ($nu.cache-dir | path join "carapace")
carapace _carapace nushell | save --force ($nu.cache-dir | path join "carapace.nu")

# Worktrunk shell integration
# Run 'wt config shell install nu' to enable worktrunk in Nushell
# This creates wt.nu in Nushell's vendor-autoload directory
# Re-run after updating worktrunk

# Zoxide (smarter cd) initialization
zoxide init nushell | save -f ~/.zoxide.nu
