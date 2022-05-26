FROM rocker/rstudio:4.2.0

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
COPY .bashrc /home/rstudio
COPY .inputrc /home/rstudio
COPY .tmux.conf /home/rstudio
COPY .vimrc /home/rstudio

COPY rstudio-prefs.json /home/rstudio/.config/rstudio/rstudio-prefs.json
RUN chown -R rstudio:rstudio /home/rstudio/.config

# *** Entry ***
WORKDIR /home/rstudio
