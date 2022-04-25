#!/bin/bash

VERSION=17.2

install_go() {
    if hash go 2>/dev/null; then
        read -p "remove current installation? (y/n): " response
        if [ $response != "y" ]; then
            exit 42
        else
            sudo rm -rf /usr/local/go
        fi
    fi
    wget https://golang.org/dl/go1.$VERSION.linux-amd64.tar.gz
    sudo tar -xzf go1.$VERSION.linux-amd64.tar.gz
    sudo mv go /usr/local
    find / -type f -name 'go1*' 2>/dev/null -exec rm -rf {} \;
    if [ ! -d ~/go ]; then
        mkdir -p ~/go/{src,bin,pkg}
    fi
}

set_paths() {
    sed -i "/GOROOT/d;/GOPATH/d" ~/.profile ~/.bashrc
    echo export $1 >> ~/.profile
}

install_go

set_paths GOROOT=/usr/local/go
set_paths GOPATH=$HOME/go
set_paths 'PATH=$GOPATH/bin:$GOROOT/bin:$PATH'
source ~/.profile

go version
