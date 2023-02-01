#!/bin/bash

install() {
    curl -fsSL https://code-server.dev/install.sh | sh

    code-server --install-extension ms-python.python 
    code-server --install-extension vscodevim.vim

    cp ./settings-minimal.json ~/.local/share/code-server/User/settings.json
    cp ./keybindings.json ~/.local/share/code-server/User/
}

run() {
    cat ~/.config/code-server/config.yaml
    code-server --bind-addr 0.0.0.0:8080 --disable-telemetry
}

uninstall() {
    rm -rf ~/.local/lib/code-server-*
}

if [ "$1" = "install" ]; then install
elif [ "$1" = "run" ]; then run
elif [ "$1" = "uninstall" ]; then uninstall
else echo "usage: ./code-server.sh [install run uninstall]"
fi


