## Directory Structure ##
### Apache Directory Structure ###
1. `whereis httpd`
	1. Location of apache files and directories
	2. `/usr/sbin/httpd` - binary file to control apache web server
		1. `/usr/sbin/httpd -h` - lists available commandline options
			1. `-R start|restart`
				1. Conflict with systemctl
	3. `/usr/sbin/httpd -M` (`httpd` works)
		1. All modules loaded by apache
	4. `httpd -l`
		1. modules compiled inside apache
	5. `httpd -t -f /etc/httpd/conf/httpd.conf` - validates apache config file
		1. Before starting apache service
			1. `Syntax OK`
	6. `whereis httpd`
		1. `cd /usr/lib64/httpd`
			1. `ls`
				1. `modules`
					1. All apache module files (*.so)
	7. `/usr/share/httpd` - error pages in different languages, icons and images
	8. `cd /etc/httpd`
		1. `conf` - apache config file
		2. `conf.d` - custom config files
			1. should end with `.conf` extension (apache can read it)
		3. `conf.modules.d` - modules config files
		4. `logs` - apache log files
			1. `logs -> ../../var/log/httpd`
		5. `modules` - symlink
			1. `modules -> ../../usr/lib64/httpd/modules`

### Configuration File ###
1. `cd /etc/httpd/conf`
	1. `httpd.conf` - main config file of apache web-server
		1. Edit - all directives that apche executes

				ServerRoot "/etc/httpd" - where apache is installed in the system

				Listen 80 - tells on which port apache is listening (we can change)

				Include conf.modules.d/*.conf - includes other config files from another location on the server. All files that end with .conf

				User apache - which user will run apache web service
				Group apache - which group will run apache web service

				ServerAdmin root@localhost - errors go to administrator

				ServerName lion.coursesvalley.net:80 - A record will point to main IP address of web-server

				<Directory /> <!-- applies some rules on directories in filesystem - on root directory here -->
					AllowOverride none <!-- prevent modification on root directory using htaccess file -->
					Require all denied <!-- No access to root -->
				</Directory>

				DocumentRoot "/var/www/html" - tells where is the location of stored files for website running on the web-server

				<Directory "/var/www">
					AllowOverride None <!-- prevent modifications using htaccess file -->
					<!-- Allow all access -->
					Require all granted
				</Directory>

				<IfModule dir_module> <!-- rule is applied if the module is installed -->
					DirectoryIndex index.html <!-- Served if someone opened the link in browser - default file served, if file does not exist, all files are served as file list -->
				</IfModule>

				<Files ".ht*"> <!-- used to apply rules on a file, .htaccess and .htpassword -->
					Require all denied <!-- denies access to the files -->
				</Files>

				ErrorLog "logs/error_log" <!-- tells where to write error log messages -->

				LogLevel warn <!-- warn level -->

				<IfModule log_config_module> <!-- applies rules of the module exists -->
		
						LogFormat "...." combined <!-- format of access_log -->
						...

				IncludeOptional conf.d/*.conf <!-- includes .conf files from conf.d directory -->
		
		1. Save and restart apache
			1. `systemctl restart httpd`

### Creation of Your First Page ###
1. `cd /var/www/html/`
	1. `mkdir courses`
		1. `echo "courses valley index page" > courses/index.html`
		2. `cat courses/index.html`
	2. `cd /etc/httpd/conf.d`
		1. `vi courses.conf`

				<VirtualHost *::80> <!-- allows to construct more websites on the same server -->
					ServerName coursesvalley.net <!-- domain name -->
					DocumentRoot /var/www/html/courses <!-- files are located here -->
				</VirtualHost>

			1. Save and restart apache
				1. `systemctl restart httpd` - no error so no problems
	3. `http://coursesvalley.net`

## Virtual Hosts ##
### Setting up the Virtual Host - Name Based ###
1. Point domain's a record to server's public IP
	1. `mkdir /var/www/akademia`
	2. `vi /etc/httpd/conf.d/akademia.cloud.conf` (can be any name - but domain name is best practice)

			<VirtualHost *:80>
				DocumentRoot "/var/www/akademia"
				ServerName www.akademia.cloud
			</VirtualHost>

		1. VirtualHost - virtual host that listens to any IP on the system (*) - public or private and port 80
		2. DocuementRoot - serve files from this directory
		3. ServerName - domain name for this virtual host
	3. `echo "This is our main web site" > /var/www/akademia/index.html`
	4. `httpd -t` - Syntax OK
	5. `systemctl reload httpd`

### Setting up the Virtual Host - Port Based ###
1. For running a website on different port
	1. `mkdir /var/www/web`
	2. `echo "Hello to web.akademia.cloud" > /var/www/web/index.html`
	3. `vi /etc/httpd/conf.d/web.academia.cloud.conf`

			listen 8080 <!-- apache listens to this port -->

			<VirtualHost *:8080>
				DocumentRoot "/var/www/web"
				ServerName web.akademia.cloud
			</VirtualHost>

		1. `httpd -t` Syntax OK
		2. `systemctl reload httpd`
	4. `firewall-cmd --permanent --add-port=8080/tcp`
	5. `firewall-cmd --reload`
	6. `http://web.academia.cloud:8080`

## Using Aliases and Redirecting ##
### Configuring an Alias for a URL ###
1. We need to send request to a file in a different document directory than the one in your directory
	1. Alias is used to redirect visitors to a new resource location
		1. Alias module - defaultly enabled
			1. `httpd -M | grep alias` - `alias_module (shared)`
	2. `vi /etc/httpd/conf.d/academia.cloud.conf`

			Alias /img /var/www/html/images <!-- www.academia.cloud/img - will gives images from /var/www/html/images -->

	3. `httpd -t`
	4. `systemctl reload httpd`
	5. `mkdir /var/www/html/images`
	6. `cd /var/www/html/images`
	7. `wget ...jpg`
	8. `http://akademia.cloud/img/`

### Redirects ###
1. Re-directing URLs
	1. If content is moved to new URL
	2. For SEO
2. `temp` - resource has moved directory (302)
3. `permanent` - resource has move permanently
4. `seeother` - requested url replaced by another one (303)
5. `gone` - resource is removed permanently (410)
6. `echo "old download page" > /var/www/akademia/program.html`
7. `echo "new download page" > /var/www/akademia/download.html`
8. `curl -I akademia.cloud/program.html`
	1. Status code 200
9. `vi /etc/httpd/conf/d/akademia.cloud.conf`

		Redirect permanent /program.html /download.html <!-- full URL can be given -->

	1. `httpd -t` Syntax OK
	2. `systemctl reload httpd`
	3. `http://akademia.cloud/program.html` -> `http://akademia.cloud/download.html`
	4. `curl -I akademia.cloud/program.html`
10. Change to `temp`

		Redirect temp /program.html /download.html <!-- status code is 302 -->

## Logging ##
### The Error Log ###
1. `cd /etc/httpd/logs`
	1. `ls -l`
		1. `error_log` - virtual host errors
			1. `vi error_log`
				1. date and time|log level|process id|message from error
					1. IP - accessed directory which does not exist

### The Access Log ###
1. `vi access_log`
	1. IP that raised request|date and time|request|status code|size of data sent by client|referral (url)|agent (browser)
	2. Some IPs try to access website (hacker)

### Custom Log ###
1. Specific logs
2. Apache log modules are enabled by default
	1. `httpd -M | grep log*`
	2. `cat /etc/httpd/conf/httpd.conf | grep "LogFormat"`
		1. `combined`
		2. `common`
		3. `combinedio`
3. Columns
	1. Remote host|identity of user|username|time request was received|request type|status code|response size|referer header (containing url)|user agent combined
	2. Common doesn't have user agent and referer
	3. Combinedio has (bytes received (cannot be zero)|bytes sent (cannot be zero))
4. `cd /etc/httpd/conf.d/akademia.cloud.conf`

		<VirtualHost *:80>
			...
			CustomLog logs/akademia_access.log combined
			...
		</VirtualHost>

	1. `httpd -t`
	2. `systemctl restart httpd`
	3. `cd /etc/httpd/logs`
		1. `akademia_access.log` - all access logs for this website
5. `academia.cloud`
	1. `tail akademia_access.log`
6. `vi /etc/httpd/conf.d/akademia.cloud.conf`

		ErrorLog logs/akademia_error.log

	1. No need for log format
	2. `httpd -t`
	3. `systemctl restart httpd`
	4. `mv /var/www/akademia/index.html /var/www/akademia/old.html`
		1. `tail -f akademia_error.log`

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
### Mitigate DOS Attacks - mod_evasive ###

## Apache Performance and Troubleshooting ##
### Apache Multi-Processing Modules (MPMs) ###
### Adjusting httpd.conf - Part 1 ###
### Adjusting httpd.conf - Part 2 ###
### Troubleshooting Apache (Analyz Access Log) - Part 1 ###
### Troubleshooting Apache (Analyz Access Log) - Part 2 ###
### Use Apachetop to Monitor Web Server Traffic ###