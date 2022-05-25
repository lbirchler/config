#!/bin/bash -x
docker run --rm -d \
    --name rstudio \
    -p 8787:8787 \
    -v $(pwd):/home/rstudio/work \
    -e ROOT=TRUE \
    lbirchler/r-dev
