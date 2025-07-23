# System Setup Guide

## Essential Packages

The following essential packages should be installed on your system:

### Base System Utilities
- make, build-essential
- git, ca-certificates, gnupg
- tree, wget, curl
- htop, glances, nethogs, vnstat
- tmux, ldnsutils, fastfetch
- autojump, encfs, securefs, sirikali
- ffmpeg, nvim, kitty

### Modern CLI Tools
These are modern alternatives to traditional Unix commands:
- exa (replacement for ls)
- drill (replacement for dig, provided by ldnsutils)
- dust (replacement for du)
- bat (replacement for cat)
- ripgrep (replacement for grep)
- zoxide (replacement for autojump)
- tealdeer (simplified man pages)
- gitui (git TUI)
- httpie (replacement for curl for web APIs)

### Desktop Applications
- Terminator (terminal emulator)
- GParted (partition editor)
- Timeshift (system backup)
- VLC, HandBrake (media players)
- Shotwell, Nomacs, GIMP (image editing)
- OBS Studio (screen recording)
- Thunderbird (email client)
- Nextcloud Desktop (file sync)
- Transmission-GTK (BitTorrent client)
- Visual Studio Code

### Fonts
- Fira Code
- Noto Mono
- JetBrains Mono
- Inconsolata
- Anonymous Pro

### Media Codecs
- ubuntu-restricted-extras
- ubuntu-restricted-addons

## Development Environment

### Database Servers
- PostgreSQL 16 and related packages
- Redis server

### Terminal Prompt
Install Starship for a better terminal prompt experience.

### Virtualization
Set up QEMU/KVM for running virtual machines:
- qemu-kvm
- libvirt-daemon-system
- libvirt-clients
- bridge-utils
- virt-manager

### Docker
Install Docker Engine and related packages:
- docker-ce
- docker-ce-cli
- containerd.io
- docker-buildx-plugin
- docker-compose-plugin

Configure Docker to use Cloudflare DNS (1.1.1.1, 1.0.0.1).

### Neovim Setup
Set up Neovim using the [kickstart-repo](https://github.com/nvim-lua/kickstart.nvim).

## External Applications

The following applications can be installed via Flatpak, DEB, AUR, or other package managers:
- PyCharm
- Tailscale
- NextDNS
- Steam
- Telegram
- Discord
- Spotify
- Bitwarden
- Fractal
- Tootle
- Slack
- Bruno
- Kdenlive
- Draw.io
- GitKraken
- DBeaver Community
- Brave Browser
- Chromium
- Insomnia
- Okular
- Gwenview

## Tailscale VPN Setup
1. Ensure your machine name doesn't conflict with existing devices
2. Follow the official [setup instructions](https://tailscale.com/download)

## Development Environment Setup

### Common Build Dependencies
The following packages are useful for building development tools from source:
- libssl-dev, zlib1g-dev, libbz2-dev
- libreadline-dev, libsqlite3-dev
- llvm, libncursesw5-dev, xz-utils, tk-dev
- libxml2-dev, libxmlsec1-dev, libffi-dev, liblzma-dev

### Python with UV
Use UV for managing Python versions and installing Python CLI tools:
- Install specific Python versions
- Create and manage virtual environments
- Install global Python tools

### Node.js with FNM
Use Fast Node Manager (FNM) to manage Node.js versions:
- Install and switch between different Node.js versions
- Set default Node.js version for new shells

### Rust and Go
Install the compilers and tools for Rust and Go development.

### Python CLI Tools
Install these useful Python CLI tools:
- yt-dlp (YouTube downloader)
- streamlink (stream media player)
- gallery-dl (image gallery downloader)
- cookiecutter (project templates)
- pgcli (PostgreSQL CLI)
- poetry (Python dependency management)
- pre-commit (Git hooks manager)
- aider-chat (AI coding assistant)
- open-webui (UI for AI models)

---

**Note:** This setup can be automated using the Ansible playbook available in the [ansible-setup](ansible-setup/) directory. See the [README](ansible-setup/README.md) for instructions on how to use the playbook to automate the installation of all these components on Ubuntu or Arch Linux systems.
