# Nushell environment configuration

# Carapace shell completion - generate cache
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
mkdir ($nu.cache-dir | path join "carapace")
carapace _carapace nushell | save --force ($nu.cache-dir | path join "carapace.nu")
