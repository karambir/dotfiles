# DotFiles

- Fish shell customisations and aliases
- Neovim as Editor
- Starship as shell prompt
- Kitty and Terminator config
- Tmux config
- SSH config

These dotfiles are extended and copied from various sources with appropriate license. A Big thanks to all of them.

## Features:

- Few [Fish](https://fishshell.com/) shell customizations and aliases
- Some Bash shell customizations and aliases are also present in `.bashrc`, `.bash_paths` and `.bash_aliases`
- Modern and fast terminal emulator [Kitty](https://sw.kovidgoyal.net/kitty/).
- Shell prompt configured with [Starship](https://starship.rs)
- [Neovim](https://neovim.io/) config using [nvchad](https://nvchad.com)
- A collection of helpful git aliases from [here](https://github.com/theskumar/dotfiles)
- SSH config for modern algorithms from [Mozilla](https://infosec.mozilla.org/guidelines/openssh). For new ssh key: `ssh-keygen -t ed25519 -f ~/.ssh/id_personal_$(date +%Y-%m-%d) -C "personal"`
- A comprehensive list of development tools, CLI utilities, and GUI applications. See [New Setup](./new_setup.md) and [Ansible Setup](./ansible-setup/README.md). Automated setup using Ansible with support for both Debian-based and Arch Linux systems

## Usage:

- Clone this repo in home directory `git clone https://github.com/karambir/dotfiles.git`
- Run `ansible-playbook -i inventory site.yml --ask-become-pass` from `ansible-setup` directory to install the programs
- Copy `.config` directories for fish, terminator, tmux, starship and neovim
- For Kitty, get themes by `kitten themes`
- For tmux config, we use tpm as plugin manager. Get it by `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

## Note:

The main branch is suitable for fish and bash in Debian/Arch based systems. If you are working on MacOS then checkout the macos branch.

## License

See LICENSE.txt file in the repo
