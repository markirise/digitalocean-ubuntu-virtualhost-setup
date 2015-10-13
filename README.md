# digitalocean-ubuntu-virtualhost-setup
Bash script to set up Apache virtual hosts on an Ubuntu 14.04 VPS according to this Digital Ocean guide: https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-ubuntu-14-04-lts

<h3>Installation</h3>

Download the script

Apply permission to execute:

<code>$ chmod +x /path/to/ubuntu-create-virtualhost.sh</code>

<h3>Usage</h3>

Using a non-root user with root priviledges you use the basic command line syntax:

<code>$ sudo sh /path/to/ubuntu-create-virtualhost.sh [domain] [host_dir]</code>

domain: Domain name being setup e.g. example.com<br/>
host_dir: Name of the host directory to be created in /var/www/

<h3>Example</h3>

<code>sudo sh /path/to/ubuntu-create-virtualhost.sh example.com example</code>

And that's all folks
