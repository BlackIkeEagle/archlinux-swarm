#!/usr/bin/env sh

set -e

sudo gluster peer probe node-1
sudo gluster peer probe node-2
sudo gluster peer probe node-3

sudo mkdir -p /data/gv0

sudo mv mnt-glusterdata.mount /etc/systemd/system/
sudo systemctl enable mnt-glusterdata.mount

