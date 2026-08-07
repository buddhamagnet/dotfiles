# Nushell configuration

# Source carapace completions
source ($nu.cache-dir | path join "carapace.nu")

# Source zoxide integration (file generated in env.nu)
source ~/.zoxide.nu
