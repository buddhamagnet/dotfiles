# Nushell configuration

# Source carapace completions
source ($nu.cache-dir | path join "carapace.nu")

# Zoxide (smarter cd) - inline initialization
zoxide init nushell | save -f ~/.zoxide.nu
source ~/.zoxide.nu
