# Nushell configuration

# Configure completions and edit mode
$env.config = ($env.config | upsert edit_mode vi)
$env.config = ($env.config | upsert completions {
    sort: "smart"
    case_sensitive: false
    quick: true
    partial: false           # Disable menu for partial matches
    algorithm: "prefix"
    external: {
        enable: false        # Disable external command completions menu
        max_results: 100
        completer: null
    }
    use_ls_colors: true
})
