#!/usr/bin/env sh

set -e

currentdir="$(pwd)"

(
    cd ..

    ./node1.sh stack deploy --compose-file=$currentdir/swarm.yml simplesample
)
