#!/bin/bash

dir=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)

set -x

cp $dir/ipython_config.py ~/.ipython/profile_default
cp $dir/keybindings.py ~/.ipython/profile_default/startup/
