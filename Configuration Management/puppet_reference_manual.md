# Puppet #

## Quick start guides ##
### Quick start intro for *nix users ###
1. Puppet installation
2. Automate basic tasks that sysadmins perform

#### Perform pre-install tasks ####
1. [these instructions](https://docs.puppet.com/puppet/4.9/install_pre.html)
	1. Decide on deployment type:
		1. agent/master architecture or self-contained architecture
			1. Packages we install and configuration differs with the architecture
	2. For standard agent/master architecture:
		1. Decide which server must be Puppet master (and PuppetDB server if it is going to be used)
		2. Completely install and configure Puppet on Puppet masters and PuppetDB servers first. (Window's machines cannot be masters)
		3. Puppet master must be reachable at a desired hostname (default hostname for master wrt agent is `puppet` - if Puppet master's hostname is `puppet`, resolution is faster)
	3. Check OS versions and system requirements:
		1. Puppet master must be able to handle the number of agents needed
		2. Systems (for which official packages are provided) should have easier installation path
		3. Systems (for which official packages are not provided) should still run Puppet (version of Ruby is suitable, prerequisites installed) 
	4. Check network configuration:
		1. Prepare network for puppet traffic:
			1. Firewalls: Puppet master must allow incoming traffic on port 8140. Agents must be able to connect to port 8140
			2. Name resolution: every node must have unique hostname (Forward and reverse DNS must be configured correctly)
				1. If there is no DNS, write `/etc/hosts` on each node
	5. Check timekeeping on Puppet master server:
		1. Time in Puppet server must be accurate (because it is certificate authority)
			1. If time is wrong, old certificates or future certificates may be issued  (it may be expired for the node)
2. Installation order:
	1. Puppet on puppet master (must be running before proceeding)
	2. PuppetDB
	3. Puppet agent

#### Install Puppet ####
1. A computet that runs Puppet server is called Puppet master.
	1. [Installation instructions](https://docs.puppet.com/puppetserver/2.7/install_from_packages.html)
2. A computer that runs Puppet agent is called Puppet agent.
	1. Puppet agent regularly pulls configuration catalogs (?) from master and applies them to local system
		1. [Installation instructions](https://docs.puppet.com/puppet/4.9/install_linux.html)
3. To establish communication between Puppet master and agents, ensure that Puppet master will receive certificates from puppet agents.
	1. Modifying the `/etc/hosts` files (to ensure that Puppet master and agents are aware of each other)
		1. Puppet master: Add all agents' IP addresses and hostnames

				192.168.33.11	agent1.example.com

		2. Each puppet agent: Add the IP address and hostname of Puppet master

				192.168.33.10	master.example.com puppet

			1. `puppet` is an alias
	2. Open port 8140 on firewall (for certificate signing and communication)

			iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 8140 -j ACCEPT
		1. Run `puppet agent -t` on each agent
		2. Run `puppet cert list` and `puppet cert sign <AGENT NAME>` for each agent on Puppet master

#### Creation of users and groups ####
1. For new user and group creation set `ensure` to `present` (Puppet checks if the resource exists on the system, if not it gets created)
	1. Example: user -> `jargyle` on Puppet master
		1. Run `puppet apply -e "user { 'jargyle': ensure => present, }"`
			1. `puppet apply -e "<puppet-code>"` **(M)**
	2. Example: group -> `web` on Puppet master
		1. Run `puppet apply -e "group { 'web': ensure => present, }"`
2. Adding group to main manifest:
	1. On Puppet master, run: `puppet resource -e group web`
		1. A file with the following possible content gets opened (gid may be different)

				group { 'web':
					ensure => 'present',
					gid => '502',
				}

		2. Copy the code, save and exit the file
	2. Go to `cd /etc/puppetlabs/code/environments/production/manifests`
	3. Paste the code in `site.pp` and save and exit
	4. Run `puppet parser validate site.pp` **(M)**  on puppet master
	5. Run `puppet agent -t` on puppet agent to trigger puppet run
3. Adding user to main manifest:
	1. Run `puppet resource -e user jargyle` on Puppet master.
		1. Opens a file with following possible code

				user { 'jargyle':
					ensure => 'present',
					gid => '501',
					home => '/home/jargyle',
					password => '!!',
					password_max_age => '99999',
					password_min_age => '0',
					shell => '/bin/bash',
					uid => '501',
				}

	2. Add the following code to the file:

			comment => 'Judy Argyle',
			groups => 'web',

	3. Delete the following code:

			gid => '501',
		
	4. Copy all of the code, save and exit the file
	5. Paste the file in main manifest file `site.pp`
	6. Run `puppet parser validate site.pp` on Puppet master to check if there are any errors.
	7. Run `puppet agent -t` on puppet agent

#### Hello, world! ####
1. Modules have classes (named chunks of Puppet code)
	1. Used to configure nodes
2. Example: module that contains two classes
	1. One class manages message of the day (motd)
	2. Second class that generates notification on command line when we run Puppet

##### Write the `helloworld` class #####
1. Modules are kept in `modulepath` (`/etc/puppetlabs/code/environments/production/modules` by default)
	1. Includes modules that are installed (downloaded from Puppet Forge)
	2. Includes modules written by us
2. Another modules directory gets generated (`/opt/puppetlabs/puppet/modules` which must not be modified)
3. Module is a directory tree:

		helloworld/
			manifests/
				init.pp (manifest file that contains `helloworld` class)
				motd.pp (manifest file that contains file resource that ensures creation of motd)

	1. manifest: it is a `.pp` file
		1. Each manifest has a single class
		2. File names map to class names (except in `init.pp` where class name is the module name `helloworld`)
			1. Other manifests should have classes called `<MODULE NAME>::<FILE NAME>`
				1. Example: `helloworld::motd`
4. Writing `helloworld` class:
	1. Navigate to modules directory: `cd /etc/puppetlabs/code/environments/production/modules`
	2. Run `mkdir -p helloworld/manifests` (module directory/manfiests directory)
	3. Goto manifests directory (`cd helloworld/manifests`)
		1. add a new `init.pp` file with the following content

				class helloworld {
					notify { 'hello, world!': }
				}

	4. In `manifests` directory, add `motd.pp` file with the following content:

			class helloworld::motd {
				file { '/etc/motd':
					owner => 'root',
					group => 'root',
					mode => '0644',
					content => 'hello, world!\n',
				}
			}

	5. Save the file and exit

##### Add the `helloworld` and `helloworld::motd` classes to the main manifest #####
1. Add `helloworld` classes to default node in the main manifest
	1. default node: it is a special value for node names
		1. if a node cannot be found with the given node name, default node will be used (ensures compilation is always successful)
		2. an egent will get only the contents of one node definition (not multiple node definitions)
		3. Default node's properties apply to all those agents which have no definitions applied to them yet.
2. Creation of default node:
	1. Navigate to main manifest: `cd /etc/puppetlabs/code/environments/production/manifests`
	2. Add the following code to `site.pp`

			node default {

			}

	3. Add the following code within `node default { }`

			class { 'helloworld': }
			class { 'helloworld::motd': }

	4. Save the file and exit
	5. Run `puppet parser validate site.pp` to check if there are any errors
		1. Parser returns nothing if there are no errors
	6. Tigger puppet run on Puppet agent: `puppet agent -t`

###### Viewing the results ######
1. Run `cat /etc/motd`

#### Module installation! ####
1. [Module Installation Quick Start Guide](https://docs.puppet.com/puppet/4.9/quick_start_module_install_nix.html)

##### Overview #####
1. A module contains classes which are named chunks of puppet code

##### Installing a Forge module #####
1. Run `puppet module search apache` on Puppet master (searches modules from Puppet forge with `apache` in their names or descriptions)
	1. [Apache module on forge](https://forge.puppet.com/puppetlabs/apache)
2. Install `apache` module:
	1. `puppet module install puppetlabs-apache` (name is displayed in search)
3. Classes are now available to be assigned to nodes

#### Adding classes ####
1. [Adding Classes Quick Start Guide](https://docs.puppet.com/puppet/4.9/quick_start_adding_classes_nix.html)

##### Overview #####
1. Use `apache` class to launch the default Apache virtual host
2. Edit class parameters in main manifest
	1. Prerequisites: Puppetserver, Puppet agent, `puppetlabs-apache` module

##### Add Apache to the main manifest #####
1. Navigate to main manifest directory on Puppet master:
	1. `cd /etc/puppetlabs/code/environments/production/manifests`
2. Open `site.pp` and edit it to contain the following:

		node default {
			include apache
		}

3. Run `puppet parser validate site.pp` to check whether there are any errors
4. Run `puppet agent -t` on puppet agent

##### Creation of `index.html` file #####
1. Goto `/var/www/html` and add a file called `index.html` (if there is no such file) on Puppet agent
2. Open `index.html` and add:
	
		<h1>Hello World</h1>

3. Run `puppet agent -t` on Puppet agent
4. Open web browser and enter IP address of Puppet agent and port 80

		http://myagentnodeIP:80/

##### Editing class parameters in the main manifest #####
1. We can edit certain parameters of class in site.pp
	1. Why parameters? allows class to request external data (if class wants to configure itself with other than Puppet facts then that data must be passed via parameters)
2. Edit the parameters of `apache` class:
	1. Navigate to `/etc/puppetlabs/code/environments/production/manifests` on Puppet master.
	2. Open `site.pp`
	3. Replace `include apache` (puppet allows including class only once) with

			class { 'apache':
				docroot => '/var/www'
			}

3. Root directory is set to `/var/www`
	1. Open `http://myagentnodeIP:80/` in browser
	2. Show list of files in `/var/www`
	3. Click `html` and contents of file `/var/www/html/index.html` will be shown

#### Writing modules ####
1. Modify a module obtained from Forge
2. Write your own Puppet module
3. Creation of site module that composes other modules into machine roles (?)

##### Editing a Forge module #####
1. Modules are directory trees.

###### Module basics ######
1. Example:
		
		apache/ (module name)
			manifests/
				init.pp (contains apache class)
			templates/
				vhost/
					_file_header.erb (contains vhost template, managed by Puppet)

2. Every manifest file contains a single class
3. File names map to class names except `init.pp` which contains class named after the module name (`apache`)
4. Other manifests contain classes of the form `<MODULE NAME>::<FILE NAME>` or `<MODULE NAME>::<FOLDER>::<FILE NAME>`

###### Writing a Puppet module ######
1. Example: Modifying `vhost.conf.erb` to include variables which will be populated by facts (uses Facter) about the node
	1. Navigate to modules directory on Puppet master: `cd /etc/puppetlabs/code/environments/production/modules`
	2. See the currently installed modules (`ls`)
		1. `apache` must be present
	3. Open `apache/templates/vhost/_file_header.erb`
	4. Collect facts about agent:
		1. Run `facter osfamily` on agent (returns agent's OS)
		2. Run `facter id` on agent (returns id of currently logged in user)
	5. Edit header of `_file_header.erb` as follows:

			# ***************************************
			# Vhost template in module puppetlabs-apache
			# Managed by Puppet
			#
			# This file is authorized for deployment by <%= scope.lookupvar('::id') %>.
			# 
			# This file is authorized for deployment ONLY on <%= scope.lookupvar('::osfamily') %> <%= scope.lookupvar('::operatingsystemmajrelease') %>.
			#
			# Deployment by any other user or on any other system is strictly prohibited.
			# ***************************************
	6. Run `puppet agent -t` on Puppet agent
		1. Default Apache virtual host gets created based on `_file_header.erb`
			1. Navigate to `/etc/apache2/sites-available` on Debian-based system or `/etc/httpd/conf.d` on Redhat-based system
			2. View `15-default.conf`

##### Writing a Puppet module #####
###### Writing a class in a module ######
1. Add `puppet_quickstart_app` that should manage PHP-based web app running on Apache virtual host
	1. `cd /etc/puppetlabs/code/environments/production/modules`
	2. Run `mkdir -p puppet_quickstart_app/manifests` to generate new module directory and manifest directory
	3. Open new `puppet_quickstart_app/manifests/init.pp`
	4. Add the following code:

			class puppet_quickstart_app {
				class { 'apache':
					mpm_module => 'prefork',
				}

				include apache::mod::php

				apache::vhost { 'puppet_quickstart_app':
					port => '80',
					docroot => '/var/www/puppet_quickstart_app',
					priority => '10',
				}

				file { '/var/www/puppet_quickstart_app/index.php':
					ensure => file,
					content => "<?php phpinfo() ?>\n",
					mode => '0644',
				}
			}

		1. New class include two other classes `apache`, `apache::mod::php`
		2. `apache` has been configured to include `mpm_module`
			1. tells which multi-process module is configured and loaded for Apache process (`prefork` module is used)
		3. `include apache::mod::php`: Class relies on these classes
			1. Puppet does not need classifying nodes with Apache and Apache PHP
		4. `priority` -> `10` - app has higher priority on port `80` than default Apache vhost app
		5. `/var/www/puppet_quickstart_app/index.php` contains `<?php phpinfo() ?>\n`
			1. `ensure => 'file'` says that the file has to be created the first time the class is applied 

###### Using your custom module in the main manifest ######
1. Navigate to main manifest: `cd /etc/puppetlabs/code/environments/production/manifests`
2. Open `site.pp`. Add the following code:

		node default {
			class { 'puppet_quickstart_app': }
		}
	
	1. Remove the first `apache` class (Puppet allows us to declare a class only once)
3. Run `puppet agent -t` on agent
4. Navigate to `http://<yournodeip>:80` on browser

###### Using Puppet to manage you app ######
1. Open `/var/www/puppet_quickstart_app/index.php` on agent
	1. Change the content to `"THIS APP IS MANAGED BY PUPPET!"`
2. Refresh the browser, and notice that PHP info page has been replaced
3. Run `puppet agent -t --onetime` **(M)**
4. Refresh browser (Puppet has reset the web app to display PHP info page)
	1. Contents of `/var/www/puppet_quickstart_app/index.php` has been reset

##### Using a site module #####
1. site module: all classes in a site module describe complete configuration for a given type of machine.
	1. Example:
		1. `site::basic`: class. For nodes which have not been given specialized role but need security management
		2. `site::webserver`: class for nodes that serve web content
		3. `site::dbserver`: class for nodes that provide database server to other apps
2. Add `/etc/puppetlabs/code/environments/production/modules/site/manifests/basic.pp` with following code:

		class site::basic {
			if $::kernel == 'Linux' {
				include puppet_quickstart_app
			}
			elsif $::kernel == 'windows' {
				include registry::compliance_example
			}
		}
	
	1. other classes are declared using `include` function
	2. `if` sets different classes for different kernels (`$kernel` fact is used)
3. Navigate to manifests `cd /etc/puppetlabs/code/environments/production/manifests`
	1. Add the following code to `site.pp`

			class { 'site::basic': }

4. Run `puppet agent -t` on agent machine

##### Summary #####
1. Intermediate users:
	1. Download and modify Forge modules to fit their deployment's needs
	2. Write new modules and classes to manage resources, (files, services, ...)
	3. Build and curate site module to empower (safely) junior admins and simplify decisions involved in deploying new machines.

### Essential configuration tasks ###
#### NTP quick start guide ####
1. NTP can be configured and managed by puppet. (For time syncing across all Puppet-managed nodes)
	1. Using NTP module
		1. NTP: protocol used to synchronize clocks of computers over a network. Uses UTC (coordinated universal time) to synchronize computer clocks within a millisecond
	2. Purpose:
		1. security services
		2. certificate validation
		3. file sharing across agents
	3. If time is wrong, Puppet master may issue agent certificates from distant past or future (may be treated as expired by agents)
2. Puppet NTP module:
	1. Ensure time is correctly synced across all servers in the infrastructure
	2. Ensure time is correctly synced acorss config management tools
	3. Roll out updates quickly to change (or specify) internal NTP server pool
3. Tasks:
	1. Install `puppetlabs-ntp` module
	2. Add classes to `default` node in main manifest
	3. View status of NTP service
	4. configure NTP for different permissions

##### Install `puppetlabs-ntp` module #####
1. `puppet module install puppetlabs-ntp`

##### Add classes from NTP module to main manifest #####
1. Classes in NTP module:
	1. `ntp`: main class (includes all other NTP classes)
	2. `ntp::install`: class, handles installation package
	3. `ntp::config`: class, handles configuration file
	4. `ntp::service`: class handles service
2. Add NTP class:
	1. Navigate to main manifest: `cd /etc/puppetlabs/code/environments/production/manifests`
	2. Open `site.pp`
	3. Add the following:

			node default {
				class { 'ntp':
					servers => ['nist-time-server.eoni.com', 'nist1-lv-ustiming.org', 'ntp-nist.ldsbc.edu']
			}
3. Run `puppet agent -t` on Puppet agent
4. Check if service is running:

		puppet resource service ntpd

##### Use multiple nodes to configure NTP for different permissions #####
1. Two organization servers (kermit, grover) talk to outside time servers
2. Other servers get time data from the two servers (kermit, grover)
	1. `autoupdate => false`: automatic updates are disabled to prevent any outages
3. `site.pp`

		node "kermit.example.com" {
			class { "ntp":
				servers => ['0.us.pool.ntp.org iburst', '1.us.pool.ntp.org iburst', '2.us.pool.ntp.org iburst', '3.us.pool.ntp.org iburst'],
				autoupdate => false,
				restrict => [],
				enable => true,
			}
		}

		node "grover.example.com" {
			class { "ntp":
				servers => ['kermit.example.com', '0.us.pool.ntp.org iburst', '1.us.pool.ntp.org iburst', '2.us.pool.ntp.org iburst'],
				autoupdate => true,
				restrict => [],
				enable => true,
			}
		}

		node "snuffie.example.com", "bigbird.example.com", "hooper.example.com" {
			class { "ntp":
				servers => ['grover.example.com', 'kermit.example.com'],
				autoupdate => true,
				enable => true,
			}
		}

#### DNS quick start guide ####
#### Sudo quick start guide ####
#### Firewall quick start guide ####

## `puppet-agent`: What is it, what's in it? ##
### What `puppet-agent` and Puppet Server are ###
1. `puppet-agent`: package, contains main code and all dependencies (including Facter, Hiera) and bundled versions of Ruby and OpenSSL.
	1. Includes MCollective as well.
2. `puppetserver`: depends on `puppet-agent` and adds JVM-based Puppet Server app.
	1. Serves catalogs to nodes running the agent.

### How version numbers work ###

## Where did everything go? ##
1. Executables are in `/opt/puppetlabs/bin/`
	1. Add it to `PATH`
2. Private commands (`ruby`, `gem`) are in `/opt/puppetlabs/puppet/bin` (prevents overriding system tools if `/opt/puppetlabs/bin/` is added to `PATH`)
3. Confdir: `/etc/puppetlabs/puppet`
	1. It has files like `puppet.conf`, `auth.conf`
4. `ssldir` is inside `confdir`
5. Server uses `/etc/puppetlabs/puppetserver`, MCollective uses `/etc/puppetlabs/mcollective` as confdir
6. `codedir`: Holds modules/manifests/data
	1. Default location: `/etc/puppetlabs/code`
		1. `<USER DIRECTORY>/.puppetlabs/etc/code` if you are running as a non-root user
	2. Contents:
		1. `environments` directory
		2. `modules` directory
		3. `hiera.yaml` config file
7. Put modules in `$codedir/environments/production/modules` and main manifest in `$codedir/environments/production/manifests`

## Installing and upgrading ##
### Overview of Puppet's architecture ###
1. Puppet usually uses agent/master architecture
2. Puppet can run in self-contained architecture

#### Two stages for Configuration Management ####
1. Configuration is in two main stages:
	1. Compile a catalog
	2. Apply the catalog

##### What is a Catalog? #####
1. Catalog: It is a document that describes desired system state for a specific computer.
	1. It has a list of resources that need to be managed (+dependencies between resources)

#### The agent/master architecture ####
1. Puppet master server controls important configuration information
2. Managed nodes request their own configuration catalogs.

##### Basics #####
1. Puppet agent periodically sends facts to Puppet master and request a catalog.
2. Master compiles and returns node's catalog
3. When agent receives a catalog, Puppet applies it by checking each resource the  catalog describes.
	1. If there are any resources not in the desired state, it makes changes necessary to correct them. (no-op mode: reports the changes needed)
4. Agent submits a report to Puppet master

##### About the Puppet services #####
1. Puppet Agent on *nix Systems
	1. Puppet agent's run environment: Runs as specific user (`root`) and initiates outbound connections on port 8140
		1. User:
			1. Puppet agent runs as `root` by default.
			2. If puppet agent (started by a user) runs as a user, it needs to be run as cron job (instead of service) and has restrictions on what resources it can manage
				1. Puppet can manage resources which can be modified without `sudo`
				2. The following resources are available to non-root agents:
					1. `cron` (non-root cron jobs can be viewed or set)
					2. `exec` (cannot run as another user or group)
					3. `file` (if the user has read/write privileges)
					4. `notify`
					5. `schedule`
					6. `ssh_key`
					7. `ssh_authorized_key`
					8. `service` (services which do not require root)
						1. `start`, `stop`, `status` attributes specify how non-root users should control service
					9. `augeas`
				3. To install a package:
					1. Use `exec` to untar a tarball or `file` to recursively copy dirctory into place
		2. Ports:
			1. Puppet's HTTPS traffic uses port 8140 (firewall must allow Puppet agent to initiate outbound connections on the port)
				1. To change port: change `masterport` setting in `puppet.conf` or on commandline (`--masterport <port>`) on all agent nodes and puppet master
		3. Logging:
			1. Logging is into syslog
				1. `/var/log/messages` by defaut on Linux (`/var/log/system.log` on Mac OS X)
			2. Change verbosity by setting `log_level` in `puppet.conf` (default: `notice`)
				1. `--verbose` is same as `info`
				2. `--debug` is same as `debug`
				3. `warning` (quiter)
			3. commandline options when running in foreground log on terminal instead of syslog
			4. `--logtest <FILE>` will log to `<FILE>` 
		4. Reporting:
			1. Report is submitted by puppet agent to master after every run
				1. Disabled by setting `report = false` in `puppet.conf`
	2. Managing systems with puppet agent:
			1. Setting up periodic configuration runs:
				1. Run puppet agent as service: Puppet agent daemon will do periodic configurations (interval can be configured)
				2. Make cron job to run puppet agent: benefit - reduces persistent processes
				3. Run puppet agent on demand: For open source deploye MCollective (framework for building server orchestration or parallel job-execution systems - uses publish/subscribe middleware to communicate in parallel with hosts at once)
		1. Running puppet agent as a service: 
			1. Starting service:
				1. Enable service using `sudo puppet resource service puppet ensure=running enable=true`
				2. `sudo puppet agent` (but no easy way to stop or restart)
					1. Use agent's pidfile to stop:

							sudo kill $(puppet config print pidfile --section agent)
			
			2. Configuring run interval:
				1. default: every 30 minutes
				2. Change it as follows:

						# /etc/puppetlabs/puppet/puppet.conf
						[agent]
							runinterval = 2h
			
			3. Running puppet agent as a cron job:
				1. `onetime` if set to `true`, puppet agent will do one configuration run and stop
				2. `daemonize` is set to `false`, puppet agent will stay in foreground (`true` will run it in background)
				3. `splay`, `splaylimit`: keep Puppet master from getting overwhelmed.
				4. Set up cron job using puppet resource command

						sudo puppet resource cron puppet-agent ensure=present user=root minute=30 command='/opt/puppetlabs/bin/puppet agent --onetime --no-daemonize --splay --splaylimit 60'
			
			4. Running puppet agent on demand:
				1. Puppet agent run can be initiated by logging into target system
	
						sudo puppet agent --test

						sudo puppet agent --onetime (runs once in background, no notification)

				2. Orchestration tool can be used to initiate puppet agent run remotely (?)

						ssh ops@magpie.example.com sudo puppet agent --test (ssh <user>@<hostname> <command>) - running on one agent

					1. MCollective: Deploy it and [puppet agent plugin](https://github.com/puppetlabs/mcollective-puppet-agent)
						1. See [the puppet agent plugin's README](https://github.com/puppetlabs/mcollective-puppet-agent#readme)
					2. [parallel SSH](https://code.google.com/p/parallel-ssh/) to run on multiple nodes at once
			
			5. Disabling and re-enabling Puppet runs
				1. Disble puppet automatic runs using: `sudo puppet agent --disable "<MESSAGE>"`
				2. Re-enable puppet automatic runs using: `sudo puppet agent --enable`
					1. When puppet attempts a run when disabled, it prints a notification indicating that run is disabled administratively
			
			6. Configuring Puppet agent:
				1. Use `[agent]` in `puppet.conf` and/or `[main]`
				2. [Short list of important settings](https://docs.puppet.com/puppet/4.9/config_important_settings.html#settings-for-agents-all-nodes)
					1. `server`: Puppet master from where configuration is requested. (default: `puppet`)
						1. `ca_server`: used for centralize CA if using multiple servers (must be configured on agents) [multiple masters guide](https://docs.puppet.com/guides/scaling_multiple_masters.html)
						2. `report_server`: used to centralize report server if using multiple servers
					2. `certname`: node's certificate name and unique id it uses when requesting catalogs (defaults to fully qualified domain name)
						1. Use `/\A[a-z0-9._-]+\Z/` pattern to define certname
					3. `environment`: environment to request from Puppet master (default is `production`) - can be overridden by master's [ENC](https://docs.puppet.com/puppet/4.9/nodes_external.html) (External Node classifiers (executable called by Puppet server or Puppet apply and takes name of node to be classified as argument and returns YAML describing the node))

##### Communications and security #####
1. Communication of Puppet masters and agents is via HTTPS with client-verification.
2. Agent submits HTTPS request to one of the endpoints provided by Puppet master on HTTP interface
	1. [HTTPS Communications walkthrough](https://docs.puppet.com/puppet/4.9/subsystem_agent_master_comm.html)
	2. [Puppet master's HTTP API](https://docs.puppet.com/puppet/4.9/http_api/http_api_index.html)
	3. [Puppet master's auth.conf file](https://docs.puppet.com/puppet/4.9/config_file_auth.html)
		1. HTTPS API:
			1. One endpoint is used to request catalog and another end-point is used to submit report
			2. Puppet master has access rules for all HTTPS services
				1. Purpose: example - node should not request another node's config catalog
		2. Location
			1. `$confdir/auth.conf` by default (customizable with `rest_authconfig` setting in `puppet.conf`)
		3. Example:
				
				# allow nodes to retrieve their own catalog
				path ~ ^/puppet/v3/catalog/([^/]+)$
				method find
				allow $1

				...
				# allow all nodes to store their own reports
				path ~ ^/puppet/v3/report/([^/]+)$
				method save
				allow $1

		4. Access control behavior
			1. Puppet master checks full list of authorization rules when HTTPS request is received.
			2. When a rule is found matching the request, Puppet master uses `allow` and `allow_ip` to decide whether to allow request.
				1. A specific rule that allows must be put before a general rule that will reject
		5. Default auth rules
			1. These are hard coded default rules (checked only when request does not match any rule in `auth.conf`)
				1. Make sure `auth.conf` includes all default rules if it needs modification.

		5. File format
			1. ACLs are separated by empty lines
			2. `#` indicate a comment (they are not empty lines)

		6. ACL syntax
			1. Example:

					path ~ ^/puppet/v3/report/([^/]+)$
					method save
					allow $1

				1. `path`: URLs the ACL applies to. Required. Must be mentioned first
					1. Above uses a regular expression
				2. `environment`: Environments the ACL applies to. Default: all
				3. `method`: HTTP method ACL applies to. Default: all
					1. `find` - GET and POST, `search` - GET and POST, for endpoints with names ending in "s" or "_search", `save` - PUT, `destroy` - DELETE
				4. `auth`: Does the ACL apply to client-verified or non-client-verified HTTPS requests? Default: yes
					1. `yes`, `any`, `no`
				5. `allow`: the certifcate names or hostnames that can make the matching request
					1. Multiple of them can be included
					2. Values: Certificate names that match the following
						1. Full certificate name
						2. hostname (unverified requests)
						3. `*`: glob (`*.delivery.example.com`)
						4. Regular expression (`/^[\w-]+.example.com$/`)
						5. `*`: all requests
				6. `allow_ip`: IP addresses which can make matching requests. Default: allow no one.
					1. Multiple of them can be included
					2. Values:
						1. single IP
						2. glob: (`192.168.100.*`)
						3. CIDR notation (represents group of IP addresses) (192.168.100.0/24)
							1. Classless Inter-Domain Routing
							2. Addressing: /24 gives (`2**(32 - 24) = 2**8` addresses of subnet = 256 addresses)
								1. From `192.168.100.0` to `192.168.100.255`
					3. For both client-verified and unverified requests (?)
3. Client-verified HTTPS:
	1. each master/agent must have identifying SSL certificate. Certificate is examined to decide whether to allow an exchange of info.
4. Puppet has built in certificate authority (CA) to manage certificates.
	1. Agents can request master for certificates via HTTP API
	2. `puppet cert` can inspect requests and sign the new certificates
	3. Agents can then download the certificates

##### What are certificates and PKI? #####
1. [https://docs.puppet.com/background/ssl/certificates_pki.html](https://docs.puppet.com/background/ssl/certificates_pki.html)

##### What is TLS/SSL? #####
1. [https://docs.puppet.com/background/ssl/tls_ssl.html](https://docs.puppet.com/background/ssl/tls_ssl.html)

##### What is HTTPS? #####
1. [https://docs.puppet.com/background/ssl/https.html](https://docs.puppet.com/background/ssl/https.html)

##### Anatomy of a Certificate #####
1. [https://docs.puppet.com/background/ssl/cert_anatomy.html](https://docs.puppet.com/background/ssl/cert_anatomy.html)

#### The stand-alone architecture ####
1. Standalone architecture: each managed server has its own complete copy of configuration info and compiles its own catalog

#### Differences between agent/master and puppet apply ####
1. Puppet apply does as a combination of Puppet agent and Puppet master.
2. There are certain trade-offs:
	1. [https://docs.puppet.com/puppet/4.9/architecture.html](https://docs.puppet.com/puppet/4.9/architecture.html)

### System requirements ###
#### Hardware ####
1. Agent has no hardware requirements
2. Master should be installed on robust dedicated server
	1. Atleast 2 processor cores and at least 1GB RAM
	2. To serve at least 1000 nodes, it should have 2-4 processor cores and at least 4GB RAM
3. Demands depend on:
	1. No of agents served
	2. How freqently the agents check in
	3. No of resources managed on each agent
	4. Complexity of manifests and modules

#### Puppet agent and operating system support life cycles ####
1. Community supported OSs: 30 days after its end of life (EOL) date
2. Enterprise-class OSs: atleast upto EOL

#### Platforms with packages ####
#### Platforms without packages ####
#### Prerequisites ####
1. Prerequisites are not required when installing using official packages (System's package manager handles dependencies).
2. For systems that run from source or unsupported systems:
	1. Ruby: 2.1.x
	2. Mandatory Libraries:
		1. Facter >= 3.1
		2. Hiera >= 2.0.0
		3. `json` gem (modern)
		4. `rgen` gem >= 0.6.6
	3. Optional libraries:
		1. `msgpack` gem (for [msgpack serialization](https://docs.puppet.com/puppet/4.9/experiments_msgpack.html))

### Pre-install tasks ###
1. Decide on deployment type
	1. Two types: agent/master architecture, self-contained architecture
		1. Packages depend on the choice
	2. Whether to install PuppetDB or not (to query and analyze Puppet's data about infrastructure)
	3. [Puppet's architecture](https://docs.puppet.com/puppet/latest/reference/architecture.html)
2. Decide which server(s) act(s) as Puppet master (if choosing agent/master architecture) and PuppetDB server (if using it)
	1. Completely install Puppet masters and PuppetDB before puppet agents
	2. Master should run on `*.nix`
	3. Puppet master should be reachable at a reliable hostname (default: `puppet` - make sure hostname resolves to this if not using something else using `server` setting in `puppet.conf`)
3. Check OS versions and system requirements
	1. Puppet master(s) should handle the number of agents needed
	2. Systems with official packages have easier install path
	3. Systems with no official packages need:
		1. suitable version of Ruby
		2. Prerequisites
4. Check network configuration
	1. Firewalls: Puppet master should allow incoming connections on port 8140 (agents connect on that port)
	2. Name resolution: every node must have a unique hostname
		1. Forward and reverse DNS must be configured correctly. (if there is not DNS, write `/etc/hosts` on each node)
5. Check timekeeping on Puppet master
	1. Time must be accurate on puppet master (it acts as CA)

### Puppet Collection repositories ###
1. Puppet collections: Versioned repositories which have all the software required for functional Puppet deployment (with compatible versions of each)
	1. Choose one collection for all the software
2. Numbered collections: (PC1) long-lived, stable repositories. Long term support (LTS) Puppet Enterprise releases are built from them.
	1. Maintains same major version of each package
3. Latest collection: updated with major version releases (may have breaking changes)
4. Content:
	1. `puppet-agent`: Puppet, Facter, Hiera, MCollective, pxp-agent, root certificates, prerequisites like Ruby, Augeas
	2. `puppetserver`: Pupper server, depends on `puppet-agent`
	3. `puppetdb`: PuppetDB
	4. `puppetdb-termini`: plugins to let Pupper server talk to PuppetDB

### Install: Puppet Server ###
#### Quick Start ####
1. [Enable the Puppet package repositories](https://docs.puppet.com/puppet/latest/reference/puppet_collections.html)
	1. Apt-based systems:
		1. Choose package based on OS version:
			1. `puppetlabs-release-<COLLECTION>-<VERSION CODE NAME>.deb`
				1. Ubuntu 16.04 Xenial Xerus: `puppetlabs-release-pc1-xenial.deb` (PC1 - Puppet Collection 1 (stable repositories from which long term support Puppet Enterprise releases are built))
		2. Download the release package and install it using `dpkg` `-i`
			1. `dpkg -i puppetlabs-release-pc1-xenial.deb`
		3. Run `apt-get update` to update `apt` package list
	2. Verification:
		1. Yum and apt tools automatically verify the integrity of packages as they are installed. Puppet Collection release also installs release signing key
		2. Manual verification:
			1. First import the public key (signed by many Puppet developers)
				1. `gpg --keyserver pgp.mit.edu --recv-key 7F438280EF8D349F` (gpg tool requests the key and imports it)
			2. Verify fingerprint: `gpg --list-key --fingerprint 7F438280EF8D349F`
				1. The output should match `6F6B 1550 9CF8 E59E 6E46 9F32 7F43 8280 EF8D 349F`
2. Stop existing Puppet master service
	1. `service puppetmaster stop` (if running WEBrick Puppet master)
	2. Disable puppetmaster vhost and restart Apache service (If Puppet is running under Apache)
		
			service apache2 stop
			service apache2 start

3. Install Puppet Server package

		apt-get install puppetserver

#### Memory Allocation ####
1. By default Puppet Server is configured to use 2GB RAM.
	1. Edit init config file to change it
		1. `/etc/default/puppetserver` - Debian

				JAVA_ARGS="-Xms2g -Xmx2g"

				to

				JAVA_ARGS="-Xms512m -Xmx512m"

			1. `-Xms`: initial minimum heap size
			2. `-Xmx`: maximum heap size

2. Restart `puppetserver` service

### Install: Puppet Agent ###
#### Install agent: Linux ####
1. Enable Puppet Collection 1 repository:
	1. Choose a package based on OS version (at `apt.puppetlabs.com` repository) of the following form: `puppetlabs-release-<COLLECTION>-<VERSION CODE NAME>.deb`
		1. Example for Ubuntu 16.06 (Xenial): `puppetlabs-release-pc1-xenial.deb`
	2. Download the release package and install it:
		
			wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
			sudo dpkg -i puppetlabs-release-pc1-xenial.deb

	3. Run `apt-get update` (updates `apt` package list)
2. Check if we can run Puppet executables:
	1. Executables are at `/opt/puppetlabs/bin/` (not in `PATH` yet but is not required to start service `service puppet start`)
		1. They are used to run interactive puppet commands
	2. Adding to path: In `.profile` or `.bashrc`

			export PATH=/opt/puppetlabs/bin:$PATH

3. Install `puppet-agent` package:

		`sudo apt-get install puppet-agent`

4. Configure critical agent settings:
	1. Change `server = puppet` to set Puppet master's hostname (if puppet master is not reachabe with default hostname)
5. Start puppet service:
	
		sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

		sudo service puppet restart

6. To manually launch and watch:

		sudo /opt/puppetlabs/bin/puppet agent --test

7. When a puppet agent runs for the first time, it submits a certificate signing request (csr) to certificate authority (CA) (Puppet master).
	1. Log into Puppet master and check for certificate requests
		1. `sudo /opt/puppetlabs/bin/puppet cert list`
	2. Sign if there is a request:
		1. `sudo /opt/puppetlabs/bin/puppet cert sign <NAME>`

#### Install agent: macOS ####

### Install: PuppetDB ###
1. PuppetDB module: It is a Puppet forge module that can install all components and prerequisites
	1. PuppetCD
	2. PostgreSQL
	3. Firewall rules on RedHat-like system
#### Installing PuppetDB from packages ####
1. Use PuppetDB module instead of this

#### Step 1: Enable Puppet Collection package repository ####
1. Enable puppet collection package repository.
2. Grab PuppetDB and PuppetDB-termini packages and import them into site's local package repos
	1. PuppetDb:

			sudo /opt/puppetlabs/bin/puppet module search puppetdb
			sudo /opt/puppetlabs/bin/puppet module install puppetlabs-puppetdb

	2. PuppetDB-termini

			sudo /opt/puppetlabs/bin/puppet resource package puppetdb-termini ensure=latest

#### Step 2: Assign classes to nodes ####
1. Assign PuppetDB module's classes to servers.
	1. Three options:
		1. If installing PuppetDB on Puppet master:
			1. assign `puppetdb` and `puppetdb::master::config` classes to it
		2. If running PuppetDB on its own server with local PostgreSQL, assign `puppetdb` class to it.
			1. Assign `puppetdb::master::config` class to Puppet master (set class parameters as necessary)
		3. If running PuppetDB on one server and PostgreSQL on another server, assign `puppetdb::server` class and `puppetdb::database::postgresql` classes to different servers
			1. Assign `puppetdb::master::config` class to Puppet master (set class parameters as necessary)
2. PuppetDB dashboard accessible on `localhost`.
	1. If we want to access dashboard from outside, set `listen_address` parameter on either
		1. `puppetdb`
		2. `puppetdb::server`

				class { 'puppetdb':
					listen_address => 'example.foo.com'
				}

3. For more settings, [Playing nice with the PuppetDB module](https://docs.puppet.com/puppetdb/4.4/configure.html#playing-nice-with-the-puppetdb-module)
4. [PuppetDB module documentation](http://forge.puppetlabs.com/puppetlabs/puppetdb)

#### What data? ####
1. PuppetDB stores:
	1. most recent facts from every node
	2. most recent catalog for every node
	3. Optionally, 14 days (configurable) event reports for every node
2. Why?
	1. Gives metadata about every node in the infrastructure and searchable database for every resource managed on each node
	2. Puppet itself uses the data for [exported resources](https://docs.puppet.com/puppet/4.10/lang_exported.html) (allows nodes to manage resources on other nodes)

#### Connecting Puppet masters ####
1. When Puppet master is connected to PuppetDB, it will do the following:
	1. Send every node's catalog, facts, and reports to PuppetDB
	2. Query PuppetDB when compiling node catalogs that collect `exported resources`
2. Adding `puppetdb::master::config` class will take care of all of the below.

##### Step 1: Install plug-ins #####
###### One platforms with packages ######
##### Step 2: Edit configuration files #####
###### Locate Puppet's config directory ######
###### Edit puppetdb.conf ######
###### Edit puppet.conf ######
###### Edit routes.yaml ######
##### Step 3: Set security policy #####
##### Step 4: Restart Puppet master #####

## Configuration ## 
### About Puppet's settings ###
### Short list of important settings ###
### Config files ###
#### `puppet.conf`: The main config file ####
#### `environment.conf`: Per-environment settings ####
#### `auth.conf` (LEGACY): HTTPS authorization ####
#### `fileserver.conf`: Custom fileserver mount points ####
#### `puppetdb.conf`: PuppetDB server locations ####
#### `hiera.yaml`: Data lookup configuration ####
#### `autosign.conf`: Basic certificate autosigning ####
#### `csr_attributes.yaml`: Certificate extensions ####
#### `custom_trusted_oid_mapping.yaml`: Short names for cert extension OIDs ####
#### `device.conf`: Network hardware access ####
#### `routes.yaml`: Advanced plugin routing ####

### Configuring Puppet Server ###
#### Puppet Server's config files ####
#### `puppetserver.conf`: Main config file ####
#### `auth.conf`: Access control ####
#### `webserver.conf`: Jetty web server config ####
#### `web-routes.conf`: Mount points for component services ####
#### `global.conf`: Trapperkeeper settings ####
#### `ca.conf`: CA service access control (deprecated) ####
#### `master.conf`: Authorization by HTTP header (deprecated) ####
#### `product.conf`: Configuration Product-level Interactions ####
#### `logback.xml`: Logging level and location ####
#### Advanced logging configuration ####
#### Bootstrap upgrade notes ####

### Checking values of settings ###
### Editing settings on the command line ###
### Complete list of settings (configuration reference) ###
### Settings that differ under Puppet Server ###

## Important directories and files ##
### Code and data directory (codedir) ###
### Config directory (confdir) ###
### The main manifest(s) ###
### The modulepath ###
### The SSLdir ###
### Cache directory (vardir) ###

## Environments ##
### About environments ###
### Configuring environments ###
### Creation of environments ###
### Assigning environments to nodes ###
### Suggestions for use ###
### Limitations of environments ###
### Environment isolation ###
### Environments and Puppet's HTTPS interface ###

## Modules ##
### Fundamentals ###
### Beginner's guide to writing modules ###
### Plugins in modules ###
### Installing modules ###
### Puglishing modules on the Puppet Forge ###
### Module metadata and metadata.json ###
### Documenting modules ###
### Smoke testing modules ###

## Puppet's services and tools ##
### Puppet's commands ###
### Running Puppet commands on Windows ###

### Puppet master ###
#### Puppet Server ####
#### The rack Puppet master ####
#### Configuring a Server with Passenger and Apache ####
#### The WEBrick Puppet master ####

### Puppet agent on *nix ###
### Puppet apply ###

## Puppet Server ##
### Index ###
### About Puppet Server ###
### Installation ###
### Differing behavior in `puppet.conf` ###
### Using Ruby gems ###
### Subcommands ###
### Using an external CA ###
### External SSL termination ###
### Tuning guide ###
### Restarting Puppet Server ###

### Puppet API ###
#### Environment classes ####

### Status API ###
#### Services ####

### Developer Info ###
#### Debugging ####

## The Puppet Language ##
### Basics ###
### Variables ###
### Resources ###
### Resources (advanced) ###
### Relationships and ordering ###
### Classes ###
### Defined resource types ###
### Expressions and operators ###
### Conditional statements and expressions ###
### Function calls ###
### Docs for built-in functions ###
### Node definitions ###
### Comments ###
### Facts and built-in variables ###
### Reserved words and acceptable names ###
### Puppet language style guide ###
### Writing functions (Puppet language) ###
### Custom types ###
### Provider development ###

### Values and data types ###
#### About values and data types ####
#### Strings ####
#### Numbers ####
#### Booleans ####
#### Arrays ####
#### Hashes ####
#### Regular expressions ####
#### Sensitive ####
#### Undef ####
#### Resource references ####
#### Resource types ####
#### Default ####
#### Data type syntax ####
#### Abstract data types ####

### Templates ###
### Using templates ###
1. Templates: documents that combine code, data and text to produce final output.
	1. Purpose: to manage complicated text with simple inputs
2. Uses: to manage content of configuration files (using `content` attribute of `file` resource)

#### Templating languages ####
1. Puppet supports Embedded Puppet (EPP) and Embedded Ruby (ERB).
	1. EPP: Uses puppet extensions in special tags (only works with Puppet >= 4.0)
	2. ERB: Uses ruby code in tags (works with all versions of Puppet)

#### Using templates ####
1. Pass the template to a function and it will be evaluated to final output.
2. Two types of templates:
	1. separate file
	2. inline

##### With a template file: `template` and `epp` #####
1. Put template files in `template` directory of a module.
2. Extensions: `.epp` and `.erb`
3. Functions to evaluate templates:
	1. `template()` for ERB
	2. `epp()` for EPP
4. Example:

		# epp(<FILE REFERENCE>, [<PARAMETER HASH>])
		file { '/etc/ntp.conf':
			ensure => file
			content => epp('ntp/ntp.conf.epp', {'service_name' => 'xntpd', 'iburst_enable' => true}),
			# Loads /etc/puppetlabs/code/environments/production/modules/ntp/templates/ntp.conf.epp
		}

		# template(<FILE REFERENCE>, [<ADDITIONAL FILES>, ...])
		file { '/etc/ntp.conf':
			ensure => file
			content => template('ntp/ntp.conf.erb'),
			# Loads /etc/puppetlabs/code/environments/production/modules/ntp/templates/ntp.conf.erb
		}

###### Referencing files ######
1. File reference: `'<MODULE>/<FILE>'` - loads `<FILE>` from `<MODULE>`'s `templates` directory
	1. Examples:
		1. `ntp/ntp.conf.epp` -> `<MODULE DIRECTORY>/ntp/templates/ntp.conf.epp`
		2. `activemq/amq/activemq.xml.erb` -> `<MODULE DIRECTORY>/activemq/templates/amq/activemq.xml.erb`

###### EPP parameters ######
1. Parameters are passed through hash to `epp` function
	1. keys must be valid local variable names - `$`
	2. Puppet will generate names and assign values to them
2. Example: `{'service_name' => 'xntpd', 'iburst_enable' => true}` will generate `$service_name` and `$xntpd` variables
3. Rules:
	1. Mandatory parameters (if any) must be set using a parameter hash
	2. Optional parameters can be passed values a parameter hash or can take defaults
	3. If no parameters are declared, pass any number of parameters

###### Extra ERB files ######
1. `template` function can take additional template files
	1. the templates will be concatenated to produce final output

##### With a template string: `inline_template` and `inline_app` #####
1. If a string contains template content, use `inline_template` for ERB and `inline_epp` for EPP.

		#inline_epp(<TEMPLATE STRING>, [<PARAMETER HASH>])
		file { '/etc/ntp.conf':
			ensure => file,
			content => inline_epp($ntp_conf_template, {'service_name' => 'xntpd', 'iburst_enable' => true}),
		}

		# inline_template(<TEMPLATE STRING>, [<ADDITIONAL STRINGS>, ...])
		file { '/etc/ntp.conf':
			ensure => file,
			content => inline_template($ntp_conf_template),
		}

#### Validating and Previewing templates ####
1. `puppet epp` for EPP templates
2. `erb` for ERB templates

##### EPP validation #####
1. `puppet epp validate <TEMPLATE NAME>`
	1. checks syntax problems
	2. `<TEMPLATE NAME>`: can be file reference or
		1. `<MODULE NAME>/<TEMPLATE FILENAME>`
2. `cat example.epp | puppet epp validate` (pipe epp code)

##### EPP rendering #####
1. `puppet epp render <TEMPLATE NAME>`
2. `puppet epp render example.epp --values '{x => 10, y => 20}'`
3. Inline template rendering:
	1. Use `-e`
	2. Pipe code to `puppet epp render`

##### ERB validation #####
1. `erb -P -x -T '-' example.erb | reby -c`
	1. `-P` ignores lines that start with `%`
	2. `-x` outputs template's Ruby script
	3. `-T '-'` sets trim mode to be consistent with Puppet's behavior
	4. `-c` Ruby checker
2. Invoking a shell function:
	1. Add the following shell function to `.bashrc` or `.zshrc` or `.profile`

			validate_erb() {
				erb -P -x -T '-' $1 | ruby -c
			}

	2. Use the following to validate:

			validate_erb example.erb

#### When to use (and not use) templates ####
1. More powerful than string, less powerful than modeling settings as resources
	1. Strings: allows interpolation of variables into text
		1. For simlple config: use heredoc and interpolation of variables

				${$my_array.join(', ')}

	2. Templates: for complex transformations (iterating over collections), large config files
	3. Setting in a file as individual resource: multiple modules must manage parts of same config file (shared config). Model each setting as individual resource
		1. Use custom resource type
		2. Use `Augeas`
		3. Use `concat`
		4. Use `file_line`

### Embedded Puppet (EPP) template syntax ###
### Embedded Ruby (ERB) template syntax ###
#### ERB structure and syntax ####
#### Tags ####
##### Expression-printing tags #####
###### Space trimming ######
##### Non-printing tags #####
###### Space trimming ######
##### Comment tags #####
###### Space trimming ######
##### Literal tag delimiters #####
#### Accessing Puppet Variabes ####
##### Puppet data types in Ruby #####
##### Testing for undefined variables #####
#### Some basic Ruby for ERB templates ####
##### `if` statements #####
##### Iteration #####
##### Manipulating data #####
#### Calling Puppet functions from templates ####
#### Example template ####

### Advanced constructs ###
#### Iteration and loops ####
#### Lambdas (code blocks) ####
#### Resource defaults ####
#### Resource collectors ####
#### Virtual resources ####
#### Exported resources ####
#### Tags ####
#### Run stages ####

### Details of complex behaviors ###
#### Containment of resources ####
#### Scope ####
#### Namespaces and autoloading ####

### Writing custom functions ###
#### Introduction to writing functions ####
#### Writing functions (Puppet language) ####

#### Writing functions (modern Ruby API) ####
##### Overview and examples #####
##### Defining signatures #####
##### Special features in implementation methods #####
##### Documenting Ruby functions #####

## Hiera: using configuration data ##
### What is Hiera? ###
1. It is built-in key/value lookup system.
2. Default implementation is YAML file or JSON file
3. It can be extended to work with other data sources

#### You should use Hiera with the roles and profiles method ####
1. [the roles and profiles method](https://docs.puppet.com/pe/2017.1/r_n_p_intro.html): it can be used to set rules about what should and shouldn't be configured with Hiera

#### Hiera is config file for Puppet code ####
1. Site specific info can be in configuration data and not in code
2. Puppet searches Hiera automatically for class parameters (use Hiera to configure a module)

#### Hiera helps you avoid repetition ####
1. Common data can be specified once and override it where default won't work.
	1. Hiera uses Puppet facts to specify data sources

### Quick start guide ###
#### The config file ####
1. `hiera.yaml`: hiera's config file
	1. Each environment gets a `hiera.yaml` file
2. Add a new `hiera.yaml` in the main environment directory (`/etc/puppetlabs/code/environments/production/hiera.yaml`)
3. Paste the following it `hiera.yaml`:

		# <ENVIRONMENT/hiera.yaml
		---
		version: 5

		defaults: # Used for any hierarchy level that omits these keys.
			datadir: data # this path is relative to the environment -- <ENVIRONMENT>/data
			data_hash: yaml_data # Use the built-in YAML backend.

			hierarchy:
				- name: "Per-node data"			# Human-readable name.
				  path: "nodes/%{trusted.certname}.yaml" # File path, relative to datadir

				- name: "Per-OS defaults"
				  path: "os/%{facts.os.family}.yaml"

				- name: "Common data"
				  path: "common.yaml"

##### The hierarchy #####
1. Hiera searches sources in the order written in `hiera.yaml`
2. variables are used to specify data source so that different nodes get different data

#### Write some data ####
##### A test class #####
1. A puppet class for testing Hiera
2. Add a new class in `profile` module

		# /etc/puppetlabs/code/environments/production/modules/profile/manifests/hiera_test.pp
		class profile::hiera_test (
			Boolean				$ssl,
			Boolean				$backups_enabled,
			Optional[String[1]]	$site_alias = undef,
		) {
			file { '/tmp/hiera_test.txt':
				ensure	=> file,
				content => @("END"),
							Data from profile::hiera_test
							-----
							profile::hiera_test::ssl: ${ssl}
							profile::hiera_test::backups_enabled: ${backups_enabled}
							profile::hiera_test::site_alias: ${site_alias}
							|END
				owner	=> root,
				mode	=> '0644',
			}
		}

	1. Puppet automatically looks up class parameters in Hiera using `<CLASSNAME::<PARAMETERNAME>` as lookup key
3. Define following keys in Hiera data
	1. `profile::hiera_test::ssl`
	2. `profile::hiera_test::backups_enabled`
	3. `profile::hiera_test::site_alias`

##### Common data #####
1. The location of yaml file:
	1. Combine the following:
		1. environment's directory
		2. data directory (subdirectory of environment) - `<ENVIRONMENT>/data` is default
		3. File path specified by hierarchy level
	2. Example: `/etc/puppetlabs/code/environments/production/` + `data/` + `common.yaml`

			# /etc/puppetlabs/code/environments/production/data/common.yaml
			---
			profile::hiera_test::ssl: false
			profile::hiera_test::backups_enabled: true

		1. `$site_alias` has default value

##### Per-OS data #####
1. Second level in hierarchy uses `os` fact to locate data file.
	1. Example: For MacBook laptops, OS family is `Darwin`
		1. Data in this example must not be sent to backup server so setting `$backups_enabled` to `false`
2. Locating the data file:
	1. Replace `%{facts.os.family}` with `Darwin`:
		1. `/etc/puppetlabs/code/environments/production/data/` + `os/` + `Darwin` + `.yaml`

				# /etc/puppetlabs/code/environments/production/data/os/Darwin.yaml
				---
				profile::hiera_test::backups_enabled: false

##### Per-node data #####
1. Highest value in the hierarchy uses `$trusted['certname']` to locate data file
	1. Example: assume there is server named `jenkins-prod-03.example.com`. It is configured to use SSL and served at hostname `ci.example.com`
2. Locating the data: Replace `%{trusted.certname}` with node name
	1. `/etc/puppetlabs/code/environments/production/data/` + `nodes/` + `jenkins-prod-03.example.com` + `.yaml`
	
			# /etc/puppetlabs/code/environments/production/data/nodes/jenkins-prod-03.example.com.yaml
			---
			profile::hiera_test::ssl: true
			profile::hiera_test::site_alias: ci.example.com

#### Different nodes get different data ####
1. Assign `profile::hiera_test` class to several machines and run puppet
2. Check contents of `/tmp/tiera_test.txt`
	1. Example: On `jenkins-prod-03.example.com`

			Data from profile::hiera_test
			-----
			profile::hiera_test::ssl: true
			profile::hiera_test::backups_enabled: true
			profile::hiera_test::site_alias: ci.example.com

#### Test data on the command line ####
1. `puppet lookup` can be used to check data that a node will recieve

		puppet lookup profile::hiera_test::backups_enabled --environment production --node jenkins-prod-03.example.com

	1. Run command on Puppet server node (or node that has access to full checkout of Puppet code and config)
	2. Command should have access to `confdir` and `codedir` (to live data)
		1. If not running `puppet lookup` as root, specify `--codedir` and `--confdir` on commandline
	3. If using PuppetDB, use any node's facts in lookup using `--node <NAME>` (because Hiera can get node's facts and use)
		1. If not using PuppetDB, provide facts as YAML or json file as `--facts <FILE>`
			1. How to get the file? run `facter -p --json > facts.json` on node and copy it to server
			2. If not getting values as expected, run with `--explain` (full explanation will be displayed for which data sources it searched)

#### Carry on! ####
1. Further:
	1. [global layer and module layer](https://docs.puppet.com/puppet/4.9/hiera_layers.html), [hash and array merging](https://docs.puppet.com/puppet/4.9/hiera_merging.html)

### How hierarchies work ###
1. Each level in hierarchy tells Hiera how to access data source.

#### Most hierarchies interpolate variables ####

#### Hiera searches the hierarchy in order ####
#### Optionally, Hiera can merge data ####
#### Three layer hierarchies -> one combined hierarchy ####

### How the three config layers work ###

### Configuring Hiera (the `hiera.yaml` file) ###
#### `hiera.yaml` v5 syntax ####
#### Interpolating variables and functions ####

### Looking up data ###
#### Automatic class parameter lookup ####
#### Using the `lookup` function ####
#### Merging data from multiple sources ####
#### Accesssing hash and array elements (`key.subkey` notation) ####
#### Using the deprecated `hiera` functions ####
#### Using the `puppet lookup` command ####

### Creation and editing data ###
#### Merging data from multiple sources ####
#### Interpolating variables and functions ####

## Resource types ##


## Reports: Tracking Puppet's activity ##
### About reporting ###
### Built-in report processors ###
### Writing custom report processors ###
### Puppet::Transaction::Report object format ###

## SSL and certificates ##
### Using an external CA ###
### Using an external CA with Puppet Server ###
### External SSL termination with Puppet Server ###
### Configuring autosigning ###
### CSR attributes and certificate extensions ###
### Regenerating all certificates in a deployment ###

## Adding file server mount points ##
## Details about Puppet's internals ##
### Agent/master HTTPS communications ###

 