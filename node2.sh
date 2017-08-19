#!/usr/bin/env sh

export DOCKER_HOST=tcp://192.168.254.42:2375
export DOCKER_CERT_PATH=$(pwd)/client-cert
export DOCKER_TLS_VERIFY=1

docker "$@"

