# macOS Dotfiles

Personal development environment configuration for macOS including:

- Zsh shell customizations and aliases
- Neovim as primary editor
- Starship as shell prompt
- Kitty and iTerm2 terminal configurations
- SSH configuration

These dotfiles are extended and copied from various sources with appropriate licenses. A big thanks to all of them.

## Features

- Modern [Zsh](https://www.zsh.org/) shell customizations and aliases
- Fast terminal emulator [Kitty](https://sw.kovidgoyal.net/kitty/) with [iTerm2](https://iterm2.com) as backup
- Shell prompt configured with [Starship](https://starship.rs)
- [Neovim](https://neovim.io/) configuration using [nvchad](https://nvchad.com)
- Helpful git aliases from [here](https://github.com/theskumar/dotfiles)
- SSH configuration for modern algorithms from [Mozilla](https://infosec.mozilla.org/guidelines/openssh)


## Usage

1. Follow the [new_setup.md](./new_setup.md) file to configure zsh, brew, and core utilities
2. Clone this repo in your home directory:
   ```sh
   git clone https://github.com/karambir/dotfiles.git
   ```
3. For Kitty themes, run:
   ```sh
   kitten themes
   ```

## Note

The `main` branch is configured for fish and bash shells on Debian/Arch-based systems. For macOS users, please use the `macos` branch.

## License

See LICENSE.txt file in the repository.
