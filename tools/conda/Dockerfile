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

# *** Conda ***
COPY environment.yml /root

RUN conda init bash \
    && conda update -n base -c defaults conda \
    && conda env create -f /root/environment.yml --force
    
RUN echo 'alias jlab="conda activate dev; jupyter lab --ip=0.0.0.0 --no-browser --allow-root"' >> ~/.bashrc

WORKDIR /root/work
