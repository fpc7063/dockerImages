#!/bin/bash

apt install -y apache2
service apache2 start


#modsecurity
apt install -y libapache2-mod-security2
mv /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf
MODSEC_CONF=`cat /etc/modsecurity/modsecurity.conf | sed 's/SecRuleEngine DetectionOnly/SecRuleEngine On/g'`
echo "$MODSEC_CONF" | tee /etc/modsecurity/modsecurity.conf

cd /tmp
git clone https://github.com/SpiderLabs/owasp-modsecurity-crs.git
cd owasp-modsecurity-crs/
git checkout v2.2/master
git pull origin v2.2/master


mv modsecurity_crs_10_setup.conf.example /etc/modsecurity/crs-setup.conf
mv base_rules/ /etc/modsecurity/rules

BASE_CONFIG="
<IfModule security2_module>
	# Default Debian dir for modsecurity's persistent data
	SecDataDir /var/cache/modsecurity

	# Include all the *.conf files in /etc/modsecurity.
	# Keeping your local configuration in that directory
	# will allow for an easy upgrade of THIS file and
	# make your life easier
    IncludeOptional /etc/modsecurity/*.conf
    Include /etc/modsecurity/rules/*.conf

	# Include OWASP ModSecurity CRS rules if installed
	IncludeOptional /usr/share/modsecurity-crs/*.load
</IfModule>
"
echo "$BASE_CONFIG" > /etc/apache2/mods-enabled/security2.conf



service apache2 restart
######################## CLEAN UP ########################
rm -rf /tmp/owasp-modsecurity-crs
apt clean


service apache2 stop