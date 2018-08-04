# Dot Files

- Bash
- vim
- Terminator
- SSH

These dotfiles were initially extended from [Swarrop CH dotbash](https://github.com/swaroopch/dotbash).

## Features:

- Bash aliases for daily usage commands with bash, git, django, vagrant and service management like postgres, mysql, nginx.
- Print help for bash aliases.
- Vim themes and some basic plugins using Bundle.
- A colorful bash prompt with info about git branch and virtualenv. From [this gist](https://gist.github.com/insin/1425703)
- Lots of helpful git aliases from [here](https://github.com/theskumar/dotfiles)
- SSH config for modern algorithms from [Mozilla](https://infosec.mozilla.org/guidelines/openssh). For new ssh key: `ssh-keygen -t ed25519 -f ~/.ssh/id_karambir_$(date +%Y-%m-%d) -C "karambir personal"`

## Usage:

- Clone this repo in home directory
- Add a symbolic link to ./vim/vimrc at .vimrc
- Vimrc will install vim wakatime plugin. If you are not using it then it from .vim/vimrc file.
- Vimrc also try to get Source Code Pro font. Download it and install it in your system.

## Note:

The master branch is suitable for bash in Ubuntu/Debian based systems. If you are working on MacOS then checkout the osx branch.

## License

See LICENSE.txt file in the repo
