#!/bin/bash

# install
echo "[+] Installing Starship..."
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -s -y

# enable
cat <<EOF>> ~/.bashrc
# starship
eval "\$(starship init bash)"
EOF
source ~/.bashrc

# config
if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi
cp ./starship.toml ~/.config
