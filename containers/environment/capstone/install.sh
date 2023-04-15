#!/bin/bash
git clone https://github.com/capstone-engine/capstone.git
cd capstone
./make.sh
./make.sh install
# *if installing on host*
#sudo ./make.sh install 
