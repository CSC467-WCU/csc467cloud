#!bin/bash

sudo wget --no-check-certificate https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
sudo bash Anaconda3-2019.10-Linux-x86_64.sh -b -p /opt/anaconda3
echo "PATH=/opt/anaconda3/bin:$PATH" | sudo tee -a /etc/environment
