# Dot Files

- Bash using powerline-shell
- vim using Vundle
- Terminator
- SSH

These dotfiles are extended and copied from various sources with appropriate license. A Big thanks to all of them.

## Features:

- Bash aliases for daily usage commands with bash, git and some services.
- Print help for bash aliases.
- Vim themes and some basic plugins using Vundle.
- A colorful bash prompt with various info from powerline-shell.
- Lots of helpful git aliases from [here](https://github.com/theskumar/dotfiles)
- SSH config for modern algorithms from [Mozilla](https://infosec.mozilla.org/guidelines/openssh). For new ssh key: `ssh-keygen -t ed25519 -f ~/.ssh/id_karambir_$(date +%Y-%m-%d) -C "karambir personal"`

## Usage:

- Clone this repo in home directory
- Add a symbolic link to ./vim/vimrc at .vimrc
- Vimrc will install vim wakatime plugin. If you are not using it then it from .vim/vimrc file.
- Vimrc also try to use Source Code Pro font. Download it and install it in your system.

## Note:

The master branch is suitable for bash in Ubuntu/Debian based systems. If you are working on MacOS then checkout the osx branch(Deprecated).

## License

See LICENSE.txt file in the repo
