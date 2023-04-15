#!/bin/bash -x
cp ../../{.vimrc,.bashrc,.inputrc,.tmux.conf} .
docker build --platform=linux/amd64 -t lbirchler/go-dev .
rm .vimrc .bashrc .inputrc .tmux.conf
