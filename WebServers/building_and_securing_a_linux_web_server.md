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
		1. It contains systemd targets and symbolic link for default.target
	2. Targets to focus on:
		1. `multi-user.target` and `graphical.target` - run level 5
		2. Installation of desktop environment is not required for web server
			1. Install CentOS without GUI
			2. GUI based CentOS is also fine
		3. List currently loaded targets using following command:
			1. `# systemctl list-units -t target` **(M)**
				1. Each service has three states
					1. enabled - service enabled, it will start at boot (if database needs to be started at boot time, then enable it)
					2. disabled
					3. static - depends on other services and is controlled automatically
						1. If a service depends on another service, then it will remain static until dependent service is started
	3. To list enabled services, use the following command - when a service is enabled, a symbolic link is created usually at multi-user.target - `/etc/systemd/system/multi-user.target.wants`
		1. `# systemctl list-unit-files --type=service | grep enabled`
		2. Open the following:

				cd /etc/systemd/system/multi-user.target.wants`
				ls -al

		3. To start/stop/restart services you can still use service. but hte new command is:

				systemctl status <servicename>
				systemctl stop <servicename>
				systemctl start <servicename>
				systemctl restart <servicename>

	4. Let's try it out!
		1. Install NTP with yum, check service status, start it and enabling to start at boot (multi-user target).

				yum install ntp
				systemctl list-units --type service --all | grep ntp

			1. Displayed in console, service is loaded but not active. Activate the service with the following commands

					systemctl start ntpd
					systemctl list-units --type service --all | grep ntp

			2. Set the service to start at boot:

					systemctl enable ntpd
					systemctl list-units --type service --all | grep ntp
					systemctl list-unit-files --type=service | grep enabled | grep ntpd - Checking enabled service

	5. Understanding IP Tables
		1. Securing Linux host is first thing before hosting web services
		2. CentOS 7 introduces `firewalld` installed by default instead of `IPTables`
		3. Another new comer (not yet loaded) is `Nftables firewalld` (doesn't replace IPtables)
	6. FirewallD
		1. It is default with RHEL and CentOS 7
			1. Difference? dynamic rule management and concept for network 'zones' (IPtables has static ruleset)
				1. A rule change with IPtables need flushing out all existing rules (`iptables -F`) the nsave new rules to `/etc/sysconfig/iptables` (iptables-save)
		2. Both IPtables and firewalld use IPtables service to talk to netfilter. Change is at user-space layer (filewall-cmd)
		3. Having good knowledge of iptables will strengthen firewalling in linux
	7. Getting started with iptables
		1. Basics: replace firewalld with IPtables
			1. stop and mask (hide) the firewalld service
			2. Install `iptables-services` and enable `IPtables`
				1. disabling service removes it from run level (`basic.target.wants`)
				2. mask option sets symbolic link to `/dev/null` so it cannot be started
		2. Commands
			
				# Stop and disable firewalld
				systemctl stop firewalld
				systemctl mask firewalld

				# Install iptables-services
				yum -y install iptables-services

				# Enable IPtables
				systemctl enable iptables
				systemctl enable op6tables
				systemctl start iptables
				systemctl start ip6tables

			1. options are case sensitive for IPtables
			2. At this time, there are no firewall rules, check existing rules using the following command:

					iptables -L

				1. Chains:
					1. Using verbose output to show stats on each rule `optables -L -v`
						1. If there are no matches on a given rule, mark it for deletion
			3. What are chains?
				1. chain: set of rules, checked one by one until it is matched
					1. 3 chains: INPUT, FORWARD, OUTPUT (processed in this order)
				2. Default policy for each chain is set to ACCEPT
					1. We can define rules as to which traffic to deny (everything else will go through)
						1. It is secure to do the opposite (define what should go through)
							1. Set default policy to DROP
								1. We will lose connectivity to linux host but
									1. Drop policies can be configured in later step
9. Order of chains
	1. Flush all chains
	2. Add rules for connections you want to drop
	3. Add rules for connections you want to accept
	4. Add logging rules (optional)
	5. Set default policy to drop for each chain
	6. Save and restart
10. Flushing the rules
	1. For IPtables, if rules have to be implemented and make change, we need to flush ruleset save and restart (because IPtables contains static configuration)
		1. Stop the IPtables service: `systemctl stop iptables`
		2. Flush out all of the rules: (start over): `iptables -F`
11. Creation of first iptables rules
	1. Dropping connections will be handled later
	2. First basic ruleset (set of chains) to allow incoming SSH connections:
		1. `iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT`
			1. `iptables -A INPUT` - append the rule to the end of the selected chain, in this case `INPUT`
			2. `-i eth0` - network interface, `eth0`
			3. `-p tcp` - protocol is TCP
			4. `--dport 22` - destination port is 22 (default for SSH)
			5. `-m state` - specifies what to match, (to check given state in this case)
			6. `--state` - `NEW` and/or `ESTABLISHED`, `RELATED`, `INVALID`
				1. `NEW` and `ESTABLISHED` are matched here
			7. `-j ACCEPT` - anything else will be dropped so accept this chain (rule) to allow SSH
		2. `iptables -A OUTPUT -o eth0 -sport 22 -m state --state ESTABLISHED -j ACCEPT`
12. Set policy to drop all other traffic
	1. Final three lines change policy (`-P`) for build in chains (INPUT, FORWARD and OUTPUT) to DROP.
		1. We can leave last OUTPUT chain to ACCEPT (this is traffic coming from host which is trusted)
			1. It is better to be specific as what to allow in and out

					iptables -P INTPUT DROP
					iptables -P FORWARD DROP
					iptables -P OUTPUT DROP
				
				1. Disable IPtables

						systemctl disable iptables
						systemctl disable ip6tables
						systemctl stop iptables
						systemctl stop ip6tables

13. Advanced SSH Security:
	1. Disable remote login for root with SSH
		1. Default: SSH config will allow root to login
	2. Another trick: change maximum number of SSH authentication attempts
		1. Tweak firewall rules to rate-limit number of SSH connections within given period of time
	3. Another trick: change SSH listening port from 22 to something else (9292)
	4. Disable root SSH login - there is no reason to allow root ssh
		1. Edit `/etc/ssh/sshd_config` and set `PermitRootLogin` to `no`

				# vi /etc/ssh/sshd_config

				PermitRootLogin no

			1. Restart SSH for these changes to take effect

					systemctl restart sshd

14. Changing maximum authentication attempts:
	1. Open `/etc/ssh/sshd_config` and change the following

			MaxAuthTries 3

15. Changing SSH Port
	1. Port scans will sweep range of IP addresses to find common open ports that can be targeted (21 - FTP, 22 - SSH, 23 - Telnet), some port scans try similar ports (222, 2222)
	2. We can reduce failed ssh connection attempts

			Port 9922

		1. Firewall rules need to be changed accordingly
16. Rate-limiting SSH Connections:
	1. To drop more than 3 connections per minute from an IP address
		1. Time frame can be adjusted to be more aggressive
	2. Example: 3 connections every 60 seconds

			iptables -A INPUT -i eth0 -p tcp --dport 9922 -m state --state NEW -m recent --set --name SSH
			iptables -A INPUT -i eth0 -p tcp --dport 9922 -m state --state NEW -m recent --update --seconds 60 --hitcount 4 --rttl --nae SSH -j DROP
			iptables -A INPUT -i eth0 -p tcp --dport 9922 -m state --state NEW,ESTABLISHED -j ACCEPT
			iptables -A OUTPUT -o eth0 -p tcp --sport 9922 -m state --state ESTABLISHED -j ACCEPT

		1. Port 9922 is used (instead of 22)
		2. `--set --name SSH` makes it easier to read later on
		3. Two new rules tat use `--recent` extension.
			1. defines list of IP addresses that matches certain criterion
17. Limiting Other Attack Vectors
	1. IPTables can be used to protect against these attacks
		1. Christmas tree packet has all options set (SYN, FIN, URG and PSH)
			1. If we are receiving a large number of these, then it could be a denial-of-service (DOS) attack
		2. Null packets indicate host is being scanned
			1. Single packet with no flags set
				1. Should be dropped (not legitimate)
		3. `Syn-floods` possible threat for DOS attacks
			1. As connection is started with `SYN` (part of three-way handshake) but doesn't respond with `ACK` (acknowledge)
				1. Like ringing someone's doorbell and running away
	2. Drop XMAS packets
		
			iptables -A INPUT -p tcp --tcp-flags ALL -j DROP

	3. Drop NULL packets

			iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

	4. Drop Syn-flood

			iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

18. Host Access (TCP_WRAPPER)
	1. This has nothing to do with IPtables - they are part of TCP_WRAPPER package
		1. `/etc/hosts.allow`
		2. `/etc/hosts.deny`
	2. It makes is possible to allow or deny access to certain services based on IP address
	3. It provides an additional layer of security
		1. A basic one
	4. All services do not support TCP wrappers
		1. sshd supports
			1. Check by running `whereis sshd` and searching for `libwrap.so` library

					whereis sshd
	
					sshd: /usr/sbin/sshd/usr/share/man/man8/sshd.8.gz

					ldd /usr/sbin/sshd | grep libwrap.so

					libwrap.so.0 => /lib64/libwrap.so.0

			2. Examples of its usage:

					vi /etc/hosts.allow

					sshd:XX.XX.XX.XX

					vi /etc/hosts.deny

					ALL:ALL

				1. A single IP address is allowed to access host with SSH (sshd) in `hosts.allow` anything else is denied in `hosts.deny`
					1. If IP address changes, we cannot access server without console access
						1. Multiple ip addresses can me specified
						2. `sshd:ALL` allows SSH from any IP
	5. Blocking IP address with IPtables

			iptables -I INPUT -i eth0 -s XX.XX.XX.XX -j DROP

			iptables -I INPUT -i eth0 -s XX.XX.XX.0/24 -j DROP

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
