# My normal system setup

## normal apt/pacman install

- make
- build-essential
- python-is-python3
- python3-dev
- ubuntu-restricted-extras (will display Microsoft fonts license)
- vim-gtk
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

With few commands:

```bash
sudo apt install make build-essential ubuntu-restricted-extras vim-gtk terminator git ca-certificates gnupg tree wget curl htop glances nethogs vnstat autojump neofetch jq make s3cmd duplicity encfs securefs ffmpeg pipx 

sudo apt install postgresql-13 postgresql-server-dev-13 postgresql-contrib redis-server
 
sudo apt install gparted timeshift vlc handbrake shotwell nomacs gimp obs-studio thunderbird sirikali nextcloud-desktop transmission-gtk
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
  - youtube-dl
  - yt-dlp
  - streamlink
  - awscli
  - ansible
  - cookiecutter
  - pgcli
  - poetry

## Setup vim:

- copy vimrc from dotfiles repo
- remove all dir from .vim/bundle
- git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
- run vim and do BundleInstall

## Setup SourceCodePro font

- sudo mkdir -p /usr/share/fonts/opentype
- sudo cp -r SourceCodePro_FontsOnly-1.017/OTF/\* /usr/share/fonts/opentype/

## External DEB/AUR/Flatpak

- Pycharm
- Tailscale
- Nextdns
- Terraform
- Tailscale
- Steam
- Qwnotes
- Telegram
- Discord
- Spotify
- Bitwarden
- Zoom
- Fractal
- Tootle
- Slack
- Postman

One command for flatpaks

```bash
flatpak install com.axosoft.GitKraken \
  com.bitwarden.desktop \
  com.discordapp.Discord \
  com.getpostman.Postman \
  com.github.bleakgrey.tootle \
  com.nextcloud.desktopclient.nextcloud \
  com.slack.Slack \
  com.spotify.Client \
  org.chromium.Chromium \
  org.gnome.Fractal \
  org.kde.gwenview \
  org.qownnotes.QOwnNotes \
  org.telegram.desktop \
  us.zoom.Zoom
```