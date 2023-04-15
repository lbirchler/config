#!/bin/bash

cp ../../{.vimrc,.bashrc,.inputrc,.tmux.conf,.gdbinit,ipython/*py} .
docker build --platform=linux/amd64 -t lbirchler/env .
rm .vimrc .bashrc .inputrc .tmux.conf .gdbinit *.py 
