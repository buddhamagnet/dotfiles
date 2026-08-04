# 🏠 Dotfiles

Personal development environment configuration for macOS. Automated Rust-based installer manages shell configurations (Zsh, Nushell, Bash), terminal setup (Ghostty, tmux), and development tools (Git, Neovim, Emacs) with a unified Catppuccin Mocha theme.

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
| ![Worktrunk](https://img.shields.io/badge/Worktrunk-5E81AC?style=flat) | Git worktree manager | Latest | [GitHub](https://github.com/jamesob/worktrunk) |
| ![zoxide](https://img.shields.io/badge/zoxide-F48FB1?style=flat) | Smarter cd command (tracks frecency) | Latest | [GitHub](https://github.com/ajeetdsouza/zoxide) |
| ![fzf](https://img.shields.io/badge/fzf-00ADD8?style=flat) | Command-line fuzzy finder | Latest | [GitHub](https://github.com/junegunn/fzf) |
| ![TPM](https://img.shields.io/badge/TPM-1BB91F?style=flat) | Tmux Plugin Manager | v3.1.0 | [GitHub](https://github.com/tmux-plugins/tpm) |

### TPM Plugins

TPM is automatically installed and initialized. The following plugins are configured:

| Plugin | Description | Repository |
|--------|-------------|------------|
| **TPM** | Tmux Plugin Manager - manages all other plugins | [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm) |
| **Catppuccin** | Soothing pastel theme for tmux (Mocha variant) | [catppuccin/tmux](https://github.com/catppuccin/tmux) |
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

## ⚙️ Shell & Terminal Tools

These tools are referenced in configurations but require separate installation:

| Tool | Description | Links |
|------|-------------|-------|
| ![Ghostty](https://img.shields.io/badge/Ghostty-000000?style=flat) | Fast, native terminal emulator | [Website](https://ghostty.org/) · [GitHub](https://github.com/ghostty-org/ghostty) |
| ![tmux](https://img.shields.io/badge/tmux-1BB91F?style=flat&logo=tmux&logoColor=white) | Terminal multiplexer | [GitHub](https://github.com/tmux/tmux) · [Wiki](https://github.com/tmux/tmux/wiki) |
| ![NVM](https://img.shields.io/badge/NVM-333333?style=flat&logo=node.js&logoColor=white) | Node Version Manager | [GitHub](https://github.com/nvm-sh/nvm) |

## 🛠️ Development Tools

| Tool | Description | Version | Links |
|------|-------------|---------|-------|
| ![Git](https://img.shields.io/badge/Git-F05032?style=flat&logo=git&logoColor=white) | Version control system | Latest | [Website](https://git-scm.com/) · [GitHub](https://github.com/git/git) |
| ![Neovim](https://img.shields.io/badge/Neovim-57A143?style=flat&logo=neovim&logoColor=white) | Hyperextensible Vim-based text editor | Latest | [Website](https://neovim.io/) · [GitHub](https://github.com/neovim/neovim) |
| ![Emacs](https://img.shields.io/badge/Emacs-7F5AB6?style=flat&logo=gnu-emacs&logoColor=white) | Extensible text editor (Clojure-focused) | Latest | [Website](https://www.gnu.org/software/emacs/) · [GNU](https://savannah.gnu.org/projects/emacs) |
| ![Leiningen](https://img.shields.io/badge/Leiningen-5881D8?style=flat&logo=clojure&logoColor=white) | Clojure build automation tool | CIDER nREPL 0.62.0 | [Website](https://leiningen.org/) · [GitHub](https://github.com/technomancy/leiningen) |
| ![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white) | Relational database | 8.3.0 | [Website](https://www.mysql.com/) · [Dev](https://dev.mysql.com/) |
| ![GDB](https://img.shields.io/badge/GDB-A42E2B?style=flat) | GNU Debugger | Latest | [Website](https://www.sourceware.org/gdb/) |
| ![GHCi](https://img.shields.io/badge/GHCi-5D4F85?style=flat&logo=haskell&logoColor=white) | Haskell REPL | Latest | [Website](https://www.haskell.org/ghc/) |
| **Claude Code** | AI-powered coding assistant | Latest | [Website](https://claude.ai/code) |

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
| `bashrc` | `~/.bashrc` | Bash configuration with Carapace and Worktrunk |
| `zshrc` | `~/.zshrc` | Zsh configuration with Starship prompt, Carapace completions, vi mode, and custom functions |
| `gitconfig` | `~/.gitconfig` | Git configuration with SSH GitHub URLs and worktree aliases |
| `gitignore` | `~/.gitignore` | Global Git ignore patterns |
| `gdbinit` | `~/.gdbinit` | GNU Debugger configuration (Intel disassembly) |
| `ghci` | `~/.ghci` | Haskell REPL configuration (lambda prompt) |
| `tmux/tmux.conf` | `~/.tmux.conf` | Tmux configuration with Catppuccin theme, custom prefix (C-a) |
| `tmux/tmux-workspace.sh` | `~/tmux-workspace.sh` | Automated tmux workspace setup script |
| `.lein/profiles.clj` | `~/.lein/profiles.clj` | Leiningen configuration with CIDER plugin |
| `.emacs.d` | `~/.emacs.d` | Emacs configuration (entire directory) |
| `ghostty/config` | `~/.config/ghostty/config` | Ghostty terminal configuration with Catppuccin theme |
| `nushell/env.nu` | `~/.config/nushell/env.nu` | Nushell environment configuration |
| `nushell/config.nu` | `~/.config/nushell/config.nu` | Nushell main configuration |
| `starship/starship.toml` | `~/.config/starship/starship.toml` | Starship prompt customization |
| `nvim/init.lua` | `~/.config/nvim/init.lua` | Neovim configuration |

## ✨ Features

### Visual Theme
- **Catppuccin Mocha** theme across tmux and Ghostty for consistent aesthetics
- **JetBrains Mono** font with ligatures
- **Starship** prompt with extensive customization

### Shell Enhancements
- **Vi mode** in Zsh with preserved Ctrl+R history search
- **Carapace** shell completion bridges for zsh, fish, bash, and inshellisense
- **Entire CLI** shell completion integration
- **Worktrunk** shell integration for Zsh and Nushell
- **zoxide** smart directory navigation based on frecency (frequency + recency)
- **fzf** fuzzy finder for files, directories, and command history

### Tmux Configuration
- **Custom prefix:** `C-a` instead of default `C-b`
- **TPM (Tmux Plugin Manager)** automatically installed for plugin management
- **Catppuccin theme** managed via TPM (Mocha variant)
- **Workspace automation:** `tmux-workspace.sh` creates 5-window setup with Claude instances

### Git Integration
- **SSH-based GitHub URLs** automatically
- **Worktree aliases** for git worktree management
- Custom `.gitignore` patterns

### Development Setup
- **Claude Code integration** with work and personal config functions
- **Clojure development** via Emacs with paredit, cider, and clojure-mode
- **Leiningen** with CIDER nREPL plugin

## 🔄 Post-Install Steps

### Worktrunk Shell Integration (Nushell)

After installation, enable Worktrunk shell integration in Nushell:

```bash
wt config shell install nu
```

This creates a static `wt.nu` file in Nushell's vendor-autoload directory. Re-run this command after updating Worktrunk.

## 🔧 Updating

### Update Dotfiles

```bash
cd ~/Code/dotfiles
git pull
cargo run --release
```

### Update Catppuccin Tmux Plugin

To move to a newer Catppuccin version:

1. Edit `src/main.rs` and update `TMUX_PLUGIN_TAG` constant
2. Remove existing plugin: `rm -rf ~/.config/tmux/plugins/catppuccin`
3. Re-run installer: `cargo run --release`

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Maintained by:** Dave Goodchild (buddhamagnet@gmail.com)
