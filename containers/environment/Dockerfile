FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# *** Packages ***
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
    libffi-dev \
    libssl-dev \
    libtool \
    ltrace \
    net-tools \
    python3 \
    python3-dev \
    python3-pip \
    strace \
    tmux \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/*

# *** Python ***
COPY requirements.txt /root
RUN pip install -r /root/requirements.txt

# *** Configs ***
COPY .bashrc /root
COPY .tmux.conf /root
COPY .vimrc /root
COPY .inputrc /root
COPY ipython_config.py /usr/local/etc/ipython
COPY keybindings.py /usr/local/etc/ipython

# *** Tools ***
ADD starship /opt/starship
ADD capstone /opt/capstone
ADD pwndbg /opt/pwndbg

RUN cd /opt/starship \
    && . ./install.sh \
    && cd /opt/capstone && ./install.sh \
    && cd /opt/pwndbg && ./install.sh 
COPY .gdbinit /root

# *** Entry ***
WORKDIR /root
