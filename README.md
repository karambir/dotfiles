# Dotfiles

Personal development environment configuration including:

- Fish shell customizations and aliases
- Neovim as editor
- Starship as shell prompt
- Kitty and Terminator configurations
- Tmux configuration
- SSH configuration

These dotfiles are extended and copied from various sources with appropriate licenses. A big thanks to all of them.

## Features:

- Few [Fish](https://fishshell.com/) shell customizations and aliases
- Some Bash shell customizations and aliases are also present in `.bashrc`, `.bash_paths`, and `.bash_aliases`
- Modern and fast terminal emulator [Kitty](https://sw.kovidgoyal.net/kitty/)
- Shell prompt configured with [Starship](https://starship.rs)
- [Neovim](https://neovim.io/) configuration using [nvchad](https://nvchad.com)
- A collection of helpful git aliases from [here](https://github.com/theskumar/dotfiles)
- SSH configuration for modern algorithms from [Mozilla](https://infosec.mozilla.org/guidelines/openssh)
- A comprehensive list of development tools, CLI utilities, and GUI applications. See [New Setup](./new_setup.md) and [Ansible Setup](./ansible-setup/README.md). Automated setup using Ansible with support for both Debian-based and Arch Linux systems

## Usage:

1. Clone this repo in your home directory: `git clone https://github.com/karambir/dotfiles.git`
2. Run `ansible-playbook -i inventory site.yml --ask-become-pass` from the `ansible-setup` directory to install the programs
3. Copy `.config` directories for fish, terminator, tmux, starship, and neovim
4. For Kitty, get themes by running `kitten themes`
5. For tmux configuration, we use tpm as plugin manager. Get it by running `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

## macOS Note:

There is a macOS setup guide [here](./macos/new_setup.md) with [zshrc](./macos/.zshrc)

## License

See LICENSE.txt file in the repo
