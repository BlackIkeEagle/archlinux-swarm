#!/usr/bin/env sh

while true; do
    curl -m2 http://192.168.254.41; echo
    curl -m2 http://192.168.254.42; echo
    curl -m2 http://192.168.254.43; echo
done

