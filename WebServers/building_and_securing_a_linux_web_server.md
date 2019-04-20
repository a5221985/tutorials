# Building and Securing a Linux Web Server #
## Course Contents ##
### Web Server Planning ##
1. Build linux web server using oracle cloud
2. CentOS/RHEL
	1. SE Linux
3. Assumptions:
	1. Vi, Vim, Nano
4. Linux security basics:
	1. Primary security requirements that will be discussed in the training
		1. SELinux will be enforcing security policies
		2. IPtables will provide firewall functionality
		3. TCP Wrapper will be configured for added security
		4. 2-Factor authentication (Google Authenticator) for WordPress
		5. SSL certificates must be used and HTTP will redirect to HTTPS (.htaccess will be used)
		6. FTP is not allowed, and all file transfers must be encrypted during transport (SSL/SSH file transfer)
		7. Multiple websites (virtual hosts) with SFTP users chroot (jailed) to their own directory
			1. Each website should have its own web directory
		8. SSH key based authentication (disable root access via SSH)
			1. No root access
		9. MySQL will be managed from the commandline (no phpMyAdmin please!)
5. Do I really have to use SELinux?
	1. It is a pain
		1. CentOS/RHEL4
	2. It is not that bad though
		1. Example: If a policy prevents a user or process from accessing a directory then it will be prevented by SELinux
	3. Targeted policy includes a list of processes that will be protected (or confined) by SELinux and anything not targeted will be unconfined and will use Discretionary Access Control (DAC) model.
		1. Almost all processes listening on network (httpd, sshd) are confined by SELinux
		2. If a process is confined and if it is compromised by an attacker, it will greatly reduce what the attacker can do
	4. Before SELinux is enabled, packages need to be installed and LAMP and WordPress will be configured.
		1. SELinux will be configured at the very end
6. Install Centos Server - command line base (No GUI: It makes system slower and runs unwanted things)
7. Managing services with systemd
	1. service, chkconfig - RHEL and CentOS - old - to manage services
		1. RHEL is paid version of CentOS
	2. System V run levels
		1. uses `/etc/init.d/` to manage services (Centos 7 uses SystemD as the default init system)
	3. `Init` was the first process to start and the last to stop on SysV (System V Unix) linux system.
		1. Basic concept of run-levels
			1. Each run-level representing each state of the system
				1. 0 - shutdown (halt)
				2. 3 - multiuser mode (server has booted) - we are going to be here
				3. 5 - running the desktop environment if you use on (X Server starts and you have a desktop)
				4. 6 - restarts the system
8. SystemD
	1. Instead of `/etc/init.d/`, systemd now uses `/etc/systemd/system/`
		1. It contains systemd targets and symbolic link for default target

### (CentOS) Linux Server Installation and Updates ###
### Installing Core Packages for Web Server ###
### Managing Linux Services ###
### Installing LAMP ###
### Configuring MariaDB (Database Server) ###
### IPTables Demos ###
### Sample IPTables Ruleset Used in This Course ###
### Configure Automatic Updates ###
### Configuring SSH Server ###
### Deploying a WordPress on CentOS ###
### Bonus Chapter - Cloud Deployment ###
