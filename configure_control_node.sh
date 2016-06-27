#!/bin/bash

IP_ADDRESS=$1

if [ $# -ne 1 ]; then
    echo $0: usage: ./configure_compute_node.sh LOCAL_IP_ADDRESS 
    exit 1
fi

cd ~

rm -rf devstack sfc-random
git clone -b stable/liberty https://github.com/openstack-dev/devstack 
git clone https://github.com/trozet/sfc-random.git 


cp -f devstack-lab/control.conf ./devstack/local.conf
sed -i 's/0.0.0.0/'$IP_ADDRESS'/g' ./devstack/local.conf


echo "Configuration Complete."

