# Workstation Setup Ansible Playbook

This Ansible playbook automates the setup of a development workstation based on the configuration specified in the dotfiles repository.

## Prerequisites

1. Install Ansible on your system:

   **For Ubuntu/Debian:**
   ```bash
   sudo apt update
   sudo apt install ansible
   ```

   **For Arch Linux:**
   ```bash
   sudo pacman -S ansible
   ```

2. Clone this repository:
   ```bash
   git clone https://github.com/karambir/dotfiles.git
   cd ansible-setup
   ```

## Running the Playbook

To run the playbook on your local machine:

```bash
ansible-playbook -i inventory site.yml --ask-become-pass
```

This will prompt for your sudo password and then proceed with the installation.

## What Gets Installed

The playbook sets up the following components:

1. **Common Utilities**
   - Essential command-line tools (make, git, curl, htop, tmux, etc.)
   - Modern CLI replacements (exa, bat, ripgrep, dust, zoxide, etc.)
   - Terminal emulators (Terminator, Kitty)
   - Text editor (Neovim)
   - Fonts (Fira Code, JetBrains Mono, etc.)
   - **AUR Package Support (Arch Linux)**: Automatically installs `yay` AUR helper and packages like `nomacs`, `sirikali`, `cursor-bin`, and `fnm-bin`

2. **Docker**
   - Docker Engine and Docker Compose
   - Proper user permissions
   - Custom DNS configuration

3. **Virtualization**
   - QEMU/KVM and related tools
   - Virt-Manager

4. **Development Environment**
   - **Database Servers**
     - PostgreSQL and related packages
     - Redis server

   - **Python Development Environment**
     - Build dependencies for compiling Python packages
     - UV package manager for fast Python package management
     - Common Python CLI tools (yt-dlp, streamlink, gallery-dl, cookiecutter, pgcli, poetry, pre-commit, aider-chat, open-webui)

   - **Node.js Environment**
     - **fnm (Fast Node Manager)** - Modern replacement for NVM
     - Automatic installation via AUR on Arch Linux (`fnm-bin`)
     - Manual installation via curl on Debian-based systems
     - Fish shell integration with automatic version switching
     - Latest LTS Node.js version installed and set as default

   - **Rust and Go**
     - Rust compiler and Cargo
     - Go compiler and tools

   - **External Applications**
     - Development tools (VSCode, etc.)
     - Media applications (VLC, GIMP, OBS Studio, etc.)
     - Productivity tools (Thunderbird, Nextcloud, etc.)
     - Various applications via Flatpak (Discord, Telegram, Spotify, GitKraken, Bruno, etc.)

   - **Tailscale VPN**
     - Installation and service setup

   - **Neovim Setup**
     - Configuration using the kickstart.nvim repository

## Key Features

- **Cross-platform support**: Works seamlessly on both Ubuntu/Debian and Arch Linux
- **AUR integration**: Automatically sets up `yay` and installs AUR packages on Arch systems
- **Modern tooling**: Uses fnm instead of NVM for faster Node.js management
- **Fish shell optimization**: Proper Fish shell configuration for all tools
- **Idempotent operations**: Safe to run multiple times without conflicts

## Customization

To customize the installation:

1. **Add AUR packages (Arch Linux)**: Edit `roles/common/tasks/main.yml` and add entries to the AUR packages loop:
   ```yaml
   - { name: 'package-name-in-aur', binary: 'binary-executable-name' }
   ```

2. **Modify package lists**: Edit the respective task files in each role
3. **Add Python tools**: Update the UV tool installation loop in `roles/development/tasks/main.yml`
4. **Customize Flatpak apps**: Modify the Flatpak installation loop

## Supported Distributions

This playbook supports:
- **Ubuntu/Debian-based distributions**: Uses `apt` package manager and curl-based installations
- **Arch Linux**: Uses `pacman` for official packages and `yay` for AUR packages

## Notes

- Some tasks require internet connectivity
- The playbook will prompt for your sudo password
- Tasks are idempotent and can be run multiple times without issues
- **Arch Linux users**: The playbook automatically installs and configures `yay` AUR helper
