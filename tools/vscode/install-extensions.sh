#!/bin/bash -x
cat ./extensions.txt | xargs -L 1 code --install-extension
