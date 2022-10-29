#!/bin/bash -x
cp -r ../../{.vimrc,.bashrc,.inputrc,.tmux.conf,.ipython} .
docker build --platform=linux/amd64 -t lbirchler/conda-dev .
rm -rf .vimrc .bashrc .inputrc .tmux.conf .ipython
