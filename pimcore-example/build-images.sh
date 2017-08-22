#!/usr/bin/env sh

set -e

docker build -f Dockerfile-nginx -t blackikeeagle/swarm-pimcore-nginx .
docker build -f Dockerfile-php -t blackikeeagle/swarm-pimcore-php .

docker push blackikeeagle/swarm-pimcore-nginx
docker push blackikeeagle/swarm-pimcore-php
