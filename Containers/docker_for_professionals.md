# Docker for Professionals: The Practical Guide #
## Introduction ##
1. What is Docker?
	1. Installing new software for testing purposes
	2. Modifying machine and uninstall software afterwards
	3. If software caused damage to system
	4. Solution: Install a VM
		1. It will consume a lot of resources (just to test Nginx with a prototype app)
		2. If mutliple apps have to interact with each other, then we need multiple VMs
	5. Solution: Docker
		1. A completely isolated container gets created inside which software would run. A simple command will remove it totally from system
2. What are you going to know about Docker?
	1. After the course, we can use Docker in daily development/testing activities
	2. Topics covered:
		1. How to pull a Docker image and run a container from it
		2. How to interact with the container and customize it to fit your needs
		3. How to make the host communicate with the container (network wise and storage wise)
		4. How to build your own container and the different ways of publishing it.
3. What do you need to get the maximum out of this course?
	1. A computer running Windows (8 or higher), Linux distro, MAX OSX.
		1. Examples are done in Ubuntu 16.04 (but Docker runs equally on all OSs)
	2. No prior Docker knowledge required
	3. Some Linux background (Simple commands)
	4. Concept of Virtualization
	5. Eagerness to learn and follow the examples in the course
		1. We need to build our own

## Introduction to DevOps ##
### Introduction to DevOps ###
1. Software development methodologies
	1. To develop a piece of software, responsible team must follow set of rules that guarantee an easy and successful development process.
	2. There are many methodologies:
		1. Waterfall, Prototyping, Spiral, Rapid, Agile...
	3. Choice depends on type of the project
	4. Looking at agile development
2. Waterfall approach:
	1. Development process falls downwards through a set of stages or phases until it reaches end point.
		1. Process starts by gathering requirements from client. (Gets added to product requirements document)
		2. The requirements get analyzed. (Models, business rules get generated as a result)
		3. Developers start to write code for build, test and integration
		4. Discovery and debugging of flaws
		5. Deployment (installation/migration), support and maintenance of app is carried out
	2. Once a step gets completed, it is very hard to return to it
	3. Good when client does not change the scope of project once started. Speed is not an issue as clearly defining project
3. Agile approach:
	1. Project is built through multiple short iterations, each iteration will take a week or a month
	2. Many versions of the end product are built from least functional to most one
	3. Any changes, customer feedback, or additional requirements are accepted and adopted in any stage (There can be a second iteration)
	4. When end product reaches the point where no more changes can be made, no more functionality is needed, it is released to the market
	5. It may suit most modern requirements
4. Infrastructure needs for Agile development
	1. In Agile methodology, product is coded in "sprints", each sprint takes two to four weeks at most.This needs multiple development environments built quickly and easily.
	2. Before, developer would request one hardware server, and operations team starts availing the required prerequisites (database, webserver, libraries, ...)
	3. After that, this was done with virtualization, A powerful machine would host a number of virtual machines each having its own set of resources. Multiple environments can be build quickly.
	4. Still need to avail pre-requisites, which consumed time and involved other teams who may not always be available for the task.
	5. Modern approach is cloud computing

### Infrastructure Needs For Agile Development ###
1. In Agile, product is coded in sprints, each sprint takes two to four weeks. This methodology requires multiple development environments built quickly and easily.
2. Before, developer would request one hardware server, and operations team starts availing the required prerequisites (database, webserver, libraries, ...)
3. After that, this was done with virtualization, A powerful machine would host a number of virtual machines each having its own set of resources. Multiple environments can be build quickly.
4. Still need to avail pre-requisites, which consumed time and involved other teams who may not always be available for the task.
5. Modern approach is cloud computing
6. A web application project - Traditional way:
	1. You are a web developer building a web application for a customer. You need a webserver equipped with all the requisites (Apache, MySQL database, PHP 5.5). Traditionally, you need to do the following:
		1. Assuming host machine is setup (purchased).
		2. A virtual machine must be created with required resources
		3. OS need to be installed
		4. Necessary security needs to be configured
		5. User accounts need to be created
		6. Apache, MySQL, PHP 5.5 need to be installed
		7. Deploy the app
		8. Repeat the above steps for each new environment
		9. If more CPU/memory is required, this may need downtime
7. A web application project - the cloud-computing way:
	1. Don't have to purchase hardware. Setup an account on cloud computing vendors (Amazon AWS, Google Apps, ...) and choose the model that best suits you: IaaS (Infrastructure as a Service), PaaS (Platform as a Servive), or SaaS (Software as a Service).
	2. Few mouse clicks will setup a machine which takes a few minutes (instead of hours or days)
	3. We can host our own cloud environment
	4. Development speed is increased.
8. Classic model:
	1. None
9. Infrastructure as a Service (IaaS)
	1. Hypervisor
	2. Hardware
	3. Storage
	4. Networking
10. Platform as a Service (PaaS)
	1. Runtime (PHP)
	2. Security
	3. Database
	4. Virtual Machine
	5. Hypervisor
	6. Hardware
	7. Storage
	8. Networking
11. Software as a Service (SaaS)
	1. Application
	2. Runtime
	3. Security
	4. Database
	5. Virtual Machine
	6. Hypervisor
	7. Hardware
	8. Storage
	9. Networking
12. Where does DevOps fit in?
	1. DevOps is combination between "Development" and "Operations"
	2. "Development" implies software developers
	3. "Operations" implies other IT departments like system administration, quality assurance...
	4. It complements cloud computing and the Agile development model
	5. It aims at facilitating and, thus, shortening the application life cycle by automating the delivery and infrastructure changes
	6. Before DevOps, communication between functionally-separated organizations was more difficult and time consuming

### DevOps Misconceptions ###
1. Misconceptions:
	1. More and more emphasis is placed on developers job. Development team does their job in addition to operations which may imply that system administration and operations staff losing their jobs. Which is untrue
	2. DevOps was then initiated and supported by Operations team. They realized their existing practices cannot keep pace with current, fast-moving climate. More and more parts need to be automated. Additionally, some operational taks need to be carried out by developers.
	3. Outcome is a person who has both operation and development skills. Who is a DevOps engineer.
2. Tools of the trade:
	1. DevOps is not a tool in itself; it is rather a set of tools that may be categorized as on or more of the following:
		1. Continuous Integration (CI): like Jenkins
		2. Containerization: like Docker, Chroot, and VMWare ThinApp
		3. Version Control: like Git
		4. Testing: like Selenium
		5. Packaging: like dpkg, rpm...etc
		6. Configuration management: like Puppet and Chef
3. Docker is used to build isolated environments for software to be deployed, shipped, tested or distributed

## Hello Docker! ##
### What is it? ###
1. What is docker?
	1. Before, we installed software on an OS that is installed on a set of hardware devices (CPU, memory, disks, ...)
	2. Then virtualization was introduced: Multiple OS's can be run on same hardware by constructing hardware distribution and isolation. Resource intensive.
	3. Docker fills gap between running a totally separate OS (like on a VM) to run a software app and to run app on same OS.
	4. Lightweight level of virtualization is created using containers
	5. It is open-source linux based software that can run on any hardware environment that supports Docker instances (Windows, Linux, OSX)
		1. Running an app in an isolated environment without running a VM
2. Containers?
	1. Before, system administrators used jails to isolate processes in "closed environments".
		1. Closed environment: special runtime space for process/application to live in where it cannot access any protected resources
		2. Container popularized by Sonaris 10 to provide more isolation than jails.
			1. Container denies process access to any system resource except the ones explicitly granted.
			2. Jail protects from accessing some of the resources of the system
			3. Container denies access to all the system resources except the onces explicitly granted to it
		3. Containers are complex and hard to setup
		4. Docker uses existing container engines to build containers according to best practices. This process does not require user intervention.
			1. It deals with the hard parts of setting up a container
3. Containers vs. Vitualization
	1. A container is not a virtual machine
	2. VM is built by abstracting necessary hardware resources to run a whole instance of an OS. Software can then be installed on the instance
		1. Problem: Resources get wasted just to run the OS
	3. When software runs inside a Docker container, it runs in an isolated environment that interfaces directly with Linux Kernel of the main OS. Saves time and reduces cost.
4. Docker images:
	1. Docker container is where app is physically stored together with its dependencies. This is used to ship, copy, distribute and run apps.
	2. Container needs to be filled before it is shipped. This is where Docker images are used.
	3. Docker image is basis of containers. It is a snapshot of all files that program running inside container should need.
	4. Image can be used for creation of containers. When an app that is inside docker, needs to be shipped, then ship the image and the recipient OS builds the containers out of the image.
	5. Images can be stored in registries and indexes.
		1. May be publicly available (on Docker website or other hosting companies)
		2. May be hosted on own indexes and registries
4. Docker Registry:
	1. [https://hub.docker.com/explore/](https://hub.docker.com/explore/)

### Common Docker Use Cases ###
1. Software dependencies
	1. Some computer running Centos
	2. Installed business app that uses glibc library version 2.12
	3. Security team advises you to upgrade Linux Kernel to apply latest patches
	4. Kernel update upgrades glibc libraries
	5. Business app fails to start anymore
	6. Prerequisites of app do not support glibc of higher version than 2.12
	7. We cannot downgrade glibc libraries without downgrading kernel -> complete OS reinstallation
	8. Solution:
		1. Install the software in Docker container. App will be completely isolated from system libraries and resources (like glibc). Upgrade the kernel without breaking anything
			1. It uses its own glibc in its own environment provided by docker image
2. Software portability:
	1. You have a software that solves a business problem
	2. Software runs on Linux only
	3. Company servers are running Microsoft Windows
	4. Workaround: Install linux on VM in one of the servers
		1. Problem: consumes a lot of resources and multiple environments need more VMs and more resources
	5. Workaround 2: Docker
		1. Run same software on any system (Windows, Mac)
		2. Docker builds a small VM on which multiple containers can be built using less resources than creation of multiple VMs.
3. Software running risks:
	1. We may need to install apps from untrusted sources. They may not be malicious but we don't want to take any risk
	2. Misbehavior: system corruption, bugs that may allow outside attackers to compromise system or may leak confidential data
	3. Solution: Docker allows app the resources that you declaratively allow it to.
	4. Installing untrusted software for testing or other purposes is much safer when used inside Docker than risking the system.
4. When not to use Docker?
	1. Currently, Docker is used to run programs that are designed to run on a Linux kernel. Native Windows of OSX app cannot be shipped by Docker to other systems.
	2. Some apps (security related ones say) need to run as privileged user with full admin capabilities. Docker is used for constructing an isolated environment where account is a limited one.
5. Docker example:
	1. Install docker [https://docs.docker.com/installation](https://docs.docker.com/installation)
	2. Run the following command (sudo for linux and Mac):

			docker run afakharany/hello_world

	3. Several components will be downloaded

### A Docker Example ###
1. Install docker [https://docs.docker.com/installation](https://docs.docker.com/installation)
2. Run the following command (sudo for linux and Mac):

		docker run -i -t ubuntu echo 'Hello World'

	1. `ubuntu`: docker image
	2. `echo 'Hello World'`: container is issued the echo command
		1. Container runs only as long as the command runs (when it is finished, container stops)
	3. `run`: consults background daemon searching for ubuntu image and build a container based on it

3. Several components will be downloaded

#### What has happened? ####
1. Issuing Docker run will start a new container. Container needs an image from which to get instructions (files, dependencies, ...)
2. Image is `ubuntu`
3. Docker searches for the image on locally on computer. It is not found so it contacts Docker Hub (Large, publicly available repository of images). When it finds the image, it starts downloading it.
4. After download, image layers get installed locally on the computer.
5. Docker uses installed image to build a new container and start the program
6. Command issued by the container is `echo "hello world"`. After command has finished, container is automatically stopped
7. If command is running, container is running, if command stops, container stops. If container is restarted, command is launched again
8. If `docker run` is issued again:
	1. Docker will find image locally installed on computer (so it is not downloaded again)
	2. A new container gets created for the command to run (each time new container gets created which is isolated from other containers)

## Using Docker Containers ##
### Getting Assistance on Docker Command Line ###
1. Docker provides bundled help system within commandline interface
	1. `docker <command> --help`
		1. `docker images --help`
		2. `docker pull --help`
2. Help on docker:
	1. `docker --help` (subcommands and brief description)

#### LAB: Creation of a service monitor
1. Target: Server running a Busybox image (tiny Linux kernel with most basic functionality). We need to check if server is up and running on periodic intervals
2. Procedure:
	1. Pull and run `afakharany/server` container from Docker hub. Container must run in background (daemon mode). It must have a name by which it can be referenced from other containers. Name it "server". Command is:

			docker run --detach --name server afakharany/server

	2. Pull and run `afakharany/checker` container from Docker hub. This container contains a script that issues a ping request to server every five seconds. If server is running it will print "Server is up", otherwise it'll print "Server is down". We must link containers with each other to do that. Consider the following:

			docker run --link server:server -it afakharany/checker

		1. `-i`: `--interactive` - Keep STDIN open even if not attached
		2. `-t`: `--tty` - Allocate a pseudo-TTY (Accepts commands from shell)
		3. `-it`: container will run in foreground and accept tty signals (CTRL+C to exit). The command should print "Server is running"
	3. CTRL+C to exit the container and run container in background mode:
		
			docker run --detach --name checker --link server:server afakharany/checker
	4. Removing existing image:

			docker rm -f checker

	5. Stopping a container:
	
			docker stop server

### LAB: Creation of Service Monitor ###
1. To start a container:

		docker start server

2. To start checker command:

		docker start checker (all the options specified during docker run are retained)

3. Print logs of a container:

		docker logs checker

		docker logs -f checker (like tail -f)

#### Listing and running containers ####
1. Information displayed with `docker ps`
	1. ID of container (`bb8aef1f12cd`)
	2. Container's name (`checker`)
	3. Image used (`afakharany/checker`)
	4. Command the container is executing (`"/runner/checker.sh"`)
	5. Amount of time elapsed since container started running
	6. Any network ports exposed by the container

#### More ways to interact with containers ####
1. We can control the state of a container using:
	1. `docker stop name/id` (stops the container)
	2. `docker start name/id` (starts a stopped container)
	3. `docker restart name/id` (restarts a container)
2. If we need to check the output of a container running in the background, use `docker logs` followed by container name or id.

		docker logs server

3. `docker logs -f server`: continuously update the output of logs command displaying new content as soon as it is available
4. If you stop server container using `docker stop server`, checker container will start sensing that server is down as no ping requests are successful anymore. It will start printing "Server is down". The message can be viewed with `docker logs checker`
5. id: 65 characters out of which 12 characters are displayed.

### The PID Namespace ###
1. Process ID: unique number that identifies a process in Linux
	1. Start from 1 (mostly init process) and incremented as more processes are spawned
2. Two containers based on busybox image:

		docker run -d --name server1 busybox sh -c "nc -l -p 0.0.0.0:7070"
		docker run -d --name server2 busybox sh -c "nc -l -p 0.0.0.0:8080"

3. Check the processes each container possesses by running ps command on each one of them.
	1. Additional commands can be run against container (in addition to the main command) using `exec`

			docker exec server1 ps
			docker exec server2 ps

4. Each container has its own namespace which PID starting from 1
5. The isolation helps container not guess the PIDs of host OS
6. The behavior can be overridden using `--pid host` with `docker create` or `docker run`

### Problems with Multiple Containers ###
1. Challenge: Need more than one server (service) all using same resources.
	1. Example - for web application, we need more than one web server to test different environments. Once first webserver is up and running, port 80 can no longer be used by another web server process.
	2. Docker provides workarounds
	3. Building multiple containers for the same purpose may lead to naming conflicts (right container may be difficult to identify).
		1. human friendly name with `--name` becomes a challenge for 10s of containers
	4. There is a mechanism used by Docker to identify its containers (we can use it)
2. See container id:
		
		docker create busybox (container gets created and is in stop state)
	
	1. Prints 65 hex characters
3. More ways to get the container ID:
	1. Save the container ID to shell variable. (Only for POSIX compliant shells)
		
			CID=`docker create buxybox`
			echo $CID

	2. Another way: Use `--cidfile` flag (available for `docker create` and `docker run`)

			docker create --cidfile bbox.cide busybox
			cat bbox.cide

		1. If file already exists, it fails to construct a container
4. Docker human-friendly names
	1. Container ID's are hard to remember and are hard to read. Manually issuing new name to a container is not easy
	2. Docker uses a naming convention to assign names
		1. adjective + _ + the last name of famous scientist/engineer
			1. Ex: kickass_hiesenberg, naughty_babbage, ...
	3. Combining name assigned to container, auto-generated name and CID helps identify containers

### Docker Human-Friendly Names - Part A ###
1. Container ID's are hard to remember and are hard to read. Manually issuing new name to a container is not easy
2. Docker uses a naming convention to assign names
	1. adjective + _ + the last name of famous scientist/engineer
		1. Ex: kickass_hiesenberg, naughty_babbage, ...
3. Combining name assigned to container, auto-generated name and CID helps identify containers
4. `docker run -d busybox sleep 30000` (4 times)
	1. Docker automatically assigns a name
	2. `docker ps`

#### Neutral systems ####
1. Systems depend on other systems or on other host
	1. Example: filesystem locations, environment variables, ...
2. We need to minimize the dependencies in order to build systems that are easily portable and require least amount of maintenance
3.Three methods of achieving this:
	1. Read-only filesystems
	2. Environment variable injection
	3. Volumes

#### Read-only filesystems ####
1. Prevents any changes to underlying system
2. Good when dealing with apps that use databases massively to store and manage data. Example: content management systems (WordPress, Joomla, Drupal, ...)
3. Helps provide a level of protection to container. If it gets compromized, attacker will not have a chance to do damage
4. Specify that container will work on read only mode using `--read-only`.
	1. There is also a readymade image for wordpress

			docker run -d --read-only --name wpress wordpress

5. Example:

		docker run -d --read-only --name wpress wordpress (latest version)

	1. wordpress does not start because it needs a database

### Docker Human-Friendly Names - Part B ###
1. `docker run --name wpressDB -d -e MYSQL_ROOT_PASSWORD=admin mysql`
2. Link wordpress to database
	1. `docker rm wpress`
	2. `docker run -d --read-only --name wpress --link wpressDB:mysql wordpress`
		1. needs file descriptor
	3. Exempting certain portions of filesystem from read only access (using Volumes)
		1. `docker rm wpress`
		2. `docker run -d --read-only --name wpress --link wpressDB:mysql -p 80 -v /run/apache2 -v /run/lock/apache2 -v /tmp wordpress`
			1. `wpressDB:mysql` - `<container-name>:<new-name>`
			2. `-p 80` - a local port (32768) gets mapped to port 80 of the container
3. Test: Open `http://localhost:32768`

### Bundling Environment Variables ###
#### Bundling environment variables ####
1. A lot of customization for Wordpress is done in `wp-config.php` file. Previous installation assumed default values for the environment variables. Docker allows passing the environment variables during container creation process.
2. Environment variables are core part of OS. Example `PATH`. In Linux/UNIX examine currently defined variables using `env` command
3. Using Docker we can add new environment variables, overwrite existing one, or both. Scripts or apps inside containers can be configured to expect and interpret variables that you pass to them.
4. Inject environment variables using `-evn` or `-e`.
	1. Example: `docker run -it -e MYVAR='Hello' busybox env`
		1. Run `env` on container to check existing environment variables and newly defined `$MYVAR`
5. Example: Wordpress settings:

		docker run -d --name wpress --link wpressDB:mysql -p 80 --read-only -v /run/lock/apache2 -v /run/apache2 -v /tmp -e WORDPRESS_DB_HOST=database_hostname -e WORDPRESS_DB_USER=database_user -e WORDPRESS_DB_PASSWORD=the_password -e WORDPRESS_DB_NAME=the_database_name wordpress
6. Environment variables example:
	1. `docker run busybox env`
	2. `docker run -e HOSTNAME=bbox busybox env`
	3. `docker run -e DB=main -e USER=admin busybox env`
7. Wordpress Environemnt variables:
	1. `docker exec wpress env`
	2. `docker run -d --read-only --name wpress --link wpressDB:mysql -p 80 -v /run/apache2 -v /run/lock/apache2 -v /tmp -e WORDPRESS_DB_HOST=mainserver wordpress`

### Recovering from Failures - Restarting ###
1. A docker container can be in one of 4 states: running, paused, restarting, exited.
2. Container will run as long as its command(s) run. When commands exit, container is stopped. If command fails for any reason, container will exit. Docker provides restart mechanism to help recover the container from failures.
3. `--restart` can be used during creation to instruct Docker to restart container. It has following 4 values:
	1. Do not restart at all (default behavior) - `no`
	2. Try to restart (default behavior) - `on-failure[:max-retries]`
		1. `on-failure:3`
	3. Always restart the container but not start it when the daemon starts if it (container) was previously put to the stopped state - `unless-stopped` (if manually stopped)
	4. Always restart the container when it is down - `always` (whether it is stopped, failure occurs, ...)
4. Docker uses back-off policy to avoid restarting container too quickly. It works as follows: 
	1. first time system will wait for a specified period (say one second)
	2. second attempt will have to wait double the period (two seconds)
	3. third will wait four seconds
	4. fourth will wight eight seconds
	4. ...
5. Example:
	1. `docker run -d --name restart-test --restart always busybox date`
	2. `docker logs -f restart-test`
		1. Container gets restarted after `date` command is done.
		2. Each restart will print the current date and time. The wait period increases for each restart
6. When docker attempts to restart container, it is in "restart" state and it cannot accept any new commands.
	1. Problem: If we want to run diagnostic or troubleshooting tools on container to determine root cause of failure.
	2. Solution: Use init process (process manager) with container

### Process Manager ###
#### The process manager (init) ####
1. Linux/UNIX system contains a main process with PID of 1. It is always the first process that gets launched when system boots. It is responsible for launching all other processes on system and respawns (restarts) some of them if they fail. (init also monitors other processes)
2. In container design, the recommended practice is to use same architecture to ensure that processes get cleanly restarted if they failed.
3. Example:

		docker run -d --name baseimage phusion/baseimage

	1. Pulls and runs baseimage container from phusion. (Ubuntu 16.04 image that uses init process to control child processes)
4. Look at running processes inside container

		docker exec baseimage ps -ef (shows processes running on system)

5. Obtain process id for one of the running processes (syslog). Kill the process using kill command:

		docker exec baseimage kill -9 PID

6. Examine container logs to see what happened

		docker logs baseimage

	1. The process was respawned again by process manager

### Container's Entry Point ###
#### Container's entry point ####
1. Another measure taken: container and processes within run smoothly without errors, is "startup script"
	1. Startup script: shell script that does a quick check on all prerequisites needed to run the application inside container
		1. Example: Check MySQL database container startup script
	
				docker exec wpressDB cat /usr/local/bin/docker-entrypoint.sh

2. Docker has an "entrypoint" command (command used to run its primary command). This is `sh -c` (ensures every command run directly using `docker` command is correctly passed on to shell to get executed)
	1. The "entrypoint" can be altered using `--entrypoint`

			docker run --entrypoint="cat" mysql /usr/local/bin/docker-entrypoint.sh
		
		1. `cat ...` gets executed

#### Removing containers ####
1. `docker ps -a`: gives complete list with all containers regardless of their state
2. To remove a container:
	1. Stop the container first
	2. Remove it using `docker rm name/id` **(M)**
	3. `docker rm -f name/id` forcefully stop and remove the container
		1. `docker kill name/id`
	4. `docker stop` sends `SIGHUP` signal to container (process is given chance to do necessary cleanup)
	5. `docker kill` sends `SIGKILL` signal (process should immediately stop while running - may result in file corruption and other adverse consequences)
3. For testing purposes, (to remove container immediately), use `--rm` during creation to automate cleanup process.

		docker run --rm busybox echo "Hello World"

	1. After executing the primary command, the container gets cleanly removed from the system

## Using Docker in Software Installations ##
### Using Docker in Software Installations ###
#### Finding the correct image ####
1. We used images to download and install software on machine using containers
2. An image can be identified by name and version of software it contains
	1. Example: ubuntu:14.04
3. Every docker image contains an ID (a long set of numbers and characters). The ID gets changed when change is made to underlying files within
4. Since image IDs are non human-readable, Docker users work with repositories instead.
5. LAB:
	1. `docker images` (IMAGE ID)

#### Docker repositories ####
1. Repository: A large vessel containing number of images
	1. It has a name similar to URLs:
		1. `quay.io/repliatedcom/nagios`
			1. `quay.io`: registry host
			2. `replicadcom`: username
			3. `nagios`: image
2. Tags: Can be used to identify image
	1. It reflects image version (often)
	2. `<image-name>:<tag>`
	3. Example:

			quay.io/replicatedcom/nagios:latest (default)

3. An image can have multiple tags
	1. Can specify minor version of software (1 (1.0), 1.1)

#### Docker hub ####
1. Docker indexes: Used to find the repository to pull image from
	1. It contains a catalog for available Docker repositories (it is like search engine - contains easy-to-use way to search and find page)
	2. Docker hub: default index for
	3. Command line tools can be used to pull images from Docker hub or from other image indexes.
2. When an image is searched in Docker hub, the following info is returned
	1. Number of pulls: number of times the image was pulled
	2. Number of stars: rough indicator of quality of image depending on community's opinion
	3. Whether or not image is trusted
	4. Whether or not image is official
3. Example:
	1. `docker search mysql`

### Docker Hub ###
#### Working with Docker Hub ####
1. Options to build and publish images to Docker Hub
	1. Build image locally then push it to repo (untrusted)
	2. Build a Dockerfile and use Docker's continuous build system to build the image. (Preferred as Dockerfile contains commands and activities that image is going to make when a container is created.)
		1. These images are marked as TRUSTED
2. To push images:
	1. Add a new account in Docker (basic type is free) - [https://cloud.docker.com](https://cloud.docker.com)
	2. Issue `docker login` to authenticate
	3. Push images to any repo owned
	4. Log out using `docker logout`
3. Dockerfile: contains dependencies, commands
4. AUTOMATED? Means Dockerfile is available and we can read and know what changes the image is going to make to the system

#### Other registries than Docker Hub ####
1. Docker hub is not the only source of images
2. Other registries are provided by companies.
3. We can host our own repository. We can build an image from Dockerfile or manually download and run image from file.
	1. For downloading image from other registry, specify full path (instead of image name): `docker pull quay.io/nitrous/wordpress` (downloads `wordpress` image from `quay.io` repo)
		1. URL: `<provider>/<username(image owner)>/<image>[:<tag>]`
		2. Docker communicates with registry and downloads the image.
		3. But we may need to authenticate before downloading (may consult image docs if so)

#### Obtaining an image from a file ####
1. If repository is not available (behind firewall that block access to repositories). But we have access to image file. Docker can load image from the file.
2. Remove an existing image: `docker rmi busybox`
3. Load local image: `docker load -i busybox.tar`
4. Save an image after it is pulled (`docker pull busybox:latest`):

		docker save -o busybox.tar busybox:latest

### Building Your Own Image ###
#### Building your own image ####
1. We can build image using Dockerfile.
	1. Dockerfile: script that describes how image is going to be built, what commands to run, what files to include
	2. Dockerfile to build server container
		1. Empty directory: `mkdir mydockerimage`
		2. New script file `runner.sh`:

				#!/bin/sh
				echo "Server started at " $(date)
				while true; do
					# The loop is doing nothing. It is just to keep the container running in the background
					sleep 5
				done

		3. New file `Dockerfile`:

				FROM busybox:latest
				RUN mkdir /runner
				COPY ./runner.sh /runner
				RUN adduser -DHs /bin/sh worker
				WORKDIR /runner
				RUN chown worker runner.sh
				RUN chmod a+x runner.sh
				USER worker
				CMD ["/runner/runner.sh"]

			1. `USER worker`: using the user `worker` the following command will be run

		4. Build an image:

				docker build -t masteringdocker/server:latest .

			1. `-t <username>/<imagename>`
		5. Run the image:

				docker run -it masteringdocker/server

## Persistent Storage ##
### Persistent Storage ###
#### Understanding union filesystems ####
1. `docker images -a`
	1. many images have no name (none). We can refer to them using image ID
2. When we download an image, we are pulling a number of images that have parent-child relation.
	1. Example: ubuntu:16.04 is built on a number of parent images.
		1. Parent images contain common libraries and dependencies for child image
3. Advantage: Common layers need not be reinstalled
	1. Several versions of same app can be downloaded without redeploying common dependencies
4. Union filesystems is not the answer for every use case.
	1. Example: It does not support extended file attributes that SELinux requires to operate correctly.
	2. Solution: "volumes"
5. Union filesystems: Filesystems used when volumes are not used
	1. The files systems of parent layers are combined into union filesystem

#### Why volumes? ####
1. When using WordPress in live environment where users will log in and start writing content Data is stored in MySQL database container linked to it.
	1. Where is the data physically stored?
	2. What if we want to access the data?
	3. What if we want to upgrade the database engine?
	4. How to view logs the app writes to troubleshoot problems?
2. Solution: This is why volumes are used
3. Volumes: mount points to respective filesystems on host OS
	1. Mount point: a link to a device (linking a directory to a device)
4. Contianer's internal filesystem (union filesystem) provides the mount points
5. If we want to decouple the data from the container (container must not own the data)
	1. If the container is deleted, we lose the data otherwise

### How to Use Volumes? ###
#### When to use volumes? ####
1. Volumes were introduced to serve containers that need to write a lot of data to persistent storage. Volumes should be used when working with:
	1. Database data (instead of engine that processes it)
		1. If we want to change engine we can
	2. Log data of web application (instead of app itself)
	3. Dynamically changing data (like in CMS) (instead of static websites)
2. Storing data in volumes makes app more modular. It helps set separation of concerns principle correctly.
	1. We can change app that deals with data (interface) while keeping data intact
		1. Saves times, effort, builds less-error-prone model
3. Volumes are controlled window between host and container
	1. Example: If host is using SSD disks for database. Without volumes, Docker does not know about underlying disk type or speed where data is stored. User who operates Docker can control this using volumes.
		1. One option is to put the entire container on SSD disk (but it is expensive)
		2. Use SSD only for data that needs fast access

### LAB: Using Volumes to Construct Persitent Data ###
#### LAB: using volumes to construct persistent data ####
1. Use of volumes with shared volume that will be used by two MySQL databases (they share data)
2. First construct a new container that will hold the volume

		docker run -d --volume /var/lib/mysql --name mysql-shared busybox echo Hello, I am the volumes container

	1. container exits immediately but a volume has got created

3. Construct a MySQL container that uses the before created volume

		docker run -d --volumes-from mysql-shared --name mysql1 -e MYSQL_ROOT_PASSWORD=admin mysql

	1. `--volumes-from`: the container uses volumes built by another container

4. Need to add data to database. So pull and run another MySQL container for the sake of using client

		docker run -it --rm --link mysql1:mysqldb mysql mysql -u root -padmin -h mysqldb

	1. `mysqldb`: new name

5. Seed some data from inside MySQL console

		mysql> create database myDB;
		mysql> use myDB;
		mysql> CREATE TABLE Persons (PersonID int, LastName varchar(255), FirstName varchar(255), Address varchar(255), City varchar(255));

6. Ensure that the data exists:
	
		mysql> select * from Persons;
		mysql> quit;

7. We need to test data persistence. Remove the mysql1 container that is created and build a new one called mysql2 that will use the same volumes:

		docker stop mysql1
		docker rm mysql1
		docker run -d --volumes-from mysql-shared --name mysql2 -e MYSQL_ROOT_PASSWORD=admin mysql
		docker run -it --rm --link mysql2:mysqldb mysql mysql -u root -padmin -h mysqldb
		mysql> use mydocker;
		mysql> select * from Persons;

### The "Bind Mount" Volume Type ###
#### The "bind mount" volume type ####
1. Refers to volumes that have user-specified mount points on host OS
	1. We have determined the physical file system of the host
2. Used to share data between container and host
3. To populate Persons table with some data.
	1. Suppose we have a CSV file containing user details
	2. We want to automatically generate MySQL INSERT statements for them
4. Write a simple Python script that will parse CSV and return appropriate SQL statements.
5. Build an Ubuntu image for it.
6. Files:
	1. `cd /share`
	2. `peaple.csv`

			1,Doe,John,same address,New York
			2,Fakharany,Ahmed,another address,Alexandria
			3,Thomson,Jack,a third address,a third city

	3. `csv_to_insert.py`

			#!/usr/bin/python
			import csv
			with open('people.csv', 'rb') as csvfile:
    			reader = csv.reader(csvfile)
    			for row in reader:
        			with open('insert.sql','ab') as writer:
            			writer.write ('INSERT INTO Persons VALUES (' + row[0] + ',"' + row[1] + '","' + row[2] + '","' + row[3] + '","' + row[4] + '");\n')
        			print ('INSERT INTO Persons VALUES (' + row[0] + ',"' + row[1] + '","' + row[2] + '","' + row[3] + '","' + row[4] + '")')

#### LAB: creation of Python script image for parsing CSV file ####
1. Assume the python script is `csv_to_insert.py`
2. New diectory with a Dockerfile

		mkdir csvDocker
		vim Dockerfile

3. Insert the following:

		FROM Ubuntu:latest
		RUN apt-get update
		RUN apt-get install -y python
		RUN mkdir /csv
		COPY * /csv/
		RUN useradd -ms /bin/sh worker
		WORKDIR /csv
		RUN chown -R worker /csv
		RUN chmod a+x csv_to_insert.py
		USER worker
		CMD ["/csv/csv_to_insert.py"]

4. Build the image:

		docker build -t afakharany/csv

5. Try running a container from the image

		docker run -it --rm afakharany/csv

6. Output: Two insert statements
7. If I want the data to be outside container (not copy it each time image is built)?

		docker run -it -v /share:/csv --rm afakharany/csvtosql

	1. `/share:/csv`: mounting local `/share` as a `/csv` in the container (`/csv` will no longer point to local filesystem)
8. Change the file by adding new entry:

		4,Gates,Bill,Sillicon Valley,Some city

9. Run the container again:

		docker run -it -v /share:/csv --rm afakharany/csvtosql

### LAB: Creation of Python Script Image for Parsing a CSV File ###
#### Mounting a volume in read-only mode ####
1. We can make volumes read-only (container command cannot make any changes to data on host filesystem)
2. `:ro` after volume name

		docker run -it --rm -v /csv:/csv:ro afakharany/csv

3. Try to make changes to a file

		docker run -it --rm -v /csv:/csv:ro afakharany/csv rm people.csv

4. An error message is shown saying that we cannot make changes to read-only filesystem.
5. Example: Make changes to `.py` file to not write to a new file

		docker run -it --rm -v /share:/csv

#### Docker-managed volumes ####
1. Type of volume
2. We do not specify a mount point for volume on host filesystem. Docker manages the volume on some location on host filesystem
3. Example:

		docker run -it --name csvContainer -v /csv afakharany/csv

4. To know where Docker did save the mount point, use `docker inspect`

		docker inspect -f "{{json .Mounts}}" csvContainer

### Sharing Volumes - The Host-Dependent Way ###
### Generalized Volume Sharing ###

## Networking in Docker ##
### Networking in Docker ###
### Docker Network Model - Illustration ###
### Closed Container ###
### Containers' Name Resolution - Part A ###
### Controlling Connections to the Container ###
### Joined Containers ###
### How do Containers "Know" About Each Other? ###

## Using Isolation to Mitigate Risks ##
### Security and Isolation ###
### CPU Allowance ###
### Assigning a CPU Set to the Container ###
### Docker Users ###
### LAB - Handling Permissions ###

## Packaging Software in Images ##
### Software Packaging ###
### Determining Changes ###
### The Commit Command Options ###
### The Commit Command and UFS ###
### Image Layer Sizes and Limits ###
### Working with Flat File Systems ###

## Build Automation and Advanced Image Consideration ##
### Build Automation ###
### Understanding Build Automation - An Explanation ###
### LAB02: A Python Base Image ###
### Exploring Base.df File ###
### The ONBUILD Instruction ###

## Public and Private Software Distribution ##
### Distributing Your Image ###
### LAB01: Using a Hosted Registry ###
### Different Methods to Distribute Your Image Using Docker ###
### LAB02: Creation of Hosted Repository Using an Automated Build ###
### Publishing to Private Registries ###
### Manual Image Publishing ###
### LAB05: Using GitHub as a Sole Means of Distribution ###

## Final Project ##
### Final Project Part A ###
### Final Project Part B ###

## Summary ##
