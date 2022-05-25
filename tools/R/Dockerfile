FROM rocker/rstudio

ENV DEBIAN_FRONTEND=noninteractive

# *** Packages ***
RUN apt-get update && apt-get install -y \
    curl \
    git \
    strace \
    tmux \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/*

# *** Configs ***
COPY .bashrc /home/rstudio
COPY .inputrc /home/rstudio
COPY .tmux.conf /home/rstudio
COPY .vimrc /home/rstudio

# *** Entry ***
WORKDIR /root
