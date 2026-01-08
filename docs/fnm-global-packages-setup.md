# fnm Global Packages Setup

When using fnm (Fast Node Manager), each Node version has its own isolated global packages directory. This means global packages installed with one Node version aren't available when switching to another version.

The solution is to configure npm to use a **shared global prefix directory** that's always in your PATH.

## Setup Steps

### 1. Create a persistent global packages directory

```bash
mkdir -p ~/.local/npm-global
```

### 2. Configure npm to use this directory

```bash
npm config set prefix ~/.local/npm-global
```

### 3. Add to your fish config

Add this to `~/.config/fish/config.fish`:

```fish
# Global npm packages path (shared across all Node versions)
fish_add_path "$HOME/.local/npm-global/bin"
```

### 4. Reload your shell

```bash
source ~/.config/fish/config.fish
```

### 5. Reinstall your global packages

```bash
npm install -g <package-name>
```

## Verification

```bash
which <package-name>
# Should show: $HOME/.local/npm-global/bin/<package-name>
```

## Why This Works

This approach keeps global tools separate from fnm-managed Node versions. The `~/.local/npm-global/bin` directory is always in your PATH, so switching Node versions won't affect your global CLI tools.
