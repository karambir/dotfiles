# My normal system setup

## normal apt install

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
- nginx
- postgresql-9.6
- postgresql-server-dev-9.6
- gnome-shell (make gdm default)
- chromium-browser
- thunderbird
- python-pip virtualenvwrapper
- jq
- s3cmd
- duplicity
- keepassxc
- nextcloud-client

## Setup python dev environment

- [Install Pyenv](https://github.com/pyenv/pyenv-installer) for managing multiple python versions
- [Install pipsi](https://github.com/mitsuhiko/pipsi) for installing user level pip packages easily. Install it using system python as pyenv installed pythons will get overrided more often.
- Pipsi install following:
  - youtube-dl
  - streamlink
  - awscli
  - ansible
  - fabric3
  - cookiecutter

## setup vim:

- copy vimrc from dotfiles repo
- remove all dir from .vim/bundle
- git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
- run vim and do BundleInstall
- copy wakatime key

## Setup SourceCodePro font

- sudo mkdir -p /usr/share/fonts/opentype
- sudo cp -r SourceCodePro_FontsOnly-1.017/OTF/\* /usr/share/fonts/opentype/

## External debs

- Virtualbox (default virtualbox do not play well with default vagrant)
- Vagrant
- Pycharm(install snap version is a good way)
- Steam
- Qwnotes
- Zulip and Mattermost chat clients
- Packer and Terraform
- Setup nvm and rvm if required
