export PS1="[\u@\h \[\e[32m\]\W\[\e[m\]]\\$ "

export EDITOR='vim'
set -o vi
bind '"jk":vi-movement-mode'

alias ssc="eval \`ssh-agent -s\` && ssh-add ~/.ssh/id_rsa"
alias pg="ping google.com"
alias uu="sudo apt update && sudo apt upgrade"
alias ls='ls --color'

