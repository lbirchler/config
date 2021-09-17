export PS1='\u@\h:\[\e[33m\]\w\[\e[0m\]\$ '

export EDITOR='vim'
set -o vi

alias uu="sudo apt update && sudo apt upgrade"
alias ls='ls --color'

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
