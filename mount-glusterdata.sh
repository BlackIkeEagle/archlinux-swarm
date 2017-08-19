#!/usr/bin/env sh

set -e

for node in {1..3}; do
    vagrant ssh node-$node -- 'sudo systemctl restart mnt-glusterdata.mount'
done

