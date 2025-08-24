# Dotfiles

A collection of my personal configuration files (dotfiles) for various tools and applications.

## Overview

This repository contains configuration files for my development environment, including shell settings, terminal configurations, and custom scripts. It's designed to be easily portable across machines.

## Contents

### Shell Configuration
- **`.zshrc`** - Zsh shell configuration with:
  - Oh My Zsh setup with robbyrussell theme
  - Git plugin enabled
  - Custom aliases for common commands
  - Editor configuration (Neovim as default)
  - Bun and NVM setup
  - PATH configurations

### Terminal Multiplexer
- **`.tmux.conf`** - Tmux configuration with:
  - Vim-style pane navigation
  - Catppuccin theme
  - TPM (Tmux Plugin Manager) integration
  - Custom keybindings for pane and window management
  - Mouse support enabled

### Terminal Emulators
- **WezTerm** - WezTerm terminal configuration:
  - Afterglow color scheme
  - Hack Nerd Font Mono with JetBrains Mono fallback
  - Custom font sizing

### Custom Scripts
Located in the `bin/` directory:
- **`getworkflow`** - Copies Claude workflow content to clipboard
- **`refreshnvim`** - Clears Neovim cache and reinstalls plugins/LSP servers

### Development Setup
- **`config-dev`** - Comprehensive setup script that:
  - Makes all bin scripts executable
  - Creates symlinks for all configuration files
  - Installs/updates Neovim via Homebrew
  - Installs development tools (stylua, shfmt, prettier)
  - Sets up Neovim configuration from a separate git repository
  - Installs/updates gemini-cli and claude-code

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   ```

2. Run the development setup script:
   ```bash
   ~/.dotfiles/config-dev
   ```

This script will:
- Create necessary symlinks
- Install required tools via Homebrew
- Set up Neovim with plugins
- Make custom scripts executable

## Manual Symlinks

The setup script automatically creates these symlinks, but if needed manually:
```bash
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/wezterm/wezterm.lua ~/.wezterm.lua
ln -sf ~/.dotfiles/claude-config ~/.claude
```

## Custom Scripts

### getworkflow
Copies Claude workflow content to clipboard:
```bash
getworkflow <workflow_name>
```

### refreshnvim
Clears Neovim cache and reinstalls plugins:
```bash
refreshnvim
```

## Requirements

- Zsh shell
- Oh My Zsh
- Homebrew (macOS)
- Bun runtime
- NVM (Node Version Manager)
- Tmux
- WezTerm (optional)
- Neovim

## Ignored Files

The following directories/files are ignored in this repository (see `.gitignore`):
- Claude configuration projects
- Claude configuration todos
- Claude configuration statsig
- Claude configuration shell snapshots
- Claude configuration IDE settings

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.