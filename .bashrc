export PS1="[\u@\h \W]\\$ "

set -o vi
bind '"jk":vi-movement-mode'
export EDITOR="vim"

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias ssr="eval \`ssh-agent -s\` && ssh-add ~/.ssh/id_rsa"
alias sse="eval \`ssh-agent -s\` && ssh-add ~/.ssh/id_ed25519"
alias pg="ping google.com"
alias uu="sudo apt update && sudo apt upgrade"
alias tkill="tmux kill-session"
