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
   - Essential command-line tools
   - Modern replacements for traditional Unix commands
   - Terminal emulators (Terminator, Kitty)
   - Fonts and system utilities

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
     - Build dependencies
     - UV package manager
     - Common Python CLI tools (yt-dlp, streamlink, gallery-dl, etc.)

   - **Node.js Environment**
     - NVM (Node Version Manager)
     - Latest LTS Node.js version

   - **Rust and Go**
     - Rust compiler and Cargo
     - Go compiler and tools

   - **External Applications**
     - Development tools (VSCode, etc.)
     - Media applications (VLC, GIMP, etc.)
     - Productivity tools
     - Various applications via Flatpak (Discord, Telegram, Spotify, etc.)

   - **Tailscale VPN**
     - Installation and service setup

   - **Neovim Setup**
     - Configuration using the kickstart.nvim repository

## Customization

To customize the installation:

1. Modify the roles in the `roles` directory
2. Add or remove packages in the task files
3. Adjust variables in the playbook or create a separate variables file

## Supported Distributions

This playbook supports:
- Ubuntu/Debian-based distributions
- Arch Linux

## Notes

- Some tasks require internet connectivity
- The playbook will prompt for your sudo password
- Tasks are idempotent and can be run multiple times without issues
