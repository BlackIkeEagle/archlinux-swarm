#!/usr/bin/env sh

set -e

siege -c 50 -r 50 http://192.168.254.41/

