#!/bin/bash -x
docker run --rm -it \
    --hostname conda --name conda \
    --platform=linux/amd64 \
    lbirchler/conda-dev /bin/bash
