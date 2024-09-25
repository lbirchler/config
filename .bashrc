export PS1="[\u@\h \W]\\$ "

set -o vi
bind '"jk":vi-movement-mode'
export EDITOR="vim"

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias pg="ping google.com"
alias uu="sudo apt update && sudo apt upgrade"

alias tl="tmux ls"
alias ta="tmux a"
alias tk="tmux kill-session"

ssh_env="$HOME/.ssh/ssh_env"

ssa() {
    pkill -u $(id -u) ssh-agent  # kill existing agents
    [ -f "$ssh_env" ] && rm -f "$ssh_env"  # remove ssh_env if it exists
    eval "$(ssh-agent -s)" && ssh-add  # start agent and add keys
    env | grep -E "SSH_AUTH_SOCK|SSH_AGENT_PID" > "$ssh_env"
    chmod 600 "$ssh_env"
}

alias ssl="pgrep -u $(id -u) ssh-agent"
alias ssk="pkill -u $(id -u) ssh-agent; rm -f '$ssh_env'"

if [[ -f "$ssh_env" && $(pgrep -u $(id -u) ssh-agent) ]]; then
    export $(< "$ssh_env")
fi

