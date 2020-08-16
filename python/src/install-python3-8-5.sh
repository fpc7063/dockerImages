#!/bin/bash

#speed build
#apt update && apt install -y python3 python3-pip
#ln -s /usr/bin/python3.8 /usr/bin/python3 2> /dev/null
#ln -s /usr/bin/python3.8 /usr/bin/python 2> /dev/null

#ln -s /usr/bin/pip3.8 /usr/bin/pip 2> /dev/null
#ln -s /usr/bin/pip3.8 /usr/bin/pip3 2> /dev/null
#exit 0


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

#Symbolic links
ln -s /usr/bin/python3.8 /usr/bin/python3 2> /dev/null
ln -s /usr/bin/python3.8 /usr/bin/python 2> /dev/null

ln -s /usr/bin/pip3.8 /usr/bin/pip 2> /dev/null
ln -s /usr/bin/pip3.8 /usr/bin/pip3 2> /dev/null


python3.8 -m pip install --upgrade pip