# 🏠 Dotfiles

Personal development environment configuration for macOS. Automated Rust-based installer manages shell configurations (zsh, nushell, bash), terminal setup (ghostty, tmux), and development tools (git, neovim, emacs) with a unified catppuccin mocha theme.

## 🚀 Quick Start

```bash
git clone https://github.com/buddhamagnet/dotfiles ~/Code/dotfiles
cd ~/Code/dotfiles
cargo run --release
```

Preview changes without modifying anything:
```bash
cargo run --release -- --dry-run
```

## 📦 Core Tools (Automated Installation)

The installer automatically installs these dependencies if not already present:

| Tool | Description | Version | Links |
|------|-------------|---------|-------|
| ![JetBrains Mono](https://img.shields.io/badge/JetBrains_Mono-000000?style=flat&logo=jetbrains&logoColor=white) | Monospace font for developers | Latest | [Website](https://www.jetbrains.com/lp/mono/) · [GitHub](https://github.com/JetBrains/JetBrainsMono) |
| ![Nushell](https://img.shields.io/badge/Nushell-4E9A06?style=flat&logo=nushell&logoColor=white) | Modern shell with structured data | Latest | [Website](https://www.nushell.sh/) · [GitHub](https://github.com/nushell/nushell) |
| ![Starship](https://img.shields.io/badge/Starship-DD0B78?style=flat&logo=starship&logoColor=white) | Fast, customizable shell prompt | Latest | [Website](https://starship.rs/) · [GitHub](https://github.com/starship/starship) |
| ![Carapace](https://img.shields.io/badge/Carapace-2E3440?style=flat) | Multi-shell completion generator | Latest | [Website](https://carapace.sh/) · [GitHub](https://github.com/carapace-sh/carapace-bin) |
| ![worktrunk](https://img.shields.io/badge/worktrunk-5E81AC?style=flat) | Git worktree manager | Latest | [GitHub](https://github.com/jamesob/worktrunk) |
| ![zoxide](https://img.shields.io/badge/zoxide-F48FB1?style=flat) | Smarter cd command (tracks frecency) | Latest | [GitHub](https://github.com/ajeetdsouza/zoxide) |
| ![fzf](https://img.shields.io/badge/fzf-00ADD8?style=flat) | Command-line fuzzy finder | Latest | [GitHub](https://github.com/junegunn/fzf) |
| ![ripgrep](https://img.shields.io/badge/ripgrep-3FB950?style=flat) | Fast line-oriented search tool | Latest | [GitHub](https://github.com/BurntSushi/ripgrep) |
| ![fd](https://img.shields.io/badge/fd-FF6B6B?style=flat) | Modern find replacement | Latest | [GitHub](https://github.com/sharkdp/fd) |
| ![atuin](https://img.shields.io/badge/atuin-00ADD8?style=flat) | Shell history sync & search | Latest | [Website](https://atuin.sh/) · [GitHub](https://github.com/atuinsh/atuin) · [Docs](https://docs.atuin.sh/) |
| ![opencode](https://img.shields.io/badge/opencode-000000?style=flat) | AI coding agent for the terminal | Latest | [Website](https://opencode.ai/) · [GitHub](https://github.com/anomalyco/opencode) |
| ![tpm](https://img.shields.io/badge/tpm-1BB91F?style=flat) | tmux plugin manager | v3.1.0 | [GitHub](https://github.com/tmux-plugins/tpm) |

### tpm plugins

tpm is automatically installed and initialized. The following plugins are configured:

| Plugin | Description | Repository |
|--------|-------------|------------|
| **tpm** | tmux plugin manager - manages all other plugins | [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm) |
| **catppuccin** | soothing pastel theme for tmux (mocha variant) | [catppuccin/tmux](https://github.com/catppuccin/tmux) |
| **tmux-cpu** | CPU and RAM usage indicators for tmux status bar | [tmux-plugins/tmux-cpu](https://github.com/tmux-plugins/tmux-cpu) |

**Installing plugins:**  
After running the dotfiles installer, open tmux and press `Prefix + I` (Ctrl-a + Shift-i) to install all declared plugins.

**Managing plugins:**
- Update plugins: `Prefix + U`
- Remove unlisted plugins: `Prefix + alt + u`

**Adding new plugins:**  
Add plugin declarations to `tmux/tmux.conf` (after the existing plugin declarations, before the TPM initialization line):
```tmux
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
```
Then press `Prefix + I` inside tmux to install them.

### neovim plugins

neovim uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management. Configured plugins:

| Plugin | Description | Repository |
|--------|-------------|------------|
| **lazy.nvim** | modern plugin manager with lazy loading | [folke/lazy.nvim](https://github.com/folke/lazy.nvim) |
| **catppuccin** | soothing pastel theme for neovim (mocha variant) | [catppuccin/nvim](https://github.com/catppuccin/nvim) |
| **telescope** | fuzzy finder over lists (files, buffers, etc.) | [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) |
| **telescope-fzf-native** | native C sorter for telescope (performance) | [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) |
| **plenary** | lua utility library (required by telescope) | [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) |

**telescope keybindings:**
- `<leader>ff` - Find files
- `<leader>fg` - Live grep (search text in files)
- `<leader>fb` - List buffers
- `<leader>fh` - Search help tags

**Managing plugins:**
- View plugin status: `:Lazy`
- Install/update plugins: `:Lazy sync`
- Check plugin health: `:checkhealth telescope`

**Adding new plugins:**  
Edit `nvim/lua/plugins/init.lua` and add plugin specs:
```lua
{
  "plugin/name",
  config = function()
    -- Plugin configuration here
  end,
}
```
Plugins auto-install on next nvim launch, or run `:Lazy sync`.

## ⚙️ Shell & Terminal Tools

These tools are referenced in configurations but require separate installation:

| Tool | Description | Links |
|------|-------------|-------|
| ![ghostty](https://img.shields.io/badge/ghostty-000000?style=flat) | fast, native terminal emulator | [Website](https://ghostty.org/) · [GitHub](https://github.com/ghostty-org/ghostty) |
| ![tmux](https://img.shields.io/badge/tmux-1BB91F?style=flat&logo=tmux&logoColor=white) | Terminal multiplexer | [GitHub](https://github.com/tmux/tmux) · [Wiki](https://github.com/tmux/tmux/wiki) |
| ![nvm](https://img.shields.io/badge/nvm-333333?style=flat&logo=node.js&logoColor=white) | node version manager | [GitHub](https://github.com/nvm-sh/nvm) |

## 🛠️ Development Tools

| Tool | Description | Version | Links |
|------|-------------|---------|-------|
| ![git](https://img.shields.io/badge/git-F05032?style=flat&logo=git&logoColor=white) | version control system | Latest | [Website](https://git-scm.com/) · [GitHub](https://github.com/git/git) |
| ![neovim](https://img.shields.io/badge/neovim-57A143?style=flat&logo=neovim&logoColor=white) | hyperextensible vim-based text editor | Latest | [Website](https://neovim.io/) · [GitHub](https://github.com/neovim/neovim) |
| ![emacs](https://img.shields.io/badge/emacs-7F5AB6?style=flat&logo=gnu-emacs&logoColor=white) | extensible text editor (clojure-focused) | Latest | [Website](https://www.gnu.org/software/emacs/) · [GNU](https://savannah.gnu.org/projects/emacs) |
| ![leiningen](https://img.shields.io/badge/leiningen-5881D8?style=flat&logo=clojure&logoColor=white) | clojure build automation tool | CIDER nREPL 0.62.0 | [Website](https://leiningen.org/) · [GitHub](https://github.com/technomancy/leiningen) |
| ![mysql](https://img.shields.io/badge/mysql-4479A1?style=flat&logo=mysql&logoColor=white) | relational database | 8.3.0 | [Website](https://www.mysql.com/) · [Dev](https://dev.mysql.com/) |
| ![gdb](https://img.shields.io/badge/gdb-A42E2B?style=flat) | GNU debugger | Latest | [Website](https://www.sourceware.org/gdb/) |
| ![ghci](https://img.shields.io/badge/ghci-5D4F85?style=flat&logo=haskell&logoColor=white) | haskell REPL | Latest | [Website](https://www.haskell.org/ghc/) |
| **claude code** | AI-powered coding assistant | Latest | [Website](https://claude.ai/code) |

## 📋 Installation

### Prerequisites

- **macOS** (tested on Darwin 24.6.0)
- **Rust & Cargo** - [Install via rustup](https://rustup.rs/)
- **Homebrew** - [Install Homebrew](https://brew.sh/)

### Installation Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/buddhamagnet/dotfiles ~/Code/dotfiles
   cd ~/Code/dotfiles
   ```

2. **Run the installer:**
   ```bash
   cargo run --release
   ```

3. **Interactive prompts:**
   When the installer encounters existing files, you'll be prompted:
   - `y` - Overwrite this file (backup created)
   - `n` - Skip this file
   - `a` - Overwrite all remaining files
   - `q` - Quit installation

4. **Backup location:**
   Existing files are moved to `~/.dotfiles-backup/` before being replaced.

### Dry Run

Preview what will be changed without modifying anything:
```bash
cargo run --release -- --dry-run
```

## 🗂️ Configuration Files

The installer symlinks these files from the repository into your home directory:

| Source (Repo) | Destination ($HOME) | Purpose |
|---------------|---------------------|---------|
| `bashrc` | `~/.bashrc` | bash configuration with carapace and worktrunk |
| `zshrc` | `~/.zshrc` | zsh configuration with starship prompt, carapace completions, vi mode, and custom functions |
| `gitconfig` | `~/.gitconfig` | git configuration with SSH GitHub URLs and worktree aliases |
| `gitignore` | `~/.gitignore` | global git ignore patterns |
| `gdbinit` | `~/.gdbinit` | GNU debugger configuration (Intel disassembly) |
| `ghci` | `~/.ghci` | haskell REPL configuration (lambda prompt) |
| `tmux/tmux.conf` | `~/.tmux.conf` | tmux configuration with catppuccin theme, custom prefix (C-a) |
| `tmux/tmux-workspace.sh` | `~/tmux-workspace.sh` | automated tmux workspace setup script |
| `.lein/profiles.clj` | `~/.lein/profiles.clj` | leiningen configuration with CIDER plugin |
| `.emacs.d` | `~/.emacs.d` | emacs configuration (entire directory) |
| `ghostty/config` | `~/.config/ghostty/config` | ghostty terminal configuration with catppuccin theme |
| `nushell/env.nu` | `~/.config/nushell/env.nu` | nushell environment configuration |
| `nushell/config.nu` | `~/.config/nushell/config.nu` | nushell main configuration |
| `starship/starship.toml` | `~/.config/starship/starship.toml` | starship prompt customization |
| `nvim` | `~/.config/nvim` | neovim configuration with lazy.nvim plugin manager |

## ✨ Features

### visual theme
- **catppuccin mocha** theme across tmux and ghostty for consistent aesthetics
- **jetbrains mono** font with ligatures
- **starship** prompt with extensive customization

### shell enhancements
- **vi mode** in zsh with preserved Ctrl+R history search
- **carapace** shell completion bridges for zsh, fish, bash, and inshellisense
- **entire CLI** shell completion integration
- **worktrunk** shell integration for zsh and nushell
- **zoxide** smart directory navigation based on frecency (frequency + recency)
- **fzf** fuzzy finder for files, directories, and command history
- **atuin** magical shell history sync and fuzzy search with server backup (replaces Ctrl+R)
- **ripgrep** blazingly fast text search (used by telescope live_grep)
- **fd** modern file finder (used by telescope for better file search)
- **opencode** AI coding agent for the terminal

### tmux configuration
- **custom prefix:** `C-a` instead of default `C-b`
- **tpm (tmux plugin manager)** automatically installed for plugin management
- **catppuccin theme** managed via tpm (mocha variant)
- **workspace automation:** `tmux-workspace.sh` creates 5-window setup with claude instances

### git integration
- **SSH-based GitHub URLs** automatically
- **worktree aliases** for git worktree management
- custom `.gitignore` patterns

### development setup
- **claude code integration** with work and personal config functions
- **clojure development** via emacs with paredit, cider, and clojure-mode
- **leiningen** with CIDER nREPL plugin

## 🔄 Post-Install Steps

### worktrunk shell integration (nushell)

After installation, enable worktrunk shell integration in nushell:

```bash
wt config shell install nu
```

This creates a static `wt.nu` file in nushell's vendor-autoload directory. Re-run this command after updating worktrunk.

### atuin server sync setup

After installation, atuin is configured but requires one-time registration for server sync:

```bash
atuin register -u <USERNAME> -e <EMAIL>
```

This will prompt for a password. After registration:

```bash
atuin import auto  # Import existing shell history (run once)
atuin sync         # Sync with server
```

**On subsequent machines:** The installer automatically detects registration and syncs history.

**Key bindings:**
- `Ctrl+R` - Search shell history (fuzzy search)
- `Ctrl+R` then `Ctrl+R` - Cycle through filter modes
- Up arrow - Search history filtered by current directory
- `atuin search` - Manual history search

**Configuration:** `~/.config/atuin/config.toml` (symlinked from repo)

## 🔧 Updating

### Update Dotfiles

```bash
cd ~/Code/dotfiles
git pull
cargo run --release
```

### update catppuccin tmux plugin

To move to a newer catppuccin version:

1. Edit `src/main.rs` and update `TMUX_PLUGIN_TAG` constant
2. Remove existing plugin: `rm -rf ~/.config/tmux/plugins/catppuccin`
3. Re-run installer: `cargo run --release`

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Maintained by:** Dave Goodchild (buddhamagnet@gmail.com)
