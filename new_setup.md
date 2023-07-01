# My normal system setup

## normal apt/pacman install

- make
- build-essential
- python-is-python3
- python3-dev
- python3-venv
- ubuntu-restricted-extras (will display Microsoft fonts license)
- ubuntu-restricted-addons
- vim-gtk
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
- tmux
- ldnsutils  (for drill command)
- gparted
- autojump
- neofetch
- postgresql-13
- postgresql-contrib
- postgresql-server-dev-13
- redis-server
- chromium-browser
- thunderbird
- jq
- s3cmd
- duplicity
- encfs
- securefs
- sirikali
- nextcloud-desktop
- ffmpeg
- vlc
- handbrake
- shotwell
- gimp
- pipx
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
sudo apt install make build-essential python3-dev python3-venv python-is-python3 git ca-certificates gnupg tree wget curl htop glances nethogs vnstat tmux ldnsutils autojump neofetch jq s3cmd duplicity encfs securefs ffmpeg pipx nvim

sudo apt install postgresql-13 postgresql-server-dev-13 postgresql-contrib redis-server

sudo apt install ubuntu-restricted-extras ubuntu-restricted-addons

sudo apt install vim-gtk terminator gparted timeshift vlc handbrake shotwell nomacs gimp obs-studio thunderbird sirikali nextcloud-desktop transmission-gtk code

sudo apt install fonts-firacode fonts-noto-mono fonts-jetbrains-mono fonts-inconsolata fonts-anonymous-pro
```

## Setup bash prompt

- Install Starship `sh -c "$(curl -fsSL https://starship.rs/install.sh)"`

## Setup qemu/virtual machines

`sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager`

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

## Setup ASDF for multiple dev env

- ASDF need some apt packages for installing python from tar.gz.
- `sudo apt-get install libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev`
- [Install ASDF](https://asdf-vm.com/) for managing multiple python, rust and node versions

```bash
asdf plugin add python
asdf plugin add rust
asdf plugin add nodejs
asdf plugin add golang
asdf install rust latest
asdf install nodejs lts
asdf install python latest
asdf install golang latest

asdf global python system
asdf global nodejs lts
asdf global rust latest
asdf global golang latest
```

[GitUI](https://github.com/extrawurst/gitui) is very handy tool for git operations. Install it with:

```sh
cargo install gitui
asdf reshim rust
```

Issue with asdf rust reshim: https://github.com/code-lever/asdf-rust/issues/14

## Python specific CLI tools

- [Install pipx](https://github.com/pipxproject/pipx/) for installing user level pip packages easily. Install it using system python as pyenv installed pythons will get overrided more often.
- Pipx install following:
  - yt-dlp
  - streamlink
  - gallery-dl
  - awscli
  - ansible (add `--include-deps` flag)
  - cookiecutter
  - pgcli
  - poetry
  - pre-commit
  - duplicity


> Duplicity requires systems libs like: `librsync-dev intltool`


## Setup vim:

- copy vimrc from dotfiles repo to `~/.vimrc`
- remove all dir from .vim/bundle
- ` git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
- run vim and do `:PluginInstall`


## Setup neovim:

- copy `.config/nvim` from dotfiles repo to `~/.config/nvim`
- More info [here](https://nvchad.com/quickstart/install#pre-requisites)


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