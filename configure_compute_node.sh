#!/bin/bash

IP_ADDRESS=$1
CONTROLLER_IP_ADDRESS=$2

if [ $# -ne 2 ]; then
    echo $0: usage: ./configure_compute_node.sh LOCAL_IP_ADDRESS CONTROLLER_IP_ADDRESS
    exit 1
fi

cd ~
git clone -b stable/liberty https://github.com/openstack-dev/devstack 
git clone https://github.com/trozet/sfc-random.git 


cp -f devstack-lab/compute.conf ./devstack/local.conf
sed -i 's/1.2.3.4/$CONTROLLER_IP_ADDRESS/g'
sed -i 's/0.0.0.0/$IP_ADDRESS/g'

sudo ovs-vsctl set-manager tcp:$CONTROLLER_IP_ADDRESS:6640

echo "Configuration Complete."

