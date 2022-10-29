#FROM continuumio/anaconda3 
FROM continuumio/miniconda3

ENV DEBIAN_FRONTEND=noninteractive

# *** Packages ***
RUN apt-get update && apt-get install -y \
    tmux \
    vim \
    && rm -rf /var/lib/apt/lists/*

# *** Configs ***
COPY .bashrc /root
COPY .inputrc /root
COPY .tmux.conf /root
COPY .vimrc /root
COPY .ipython /usr/local/etc/ipython

RUN conda init bash \
    && conda install ipython -y --quiet

RUN mkdir /root/work

WORKDIR /root/
