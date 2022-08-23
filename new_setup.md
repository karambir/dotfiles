# My normal system setup

## normal brew install

==> Formulae
asdf
autojump
curl
doppler
ffmpeg
git
gnupg
nmap
openssl
pipx
postgresql
python@3.10
readline
redis
rsync
sqlite3
ssh-copy-id
starship
vim
wget
xz
zlib
zsh-completions

==> Casks
bitwarden
brave-browser
font-fira-code
font-fira-code-nerd-font
font-fira-mono-nerd-font
font-jetbrains-mono-nerd-font
font-noto-nerd-font
handbrake
iterm2
macfuse
osxfuse
postman
pycharm
visual-studio-code
vlc
webstorm

## Setup bash prompt

- Install Starship `sh -c "$(curl -fsSL https://starship.rs/install.sh)"`

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
  - ansible
  - cookiecutter
  - pgcli
  - poetry
  - duplicity


> Duplicity requires systems libs like: `librsync-dev intltool`


## Setup vim:

- copy vimrc from dotfiles repo to `~/.vimrc`
- remove all dir from .vim/bundle
- ` git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
- run vim and do `:PluginInstall`


## Setup Tailscale

1. Make sure machine name is not conflicting with current [list](https://login.tailscale.com/admin/machines)
2. Use official [setup instructions](https://tailscale.com/download)