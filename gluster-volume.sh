#!/usr/bin/env sh

set -e

# use force for vagrant machines because gluster does not like us putting data in the root partition
sudo gluster volume create gv0 replica 3 node-1:/data/gv0 node-2:/data/gv0 node-3:/data/gv0 force
sudo gluster volume start gv0
sudo gluster volume info

