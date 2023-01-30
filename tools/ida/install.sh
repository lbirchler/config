#!/bin/bash -x
set -eo pipefail

wget https://out7.hex-rays.com/files/arm_idafree82_mac.app.zip

unzip arm_idafree82_mac.app.zip

./arm_idafree82_mac.app/Contents/MacOS/installbuilder.sh \
--mode unattended \
--installpassword "" \
--prefix ~/tools/ida-8.2

rm -rf arm_idafree82_mac.app*
