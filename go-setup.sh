#!/bin/bash

VERSION=17.2

installGo() {
    if hash go 2>/dev/null; then
        echo [-] === GO ALREADY INSTALLED ===
        read -p "remove current installation? (y/n): " response
        if [ $response != "y" ]; then
            return
        else
        echo [-] === REMOVING CURRENT GO INSTALLATION ===
            sudo rm -rf /usr/local/go
        fi
    fi
    echo [-] === INSTALLING GO VERSION $VERSION ===
    wget https://golang.org/dl/go1.$VERSION.linux-amd64.tar.gz
    sudo tar -xzf go1.$VERSION.linux-amd64.tar.gz
    sudo mv go /usr/local
    find / -type f -name 'go1*' 2>/dev/null -exec rm -rf {} \;
    go version
}

setPaths() {
    if ! grep -Fq "$1" ~/.profile; then
    echo [-] === ADDED $1 TO ~/.PROFILE ===
        echo export $1 >> ~/.profile
    fi
}

setupVim() {
    if ! hash pip3 2>/dev/null; then
    echo [-] === INSTALLING PIP3 ===
        sudo apt install python3-pip > /dev/null 2>&1
    fi
    echo [-] === INSTALLING NEOVIM and PYNVIM PACKAGES ===
    pip3 install --user --upgrade neovim > /dev/null 2>&1
    pip3 install --user --upgrade pynvim > /dev/null 2>&1
}

main() {
    installGo

    setPaths GOROOT=/usr/local/go
    setPaths GOPATH=$HOME/go
    setPaths 'PATH=$GOPATH/bin:$GOROOT/bin:$PATH'
    source ~/.profile

    mkdir -p ~/go/{src,bin,pkg}

    setupVim
}

main
