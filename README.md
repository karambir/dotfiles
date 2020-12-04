# DotFiles

- Few Bash customisations
- vim using Vundle
- Terminator
- SSH

These dotfiles are extended and copied from various sources with appropriate license. A Big thanks to all of them.

## Features:

- Few bash customizations(some from [Paul Dotfiles](]https://github.com/paulirish/dotfiles))
- Bash aliases for daily usage commands with bash, git and some services.
- Print help for bash aliases.
- Bash status line configured with [Powerline](https://github.com/powerline/powerline).
- Vim themes and some basic plugins using Vundle.
- Lots of helpful git aliases from [here](https://github.com/theskumar/dotfiles)
- SSH config for modern algorithms from [Mozilla](https://infosec.mozilla.org/guidelines/openssh). For new ssh key: `ssh-keygen -t ed25519 -f ~/.ssh/id_karambir_$(date +%Y-%m-%d) -C "karambir personal"`

## Usage:

- Clone this repo in home directory
- Add a symbolic link to ./vim/vimrc at .vimrc
- Vimrc will install vim wakatime plugin. If you are not using it then it from .vim/vimrc file.
- Vimrc also try to use Source Code Pro font. Download it and install it in your system.
- Some programs may need to be installed via system package manager(pacman/apt/brew) or [pipx](https://github.com/pipxproject/pipx/).
- Have a look at [New Setup](new_setup.md) file for list of programs I have found helpful.

## Note:

The master branch is suitable for bash in Debian/Arch based systems. If you are working on MacOS then checkout the osx branch(Deprecated).

## License

See LICENSE.txt file in the repo
