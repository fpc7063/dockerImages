#!/bin/bash

#Dependencias
apt-get install -y curl libcurl4-gnutls-dev libexpat1-dev gettext \
  libz-dev libssl-dev gcc make



#Dentro de /opt
cd /opt
PYTGZ='python.tgz'
curl https://www.python.org/ftp/python/3.8.5/Python-3.8.5.tgz -o $PYTGZ
tar zxvf $PYTGZ
rm $PYTGZ

#Compile python3.8.5
cd Python-3.8.5
./configure --enable-optimizations
    make 
    make test
    make altinstall