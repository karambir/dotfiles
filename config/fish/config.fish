set -x LANG en_US.UTF-8
set fish_greeting

if status is-interactive
    set -gx EDITOR nvim
    set -gx MANPAGER "sh -c 'sed -u -e \\\"s/\\\\x1B\\[[0-9;]*m//g; s/.\\\\x08//g\\\" | bat -p -lman'"

    set -gx LESS_TERMCAP_mb (printf '\e[01;31m')
    set -gx LESS_TERMCAP_md (printf '\e[01;38;5;74m')
    set -gx LESS_TERMCAP_me (printf '\e[0m')
    set -gx LESS_TERMCAP_se (printf '\e[0m')
    set -gx LESS_TERMCAP_so (printf '\e[38;5;246m')
    set -gx LESS_TERMCAP_ue (printf '\e[0m')
    set -gx LESS_TERMCAP_us (printf '\e[04;38;5;146m')
end

# OS-specific paths are in conf.d/macos.fish and conf.d/linux.fish
fish_add_path $HOME/.cargo/bin
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.local/npm-global/bin"

if command -v starship > /dev/null
    starship init fish | source
end

if command -v zoxide > /dev/null
    zoxide init --cmd j fish | source
end

if command -v fnm > /dev/null
    fnm env --use-on-cd --shell fish | source
end

if command -v uv > /dev/null
    uv generate-shell-completion fish | source
end

# SSH Agent handled in conf.d/linux.fish (macOS uses Keychain)

alias mycow 'fortune | cowsay'
alias myproxystart='ssh -D 8123 -S /tmp/.ssh-myproxy -M -f -C -q -N $1'
alias myproxycheck='ssh -S /tmp/.ssh-myproxy -O check $1'
alias myproxyexit='ssh -S /tmp/.ssh-myproxy -O exit $1'
alias generaterandom='openssl rand -hex $1'
alias myip "curl -4 ifconfig.co"
alias myip6 "curl -6 ifconfig.co"
alias dc 'docker compose'
alias docker-compose 'docker compose'
alias df 'df -h'
alias pyclean 'find . -name \*.pyc -type f -ls -delete'
alias pipgrep 'pip freeze | grep -i '
alias psgrep 'ps aux | grep '
alias sshconfig "nvim ~/.ssh/config"
alias gitconfig "nvim ~/.gitconfig"
alias slc 'streamlink --player="vlc --network-caching 3000"'
alias sv 'source .venv/bin/activate.fish'
alias cv 'python -m venv .venv'
alias rv 'rm -rf .venv'
alias k 'clear'
alias clr 'clear'
alias edit "$EDITOR"
alias q "exit"
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias h 'history'
alias md 'mkdir -p'
alias rd 'rmdir'
alias incognito 'fish --private'
alias ls 'eza -al --color=always --group-directories-first'
alias la 'eza -a --color=always --group-directories-first'
alias ll 'eza -l --color=always --group-directories-first'
alias lt 'eza -aT --color=always --group-directories-first'
alias vimdiff 'nvim -d'
alias dig 'drill'
alias netstat 'ss'
alias du 'dust'
alias cat 'bat'
alias grep 'rg'
alias curl 'curlie'
alias nvm 'fnm'

alias p "python"
alias v "nvim"
alias yt 'yt-dlp'
alias sl 'streamlink'
alias s "sudo"
alias root "sudo su"

if command -v gshuf > /dev/null
    alias shuf 'gshuf'
end

if not command -v tree > /dev/null
    alias tree "find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
end
alias gcl 'git clone'
alias ga 'git add'
alias gall 'git add .'
alias g 'git'
alias get 'git'
alias gst 'git status'
alias gs 'git status'
alias gss 'git status -s'
alias gl 'git pull'
alias gp 'git push'
alias gpo 'git push origin'
alias gpl 'git push local'
alias gc 'git commit -v -m'
alias gca 'git commit -v -a -m'
alias gce 'git commit --allow-empty-message -m ""'
alias gcb 'git add . && git commit --allow-empty-message -m ""'
alias gci 'git commit --interactive'
alias gb 'git branch'
alias gba 'git branch -a'
alias gcount 'git shortlog -sn'
alias gcp 'git cherry-pick'
alias gco 'git checkout'
alias gexport 'git archive --format zip --output'
alias gdel 'git branch -d'
alias gmu 'git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gll 'git log --graph --pretty=oneline --abbrev-commit'
alias gitlog "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias grb 'git rebase -p'
alias gup 'git fetch origin && git rebase origin/(git_current_branch)'

set -U fish_history_size 500000
