# Nushell configuration

# Source carapace completions
source ($nu.cache-dir | path join "carapace.nu")

# Source atuin integration (file generated in env.nu)
source ~/.atuin.nu

# Source zoxide integration (file generated in env.nu)
source ~/.zoxide.nu

# Set vi mode
$env.config = ($env.config | upsert edit_mode vi)
