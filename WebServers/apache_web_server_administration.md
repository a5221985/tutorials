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
1. Large log files is slow and cpu may be consumed
2. `whereis logrotate`
	1. `yum install logrotate`
3. `vi /etc/logrotate.d/apache24`

		/etc/httpd/logs/*.log {
				daily
				rotate 3
				size 2K
				compress
				delaycompress
				postrotate
				/bin/systemctl reload httpd.service > /dev/null 2>/dev/null || true
			endscript
		}

	1. `daily`, `weekly`, `monthly` - Rotates everyday
	2. `rotate 3` - only 3 rotated file should be kept (4th run will remove oldest one)
	3. `size 2K` - if size becomes 2K, file will be rotated
		1. `10M` or `100M` - batch environment
	4. `compress` - all rotated logs except for the most recent one should be compressed
	5. `postrotate ...` - reload httpd service after log rotation
4. `logrotate -t /etc/logrotate.d/apache24`
	1. `cd /etc/httpd/logs/`
		1. `ls -l`
			1. rotated files for `akademia_access.log` and `akademia_error.log`

## Security ##
### Basic Security - Part 1 ###
1. `curl -I akademia.cloud`
	1. `Server: Apache/2.4.6 (CentOS)` - this is security risk and should not be exposed
	2. `vi /etc/httpd/conf/httpd.conf`

			# Security configuration
			ServerTokens Prod <!-- Removes apache release info -->
			ServerSignature Off <!-- Removes version info from page generated by apache web server 403, 404, 502 ... -->

		1. `systemctl restart httpd`
		2. `curl -I akademia.cloud`
			1. `Server: Apache`
2. Removing directory listing
	1. `akademia.cloud/info/`
		1. All files from directory are shown as list (if no index.html)
	2. `cd /etc/httpd/conf.d/akademia.cloud.conf`

			# Options +Indexes
			Options -Indexes

	3. `systemctl restart httpd`
		1. forbidden
3. Disable etag (attackers can get multiple mime boundary, child process, ... through etag header)
	1. `curl -I akademia.cloud`
		1. `ETag: "..."`
	2. `vi /etc/httpd/conf/httpd.conf`

			# Security configuration
			...
			FileETag None

		1. `systemctl restart httpd`
		2. `curl -I akademia.cloud`
			1. No ETag

### Basic Security - Part 2 ###
1. Root running apache is not good
	1. If installing apache from source this requires configuration
		1. `useradd apache` **(M)**
		2. `groupadd apache` **(M)**
		3. `usermod -g apache apache` (adding user to group)
		4. `chown -R apache.apache /etc/httpd/`
	2. `cd /etc/httpd/conf/httpd.conf`

			User apache
			Group apache

	3. `systemctl restart httpd`
	4. `ps -ef | grep httpd`
		1. First process runs with root because apache runs on port 80
2. Permissions
	1. 750 (others cannot read write or execute)
		1. `chmod 750 /etc/httpd/conf.d`
		2. `vi /etc/httpd/conf/httpd.conf`

				<Directory />
					AllowOverride none
					Require all deinied
				</Directory>

	2. `systemctl restart httpd`
3. Prevent hacker from steeling cookies by disabling trace of http request
	1. `vi /etc/httpd/conf/httpd.conf`

			TraceEnable off

	2. `systemctl restart httpd`

### Set up TLS/SSL for Free ###
1. Let's encrypt - 90 days
	1. `yum install epel-release`
	2. `yum install mod_ssl python-certbot-apache`
	3. `firewall-cmd --permanent --add-service=https` - enable https
	4. `firewall-cmd --reload`
	5. `certbot --apache -d akademia.cloud` - `-d` domain
		1. `mtork@linuxdirection.com`
		2. `A`
		3. `N`
		4. Allow visitor http or https
			1. `2` - https
	6. `vi /etc/httpd/conf.d/akademia.cloud-le-ssl.conf`
		1. Google - verify ssl online
			1. `SSL Shopper`
				1. Domain name
					1. 89 days
		2. `http://akademia.cloud` - redirects to https
	7. Auto renew
		1. `crontab -e`

				59 11 * * * /usr/bin/certbot renew >> /ver/log/ssl-renew.log
		
			1. everyday at 11:59 PM
		2. `systemctl restart crond`

2. E-commerce
	1. Credit cards - higher secure SSL

### Basic Authentication ###
1. Admin URL by authorized people only
	1. `mkdir /var/www/akademia/admin`
	2. `echo "Admin page" > /var/www/akademia/admin/index.html`
	3. `https://akademia.cloud/admin/` - can access
	4. `vi /etc/httpd/conf.d/akademia.clud-le-ssl.conf`

			<VirtualHost mode_ssl.c>
				...
				<Directory "/var/www/akademia/admin">
					AuthType Basic
					AuthName "For authenticated asers" <!-- message to user who wants to access the page -->
					AuthUserFile /etc/httpd/password/passwords_file <!-- username and password -->
					Require valid-user <!-- any valid user from the above file -->
				</Directory>
				...
			</VirtualHost>

		1. `httpd -t`
		2. `systemctl reload httpd`
		3. `mkdir /etc/httpd/password`
		4. `htpasswd -c /etc/httpd/password/passwords_file user1`
			1. Password
			2. Password again
		5. `cat /etc/httpd/password/passwords_file`
			1. user1:<encrypted-password>
		6. `https://akademia.cloud/admin`
			1. user1
			2. password
	5. `htpasswd /etc/httpd/password/passwords_file user2`
		1. password 2 times
	6. `cat /etc/httpd/password/passwords_file`
		1. 2 users

### Digest Authentication ###
1. `mkdir /var/www/akademia/mod`
2. `echo "mod area" > /var/www/akademia/mod/index.html`
3. `htdigest -c /etc/httpd/password/digest "Private" user3`
	1. password 2 times
	2. `cat /etc/httpd/password/digest`
		1. `user3:Private:<password-encrypted>`
4. `vi /etc/httpd/conf.d/akademia.cloud-le-ssl.conf`

		<Directory /var/www/akademia/mod>
			AuthType Digest
			AuthName "Private"
			AuthUserFile /etc/httpd/password/digest
			Require valid-user
		</Directory>

	1. `systemctl reload httpd`
	2. `https://akademia.cloud/mod/`
		1. user3
		2. password
5. `htdigest /etc/httpd/password/digest "Private" user4`
	1. password 2 times

### Access Control ###
1. Allowing specific IP to access web-server
	1. `vi /etc/httpd/conf.d/akademia.cloud-le-ssl.conf` - if https
		1. Delete digest part

				<Directory "/var/www/akademia/admin/"> <!-- admin page -->
					<RequireAll> <!-- allows or denies ips from accessing website -->
						Require ip 185.183.107.65
					</RequireAll>
				</Directory>

			1. `systemctl reload httpd`
			2. `https://akademia.cloud/admin/` - no permission
	2. Require all

			<RequireAll>
				Require all granted
				Require not ip 185.183.107.65
			</RequireAll>

		1. Except the specific ip all other ips can access the admin area
2. Deny all ips to browse admin

		Require all denied 

### .htaccess (Administrator Side) ###
1. `vi /etc/httpd/conf.d/htaccess.conf`

		<Directory "/var/www/html/*/">
			AllowOverride AuthConfig
		</Directory>

	1. Allowing all .htaccess files stored anywhere under `/var/www/html/` allowed to be read by apache service
		1. `AllowOverride AuthConfig` - allowing apache to read only the authentication part in the htaccess file
	2. `service httpd restart`

### .htaccess (User Side) ###
1. How the user will configure basic authentication using htaccess
2. Filezilla
	1. New directory - `/members`
	2. Open the directory
	3. New file - `.htaccess`
	4. Open the file

			AuthType Basic
			AuthName "By Invitation only"
			AuthUserFile /var/www/html/examplecom/.htpasswd/passwd
			Require valid-user

		1. password file
		2. Requires valid user
	5. Save and close
3. User cannot use `htpasswd` command
	1. Open `www.htaccesstools.com/htpasswd-generator`
		1. Enter username
		2. Enter password
		3. Click on **Create .htpasswd file**
		4. Copy the line
	2. Directory `/.htpasswd`
		1. File `passwd`
			1. Open the file
			2. Paste the line
4. Open `example.com/members`
	1. Type username
	2. Type password

### Authentication (notes) ###

Authentication ( notes )
1- BASIC AUTHENTICATION LESSON

<!DOCTYPE html>
<html>
<body>
<hl>Admin's web pages</hl>
<p>Restricted web page</p>
</body>
</html>

( basicAuth.conf ) file :

<directory “/var/www/html/examplecom/admin”>
AuthType Basic
AuthName “For authenticated users”
AuthUserFile /etc/httpd/password/passwords
Require valid-user
</Directory>

------------------------------------------------------------------------------------------------------------------------------------------------------

2 - DIGEST AUTHENTICATION LESSON

( DigestAuth.conf ) file :

<Directory /var/www/html/examplecom/mod>
AuthType Digest
AuthName “private”
AuthUserFile /etc/httpd/password/digest
Require valid-user
</Directory>

------------------------------------------------------------------------------------------------------------------------------------------------------

3 - ACCESS CONTROL LESSON

<Directory /var/www/html/examplecom>
deny from all
</Directory>

------------------------------------------------------------------------------------------------------------------------------------------------------

4 - .HTACESS ( ADMINISTRATOR SIDE )

( htaccess.conf ) file :

<Directory “/var/www/html/*/”>
AllowOverride AuthConfig
</Directory>

### Install and Configure Antivirus ###
1. `yum -y install epel-release`
2. `yum -y install clamav-server clamav-data clamav-update clamav-filesystem clamav clamav-scanner-systemd clamav-devel clamav-lib clamav-server-systemd`
3. In production - enable se-linux
4. `setsebool -P antivirus_can_scan_system 1`
5. `setsebool -P clamd_use_jit 1`
6. `vi /etc/clamd.d/scan.conf`

		#Example

		LocalSocket /var/run/clamd.scan/clamd.sock

7. `vi /etc/freshclam.conf`
8. `freshclam` - udpates database
9. `clamscan -r /var/www/akademia`
10. Download virus:
	1. `cd /var/www/akademia`
		1. `wget http://www.eicar.org/download/eicar.com`
	2. `clamscan -r /var/www/akademia`
		1. Delete the file
	3. Removing virus
		1. `clamscan -r --remove /var/www/akademia/`
11. Moving infected file to another directory
	1. `mkdir /tmp/quarantine`
	2. `clamscan -r --move=/tmp/quarantine /var/www/akademia/`

### Mitigate DOS Attacks - mod_evasive ###
1. How to protect web server using mod-evasive
	1. Prevents suspicious IPs from accessing the website for a period of time
		1. Not for huge attacks
			1. Cloud flare
2. `yum -y install mod_evasive`
	1. `httpd -M | grep evasive`
3. `vi /etc/httpd/conf.d/mod_evasive.conf`
	1. Delete all between `<IFModule ...`
	2. Add the following

			<IFModule mod_evalive24.c>
				DOSHashTableSize 3097 <!-- has lookup of sites the client has visited in the past -->
				DOSPageCount 2 <!-- how many identical requests to a specific URI/URL a visitor can make over the DOS page interval -->
				DOSSiteCount 5 <!-- how many requests overall a visitor can make to the site over the DOS interval -->
				DOSPageInterval 1
				DOSSiteInternal 1
				DOSBlockingPeriod 10 <!-- If user exceeds the limit in DOS site count or DOS page count, IP will be blocked for the specified amount of time - 10 minutes - 403 error will be shown -->
				DOSEmailNotify admin@linuxdirection.com <!-- needs mailx -->
			</IFModule>

		1. `yum install mailx`
4. `www.akademia.com/`
	1. `tail -f /var/log/messages`
		1. Black listed IP address

## Apache Performance and Troubleshooting ##
### Apache Multi-Processing Modules (MPMs) ###
1. MPM modules allow us to use threads or move apache to different OS
2. Three types of MPMs - only one can be activated
	1. **The worker MPM** - uses multiple child processes with many threads each
		1. Each thread handles one connection at a time
		2. Good choice for high-traffic servers - it has smaller memory footprint than prefork MPM
	2. **The event MPM** - Threaded like worker MPM but allows more requests to be served simultaneously by passing off some processing work to supporting threads, freeing up main threads to work on new requests
	3. **The prefork MPM** - Uses multiple child processes with one thread each
		1. Each process handles only one connection at a time
		2. Comparable in speed to worker but uses more memory
		3. Advantages in some situations over worker
			1. Can be used with non-thread-safe third-party modules
			2. Easier to debug on platforms with poor thread debugging support
3. Prefork MPM is default (2.4)
4. Which MPM to configure is upto us based on our needs
5. Configuration
	1. StartServers (Prefork, Event, Worker MPM)
		1. sets number of child server processes created on startup
		2. Number of processes is dynamically controlled depending on load
			1. Very little reason to adjust this parameter
	2. MinSpareServers(Prefork MPM)
		1. Sets desired min number of idle child server processes
			1. Idle process is the one not handling a request
		2. If fewer spare servers are idle than the specified value, parent process initiates new children at a maximum rate of 1 per second
		3. Setting the parameter to a large number is a bad idea
	3. MaxSpareServers(Prefork MPM)
		1. Sets desired max number of idle child server processes
		2. If there are more than MaxSpareServers idle, then parent process will kill off excess processes
		3. If more idle processes exist than this number, they are terminated
		4. Set the number high if website is extremely busy (or else don't)
			1. Idle processes consume valuable resources
	4. ServerLimit(Prefork, Event, Worker MPM)
		1. When using Preform MPM, ServerLimit is used in case we need to set MaxRequestWorkers higher than 256 (default)
		2. Match value to MaxRequestWorkers (not higher)
		3. For Worker and Event MPMs, directive is combined with ThreadLimit set max configured value for MaxRequestWorkers for lifetime of Apache httpd process
		4. For Event MPM, the directive defines how many old server processes may keep running and finish processing open connections
	5. ThreadLimit(Event, Worker MPM)
		1. Sets max configured value for ThreadsPerChild for lifetime of Apache httpd process
			1. During restart, change to this param is ignored
		2. ThreadsPerChild can be modified during restart up to this value
		3. Care: If ThreadLimit is much higher than ThreadsPerChild, extra un-used shared memory is allocated
		4. If ThreadLimit and ThreadsPerChild are set to values higher than system can handle, Apache httpd may not start or system may become unstable
			1. Value should not be higher than greatest predicted setting of ThreadsPerChild for current run of Apache httpd
	6. ThreadsPerChild(Event, Worker MPM)
		1. Sets number of threads created by each child process
		2. Created at startup and never more
		3. `mpm_winnt` (or the likes) - only one child process - the number should be high enough to handle the entire load of the server
		4. Worker mpm - multiple child processes - total number of threads should be high enough to handle common load on server
	7. MaxRequestWorkers/ MaxClients(Prefork, Event, Worker MPM)
		1. MaxClients is also supported
		2. Sets limit on the number of simultaneous requests that will be served
		3. Connections over MaxRequestWorkers limit will be queued up to number based on ListenBacklog directive
		4. If child process is free after serving a request, the new connection will be served
		5. If value is too low, connections sent to queue may time-out
		6. If value is too high, memory may start swapping
		7. For non-threaded servers (prefork)
			1. Maximum number of child processes that will be launched to server requests
				1. Default - 256
			2. To increase, raise ServerLimit as well (should have equal or near equal values and MaxRequestWorkers never exceeding ServerLimit)
			3. The number should be increased for servers under high load
	8. MaxConnectionsPerChild(Prefork, Event, Worker MPM)
		1. Sets limit on number of connections that an individual child server process will handle
		2. After MaxConnectionsPerChild, child process will die
			1. If 0, process will never expire
		2. If non 0, limits amount of memory consumed by accidential memory leakage

### Adjusting httpd.conf - Part 1 ###
1. Topics - For better performance
	1. Timeout
	2. KeepAlive
	3. KeepAliveTimeout
	4. MaxKeepAliveRequests
2. Timeout
	1. Sets the number of seconds before data sends to or receives from the client timeout
		1. http.conf
			1. Timeout 100
				1. If high - consumers may have to wait which may increase CPU load
				2. If low - long running scripts terminate
				3. 100 - for heavily loaded servers
				4. 300 - for normally loaded servers
				5. Default value - 300 s
3. KeepAlive
	1. Enables persistent connections on web server
		1. Allows multiple requests to be served over the same TCP connection
		2. Should be on if we don't have connections from many IPs at once
			1. If heavy traffic, disable it
		2. httpd.conf
			1. KeepAlive on # enable KeepAlive
			2. KeepAlive off # disable KeepAlive
4. KeepAliveTimeout
	1. Number of seconds apache will wait for a subsequent request before closing connection
		1. httpd.conf
			1. KeepAliveTimeout 5
	2. Applies once request is received
	3. High value may cause performance problems in heavily loaded servers
		1. More server processes will be kept occupied waiting for connections with idle clients
		2. Default value 10 s - recommended 5 for servers under heavy load
5. MaxKeepAliveRequests
	1. Limits number of requests per connection when KeepAlive is on.
		1. If 0 - unlimited requests will be allowed
		2. -httpd.conf
			1. MaxKeepAliveRequests 100
				1. Recommended 100 to 150

### Adjusting httpd.conf - Part 2 ###
1. ExtendStatus - to gather statistics about web server
	1. Negatively impacts performance
		1. Disable it normally
		2. Enable it for short period of time for statistics
2. `vi /etc/httpd/conf/httpd.conf`

		# Adjusting httpd.conf
		ExtendedStatus Off

3. Disabling hostname lookups
	1. DNS lookups cause additional CPU time (rarely need this)

			# Adjusting httpd.conf
			...
			Hostnamelookups off

		1. `httpd -t`
	2. `systemctl restart httpd`

### Troubleshooting Apache (Analyz Access Log) - Part 1 ###
1. Access logs can help us solve common issues
	1. Attacks
2. It is a skill that is much required for sys admins
3. `cd /etc/httpd/logs/`
	1. `ls -l`
	2. `access_log` - other access logs
	3. `tail -n 1 access_log`
		1. IP|data and time|request|response|files|referal|agent
			1. If website is slow:
				1. Check for DOS attacks (a lot of requests or connections)
					1. Number of connections for each IP
						1. `cat access_log | awk '{print $1}' | sort | uniq -c | sort -n | tail -n 10`
							1. IP at the bottom
								1. Copy the ip to whois.domaintools.com
									1. Location
										1. It is safe or not
								2. `cat access_log | grep "<ip>"`
									1. `\x03` - client tried to connect without sending anything so nothing suspicious
				2. Take next ip
					1. `cat access_log | grep "<ip>"`
						1. Did lot of head request
							1. Disable head request (admin)
					2. Block the guy
	3. Top requests
		1. `cat access_log | awk '{print $6}' | sort | uniq -c | sort -n | tail -n 10`
		2. Combining
			1. `cat access_log | awk '{print $1,$6}' | sort | uniq -c | sort -n | tail -n 10`
	4. POST requests
		1. `cat access_log | grep "POST"`
			1. `xmlrpc.php` - file used to launch attacks
				1. Block the ips

### Troubleshooting Apache (Analyz Access Log) - Part 2 ###
1. `yum install git`
2. `yum install python-pip`
3. `mkdir /scripts/`
4. `cd /scripts`
5. `git clone https://github.com/mohtork/Sinai-Apache.git`
6. `pip install geoip2`
7. `pip install PrettyTable`
8. `cd Sinai-Apache`
9. `wget https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz`
10. `tar xvfz GeoLite2-City.tar.gz`
11. `mv GeoLite2-City_20171205/GeoLite2-City.mmdb .`
12. `python sinai.py -h`
13. `python sinai.py /etc/httpd/logs/access_log --topip` - top 10 ips with num of connections
14. `python sinai.py /etc/httpd/logs/access_log --topidloc` - with country
15. `python sinai.py /etc/httpd/logs/access_log --bandwidth` - total bandwidth
16. `python sinai.py /etc/httpd/logs/access_log --topstatus` - status codes

### Use Apachetop to Monitor Web Server Traffic ###
1. How to monitor web-server traffic in realtime with apachetop
	1. Also works with nginx
2. `yum install epel-release`
3. `yum install apachetop`
4. `apachetop -f /etc/httpd/logs/akademia_access.log -T 600` (past 5 minutes)
	1. All requests
	2. Previous 30 seconds requests
	3. Actual requests
	4. % for status codes
	5. Right arrow
		1. Know more info about a request
			1. IP
	6. Press P - pauses monitoring
	7. Press H - help
	8. Press Q - Quit