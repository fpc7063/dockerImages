#!/bin/bash
set -e

#python settup
cd /tmp
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
apt install -y python3 python3-pip
pip3 install -U pip


pip3 install supervisor


rm /tmp/get-pip.py



#supervisord config
mkdir /var/run/supervisord
mkdir /var/log/supervisord