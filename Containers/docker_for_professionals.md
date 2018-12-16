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
#### Sharing volumes the host-dependent way ####
1. If we need to share volumes across multiple containers.
	1. Example: Say mysql1 container has access to INSERT commands that csv container generated
2. How to do that? Using host-dependent volumes (one or more volumes on host are shared among different containers)

		docker run --name csv -d -v /share:/csv --rm afakharany/csv
		docker start mysql1
		docker run -it -v /share:/mnt --rm --name mysql-client --link mysql1:mysqldb mysql mysql -u root -padmin -h mysqldb
		mysql> use myDB;
		mysql> select * from Persons;
		mysql> source /mnt/insert.sql;

3. There are three containers
	1. csv for running Python script against csv file and generating SQL file
	2. mysql1 container (already created so starting it)
	3. The mysql-client container is just used for connecting to mysql1 database. But here we mounted `/csv` on `/mnt` so that we can use `insert.sql` inside container
4. `/share` is shared among containers.
	1. First one generated SQL file
	2. Second one used the SQL file to feed database

### Generalized Volume Sharing ###
#### Generalized volume sharing ####
1. host-dependent sharing is fine if we are using a couple of volumes and no docker-managed volumes. If number of volumes increase and if we are mixing between docker-managed and bind volumes, it is difficult to use host-dependent sharing. (More typing and need to use inspect command to determine physical locations of mount points on host system)
2. Easier option: `--volumes-from` option
	1. Consider another filesystem `/csv2` containing data which will be needed while working with `mysql1`. This filesystem is not shared with the host:

			docker run --name csv -d -v /share:/csv -v /csv2 --rm afakharany/csv

3. To use both filesystems, we can either inspect csv container to see where `/csv2` points, or we can use the following:

		docker run -it -volumes-from csv --rm --name mysql-client --link mysql1:mysqldb mysql mysql -u root -padmin -h mysqldb

	1. all volumes used by `csv` container should be available to `mysql-client`
4. Even if csv container was inheriting volumes from another parent container, all volumes (current and inherited) should be available to `mysql-client`
5. `--volumes-from` works in recursive mode
	1. If we are inheriting from more than one container and if the containers are inheriting from each other, all volumes will be available to child container

#### When NOT to use `--volumes-from`? ####
1. Inherited volumes maintain the same mount point. If container needs to find data on specific mount point name that is different than that in parent container, this does not work. Example: if `mysql-client` was expecting to find data at `/share2` instead of `/csv2` using `--volumes-from` won't benefit.
2. When more than one mount point have the same name.
	1. Example: if we have a container against which we used `--volumes-from` and it happened to have file system under `csv` (two file systems with same name). Only one of them will be available to consuming container.
3. IF we are planning to change read/write access permissions of inherited volumes `--volumes-from` wont work.
		1. The first one that is mounted would have the files (race mode)
	1. Example: If we need to make `/csv2` read-only (the volume was exposed in parent container with read-write permissions which cannot be changed in consuming container)

#### Referencing managed volumes ####
1. Managed volumes are mounted on host that is managed by Docker. These volumes can be shared only by using `--volumes-from` (owning container identifies them). They cannot be removed except owning container is removed.
	1. We can use inspect and get the physical location and use it with `-v`
2. Common practice: One container per managed volume. (makes sharing and deleting easy)
3. Removing container does not remove managed volume.
	1. `-v`: option used to override the behavior
		1. Example: `docker rm -v afakharany/csv`
4. Multiple containers are using the volume, volume will not be deleted (even with `-v`) unless last container using the volume is removed
5. If `-v` flag is not used, the volume becomes orphaned. (deleted using several manual steps)
6. Bind volumes cannot be deleted (Because they are not managed by Docker). They are managed by host OS.

## Networking in Docker ##
### Networking in Docker ###
#### A networking quick refresher ####
1. Quick refresher about important networking concepts used in the section
	1. Network protocol: agreed-upon method of communication between two or more nodes on a network. Example: Hyper Text Transfer Protocol (HTTP) (used for browsing web pages as well as other tasks). File Transfer Protocol (FTP) for uploading and downloading files.
	2. Network interface: Device that a given host uses to communicate with other hosts on network. An interface must have an IP address (set of numbers separated by dots used to uniquely identify a device on a network). IP addresses use the Internet Protocol (IP)
	3. The loopback interface: We often use Ethernet interface. This has the IP address and is used to communicate over the network. Computer has another special type of interface called loopback. It is not connected to any network and it has a special type of IP address (127.0.0.1). It is used by internal applications on OS to communicate with each other using networking protocols.
	4. Network port: Unique number (per host) that identifies which app will be receiving the network traffic arriving at network interface.
		1. Example: Web server usually on port 80
			1. HTTP traffic received by the interface need to be redirected (by OS) to appropriate app (web server) using it's designated port (80)
	5. Using protocol, IP address (or hostname) and network port, we can specify meaningful network address.
		1. Example: To connect to web server running on 192.168.1.100 on port 8080 and using HTTP protocol. Give the address `http://192.168.1.100:8080`

### Docker Network Model - Illustration ###
1. Container has loopback and private interface
2. There is a host virtual network interface (this communicates with container's private interface)
	1. The computer on which docker daemon is installed, a virtual network interface gets created on it
3. Virtual network interface is connected to a bridge called `docker0` (default)
	1. It is a network card that acts as bridge between host network interface and virtual network interface
	2. Directs traffic from outside network to virtual network interface
4. `ifconfig -a`

#### Routing and NATing ####
1. Since networks get extremely large, they are divided into logical segments called "subnets"
2. In a single network subnet, hosts can connect and communicate with each other without a problem. If one host in a subnet wants to connect to another host in another subnet, intermediary device (called router) must be used.
3. Router contains "routing tables". It is information about how to reach different hosts on the networks to which router is connected. Router is responsible for connecting hosts on different subnets.
	1. Home network need to connect to ISP network and then to backbone and then to a network in the country in which gmail server resides and then to the gmail server (many routers are used usually)
4. In Docker's network topology, docker0 interface is like the router of an outside network. It is used to connect containers with each other in an internal network. It is also used to connect containers to the outside world.
	1. Internal network of a container are connected to outside network or to another container internal network
5. Docker provides 4 different ways to build and connect containers.
	1. We can make educated decision when choosing which model to use during creation of containers.

### Closed Container ###
#### Closed container ####
1. This container does not have any access to the outside world
2. It uses the loopback interface of the host to allow programs inside container to cummunicate internally
3. Maximum level of network protection. This container will not be reachable from outside the host
4. Containers cannot connect to the outside network. If we need network connection ex download packages before it can function.
5. For building a closed container, use `--net none` option during creation.

		docker run --rm --net none busybox ifconfig -a

6. Use cases:
	1. Where app requires maximum security level
	2. Where access is not a requirement
	3. If container runs only a python script which does not require outside network access

#### Bridged containers ####
1. Default type of networks in Docker containers
2. Reduces level of network isolation in favor of providing outside connectivity
3. In this mode, container has two interfaces
	1. loopback interface
	2. private interface (connected to host's virtual interface and bridge (docker0))
4. Bridged containers can communicate with each other as they are connected to same virtual network
5. Bridged containers can communicate with outside network (internet depending on configuration) through host's bridge interface.
6. Common type of network model in Docker.
7. Example: `docker run --name bridgedcontainer -d busybox nc -l 0.0.0.0:10000`
	
		docker exec closedcontainer ping 8.8.8.8
		docker exec bridgedcontainer ping 8.8.8.8

#### Running a brided container ####
1. Bridged network model is default in Docker. It is the model that is automatically chosen for you if you did not specify `--net`
2. In bridged container, apps have access to two network interfaces: loopback device (used for internal communication) and private interface (connected to virtual interface of host. Used to connect to outside network. Uses host's bridge device to connect to outside network)
3. A container can be run in bridged networking mode by either running container without any flags or specifying `--net bridge`
	1. Example: `docker run --rm --net bridge busybox`
4. A container in bridge mode can connect to other containers on same host using internal network. It can connect to outisde network (Internet, depending on configuration) using host's bridge device
5. All communications are done through IP address. If container needs to be identified by hostname, modify creation command as follows...

### Containers' Name Resolution - Part A ###
#### Containers' name resolution ####
1. To communicate with other nodes using hostnames other than IP addresses, use service/server called the DNS (Domain Name Service). It's role is to translate hostnames to IP addresses and vice versa.
2. To assign a hostname to container during its creation, we have two options:
	1. Specify hostname using `--hostname` flag.
		
			docker run --rm --hostname helloDocker busybox nslookup helloDocker

		1. Docker overrides DNS by manually assigning hostname to container. The hostname is used by container internally. No other containers can connect to this container by it's hostname as it is not known to them.
	2. Specify one or more DNS servers that will be used for name resolution.

			docker run --rm --dns=8.8.8.4 --dns=8.8.8.8 busybox nslookup google.com

3. DNS options consideration
	1. Specify it as IP address
	2. `--dns`: option can be set when service is starting (Doesn't need specifying DNS server for new containers since they will be assigned one)
		1. If DNS server is changed, only containers will be affected (containers that were running before the change occured will continue to use old DNS)
			1. Need manual assignment of DNS address
4. Containers can be instructed to use domain name by default (if they want to resolve a hostname that does not contain domain part)
	1. Example:
		1. `myserver.example.com`. If `myserver` is used for hostname, it may not be resolvable unless client appends `.example.com` by default if containers do not have FQDNs. We can do this using `--dns-search`
			1. `docker run --rm -dns-search google.com busybox nslookup mail`

		1. container will resolve `mail.google.com` to IP address using `nslookup` though hostname used was `mail`. Multiple search domains can be added during container creation. Option can also be configured during daemon startup.
5. Another feature: to manually assign hostnames to IP addresses (done using `--add-host` flag)
	1. Example: `docker run --rm -add-host www.google.com:127.0.0.1 busybox ping www.google.com`
		1. If any application tries to access `www.googl.com`, answer will come from localhost loopback address (127.0.0.1).
			1. Purpose: To block some outside connections or want to re-route unsecure traffic through a secure channel like SSH. (Cannot be set at daemon startup)
6. Example: `docker run --name webserver --hostname httpserver httpd`
	1. `docker exec webserver hostname`
		1. hostname is used to connect to the container over the network instead of IP address
		2. `httpserver` is available only to apps in container
	2. `docker exec webserver nslookup httpserver`
	3. `docker run -d --name bbox --hostname bbox busybox nc -l 0.0.0.0:7000`
		1. `docker exec bbox nslookup bbox` (Gives Public DNS server used to query but actually consulted local DNS server in the container to give IP address of `bbox`)
	4. `nslookup`: it can be used to query DNS server and bring IP address of the machine given it's name
	5. `docker run --name test --rm -it --dns 8.8.4.4 --dns 8.8.8.8 busybox nslookupup www.google.com`
		1. Uses `8.8.4.4` to resolve `www.google.com`
7. DNS can be specified in daemon configuration file (--dns need not be used during creation)
	1. If change occurs in DNS server configuration in daemon configuration file, it will not affect running containers. If running containers have to be configured, shutdown and start them again.
8. Resolving hostname:
	1. `mail.google.com`: fully qualified domain name
	2. `development.mycompany.com`: fully qualified domain name
		1. `development`
	3. `docker run --name test --rm -it --dns 8.8.4.4 --dns 8.8.8.8 --dns-search google.com busybox nslookup www`
	4. `docker run --name test --rm -it --dns 8.8.4.4 --dns 8.8.8.8 --dns-search google.com busybox nslookup mail`
		1. If only hostname is specified, docker will append domain name to it
9. Adding hostnames to IP addresses
	1. `docker --dns 8.8.8.8 -it --add-host www.google.com:127.0.0.1 busybox ping www.google.com`
		1. a hostname is resolved to the IP address specified

### Controlling Connections to the Container ###
#### Controlling connections to the container ####
1. How to control traffic arriving to the container. Done through port-forwarding.
2. Bridged containers cannot be reached from outside the host by default (security measure). Specific ports can be made accessible from outside network using port forwarding (using `-p` flag)
3. `-p` has 4 possible use cases
	1. `-p N`: where `N` is container's port number. It is bound to a random port on all host's interface
	2. `-p N:n`: `n` is host's port where `N` is bound to. Example: `-p 8080:80` (traffic arriving at host's port 80 will be automatically routed through Docker to container listening on port 8080)
	3. `-p ip_address:N`: binds container's port `N` to random port on host but only on interface specified by IP address
	4. `-p ip_address:n:N`: binds container's port `N` to port `n` on host but only on the interface indicated by IP address
4. We can assign random host ports to all ports exposed by a given container using `-P` flag
	1. `docker run -P httpd` binds port 80 exposed by webserver to random host port
5. To see which ports on host are mapped use
	1. `docker ps`
	2. `docker inspect`
	3. `docker port`

#### Examples ####
1. `docker run -d --name webserver1 -p 80 httpd`
	1. Maps random port to port 80
		1. Connect using random port (localhost:32768)
2. `docker run -d --name webserver2 -p 8080:80 httpd`
	1. `0.0.0.0:8080->80/tcp`: all interfaces
3. `docker run -d --name webserver3 -p 127.0.0.1::80 httdd`
	1. Only gets redirected 
4. `docker run -d --name webserver4 -p 127.0.0.1:9090 httpd`
5. `docker stop webserver1`
6. `docker stop webserver2` 
7. `docker stop webserver`
8. `wget 127.0.0.1:9090` - works
9. `wget <host-public-ip>:9090` - throws an error
10. `docker port webserver3` - ports open on container and its mapping
11. `docker inspect webserver3`

### Joined Containers ###
1. If more than one container shares the same network interface
2. Similar to volume sharing

		docker run -d --name server1 --net none busybox nc -l 127.0.0.1:8888
		docker run -it --rm --net container:server1 busybox netstat -al

	1. `netstat -al` will show port 8888 listening on local interface 127.0.0.1
	2. `none`: using loopback interface
3. Both containers maintain network isolation
4. Used for two containers to communicate with each other but don't want any external access (not even from host).
	1. It can be used in the absence of network discovery tools (DNS) as well.
5. If programs running on same port numbers exist in joined containers, there may be conflicts

#### Examples ####
1. `docker run -d --name server1 --net none busybox nc -l 127.0.0.1:8000`
2. `docker run -it --net container:server1 busybox netstat -al`
3. `docker exec server1 netstat -al`

#### Open containers ####
1. Most unprotected sort of network models in Docker
2. They have full access to host's interface. They can use ports numbered lower than 1024.
3. Use it only if it is the only valid option.
		
		docker run -it --net host busybox ifconfig -a

	1. shows network interfaces on host
		1. Also the bridge interface
4. No isolation performed on this type of container

##### Examples #####
1. `docker run --rm --net host busybox ifconfig -a`
2. `docker run --rm --net host busybox ip addr` (full access to network on host)
3. `docker run -d --name openwebserver --net host httpd` (`localhost`: port 80 is mapped to port 80)

### How do Containers "Know" About Each Other? ###
#### How do containers "know" about each other? ####
1. If a container is running a webserver, how does another container communicate with it?
2. Options:
	1. Simple network scan to see which nodes on the network are listening on port 80.
	2. We can use local DNS server and make necessary configuration so that container register themselves the moment they start.
	3. linking: easier option
3. When we link containers, an entry will be added to DNS override (`/etc/hosts`) specifying hostname and IP address of target machine. (`/etc/hosts` is consulted before the DNS is consulted)
	1. Example:

			docker run -d --name webserver1 httpd
			docker run -it --rm --link webserver1:web busybox wget web

		1. A second container has link to container nemed `webserver1` which is inernally reffered to as `web`.
			1. `wget` can be used to download `index.html` from webserver container
4. There is no easy way to link a container to other containers serving its required service.
	1. Example: An application is expecting to find a webserver named http101.

#### Examples ####
1. `docker run -it --hostname hellodocker busybox cat /etc/hosts`
	1. An entry is added in `/etc/hosts`
2. `docker start webserver`
3. `docker stop openwebserver`
4. `docker run -it --rm --name client --link webserver:web busybox wget web`
	1. `web` the name that will be used internally in this container
5. `docker run -it -d --name client --link webserver:web busybox nc -l 127.0.0.1:7070`
	1. Entries in `/etc/hosts`

			172.17.0.3		web httpserver webserver
			172.17.0.5		76.....

6. `docker run -it -d --name client --hostname client --link webserver:web busybox wget web`
7. `docker run -it --rm --name client1 busybox wget web`
	1. `web` is not known

#### Environment variables creation ####
1. Consider the following:

		docker run -d --name baseserver --expose 8080 -expose 9090 busybox nc -l 0.0.0.0:8080
		docker run --rm -it --link baseserver:server busybox env

	1. A list of environment variables will be printed that were automatically created when container was linked.
2. One environment variable with alias followed by `NAME` (`<SERVER>_NAME`), then value of container's name and link alias separated by a slash
3. Other environment variables are:
	1. `ALIAS_<PORT>_PORT_NUMBER_PROTOCOL_PORT`
	2. `ALIAS_<PORT>_PORT_NUMBER_PROTOCOL_ADDR`: refers to interface IP address on which port is bound
	3. `ALIAS_<PORT>_PORT_NUMBER_PROTOCOL_PROTO`: name of protocol (TCP and UDP)
	4. `ALIAS_<PORT>_PORT_NUMBER_PROTOCOL`: will have all previous information encoded in one URL.
4. Environment variables can be used in a shell script that is run inside the container.

#### Examples ####
1. `docker run -d --name baseserver --expose 1111 --expose 2222 busybox nc -l 0.0.0.0:1111`
	1. `--expose`: making ports available to other containers running on same host (same host)
2. `docker -it --name client2 --link baseserver:server busybox env`

## Using Isolation to Mitigate Risks ##
### Security and Isolation ###
#### Resource limits ####
1. A container has to execute some app/command to stay running. This instantiates one or more processes that consumes hosts memory and CPU
2. If amount of available resources (CPU and Memory) runs out, this will cause severe performance degradation for the process and it may eventually crash
3. Using up all resources on system not only affects process inside container, but also other processes owned by other users on system. This may affect overall performance of the machine
4. Solution: Docker provides some controls that can be used to limit amount of resources used by given container when it starts up.

#### Memory allowance ####
1. Amount of memory used by the container can be limited using `-m` or `--memory` flag
	1. Example: `docker run --name webserver -m 512m httpd` (can consume only upto 512 MB of RAM)
2. Amount of memory can be specified in byts (b), kilobytes (k), megabytes (m) or gigabytes (g)
3. The amount specified only prevents container for exceeding that amount (does not guarantee that much memory)
4. Assigning memory needs careful planning:
	1. Can the application function properly within assigned memory limits?
	2. Can host avail that amount of memory?
5. It is difficult at times to determine the requirements of open-source programs.
	1. For databases, memory can be calculated by system admins (may be overestimated and trial and error may be required to reach the optimum)
6. If an app runs out of memory, it may start writing error messages indicating that in logs and it may crash.
	1. Precaution: use `--restart`

#### Examples ####
1. `docker run -d --name webserver --memory 512m httpd`
2. `docker ps`

### CPU Allowance ###
1. Running out of CPU has different consequences as compared to running out of memory.
	1. Memory: process can run slower and can crash
	2. CPU: process may wait indefinitely until some cycles get free to serve it
		1. each cycle processes only one task
2. Sometimes it is better that process crashes and restarts instead of waiting and freezing the thread.
3. Two ways of specifying CPU limit:
	1. Assign relative weight to container. Percentage of CPU cycles the container will use relative to sum of all computing cycles available to the other containers
	2. Restricting container to work on only a set of CPU cores

#### Assiging a percentage of cycles to the container ####
1. `--cpu-shares`: used to assign number of cycles to container

		docker run -d --cpu-shares 1024 -name hogger1 afakharany/hogger
		docker run -d --cpu-shares 2048 -name hogger2 afakharany/hogger

	1. The above run CPU intensive commands called `stress`.
	2. `hogger1` should get half the number of cycles available to `hogger2`
2. If more containers are added, the number specified controls percentage of CPU assigned to container relative to other containers that are currently running
3. If a container needs more CPU than assigned to it and if the amount of CPU cycles is available on the host, container will just break the limit and use extra cycles. However, if the cycles were originally assigned to another container, which demanded them back, they will be assigned to it. This ensures that all containers use maximum possible CPU resources.

#### Examples ####
1. `stress --cpu 1 --timeout 30s &`
2. `htop`
3. `docker run --name hogger1 -d --cpu-shares 512 afakharany/hogger --cpu 1`
4. `docker run --name hogger2 -d --cpu-shares 1024 afakharany/hogger --cpu 1`
5. `docker run --name hogger3 -d --cpu-shares 256 afakharany/hogger --cpu 1`

### Assigning a CPU Set to the Container ###
#### Assigning a CPU set to the container ####
1. Assigning a group of CPUs to the container
2. Most computers nowadays have more than one core. We can specify number of CPUs on which containers will run using `--cpu-set` flag.
	1. Example:
	
			`docker run -d --name hogger --cpuset-cpus 0 afakharany/hogger -c 1`

		1. `--cpu-set 0`: using only first CPU of host
		2. `--cpu-set 0-2`: using first, second and third CPUs
		3. `--cpu-set 0,2`: using first and third processors

#### Examples ####
1. `docker run --name hogger3 -d --cpuset-cpus 0 afakharany/hogger --cpu 1`
2. `docker run --name hogger3 -d --cpuset-cpus 0-1 afakharany/hogger --cpu 1`

#### Controlling access to devices ####
1. Not limiting container's access to host devices but control it.
2. Some resources are automatically mapped to docker but some aren't.
3. To map a device to container, use `--device` flag.
	1. Example: `docker run -it --rm --privileged --device /dev/sr0:/dev/sr0 busybox mkdir /media && mount /dev/sr0 /media && ls -l /media`
		1. maps cd-rom device on host to device with same name on container.

#### Examples ####
1. `docker run -it --rm --privileged --device --device /dev/sr0:/dev/sr0 busybox mkdir /cdrom && mount /dev/sr0 /cdrom && ls -l /cdrom`
	1. `--privileged`: enables access to host devices
2. `mount /dev/sr0 /media/`

### Docker Users ###
1. By default, Docker containers run as root user account. May be a potential security threat (All daemons will be running using admin privileges). If there is a bug in the app running inside container, the consequences may be disastrous.
2. Sometimes, we may need to run container running under root account powers to perform some essential system admin tasks.
3. Sometimes, we may need root/admin access to host OS to perform some security related tasks.

#### Determining the container's user account ####
1. If we need to know which user account will be used inside a container, such info is not available on the image (there is no way to examine image's metadata)
2. To inspect container for user and UID it is going to be using before you start running it, use docker inspect command:

		docker create -name myUser busybox sleep 3000
		docker inspect --format="{{ .Config.User }}" myUser

	1. If result is nothing, user is root with UID 0. Otherwise, author of image has chosen to make it "run-as" a specific user
3. Two problems with the method:
	1. User can be changed in any script the container uses
	2. Container has to be created before we can acquire the information. (May cause potential threats)
4. Solution for first problem:

		docker run --rm --entrypoint "" busybox:latest id

	1. Runs quicks test on busybox image to determine user account by which container will be run.
	2. `--entrypoint ""`: ommits default `sh -c`
	3. `id`: it will be the only command to run on the container (displays UID and username of current user)

#### Examples ####
1. `docker create --name myUser busybox sleep 3000`
2. `docker inspect --format="{{.Config.User}}" myUser`
3. `docker run --rm --entrypoint "" busybox id`

#### Changing the default user ####
1. We can change the default user to run the container when running or during creation of it.
	1. We need to select the user that is already available in container.
	2. To list available users:

			docker run --rm -it --entrypoint "" busybox cat /etc/passwd | cut -d : -f 1,3,4,5
	3. The following command runs container with a different user:

			docker run --user nobody busybox id

		1. UID may or may not differ
	4. Specifying user id:

			docker run --user 99 busybox id

	5. Specifying group:

			docker run --user www-data:www-data busybox id
	
		1. `www-data` (Apache) user and `www-data` group
	6. A user can easily promote itself to root account on some week images like BusyBox which has a root account without a password. Ubuntu (stronger image) has this account locked by default.

#### Examples ####
1. `docker run --rm -it --entrypoint "" busybox cat /etc/passwd | cut -d : -f 1,3,4,5`
2. `docker run --user nobody busybox id`
3. `docker run --user www-data:www-data busybox id`  

### LAB - Handling Permissions ###
#### LAB - Handling permission on volumes ####
1. 

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
