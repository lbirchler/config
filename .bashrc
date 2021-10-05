export PS1='\u@\h:\[\e[01;32m\]\w\[\e[0m\]\$ '

export EDITOR='vim'
set -o vi
bind '"jk":vi-movement-mode'

alias uu="sudo apt update && sudo apt upgrade"
alias ls='ls --color'
