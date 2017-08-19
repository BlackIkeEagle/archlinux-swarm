#!/usr/bin/env sh

set -e

currentdir="$(pwd)"

(
    cd ..

    ./node1.sh ps
    ./node1.sh service ls
    ./node1.sh node ls
)
