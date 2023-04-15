FROM golang:1.18.2-bullseye

ENV DEBIAN_FRONTEND=noninteractive

# *** Packages ***
RUN apt-get update && apt-get install -y \
    curl \
    git \
    tmux \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/*

# *** Configs ***
COPY .bashrc /root
COPY .inputrc /root
COPY .tmux.conf /root
COPY .vimrc /root

# *** Vim-Go ***
RUN mkdir ~/.vim \
    && git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go \
    && vim +GoInstallBinaries +qall >/dev/null 2>&1

# vimrc additions
COPY config .
RUN cat config >> ~/.vimrc \
    && rm config

# *** Entry ***
WORKDIR /go/src
