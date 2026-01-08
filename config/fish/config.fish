# ~/.config/fish/config.fish
# -gx means set global variable and export to child processes

set -x LANG en_US.UTF-8
set fish_greeting

# --- Basic Setup ---
# Only run commands for interactive sessions
if status is-interactive
    # Use nvim as the default editor
    set -gx EDITOR nvim

    # Set MANPAGER to use bat for man pages
    # Note: Fish uses 'set -gx' to export variables
    set -gx MANPAGER "sh -c 'sed -u -e \\\"s/\\\\x1B\\[[0-9;]*m//g; s/.\\\\x08//g\\\" | bat -p -lman'" #

    # Set variables for LESS colors (used by man pages, etc.)
    set -gx LESS_TERMCAP_mb (printf '\e[01;31m')       # begin blinking
    set -gx LESS_TERMCAP_md (printf '\e[01;38;5;74m')  # begin bold
    set -gx LESS_TERMCAP_me (printf '\e[0m')           # end mode
    set -gx LESS_TERMCAP_se (printf '\e[0m')           # end standout-mode
    set -gx LESS_TERMCAP_so (printf '\e[38;5;246m')    # begin standout-mode - info box
    set -gx LESS_TERMCAP_ue (printf '\e[0m')           # end underline
    set -gx LESS_TERMCAP_us (printf '\e[04;38;5;146m') # begin underline

    # Set parallel make jobs (adjust ignore count as needed)
    # set -gx MAKEFLAGS "--jobs=(nproc --ignore=4)"

end

# --- PATH Setup ---
# OS-specific paths are in conf.d/macos.fish and conf.d/linux.fish
fish_add_path $HOME/.cargo/bin
fish_add_path "$HOME/.rd/bin"
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.local/npm-global/bin"

# fish_update_completions

# --- Tool Initializations ---

# Starship Prompt
# (Ensure starship is installed: https://starship.rs/)
if command -v starship > /dev/null
    starship init fish | source
end

# Zoxide (smarter cd)
# (Ensure zoxide is installed: https://github.com/ajeetdsouza/zoxide)
if command -v zoxide > /dev/null
    zoxide init --cmd j fish | source
end

# fnm(better nvm)
if command -v fnm > /dev/null
    fnm env --use-on-cd --shell fish | source
end

# SSH Agent - handled in conf.d/linux.fish (macOS uses Keychain)

# --- Load Aliases and Functions ---
# Fish automatically loads functions from ~/.config/fish/functions/
# Aliases can be placed here or in conf.d/

# Source files in conf.d (optional structure)
# for file in ~/.config/fish/conf.d/*.fish
#    source $file
# end
# unset file

# --- Aliases (Alternatively, place in ~/.config/fish/conf.d/aliases.fish) ---
# General Aliases
alias mycow 'fortune | cowsay'
# alias myproxy='ssh -D 8123 -f -C -q -N $1'
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
alias sshconfig "nvim ~/.ssh/config" # Use $EDITOR or explicitly nvim
alias gitconfig "nvim ~/.gitconfig" # Use $EDITOR or explicitly nvim
alias slc 'streamlink --player="vlc --network-caching 3000"'
alias sv 'source .venv/bin/activate.fish' # Fish uses .fish activate script
alias cv 'python -m venv .venv'
alias rv 'rm -rf .venv' # Use -rf for directories
alias k 'clear'
alias clr 'clear'
alias edit "$EDITOR"
alias q "exit"
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
# alias -- - 'cd -' # Go back
alias h 'history'
alias md 'mkdir -p'
alias rd 'rmdir' # Note: rmdir only removes empty directories
alias incognito 'fish --private' # Start a private session (no history saved)

# Aliases overriding commands
alias ls 'eza -al --color=always --group-directories-first'
alias la 'eza -a --color=always --group-directories-first'
alias ll 'eza -l --color=always --group-directories-first'
alias lt 'eza -aT --color=always --group-directories-first'
alias vimdiff 'nvim -d'
alias dig 'drill'
alias netstat 'ss'
alias du 'dust'
alias cat 'bat'
alias grep 'rg' # Ripgrep alias
alias curl 'curlie'
alias nvm 'fnm'

alias p "python"
alias v "nvim" # Use $EDITOR or explicitly nvim
alias yt 'yt-dlp'
# alias yt 'yt-dlp --remote-components ejs:github'
alias sl 'streamlink'
alias s "sudo"
alias root "sudo su"

# Conditional alias for shuf (macOS has gshuf from coreutils, Linux has native shuf)
if command -v gshuf > /dev/null
    alias shuf 'gshuf'
end

# Conditional alias for tree (if tree command doesn't exist)
if not command -v tree > /dev/null
  alias tree "find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
end

# Git Aliases
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
# gdv alias needs to be a function in Fish to accept arguments ($argv)
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
alias gexport 'git archive --format zip --output' # Needs output file arg
alias gdel 'git branch -d' # Needs branch name arg
alias gmu 'git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gll 'git log --graph --pretty=oneline --abbrev-commit'
alias gitlog "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias grb 'git rebase -p' # Needs args
alias gup 'git fetch origin && git rebase origin/(git_current_branch)' # Needs git_current_branch function

# Alert alias (needs function for status check)
# alias alert 'notify-send --urgency=low -i (if test $status = 0; echo terminal; else; echo error; end) (history | tail -n1 | sed -e \'s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//\')'
# See function definition below


# --- Fish Specific Settings ---

# History settings (Fish defaults are often sensible)
set -U fish_history_size 500000 # Combine HISTSIZE/HISTFILESIZE
# HISTCONTROL=ignorespace -> Fish uses `fish_history=erasedups` (default) or `fish_history=contains`
# histappend is default in Fish
# cmdhist is default in Fish

# --- End of config.fish ---
