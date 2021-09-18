# My normal system setup

## normal apt/pacman install

- make
- build-essential
- python-dev
- python3-dev
- ubuntu-restricted-extras (will display Microsoft fonts license)
- vim-gtk
- terminator
- git
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
- postgresql-12
- postgresql-server-dev-12
- chromium-browser
- thunderbird
- python-pip virtualenvwrapper
- jq
- s3cmd
- duplicity
- encfs
- securefs
- sirikali
- nextcloud-client
- ffmpeg
- vlc
- handbrake
- shotwell
- gimp
- pipx

## Setup bash prompt

- Install Starship `sh -c "$(curl -fsSL https://starship.rs/install.sh)"`

## Setup qemu/virtual machines

`sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager`

## Setup ASDF for multiple dev env

- ASDF need some apt packages for installing python from tar.gz.
- `sudo apt-get install libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev`
- [Install ASDF](https://asdf-vm.com/) for managing multiple python, rust and node versions

```bash
asdf plugin add python
asdf plugin add rust
asdf plugin add nodejs
asdf install rust latest
asdf install nodejs lts
asdf install python latest
```


## Python specific CLI tools

- [Install pipx](https://github.com/pipxproject/pipx/) for installing user level pip packages easily. Install it using system python as pyenv installed pythons will get overrided more often.
- Pipx install following:
  - youtube-dl
  - streamlink
  - awscli
  - ansible
  - cookiecutter
  - tox

## Setup vim:

- copy vimrc from dotfiles repo
- remove all dir from .vim/bundle
- git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
- run vim and do BundleInstall
- copy wakatime key

## Setup SourceCodePro font

- sudo mkdir -p /usr/share/fonts/opentype
- sudo cp -r SourceCodePro_FontsOnly-1.017/OTF/\* /usr/share/fonts/opentype/

## External DEB/AUR/Flatpak

- Pycharm
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