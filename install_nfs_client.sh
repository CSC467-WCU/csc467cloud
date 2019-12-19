#!/bin/bash

echo "Install NFS clients"
set -x

sudo apt-get update
sudo apt-get install -y nfs-common

sudo mount 192.168.1.1:/opt /opt || true
# Cycle until we can mount software.
while [ ! -d /opt/flagdir ]; do
  sudo mount 192.168.1.1:/opt /opt || true
  sleep 30
done

# Keep the shared dirs after a reboot
echo '192.168.1.1:/opt /opt nfs' | sudo tee -a /etc/fstab
