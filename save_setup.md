# Save a setup

## Debian/Ubuntu
Get all installed apt apps:
```bash
sudo apt list --installed
```

## Flatpak (Cross-platform)
Get all flatpak packages:
```bash
flatpak list --app --columns=application
```

## Arch Linux
Get all explicitly installed packages (including AUR):
```bash
pacman -Qe
```

Get only AUR packages:
```bash
pacman -Qm
```
