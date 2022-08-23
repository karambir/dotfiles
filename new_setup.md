# My normal system setup

## Brew List

### Formulae

- asdf
- autojump
- curl
- ffmpeg
- git
- gnupg
- nmap
- openssl
- pipx
- postgresql
- python@3.10
- readline
- redis
- rsync
- sqlite3
- ssh-copy-id
- starship
- vim
- wget
- xz
- zlib
- zsh-completions

### Casks

- firefox
- google-chrome
- brave-browser
- bitwarden
- slack
- vlc
- handbrake
- iterm2
- visual-studio-code
- pycharm
- webstorm
- postman
- font-fira-code
- font-fira-code-nerd-font
- font-fira-mono-nerd-font
- font-jetbrains-mono-nerd-font
- font-noto-nerd-font
- macfuse
- osxfuse

## Brew Install

```bash
brew install asdf autojump curl ffmpeg git gnupg nmap openssl pipx postgresql python@3.10 readline redis rsync sqlite3 ssh-copy-id starship vim wget xz zlib zsh-completions

brew tap homebrew/cask-fonts

brew install dopplerhq/cli/doppler

brew install firefox google-chrome brave-browser bitwarden slack vlc handbrake iterm2 visual-studio-code pycharm webstorm postman

brew install font-fira-code font-fira-code-nerd-font font-fira-mono-nerd-font font-jetbrains-mono-nerd-font font-noto-nerd-font

brew install macfuse osxfuse
```

## Setup ASDF for multiple dev env

- ASDF need some apt packages for installing python from tar.gz: `readline zlib xz`. [Check ASDF](https://asdf-vm.com/) for other requirements.

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
