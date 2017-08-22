#!/usr/bin/env sh

set -e

currentdir="$(pwd)"

(
    cd ..

    #vagrant ssh node-1 -- "sudo mkdir -p /mnt/glusterdata/pimcore-var"
    ./node1.sh volume create --opt type=none --opt device=/mnt/glusterdata/pimcore-var --opt o=bind pimcore-var
    ./node2.sh volume create --opt type=none --opt device=/mnt/glusterdata/pimcore-var --opt o=bind pimcore-var
    ./node3.sh volume create --opt type=none --opt device=/mnt/glusterdata/pimcore-var --opt o=bind pimcore-var
)
