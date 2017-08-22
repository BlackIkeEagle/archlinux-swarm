#!/usr/bin/env bash

mkdir -p /shared/website
cp -a /phpapp/website/var /shared/website/
chown -R www-data:www-data /shared
