# Complete Apache HTTP Server Course #
## Essentials ##
### Introduction to web server ###
1. Essentials:
	1. What is a Web Server?
	2. Web Server History
	3. Web Server Software
	4. Examples of Web Server Software
	5. Web Server Usage Statistics
	6. What is HTTP?
	7. How HTTP Works?
	8. Apache Web Server
2. What is a Web Server?
	1. server is in data center
	2. contains files of website
	3. delivers files over http protocol
3. History
	1. Sir Tim Beners Lee - 1989
	2. Based on Hypertext (has links)
	3. TCP and DNS were used
	4. Three fundamentals
		1. HTML
		2. URI
		3. HTTP
4. Web Server Software
	1. Web Server - HTTP Server - Application Server
	2. Serve content using the HTTP protocol
	3. Static Content - Dynamic Content
		1. Dynamic content
			1. Conversion of currencies
	4. Must implement the HTTP Protocol

5. Examples of Web Server Software
	1. More than 30 web-servers (paid or free)
		1. Apache HTTP Server
			1. Apache has improved and is competing with Nginx
		2. Nginx Web Server (Engine X)
			1. Nginx+ - paid
		3. IIS Web Server
		4. Other Web Servers
			1. LiteSpeed
			2. Google Servers
			3. Tomcat
			4. Lighttpd
			5. Full List of Web Servers
6. Apache is most used then IIS then nginx

### Essentials ###
1. What is HTTP protocol?
	1. Hypertext Transfer Protocol
		1. It is application layer protocol for distributed, collaborative hypermedia systems
		2. Used to deliver data between server and client
		3. It is based on TCP/IP
			1. Data is reliably transmitted
	2. TCP/IP
	3. Default port: 80
		1. Other ports can be used
2. How HTTP Works?
	1. Address is entered
	2. Information is sent back to client
		1. Along with meta information
	3. `http://` need not be entered (implied)
3. Apache Web Server (HTTP)
	1. Open source
	2. Fast, reliable and secure
	3. Highly customizable (using extensions and modules)
4. Advantages of Apache HTTP
	1. Price
	2. Features
		1. They compare to high priced compatitors
		2. Admin control panel
		3. Customizable error messages
		4. Authentication schemas
		5. Virtual hosting modules - allow us to run multiple websites from same server
		6. We can tweak to suite technical capabilities of hardware
		7. Programming languages
			1. Php
			2. Perl
			3. Python
		8. SSL and TLS encryption
	3. Compatibility
	4. Community Support
		1. Technical support available worldwide
			1. Community develops a patch to fix it

## Getting Started with Apache ##
### Install Apache on CentOS 7.4 ###
1. `yum update`
2. `yum install httpd`
	1. `2.4.x`
3. Start apache service: `systemctl start httpd.service` (or `httpd`)
4. Check if it started: `systemctl status httpd`
5. `http://<ip>`
6. For reboot: `systemctl enable httpd` **(M)**

### Enable Apache to Automatically Start When System Boot ###
1. `yum install elinks`
	1. `elinks` - browser in the console
	2. `Q` to quit
2. Status:
	1. `systemctl status httpd`
		1. `disabled` - need to start manually
			1. `systemctl enable httpd`

### Configure the Firewall Service ###
1. `ip addr` **(M)**
	1. Firewall
		1. `firewall-cmd --permanent --add-service=http`
			1. `--permanent` - permanent change
			2. `--add-service` - allows access to port 80
		2. `firewall-cmd --permanent --add-service=https`
			1. `--add-service` - allows access to port 443
		3. `firewall-cmd --reload`

### Where is Apache? ###
1. `whereis httpd`
2. `httpd -h` - lists all options
	1. `/usr/lib64/httpd` - all apache modules
	2. `/etc/httpd` - all config files for apache web server
	3. `/usr/share/httpd` - templates for messages and alerts that appear to the user
		1. Error for 404, ...
	4. `/usr/share/man/man8/httpd.8.gz` - user manuals

## Directory Structure ##
### Apache Directory Structure ###
1. `whereis httpd`
	1. `/usr/sbin/httpd` - binary file to control apache
		1. `/usr/sbin/httpd -h` - lists commandline options
			1. `-k` - start/restart/graceful ...
				1. May conflict with `systemctl`
			2. `/usr/sbin/httpd -m` (`httpd` also works)
				1. all modules loaded by apache
			3. `httpd -l` - compiled modules (inside apache)
			4. `httpd -t -f /etc/httpd/conf/httpd.conf` - validates configuration file
				1. Useful to verify the configuration before applying the changes
					1. `Syntax OK`
	2. `cd /usr/lib64/httpd`
		1. `cd modules`
			1. `*.so`
	3. `cd /usr/share/httpd` - apache error pages in different languages, icons, images
	4. `cd /etc/httpd`
		1. `cd conf` - main apache config files
		2. `cd conf.d` - custom configuration files (`*.conf` extension)
		3. `cd conf.modules.d` - modules config files
		4. `logs` - apache log files - symlink to `/var/log/httpd`
		5. `modules` - symlink to `/usr/lib64/httpd/modules`

### Configuration File ###
1. `cd /etc/httpd/conf`
	1. `ls`
		1. `httpd.conf` - main config file
			1. `vi httpd.conf`
				1. It is like instruction manual for apache
				2. Directives
					1. `ServerRoot` - where apache is installed `/etc/httpd`
					2. `Listen` - on which port it is listening `80`
						1. We can change to new port
					3. `Include` - includes other config files from another locations `conf.modules.d/*.conf` - includes all files that end with `.conf` from `conf.modules.d` directory
					4. `User` - which user and group will run the apache webservice
					5. `Group` which group ...
					6. `ServerAdmin` - email for webserver administrator
						1. error messages go to the admin
					7. `ServerName` - server hostname
						1. Modify DNS for the domain
							1. A record will point to IP address of web-server
					8. `Directory` - applies some rules on the directories of the file system
						1. `AllowOverride none`
						2. `Require all denied`

### Creation of Your First Page ###

## Virtual Hosts ##
### Setting Up the Virtual Host - Name Based ###
### Setting Up the Virtual Host - Port Based ###

## Using Aliases and Redirecting ##
### Configuring an Alias for a URL ###
### Redirects ###

## Logging ##
### The Error Log ###
### The Access Log ###
### Custom Log ###
### Log Rotation ###

## Security ##
### Basic Security - Part 1 ###
### Basic Security - Part 2 ###
### Set up TLS/SSL for Free ###
### Basic Authentication ###
### Digest Authentication ###
### Access Control ###
### .htaccess (Administrator Side) ###
### .htaccess (User Side) ###
### Authentication (notes) ###
### Install and Configure Antivirus ###
### Mitigate dos Attacks - mod_evasive ###

## Apache Performance and Troubleshooting ##
### Apache Multi-Processing Modules (MPMs) ###
### Adjusting httpd.conf - Part 1 ###
### Adjusting httpd.conf - Part 2 ###
### Troubleshoot Apache (Analyze Access Log) - Part 1 ###
### Troubleshoot Apache (Analyze Access Log) - Part 2 ###
### Use Apachetop to Monitor Web Server Traffic ###
