#!/bin/bash

apt install -y apache2
service apache2 restart


#modsecurity
apt install -y libapache2-mod-security2
mv /etc/modsecurity/modsecurity.conf-recommended  /etc/modsecurity/modsecurity.conf

cd /tmp
ls -l
git clone https://github.com/SpiderLabs/owasp-modsecurity-crs.git
cd ./owasp-modsecurity-crs/
mv /tmp/owasp-modsecurity-crs/crs-setup.conf.example /etc/modsecurity/crs-setup.conf
mv /tmp/owasp-modsecurity-crs/rules /etc/modsecurity/



######################## TEMPLATE FILES ########################

#/etc/apache2/mods-enabled/security2.conf
rm /etc/apache2/mods-enabled/security2.conf
mv /tmp/src/security2.conf /etc/apache2/mods-enabled/security2.conf

#/etc/apache2/sites-available/000-default.conf
rm /etc/apache2/sites-available/000-default.conf
mv /tmp/src/000-default.conf /etc/apache2/sites-available/000-default.conf

#/usr/share/modsecurity-crs/owasp-crs.load
rm /usr/share/modsecurity-crs/owasp-crs.load
mv /tmp/src/owasp-crs.load /usr/share/modsecurity-crs/owasp-crs.load



######################## CLEAN UP ########################
rm -rf /tmp/owasp-modsecurity-crs
apt clean