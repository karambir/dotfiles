# System setup

## normal apt/pacman install

- make
- build-essential
- ubuntu-restricted-extras (will display Microsoft fonts license)
- ubuntu-restricted-addons
- nvim
- terminator
- git
- ca-certificates
- gnupg
- tree
- wget
- curl
- htop
- glances
- nethogs
- vnstat
- kitty
- tmux
- ldnsutils  (for drill command)
- gparted
- autojump
- fastfetch
- postgresql-16
- postgresql-contrib
- postgresql-server-dev-16
- redis-server
- chromium-browser
- thunderbird
- encfs
- securefs
- sirikali
- nextcloud-desktop
- ffmpeg
- vlc
- handbrake
- shotwell
- gimp
- timeshift
- obs-studio
- transmission-gtk
- nomacs
- code (Visual Studio Code)
- fonts-firacode
- fonts-noto-mono
- fonts-jetbrains-mono
- fonts-inconsolata
- fonts-anonymous-pro
- terraform
- restic
- uv

Some modern programs for traditional unix commands:

- exa (ls)
- drill (dig)
- ss (netstat)
- dust (du)
- bat (cat)
- ripgrep (grep)
- zoxide (autojump)
- tealdeer (man-pages, not quite a replacement)
- gitui (git TUI)
- httpie (curl for web apis)

With few commands:

```bash
sudo apt install make build-essential git ca-certificates gnupg tree wget curl htop glances nethogs vnstat tmux ldnsutils fastfetch autojump encfs securefs ffmpeg nvim kitty

sudo apt install bat exa ripgrep dust zoxide gitui httpie uv

sudo apt install postgresql-16 postgresql-server-dev-16 postgresql-contrib redis-server

sudo apt install ubuntu-restricted-extras ubuntu-restricted-addons

sudo apt install terminator gparted timeshift vlc handbrake shotwell nomacs gimp obs-studio thunderbird sirikali nextcloud-desktop transmission-gtk code

sudo apt install fonts-firacode fonts-noto-mono fonts-jetbrains-mono fonts-inconsolata fonts-anonymous-pro
```


## Setup bash prompt

- Install Starship `sh -c "$(curl -fsSL https://starship.rs/install.sh)"`


## Setup qemu/virtual machines

```bash
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
```

## Setup docker

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER
```

Put following in `/etc/docker/daemon.json`:

```json
{
    "dns": ["1.1.1.1", "1.0.0.1"]
}
```

## Setup neovim:

Setup using this [kickstart-repo](https://github.com/nvim-lua/kickstart.nvim). The docs there recommend cloning and forking it. For now, my usecase of vim is shrinking, so the initial setup from that repo is enough for me.


## External DEB/AUR/Flatpak

- Pycharm
- Tailscale
- Nextdns
- Tailscale
- Steam
- Telegram
- Discord
- Spotify
- Bitwarden
- Fractal
- Tootle
- Slack
- Postman
- Kdenlive
- DrawIO

One command for flatpaks

```bash
flatpak install com.axosoft.GitKraken \
  com.bitwarden.desktop \
  com.brave.Browser \
  com.discordapp.Discord \
  com.getpostman.Postman \
  com.github.bleakgrey.tootle \
  com.nextcloud.desktopclient.nextcloud \
  com.slack.Slack \
  com.spotify.Client \
  io.dbeaver.DBeaverCommunity \
  io.dbeaver.DBeaverCommunity.Client.mariadb \
  io.dbeaver.DBeaverCommunity.Client.pgsql \
  org.chromium.Chromium \
  org.gnome.Fractal \
  org.kde.gwenview \
  org.kde.okular \
  org.telegram.desktop \
  rest.insomnia.Insomnia \
  org.kde.kdenlive \
  com.jgraph.drawio.desktop
```


## Setup Tailscale

1. Make sure machine name is not conflicting with current [list](https://login.tailscale.com/admin/machines)
2. Use official [setup instructions](https://tailscale.com/download)


## Development Environment Setup

### Common Build Dependencies
The following packages are useful for building development tools from source. They might be needed by `uv` if it has to build a requested Python version from source when a pre-built version isn't available:
`sudo apt-get install libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev`

### Python with uv
`uv` is used for managing Python versions and installing Python CLI tools. Ensure `uv` is installed (it's included in the main `apt install` command list).

**Managing Python Versions with uv:**
- To list Python versions installable by `uv`: `uv python list-available` (this command is subject to change; refer to `uv python --help` for the latest usage).
- To install a specific Python version: `uv python install <version>` (e.g., `uv python install 3.13`)
- In your project directory, creating a `.python-version` file (e.g., containing `3.13`) allows `uv` to automatically use the specified Python version for commands like `uv pip install` or `uv run`.
- To create and activate a virtual environment with a specific Python version: `uv venv --python <version_or_path> .venv && source .venv/bin/activate`
  (Replace `<version_or_path>` with a specific version like `3.13` or the path to a Python executable).
- To create a virtual environment with the current Python version: `uv venv .venv && source .venv/bin/activate`

### Node.js with NVM
Node Version Manager (NVM) is used to manage Node.js versions.

**Install NVM:**
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```
After installation, source your shell's configuration file (e.g., `~/.bashrc`, `~/.zshrc`, or `~/.config/fish/config.fish`) or open a new terminal. Follow the NVM installation output instructions to add the necessary lines to your shell's startup file for automatic loading.

**Using NVM:**
- To install the latest LTS version of Node.js: `nvm install --lts`
- To install a specific version: `nvm install <version>` (e.g., `nvm install 20.10.0`)
- To list installed versions: `nvm ls`
- To use a specific version in the current shell: `nvm use <version>`
- To set a default Node.js version for new shells: `nvm alias default <version>`

### Rust and GoLang
For Rust and GoLang development, install the compilers and tools using your system's package manager (e.g., `apt`):

**Example:**
```bash
sudo apt install rustc cargo golang
```

## Python specific CLI tools

Use `uv tool install <package_name>` to install the following globally managed Python tools:
  - yt-dlp
  - streamlink
  - gallery-dl
  - cookiecutter
  - pgcli
  - poetry
  - pre-commit
  - aider-chat
  - open-webui
