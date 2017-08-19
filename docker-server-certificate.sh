#!/usr/bin/env sh

set -e

# eth1 ip address
hostonlyip=$(ip address show dev eth1 | \
    sed -rne 's/.*inet ([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*).*/\1/p')

mkdir server-cert
cp -a client-cert/ca.pem server-cert/

docker run --rm \
    -v $(pwd)/server-cert:/server \
    -v $(pwd)/client-cert:/certs \
    -e SSL_IP=127.0.0.1,$hostonlyip \
    -e SSL_DNS=docker.local \
    -e SSL_KEY=/server/key.pem \
    -e SSL_CERT=/server/cert.pem \
    paulczar/omgwtfssl

sudo mkdir /etc/docker/ssl
sudo mv server-cert/{ca.pem,cert.pem,key.pem} /etc/docker/ssl/
sudo chown root:root -R /etc/docker/ssl/

sudo mv /usr/lib/systemd/system/docker.service /etc/systemd/system/
sudo sed \
    -e "s#^\(ExecStart.*\)#\1 -H tcp://0.0.0.0:2375 --tlsverify --tlscacert=/etc/docker/ssl/ca.pem --tlscert=/etc/docker/ssl/cert.pem --tlskey=/etc/docker/ssl/key.pem#" \
    -i /etc/systemd/system/docker.service

sudo systemctl daemon-reload
sudo systemctl restart docker.service;

