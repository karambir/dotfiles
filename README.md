# DotFiles

- Few Bash customisations and aliases
- Neovim as Editor
- Starship as shell prompt
- Kitty, Terminator and Alacritty config
- Tmux config
- SSH config

These dotfiles are extended and copied from various sources with appropriate license. A Big thanks to all of them.

## Features:

- Few bash customizations(some from [Paul Dotfiles](]https://github.com/paulirish/dotfiles))
- Modern and fast terminal emulator [Kitty](https://sw.kovidgoyal.net/kitty/). Previous config with Alacritty with Tmux is also available
- Shell prompt(Bash) configured with [Starship](https://starship.rs)
- [Neovim](https://neovim.io/) config using [nvchad](https://nvchad.com)
- Bash aliases for daily usage commands with bash, git and some services
- Print help for bash aliases
- Lots of helpful git aliases from [here](https://github.com/theskumar/dotfiles)
- SSH config for modern algorithms from [Mozilla](https://infosec.mozilla.org/guidelines/openssh). For new ssh key: `ssh-keygen -t ed25519 -f ~/.ssh/id_personal_$(date +%Y-%m-%d) -C "personal"`
- A list of commonly used cli and gui programs to one can install via apt and flatpak. See [New Setup](./new_setup.md)

## Usage:

- Clone this repo in home directory
- Copy `.config` dirs for terminator, alacritty, tmux, starship and neovim
- Some programs may need to be installed via system package manager(pacman/apt/brew) or [pipx](https://github.com/pipxproject/pipx/)
- Have a look at [New Setup](new_setup.md) file for list of programs I have found helpful
- Terminator config uses *FiraCode Nerd Font Mono* font for starship prompt. Install nerd fonts first
- For Kitty, get themes by `kitten themes`
- For tmux config, we use tpm as plugin manager. Get it by `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

## Note:

The main branch is suitable for bash in Debian/Arch based systems. If you are working on MacOS then checkout the macos branch.

## License

See LICENSE.txt file in the repo
