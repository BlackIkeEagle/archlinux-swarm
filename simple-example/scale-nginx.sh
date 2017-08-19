#!/usr/bin/env sh

set -e

(
    cd ..
    ./node1.sh service scale simplesample_nginx=$1
)
