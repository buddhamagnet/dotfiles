//! Symlinks the dotfiles in this repo into $HOME. Replaces the old `rake install`.
//!
//! Run from the repo root: `cargo run --release` (or `--dry-run` to preview).

use std::env;
use std::fs;
use std::io::{self, Write};
use std::os::unix::fs::symlink;
use std::path::{Path, PathBuf};
use std::process::{exit, Command};

/// (path in repo, path under $HOME). Directories are linked whole.
const MANIFEST: &[(&str, &str)] = &[
    ("zshrc", ".zshrc"),
    ("gitconfig", ".gitconfig"),
    ("gitignore", ".gitignore"),
    ("gdbinit", ".gdbinit"),
    ("ghci", ".ghci"),
    ("tmux/tmux.conf", ".tmux.conf"),
    (".lein/profiles.clj", ".lein/profiles.clj"),
    (".emacs.d", ".emacs.d"),
    ("ghostty/config", ".config/ghostty/config"),
];

enum Choice {
    Yes,
    No,
    All,
    Quit,
}

fn main() {
    let dry_run = env::args().any(|a| a == "--dry-run");

    let repo_root = env::current_dir().expect("could not read current directory");
    if !repo_root.join("Cargo.toml").exists() {
        eprintln!("run this from the root of the dotfiles repo");
        exit(1);
    }

    let home = PathBuf::from(env::var("HOME").expect("$HOME is not set"));
    let backup_dir = home.join(".dotfiles-backup");

    let mut replace_all = false;

    for (src_rel, dst_rel) in MANIFEST {
        let src = repo_root.join(src_rel);
        let dst = home.join(dst_rel);

        if !src.exists() {
            eprintln!("skipping {src_rel}: not found in repo");
            continue;
        }

        if is_linked_to(&dst, &src) {
            println!("up to date  ~/{dst_rel}");
            continue;
        }

        let conflict = dst.exists() || dst.symlink_metadata().is_ok();

        if dry_run {
            if conflict {
                println!("would overwrite ~/{dst_rel} (existing moved to ~/.dotfiles-backup/)");
            } else {
                println!("would link      ~/{dst_rel} -> {}", src.display());
            }
            continue;
        }

        if conflict {
            let choice = if replace_all {
                Choice::Yes
            } else {
                prompt_overwrite(dst_rel)
            };
            match choice {
                Choice::Quit => {
                    println!("aborted");
                    exit(0);
                }
                Choice::No => {
                    println!("skipping   ~/{dst_rel}");
                    continue;
                }
                Choice::All => replace_all = true,
                Choice::Yes => {}
            }
        }

        if let Err(e) = link_file(&src, &dst, &backup_dir) {
            eprintln!("failed to link ~/{dst_rel}: {e}");
            exit(1);
        }
        println!("linked     ~/{dst_rel} -> {}", src.display());
    }

    if !dry_run {
        install_jetbrains_mono();
    }
}

/// True if `dst` is a symlink that already resolves to `src`.
fn is_linked_to(dst: &Path, src: &Path) -> bool {
    match fs::read_link(dst) {
        Ok(target) => {
            let resolved = if target.is_absolute() {
                target
            } else {
                dst.parent().unwrap_or(Path::new("/")).join(target)
            };
            match (resolved.canonicalize(), src.canonicalize()) {
                (Ok(a), Ok(b)) => a == b,
                _ => false,
            }
        }
        Err(_) => false,
    }
}

fn prompt_overwrite(dst_rel: &str) -> Choice {
    loop {
        print!("overwrite ~/{dst_rel}? [y/N/a(ll)/q(uit)] ");
        io::stdout().flush().ok();

        let mut input = String::new();
        if io::stdin().read_line(&mut input).is_err() {
            return Choice::Quit;
        }

        return match input.trim().to_lowercase().as_str() {
            "y" | "yes" => Choice::Yes,
            "a" | "all" => Choice::All,
            "q" | "quit" => Choice::Quit,
            _ => Choice::No,
        };
    }
}

/// Moves any existing file/dir at `dst` into `backup_dir`, then symlinks `dst` -> `src`.
fn link_file(src: &Path, dst: &Path, backup_dir: &Path) -> io::Result<()> {
    if let Some(parent) = dst.parent() {
        fs::create_dir_all(parent)?;
    }

    if dst.symlink_metadata().is_ok() {
        fs::create_dir_all(backup_dir)?;
        let name = dst.file_name().unwrap();
        let backup_path = unique_backup_path(backup_dir, name);
        fs::rename(dst, &backup_path)?;
    }

    symlink(src, dst)
}

fn unique_backup_path(backup_dir: &Path, name: &std::ffi::OsStr) -> PathBuf {
    let base = backup_dir.join(name);
    if !base.exists() {
        return base;
    }
    for n in 1.. {
        let candidate = backup_dir.join(format!("{}.{n}", name.to_string_lossy()));
        if !candidate.exists() {
            return candidate;
        }
    }
    unreachable!()
}

/// Install JetBrains Mono font via Homebrew if not already installed.
fn install_jetbrains_mono() {
    let home = env::var("HOME").expect("$HOME is not set");
    let font_path = PathBuf::from(&home).join("Library/Fonts");

    // Check if JetBrains Mono is already installed
    if let Ok(entries) = fs::read_dir(&font_path) {
        for entry in entries.flatten() {
            if let Some(name) = entry.file_name().to_str() {
                if name.to_lowercase().contains("jetbrains") {
                    println!("JetBrains Mono already installed");
                    return;
                }
            }
        }
    }

    println!("Installing JetBrains Mono font...");
    let status = Command::new("brew")
        .args(["install", "--cask", "font-jetbrains-mono"])
        .status();

    match status {
        Ok(s) if s.success() => println!("JetBrains Mono installed successfully"),
        Ok(_) => eprintln!("Warning: brew install font-jetbrains-mono failed"),
        Err(e) => eprintln!("Warning: failed to run brew: {e}"),
    }
}
