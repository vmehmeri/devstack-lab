#!/bin/bash

sudo apt-get install git make autoconf libtool 
git clone -b stable/liberty https://github.com/openstack-dev/devstack 
git clone https://github.com/trozet/sfc-random.git 
git clone https://github.com/pritesh/ovs --branch nsh-v8
git clone https://github.com/vmehmeri/ovs-lab

# Install OVS with NSH support

cd ovs
./boot.sh
./configure
make && sudo make install

# Create OVS database
cp ../ovs-lab/*.sh .
sudo chmod +x run.sh stop.sh clean.sh
sudo ./clean.sh
sudo ./run.sh
cd ~

# copy sample configuration file

cp -f sfc-random/local.conf devstack/
cd devstack

## modify host IP address in local.conf file (there are 3 occurrences):

## sed -i 's/10.6.65.37/<your IP>/g' local.conf

# Sym-Link NSH OVS:

sudo ln -s /usr/local/bin/* /bin/