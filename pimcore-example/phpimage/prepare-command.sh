#!/usr/bin/env bash

chown www-data:www-data /phpapp/website/var/
gosu www-data rsync -a --info=progress2 \
    /shared/website/var/ /phpapp/website/var/
