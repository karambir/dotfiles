###### ZSH
#-------------------------------------
# bindings
bindkey "^R" history-incremental-search-backward
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
# Bind option+leftArrow and option+rightArrow for moving cursor forward or backwards one word
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

# history
export HISTSIZE=500000
export SAVEHIST=900000
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS

# Set language
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

###### CONFIGS
#-------------------------------------

# macos multithreading allow
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export EDITOR=nvim

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

# starship for prompt
eval "$(starship init zsh)"

# zoxide for cd
eval "$(zoxide init --cmd j zsh)"

###### PATHS
#-------------------------------------
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

export PATH="/opt/homebrew/opt/ssh-copy-id/bin:$PATH"

export PATH="/opt/homebrew/opt/curl/bin:$PATH"

export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/.google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/.google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/.google-cloud-sdk/completion.zsh.inc'; fi


# export PATH="/opt/homebrew/opt/kubernetes-cli/bin:$PATH"
# using kubectl, docker, helm commands from rancher desktop
export PATH="$HOME/.rd/bin:$PATH"

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"


###### COMPILER FLAGS
#-------------------------------------
# zlib
export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig"

# curl
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/curl/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/opt/homebrew/opt/curl/lib/pkgconfig"

# sqlite
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/sqlite/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/opt/homebrew/opt/sqlite/lib/pkgconfig"

##### ALIASES
#-------------------------------------
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

alias dig='drill'
alias du='dust'
alias cat='bat'
alias grep='rg'
alias curl='curlie'
alias tree='erd'

alias _ug="brew update && brew upgrade"
alias sc="brew services"
alias dc='docker compose'
alias docker-compose='docker compose'
alias df='df -h'
alias myip="curl -4 ifconfig.co"
alias myipany="curl ifconfig.co"
alias pyclean='find . -name \*.pyc -type f -ls -delete'
alias pipgrep='pip freeze | grep -i '
alias psgrep='ps aux | grep '
alias incognito='export HISTFILE=/dev/null'
alias sl='streamlink'
alias slc='streamlink --player="vlc --network-caching 3000"'
alias sv='source .venv/bin/activate'
alias cv='uv venv --python $1'
alias rv='rm -r .venv'
alias vimdiff='nvim -d'

# Run Programs
alias p="python"
alias v="nvim"
alias vim="nvim"
# alias docker="nerdctl"

# List directory contents
alias ls='eza -al --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing

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

# Directory
alias md='mkdir -p'
alias rd=rmdir

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
