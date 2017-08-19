# -*- mode: ruby -*-
# vi: set ft=ruby ts=2 sw=2 sts=2 :

$swarmscript = <<SCRIPT
echo I am provisioning...
echo "192.168.254.41 node-1" >> /etc/hosts
echo "192.168.254.42 node-2" >> /etc/hosts
echo "192.168.254.43 node-3" >> /etc/hosts
pacman --noconfirm -Syu docker glusterfs
usermod -a -G docker vagrant
systemctl enable docker.service
systemctl enable glusterd.service
SCRIPT

Vagrant.configure("2") do |config|

  # swarm nodes
  (1..3).each do |i|
    config.vm.define "node-#{i}" do |node|
      node.vm.box = "archlinux/archlinux"
      node.vm.synced_folder '.', '/vagrant', disabled: true
      node.vm.network :private_network, ip: "192.168.254.4#{i}"
      node.vm.provision "shell", inline: $swarmscript
    end
  end

end
