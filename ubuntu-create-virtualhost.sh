#!/bin/bash

domain=$1
folder=$2

echo domain: $domain folder: $folder

sudo mkdir -p /var/www/$folder/public_html

sudo chown -R $USER:$USER /var/www/$folder/public_html

sudo chmod -R 755 /var/www


conffile='/etc/apache2/sites-available/'$domain.conf
echo $conffile

if ! echo "
<VirtualHost *:80>
        # The ServerName directive sets the request scheme, hostname and port t$
        # the server uses to identify itself. This is used when creating
        # redirection URLs. In the context of virtual hosts, the ServerName
        # specifies what hostname must appear in the request's Host: header to
        # match this virtual host. For the default virtual host (this file) this
        # value is not decisive as it is used as a last resort host regardless.
        # However, you must set it for any further virtual host explicitly.
        ServerName $domain
        ServerAlias www.$domain

        ServerAdmin admin@$domain
        DocumentRoot /var/www/$folder/public_html

        # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
        # error, crit, alert, emerg.
        # It is also possible to configure the loglevel for particular
        # modules, e.g.
        #LogLevel info ssl:warn
		
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        # For most configuration files from conf-available/, which are
        # enabled or disabled at a global level, it is possible to
        # include a line for only one particular virtual host. For example the
        # following line enables the CGI configuration for this host only
        # after it has been globally disabled with "a2disconf".
        #Include conf-available/serve-cgi-bin.conf
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet" > $conffile
then
	echo -e $"There is an ERROR creating $domain conf file"
	exit;
else
	echo -e $"\nNew Virtual Host File Created\n"
	sudo a2ensite $domain.conf
	sudo service apache2 restart
fi



