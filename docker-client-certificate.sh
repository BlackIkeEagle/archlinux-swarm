#!/usr/bin/env sh

set -e

docker run --user=$(id -u) --rm -v $(pwd)/client-cert:/certs paulczar/omgwtfssl
