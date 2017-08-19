#!/usr/bin/env sh

set -e

while true; do
    curl http://192.168.254.41; echo
    curl http://192.168.254.42; echo
    curl http://192.168.254.43; echo
done

