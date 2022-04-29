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
    ipython3 \
    libffi-dev \
    libssl-dev \
    libtool \
    ltrace \
    net-tools \
    netcat \
    openssh-client \
    python3 \
    python3-dev \
    python3-pip \
    sshfs \
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
COPY .gdbinit /root
COPY .inputrc /root
COPY .tmux.conf /root
COPY .vimrc /root
COPY .ipython /usr/local/etc/ipython

# *** Tools ***
COPY tools /tools 

RUN cd /tools/starship \
    && . ./install.sh \
    && cd /tools/capstone && ./install.sh \
    && cd /tools/pwndbg && ./install.sh 

#WORKDIR /tools/starship
#RUN . ./install.sh
#
#WORKDIR /tools/capstone
#RUN ./install.sh
#
#WORKDIR /tools/pwndbg
#RUN ./install.sh

WORKDIR /root
CMD "/bin/bash"
