# Personal Dev Setup

## Install Homebrew

```sh
# Install Xcode Command Line Tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Configure Homebrew in your shell
echo >> $HOME/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## Install Applications

```sh
# Core utilities
brew install curl git gnupg gnu-sed rsync nmap starship neovim wget openssl@3 ca-certificates zlib readline xz libmagic libmxml libffi sqlite3 ssh-copy-id zsh-completions tmux

# CLI services
brew install redis postgresql@16 tailscale ollama

# Development tools
brew install go hugo uv poetry pre-commit ruff justfile google-cloud-sdk kubernetes-cli k9s hashicorp/tap/terraform dopplerhq/cli/doppler

# Modern CLI tools
brew install drill dust bat ripgrep zoxide tealdeer gitui httpie fzf erdtree

# GUI applications
brew install kitty nextcloud firefox firefox-nightly google-chrome bitwarden slack vlc iterm2 visual-studio-code cursor zed pycharm bruno

# Additional applications
brew install --cask handbrake tailscale

# Fonts
brew tap homebrew/cask-fonts
brew install font-fira-code font-fira-code-nerd-font font-fira-mono-nerd-font font-jetbrains-mono-nerd-font font-noto-nerd-font font-anonymous-pro font-inconsolata-nerd-font
```

## Configure Applications

```sh
# Start services
brew services start postgresql@16
brew services start redis
brew services start ollama

# Setup Google Cloud SDK
gcloud components update
gcloud init --no-launch-browser
```

### Zsh Configuration

1. Copy `.zshrc` to `$HOME`

2. If you encounter compinit/compaudit errors in a new terminal:

```sh
# Check which files/directories have permission issues
compaudit

# Fix common permission issues
chmod 755 /opt/homebrew/share/zsh/site-functions
chmod 755 /opt/homebrew/share/zsh/site-functions/_*
chmod 755 /opt/homebrew/share

# Verify the fix
compaudit
```

### Configure Git and SSH

1. Copy Git configuration:
   ```sh
   cp .gitconfig $HOME/
   ```

2. Copy SSH configuration:
   ```sh
   cp -r .ssh $HOME/
   ```

3. Generate a new SSH key (if needed):
   ```sh
   ssh-keygen -t ed25519 -f ~/.ssh/id_personal_$(date +%Y-%m-%d) -C "personal"
   ```

### Configure iTerm2

Our default terminal is **Kitty**, with iTerm2 as a backup. Load `iterm2-Profile-kb.json` in iTerm2 Profiles and set it as default.

### Configure Starship Prompt

Copy the configuration file:
```sh
cp .config/starship.toml ~/.config/
```

### Configure Kitty

Copy the configuration directory:
```sh
cp -r .config/kitty ~/.config/
```

### Configure Neovim

Use [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) or [NvChad](https://nvchad.com/)

### Configure Firefox

1. Go to `about:config` in Firefox and set `toolkit.legacyUserProfileCustomizations.stylesheets` to `true`
2. Find your Profile Folder by going to Menu > Help > More Troubleshooting Information
3. Create a `chrome` directory in your profile folder
4. Create `userChrome.css` in the `chrome` directory with the following content:
```css
/* Hides the native tabs */
#TabsToolbar {
  visibility: collapse;
}
```

## Python CLI Tools

Install using uv:

```sh
# Install Python versions
uv python install 3.10 3.11 3.12 3.13

# Install tools
uv tool install keyring --with keyrings.google-artifactregistry-auth
uv tool install yt-dlp
uv tool install cookiecutter
uv tool install gallery-dl
uv tool install streamlink
uv tool install pgcli
uv tool install aider-chat
uv tool install --python 3.12 open-webui
```
