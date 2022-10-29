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
COPY .gdbinit /root
COPY .inputrc /root
COPY .tmux.conf /root
COPY .vimrc /root
COPY .ipython /usr/local/etc/ipython

# *** Tools ***
COPY tools /opt

RUN cd /opt/starship \
    && . ./install.sh \
    && cd /opt/capstone && ./install.sh \
    && cd /opt/pwndbg && ./install.sh 

# *** Entry ***
WORKDIR /root
