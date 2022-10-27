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
alias myproxy='ssh -D 8123 -f -C -q -N $1'
alias watchcpu='watch -n.1 "cat /proc/cpuinfo | grep \"^[c]pu MHz\""'
alias generaterandom='openssl rand -hex $1'

#Arch linux
#alias _i="trizen -S"
#alias _ug="trizen -Syu --devel --show-ood --noedit --needed"
alias _ug="yay -Syu --devel --needed && flatpak update --noninteractive"
#alias _ug="sudo apt-get update && sudo apt-get upgrade -y && flatpak update --noninteractive"
alias sc="sudo systemctl"
alias dig='drill'
alias netstat='ss'
alias dc='docker compose'
alias docker-compose='docker compose'

alias df='df -h'
alias du='du -hs'
alias fo='xdg-open'
alias myip="curl ifconfig.co"
alias pyclean='find . -name \*.pyc -type f -ls -delete'
alias pipgrep='pip freeze | grep -i '
alias psgrep='ps aux | grep '
alias sshconfig="v ~/.ssh/config"
alias gitconfig="v ~/.gitconfig"
alias incognito='export HISTFILE=/dev/null'
alias yt='yt-dlp'
alias sl='streamlink'
alias slc='streamlink --player="vlc --network-caching 3000"'
alias sv='source .venv/bin/activate'
# alias cv='/usr/bin/virtualenv .venv -p $(pyenv which python)'
alias cv='python -m venv .venv'
alias rv='rm -r .venv'


# Run Programs 
alias p="python"
alias v="nvim"
alias vim="nvim"

# List directory contents
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -lhrt'
alias l='ls -a'
alias l1='ls -1'


# Sudo related
alias s="sudo"
alias _='sudo'
alias root="sudo su"

if [ $(uname) = "Linux" ]
then
  alias ls="ls --color=always"
fi
which gshuf &> /dev/null
if [ $? -eq 1 ]
then
  alias shuf=gshuf
fi

alias k='clear'
alias clr='clear'

alias edit="$EDITOR"

alias q="exit"

alias irc="$IRC_CLIENT"


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

function aliases-help() {
echo "Generic Alias Usage"
echo
echo "  sl      = ls"
echo "  ls      = ls -G"
echo "  la      = ls -AF"
echo "  ll      = ls -al"
echo "  l       = ls -a"
echo "  k/clr   = clear"
echo "  ..      = cd .."
echo "  ...     = cd ../.."
echo "  -       = cd -"
echo "  h       = history"
echo "  md      = mkdir -p"
echo "  rd      = rmdir"
echo "  editor  = $EDITOR"
echo "  q       = exit"
echo "  irc     = $IRC_CLIENT"
echo "  md      = mkdir -p"
echo "  rd      = rmdir"
echo " generaterandom = openssl rand -hex $1"
echo " _ug      = sudo apt-get update && sudo apt-get upgrade -y && flatpak update --noninteractive"
echo " sc       = sudo systemctl"
echo " dig      = drill"
echo " netstat  = ss"
echo " df       = df -h"
echo " du       = du -hs"
echo " fo       = xdg-open"
echo " myip     = curl ifconfig.co"
echo " psgrep   = ps aux | grep "
echo " dc       = docker compose"
echo
}

function python-help() {
echo "Python Dev Aliases Usage"
echo
echo " p       =  python"
echo " pyclean  = find . -name \*.pyc -type f -ls -delete"
echo " pipgrep  = pip freeze | grep -i "
echo " sv       = source .venv/bin/activate"
echo " cv       = python -m venv .venv"
echo " rv       = rm -r .venv"
echo
}

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
alias gph='git push heroku master'
alias gdv='git diff -w "$@" | nvim -R -'
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
    alias gd='git diff | nvim -R -'
    ;;
  darwin*)
    alias gd='git diff | nvim -R -'
    ;;
  darwin*)
    alias gd='git diff'
    ;;
esac



function git-help() {
  echo "Git Custom Aliases Usage"
  echo
  echo "  gcl	  = git clone"
  echo "  g       = git"
  echo "  get 	  = git"
  echo "  ga      = git add"
  echo "  gall	  = git add ."
  echo "  gst/gs  = git status"
  echo "  gss	  = git status -s"
  echo "  gl      = git pull"
  echo "  gp      = git push"
  echo "  gd      = git diff | nvim -R -"
  echo "  gdv     = git diff -w \"$@\" | nvim -R -"
  echo "  gc      = git commit -v -m"
  echo "  gce     = git commit --allow-empty-message -m ''"
  echo "  gcb     = git add . && git commit --allow-empty-message -m ''"
  echo "  gca     = git commit -v -a -m"
  echo "  gci 	  = git commit --interactive"
  echo "  gb      = git branch"
  echo "  gba     = git branch -a"
  echo "  gcount  = git shortlog -sn"
  echo "  gcp     = git cherry-pick"
  echo "  gco     = git checkout"
  echo "  gexport = git git archive --format zip --output"
  echo "  gdel    = git branch -d"
  echo "  gpo     = git push origin"
  echo "  gpl     = git push local"
  echo "  gph     = git push heroku master"
  echo "  gmu     = git fetch origin -v; git fetch upstream -v; git merge upstream/master"
  echo "  gll     = git log --graph --pretty=oneline --abbrev-commit"
  echo "  gitlog  = git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
  echo "  grb     = git rebase -p"
  echo "  gup     = git fetch origin && grb origin/<git_current_branch>"
  echo "  gpthis  = git push origin HEAD:<git_current_branch>"
  echo "  gm      = git merge --no-ff"
  echo "  gsync   = gup && gpthis"
  echo
}
