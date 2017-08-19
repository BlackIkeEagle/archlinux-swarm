#!/usr/bin/env sh

set -e

docker build -f Dockerfile-nginx -t blackikeeagle/swarm-sample-nginx .
docker build -f Dockerfile-php -t blackikeeagle/swarm-sample-php .

docker push blackikeeagle/swarm-sample-nginx
docker push blackikeeagle/swarm-sample-php
