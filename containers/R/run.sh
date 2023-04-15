#!/bin/bash -x
docker run --rm -it --name rstudio \
    -p 8787:8787 \
    -v $(pwd):/home/rstudio/work \
    -e ROOT=TRUE \
    lbirchler/r-dev 
