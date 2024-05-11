export PS1="[\u@\h \W]\\$ "

set -o vi
bind '"jk":vi-movement-mode'
export EDITOR="vim"

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias pg="ping google.com"
alias uu="sudo apt update && sudo apt upgrade"

alias ssl="pgrep ssh-agent"
alias ssk="pgrep ssh-agent | xargs kill"
alias ssa="eval \`ssh-agent -s\` && ssh-add"

alias tl="tmux ls"
alias ta="tmux a"
alias tk="tmux kill-session"

