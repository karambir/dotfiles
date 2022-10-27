# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return



##
## Bash history
##

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
export HISTTIMEFORMAT='%F %T '

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# https://stackoverflow.com/questions/19454837/bash-histsize-vs-histfilesize
HISTSIZE=200000
HISTFILESIZE=50000000

# Save multi-line commands as one command
shopt -s cmdhist



##
## Shell Highlighting/Colors
##

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# highlighting inside manpages and elsewhere
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Load our dotfiles like ~/.bash_aliases, etc…
#   ~/.extra can be used for settings you don’t want to commit,
#   Use it to configure your PATH,
for file in ~/.{bash_aliases,bash_prompt,bash_paths,bash_extras}; do
    [ -r "$file" ] && source "$file"
done
unset file


##
## Bash and other completions
##

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
  # Add local bash completion
  if [ -f ~/.bash_completion ]; then
    . ~/.bash_completion
  fi
fi


# bash completion with sudo
complete -cf sudo

# pipx completion
# eval "$(register-python-argcomplete pipx)"



##
## Other customizations
##
# neovim as default
export EDITOR="nvim"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Set language
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# activate starship
# https://starship.rs/
eval "$(starship init bash)"


# pipx set custom python path
# export PIPX_DEFAULT_PYTHON=/usr/bin/python
export PIPX_DEFAULT_PYTHON=/home/karambir/.asdf/installs/python/3.9.15/bin/python

# Arch - start ssh-agent
# https://wiki.archlinux.org/title/SSH_keys#SSH_agents
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi
