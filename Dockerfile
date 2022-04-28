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

# To work on repo in container
# 1. Add private key identity to auth agent *ssh-add*
# 2. Uncomment RUN commands below 
# 3. Build image *docker build --ssh default .*
# 4. Run container *docker run --it --project <project> ...*
ARG project 
RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN --mount=type=ssh git clone git@github.com:lbirchler/$project.git $project

# *** Tools ***
COPY tools /tools 

WORKDIR /tools/starship
RUN . ./install.sh

WORKDIR /root
CMD "/bin/bash"
