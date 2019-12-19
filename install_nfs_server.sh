#!/bin/bash
echo "install NFS server"
set -x

sudo chown nobody:nogroup /opt
sudo chmod -R a+rx /opt
mkdir /opt/flagdir

#################
sudo apt-get update
sudo apt-get install -y nfs-kernel-server

nodes=$(($1 + 1))
for i in $(seq 2 $nodes)
do
  echo "/opt 192.168.1.$i(rw,sync,no_root_squash,no_subtree_check)" | sudo tee -a /etc/exports
done

sudo systemctl restart nfs-kernel-server
