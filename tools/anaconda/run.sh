#!/bin/bash -x
docker run --rm -it \
    --hostname conda --name anaconda \
    --platform=linux/amd64 \
    lbirchler/anaconda-dev /bin/bash
