#!/bin/bash

cd "$(dirname "${0}")"

mkdir -pv $(pwd)/../../downloads
mkdir -pv $(pwd)/../../sstate-cache

docker run \
    --rm -it \
    -e "DL_DIR=/downloads" \
    -e "SSTATE_DIR=/sstate-cache" \
    -e "BB_ENV_PASSTHROUGH_ADDITIONS=DL_DIR SSTATE_DIR" \
    -v $(pwd)/..:/workdir \
    -v $(pwd)/../../downloads:/downloads \
    -v $(pwd)/../../sstate-cache:/sstate-cache \
    --workdir=/workdir \
    crops/poky:ubuntu-22.04


