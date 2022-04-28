FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    automake \
    build-essential \
    cmake \
    coreutils \
    curl \
    g++ \
    gcc \
    gdb \
    git \
    ipython3 \
    libtool \
    ltrace \
    net-tools \
    netcat \
    python3 \
    python3-pip \
    sshfs \
    strace \
    tmux \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/*

# *** Configs ***
COPY .tmux.conf /root
COPY .vimrc /root
COPY .bashrc /root
COPY .inputrc /root
COPY ipython /usr/local/etc/ipython

# *** Go ***
COPY go/install.sh . 
RUN ./install.sh


WORKDIR /root
CMD "/bin/bash"
