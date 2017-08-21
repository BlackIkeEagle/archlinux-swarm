#!/usr/bin/env sh

set -e

docker build --no-cache -f Dockerfile-nginx -t blackikeeagle/swarm-sample-nginx .
docker build --no-cache -f Dockerfile-php -t blackikeeagle/swarm-sample-php .

docker push blackikeeagle/swarm-sample-nginx
docker push blackikeeagle/swarm-sample-php
