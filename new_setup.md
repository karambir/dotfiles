# My normal system setup

## normal apt/pacman install

- build-essential
- python-dev
- python3-dev
- ubuntu-restricted-extras (will display Microsoft fonts license)
- vim-gtk
- terminator
- git
- tree
- curl
- ipython
- gparted
- postgresql-12
- postgresql-server-dev-12
- chromium-browser
- thunderbird
- python-pip virtualenvwrapper
- jq
- s3cmd
- duplicity
- nextcloud-client

## Setup python dev environment

- [Install Pyenv](https://github.com/pyenv/pyenv-installer) for managing multiple python versions
- [Install pipx](https://github.com/pipxproject/pipx/) for installing user level pip packages easily. Install it using system python as pyenv installed pythons will get overrided more often.
- Pipx install following:
  - youtube-dl
  - streamlink
  - awscli
  - ansible
  - cookiecutter
  - tox

## setup vim:

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
- Packer and Terraform
- Steam
- Qwnotes
- Telegram
- Discord
- Spotify
- Bitwarden
- Glimpse
- Fractal
- gitg