#!/bin/bash -x
cp ../../{.vimrc,.bashrc,.inputrc,.tmux.conf} .
docker build --platform=linux/amd64 -t lbirchler/r-dev .
rm {.vimrc,.bashrc,.inputrc,.tmux.conf}
