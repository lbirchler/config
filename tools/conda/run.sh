#!/bin/bash -x
docker run --rm -it \
    -p 8888:8888 \
    --hostname conda --name conda \
    --platform=linux/amd64 \
    -v $(pwd):/root/work \
    lbirchler/conda-dev /bin/bash
    
# jupyter lab --ip=0.0.0.0 --no-browser --allow-root