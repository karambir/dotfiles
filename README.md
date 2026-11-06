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
4. On Linux, enable the SSH agent systemd service: `systemctl --user enable --now ssh-agent`
5. For Kitty, get themes by running `kitten themes`
6. For tmux configuration, we use tpm as plugin manager. Get it by running `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

### Kitty screenshake

Failed interactive Fish commands trigger a silent, 150 ms horizontal shake in
Kitty, based on [Jonathan Davies's shader](https://jcd.pub/2026/11/04/screenshake-shaders-for-kitty/).
Requires Kitty 0.49+ and the Slang shader compiler (`slangc`). On Arch Linux,
install the compiler with `sudo pacman -S --needed shader-slang`.

Copy `config/kitty/shaders/` to `~/.config/kitty/shaders/` and
`config/fish/conf.d/kitty-screenshake.fish` to `~/.config/fish/conf.d/`.
The Kitty settings are in the terminal bell section of `config/kitty/kitty.conf`:
`custom_shaders shake`, `enable_audio_bell no`, and `visual_bell_duration 0.00001`.

Open a new Kitty window, or reload Kitty with `Ctrl+Shift+F5` and run
`source ~/.config/fish/conf.d/kitty-screenshake.fish` in existing Fish shells.
Run `false` to try it; `printf '\a'` tests the shader directly.
Adjust `max_displacement` (pixels) and `animation_stop` (milliseconds) in
`~/.config/kitty/shaders/shake.pipeline`, then reload Kitty.
To disable the effect, remove `custom_shaders shake`, set `visual_bell_duration 0`,
and remove the Fish snippet; reload Kitty and start a new Fish shell.

## Arch Linux Notes:

### ZFS update with yay

When updating ZFS packages, yay may fail with a dependency conflict like:
`installing zfs-utils (x.y.z) breaks dependency 'zfs-utils=x.y.z-old' required by zfs-dkms`

Fix: update both packages together in one transaction:
```
yay -S zfs-dkms zfs-utils
```

## macOS Note:

There is a macOS setup guide [here](./macos/new_setup.md) with [zshrc](./macos/.zshrc)

## License

See LICENSE.txt file in the repo
