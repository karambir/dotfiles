#!/bin/bash

function loaddotenv() {
#   if [ ! -f .env ]
#   then
#     export $(cat .env | xargs)
#   fi
  if [ -f .env ]
  then
    export $(cat .env | sed 's/#.*//g' | xargs)
  fi
}

alias mycow='fortune | cowsay'
# alias myproxy='ssh -D 8123 -f -C -q -N $1'
alias myproxystart='ssh -D 8123 -S /tmp/.ssh-myproxy -M -f -C -q -N $1'
alias myproxycheck='ssh -S /tmp/.ssh-myproxy -O check $1'
alias myproxyexit='ssh -S /tmp/.ssh-myproxy -O exit $1'
alias watchcpu='watch -n.1 "cat /proc/cpuinfo | grep \"^[c]pu MHz\""'
alias generaterandom='openssl rand -hex $1'
alias incognito='export HISTFILE=/dev/null'
alias myip="curl -4 ifconfig.co"
alias myip6="curl -6 ifconfig.co"

# Arch linux
alias _ug="yay -Syu --devel --needed && flatpak update --noninteractive"
#alias _ug="sudo apt-get update && sudo apt-get upgrade -y && flatpak update --noninteractive"

# pacman and yay
# Ref https://gitlab.com/dwt1/dotfiles
alias pacsyu='sudo pacman -Syu'                  # update only standard pkgs
alias pacsyyu='sudo pacman -Syyu'                # Refresh pkglist & update standard pkgs
alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias orphan='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages (DANGEROUS!)


# Shortcuts
alias sc="sudo systemctl"
alias dc='docker compose'
alias docker-compose='docker compose'
alias df='df -h'
alias fo='xdg-open'
alias pyclean='find . -name \*.pyc -type f -ls -delete'
alias pipgrep='pip freeze | grep -i '
alias psgrep='ps aux | grep '
alias sshconfig="v ~/.ssh/config"
alias gitconfig="v ~/.gitconfig"
alias slc='streamlink --player="vlc --network-caching 3000"'
alias sv='source .venv/bin/activate'
alias cv='python -m venv .venv'
alias rv='rm -r .venv'

# Alternate programs for common commands
alias ls='eza -al --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias vimdiff='nvim -d'

alias dig='drill'
alias netstat='ss'
alias du='dust'
alias cat='bat'
alias grep='rg'
alias curl='curlie'

# Run Programs 
alias p="python"
alias v="vim"
alias yt='yt-dlp'
alias sl='streamlink'


# Sudo related
alias s="sudo"
alias _='sudo'
alias root="sudo su"

which gshuf &> /dev/null
if [ $? -eq 1 ]
then
  alias shuf=gshuf
fi

alias k='clear'
alias clr='clear'

alias edit="$EDITOR"

alias q="exit"

alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up two directories
alias -- -="cd -"        # Go back

# Shell History
alias h='history'

# Tree
if [ ! -x "$(which tree)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# Directory
alias	md='mkdir -p'
alias	rd=rmdir

# Git Aliases
alias gcl='git clone'
alias ga='git add'
alias gall='git add .'
alias g='git'
alias get='git'
alias gst='git status'
alias gs='git status'
alias gss='git status -s'
alias gl='git pull'
alias gp='git push'
alias gpo='git push origin'
alias gpl='git push local'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v -m'
alias gca='git commit -v -a -m'
alias gce='git commit --allow-empty-message -m ""'
alias gcb='git add . && git commit --allow-empty-message -m ""'
alias gci='git commit --interactive'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gexport='git archive --format zip --output'
alias gdel='git branch -d'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

## https://gist.github.com/590895
## via http://notes.envato.com/developers/rebasing-merge-commits-in-git/
function git_current_branch() {
  git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}

alias grb='git rebase -p'
alias gup='git fetch origin && grb origin/$(git_current_branch)'
alias gpthis='git push origin HEAD:$(git_current_branch)'
alias gm='git merge --no-ff'
alias gsync='git fetch origin && git rebase -p origin/$(git_current_branch) && git push origin HEAD:$(git_current_branch)'

case $OSTYPE in
  linux*)
    alias gd='git diff | vim -R -'
    ;;
  darwin*)
    alias gd='git diff | vim -R -'
    ;;
  darwin*)
    alias gd='git diff'
    ;;
esac
