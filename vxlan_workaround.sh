#!/bin/bash

sudo ifconfig br-int up
sudo ip route add 11.0.0.0/24 dev br-int
