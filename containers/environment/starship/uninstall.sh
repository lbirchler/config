#!/bin/bash

sed -i '/# starship/,+1 d' ~/.bashrc 
rm ~/.config/starship.toml
sudo sh -c 'rm "$(command -v 'starship')"'
