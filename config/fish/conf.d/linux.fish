if test (uname) != Linux
    exit
end

fish_add_path "$HOME/.local/share/fnm"
fish_add_path /var/lib/flatpak/exports/bin/
fish_add_path $HOME/.local/share/JetBrains/Toolbox/scripts

if status is-interactive
    set -gx MAKEFLAGS "--jobs=(nproc --ignore=4)"
end

if command -v apt > /dev/null
    alias _ug "sudo apt update && sudo apt upgrade"
else if command -v yay > /dev/null
    alias _ug "yay -Syu --devel --needed && flatpak update --noninteractive"
    alias unlock "sudo rm /var/lib/pacman/db.lck"
    alias orphan "sudo pacman -Rns (pacman -Qtdq)"
else if command -v pacman > /dev/null
    alias _ug "sudo pacman -Syu"
    alias unlock "sudo rm /var/lib/pacman/db.lck"
    alias orphan "sudo pacman -Rns (pacman -Qtdq)"
else if command -v dnf > /dev/null
    alias _ug "sudo dnf upgrade"
end

alias sc "sudo systemctl"
alias scu "systemctl --user"
alias fo "xdg-open"
alias watchcpu 'watch -n.1 "cat /proc/cpuinfo | grep \"^[c]pu MHz\""'
if test -z "$SSH_AGENT_PID"; and status is-interactive
    set -U XDG_RUNTIME_DIR (mktemp -d -p "$TMPDIR" ssh-agent.XXXXXX)
    eval (ssh-agent -c | sed 's/^echo/#echo/') > /dev/null
end
