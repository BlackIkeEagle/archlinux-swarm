#!/usr/bin/env sh

set -e

vagrant plugin install vagrant-scp

 #provisioning
echo "PROVISIONING"
vagrant up
vagrant halt

vagrant up

# install and configure gluster
echo "GLUSTERFS"
for node in {1..3}; do
    vagrant scp gluster-prepare.sh node-$node:gluster-prepare.sh
    vagrant scp mnt-glusterdata.mount node-$node:mnt-glusterdata.mount
    vagrant ssh node-$node -- 'sh gluster-prepare.sh'
done
vagrant scp gluster-volume.sh node-1:gluster-volume.sh
vagrant ssh node-1 -- 'sh gluster-volume.sh'

# update docker configuration
echo "UPDATE DOCKER CONFIG"

mkdir -p client-cert
for node in {1..3}; do
    vagrant ssh node-$node -- 'mkdir client-cert'
done

vagrant scp docker-client-certificate.sh node-1:docker-client-certificate.sh
vagrant ssh node-1 -- 'sh docker-client-certificate.sh'

vagrant scp 'node-1:client-cert/*' client-cert/
for file in $(ls client-cert); do
    vagrant scp client-cert/$file node-2:client-cert/
    vagrant scp client-cert/$file node-3:client-cert/
done

for node in {1..3}; do
    vagrant scp docker-server-certificate.sh node-$node:docker-server-certificate.sh
    vagrant ssh node-$node -- 'sh docker-server-certificate.sh'
done

./docker-create-swarm.sh

vagrant halt

