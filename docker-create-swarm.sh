#!/usr/bin/env sh

vagrant ssh node-1 -- "docker swarm init --advertise-addr=192.168.254.41"
token=$(vagrant ssh node-1 -- "docker swarm join-token -q worker")
vagrant ssh node-2 -- "docker swarm join --token $token 192.168.254.41"
vagrant ssh node-3 -- "docker swarm join --token $token 192.168.254.41"
