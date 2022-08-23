###### ZSH

# bindings
bindkey "^R" history-incremental-search-backward
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# history
export HISTSIZE=500000
export SAVEHIST=900000
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS



###### CONFIGS
export PIPX_DEFAULT_PYTHON="/Users/karambir/.asdf/installs/python/3.9.13/bin/python"

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

# starship
eval "$(starship init zsh)"

# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# asdf
. /opt/homebrew/opt/asdf/asdf.sh
# eval "$(register-python-argcomplete pipx)"



###### PATHS
export PATH="/Users/karambir/.local/bin:$PATH"

export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

export PATH="/opt/homebrew/opt/ssh-copy-id/bin:$PATH"

export PATH="/opt/homebrew/opt/curl/bin:$PATH"

export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"




# ALIASES

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

alias _ug="sudo apt-get update && sudo apt-get upgrade -y && flatpak update --noninteractive"
alias sc="sudo systemctl"
alias dig='drill'
alias netstat='ss'

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
alias sl='streamlink'
alias slc='streamlink --player="vlc --network-caching 3000"'
alias sv='source .venv/bin/activate'
alias cv='python -m venv .venv'
alias rv='rm -r .venv'


# Run Programs
alias p="python"
alias v="vim"

# Django Commands
alias djrun="./manage.py runserver"
alias djshell="./manage.py shell_plus"
alias djmigrate="./manage.py migrate"
alias djstatic="./manage.py collecstatic"

# List directory contents
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -lhrt'
alias l='ls -a'
alias l1='ls -1'

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
