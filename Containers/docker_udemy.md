# Docker #
## Introduction ##
1. Course objective
	1. Buzz around Docker and containers
2. What are containers?
3. What is Docker?
4. Preparing for a world of containers
5. What kind of taks containers do?
6. Docker Hub and other container registries
7. Are Docker and containers ready for production and enterprise?
8. What is container orchestration?

### What are containers? ###
1. THe old days: single server:
	1. Apps run on servers
		1. One app on one server
	2. IT needs to procure resources
		1. capex cost
		2. opex cost
		3. What is the power?
			1. IT selects high power
	3. Underutilized servers
2. VMWare:
	1. Run multiple apps on single server
	2. We buy server only when we need them
	3. Multiple VMs can run on a single server
	4. Shortcomings
		1. Hypervisors the bad part
			1. n virtual machines take n slices of physical server
			2. vms are slices of physical server
			3. Each vm needs one dedicated OS
				1. OS use CPU, memory, ...
				2. OS needs licenses
				3. OS needs to maintain (administration)
					1. Security
					2. Anti-virus
3. Containers
	1. One server, one OS
	2. Each container runs one app
	3. start may be 100x times faster than VM

### Container in Action ###
1. Physical server:
	1. Time wasted
		1. Setup
		2. Overpowered
	2. Money drain
	3. Resource drain
2. Hipervisor
	1. More efficient
	2. OSs, maintenance, resource usage overhead, licensing, patching, security updates
3. Containers
	1. Efficient
	2. Quick start and stop
	3. Tooling lack
	4. It is young

### Docker ###
1. Most popular
2. Docker Inc:
	1. Technology builder of docker
	2. It was dotCloud (PaaS service company)
		1. Offer developer platform on AWS
	3. Internal project
		1. container management for deployment
	4. Docker = Dock Worker
	5. Bilion dollar valuation
	6. Raised $150M in venture capital
	7. Made acquisitions of their own

### Docker Project ###
1. Docker Inc started of Docker project but dont own
2. Docker project is open source owned by community
3. Apache licence 2
4. Project
	1. Make tools that enable us to build ship and run apps
	2. Multiple tools exist
5. Docker Engine:
	1. Core software for building images and running them as containers
	2. Starting and stopping containers
6. Microsoft, IBM, ... contributing to the project
7. Written in GO and golang
8. 2 Month release cycle
9. Docker Hub: Docker's public repositories - place to store and retrieve docker images
	1. 240K Repositories	
	2. Has private repositories

### The Open Container Initiative ###
1. OCI: Governance Council
	1. Standards
		1. Container format
		2. Container runtime
2. People felt contianers did not meet the use cases they wanted
3. CoreOS:
	1. Found that
		1. too long didn't read
		2. too much functionality in daemon
		3. Not secure
	2. Wrote: rkt (container)
		1. Specification: appc
	3. docker vs rkt (competing standards)
		1. Fractures ecosystem
	4. Everyone came together to form OCI
4. What is OCI?
	1. Lightweight governance council
		1. Standardize
		2. Container format
		3. Container runtime
	2. Vendor neutral
	3. Orchestration Platform neutral
	4. Operates under Linux foundation

### Summary ###
1. Docker Inc
	1. Silicon Valley Startup
	2. Raised 150 million
	3. Made serveral Acquisitions
2. Docker project
	1. Open source
	2. Billions of downloads images
	3. Over 240K Repos
	4. Support from major industry leaders
3. Open Container Initiative
	1. Lightweight governance
		1. Open standards
	2. They make rails, we make trains

### How to prepare for Containers ###
1. Organizations don't like unknowns
2. Individual Preparation
3. Organizational Preparation

### Personal Preparedness ###
1. Knowledge + Experience
2. Gets hands dirty
3. Leverage, tell peers, get together, plan and introduce it at work

### Preparing Organization ###
1. Data Dog:
	1. Publishes stats
		1. 500% adoption
		2. 2/3rds of customers who tried adopted docker
		3. Complanies triple number of containers in their first 6 months
		4. 6% of hosts run docker
2. How to prepare teams and organizations
	1. Must accept that containers are coming
	2. Do we already have containers? May be in AWS or Azure
	3. Start making official
	4. Take into consideration the operations aspect
		1. Orchestration tools
		2. Clustering tools
		3. Management tools
		4. Monitoring and logging tools

### What kind of work will containers do? ###
1. Can they be used for statefull apps? (store data)
	1. Stateless:
		1. Forgets what it did
			1. Example: Web service
	2. Statefull:
		1. Remembers what it did
			1. Connection for example
			2. Example: db service
2. Docker can handle stateless and statefull apps
	1. Docker excells at stateless apps

### Containers and Modern Stateless apps ###
1. Containers encourages us to build apps in a new way
	1. Microservices the way to go
		1. They are scalable, and deployable, self healing
2. Traditional apps:
	1. Initially container was meant for cloud native apps
		1. Containers naturally excel
		2. Containers can be used for traditional apps
3. Docker is used for databases
4. Docker containers are persistent by nature
	1. stopping a container does not wipe its data
	2. restarting a container brings its data back
	3. container data stored in volumes persists even after container is destroyed

### Summary ###
1. Deals with stateful and stateless services
	1. Can be used to deploy
		1. fancy
		2. modern cloud
		3. native
		4. self healing
		5. portable
			1. apps
	2. Can be used to deploy classical apps
2. Apps will have stateless and statefull apps
	1. stateless part on one container
	2. statefull part on one container
		1. Storage backend is made pluggable
			1. Plugins support portability of stateful containers (and data)
				1. Portworks
				2. cluster HQ
				3. Locker
				4. Seth
				5. Blockbridge
				6. EMC
			2. Sanpshots, replication

### Introduction to Docker Hub and Container Registries ###
1. They are like app stores of enterprise IT
2. It is a combination of appstore and icloud
3. It is a place to store and retrieve container images
4. Other registries
	1. Google cloud
	2. Amazon
	3. Quay.io
	4. Microsoft Azure
5. How does it work?
	1. Pull down an image (download)
6. `docker run --name some-mongo -d mongo`
	1. Pulls mongo db image from Docker Hub
7. `docker commit dasfdsfaf btreepress/mongo-essentials:latest`
	1. Pushes image to docker hub
8. We can have own repositories
	1. Public repositories
	2. Private repositories

### Registry security ###
1. App
2. Pushed to App repo
3. Tested
4. Push container repo
5. Registry performs automated build to give updatee container image
6. Deploy the container on premise or cloud

### Wrapping up ###
1. Registries are like app store
2. Own containerized apps
	1. Dockerize app and push to Hub
3. Many registries
4. Registries can have many repositories
	1. Public and private
5. Public only read some
6. Private registries
	1. Can be hosted on internal network
7. Registries can be used for rapidly build and deploy apps

### Docker Hosting Options ###
1. Some offer management and orchestration tools on top of hosting providers
2. Providers are usually hidden
3. [Deis Workflow](https://github.com/deis/workflow), [Docker Cloud](https://cloud.docker.com/), [ContainerShip](https://containership.io/) do not offer hosting services

#### Docker Machine ####
1. To deploy and manage container, use [Docker Machine Drivers](https://docs.docker.com/machine/drivers/)
2. [generic driver](https://docs.docker.com/machine/drivers/generic/) for other hosts

#### h4 ####
1. AWS offers support for Docker across most of its standard EC2 machines
2. ECS: EC2 Container service
	1. Exposes set of API calls for managing containers installed across EC2 instances.
	2. No charge
	3. Containers can access other services (storage, scaling)

#### Digital Ocean ####
1. New droplet
2. Choose Docker 1.10.3 on 14.04
	1. VM running docker is created on top of Ubuntu 14.04

#### Carina ####
1. Rackspace has docker machine driver
2. Rackspace has container hosting service
3. Carina can be used for creation of Docker swarm-like clusters.
4. Has tools to manage containers all the way from development to production using mostly standard docker commands

		carina create chriscluster --wait --nodes=3 --autoscale

5. Web console for managing containers and apps

#### Sloppy.io ####
1. It provides 
	1. CLI tools
	2. Web interface
	3. persistent storage (between container launches (?))
	4. statistics
2. App stacks are constructed using json file
	1. Mesos integration under
3. Example machine specification

		{ "project": "chrisexample", "services": [ { "id": "frontend", "apps": [ { "id": "node", "domain": { "type": "HTTP", "uri": "chrisexample.sloppy.zone" }, "mem": 1024, "image": "chrischinchilla/frontend", "instances": 1, "port_mappings": [ { "container_port": 5000 } ], "env": { "LCB_DATABASE_URI": "mongodb://mongodb.backend.chrisexample/chrisexample" }, "dependencies": [ "https://docs.docker.com/backend/mongodb" ] } ] }, { "id": "backend", "apps": [ { "id": "mongodb", "mem": 512, "image": "mongo", "instances": 1, "port_mappings": [ { "container_port": 27017 } ] } ] } ] }

#### Giant Swarm ####
1. Doesnt use VMs
2. Deploys containers and services to private AWS machines and their own bare metal services
3. Infrastructure can be customized using components on GitHub.
4. Setup: Use CLI using apps defined by JSON
	
		{ "name": "chris-app", "components": { "front-end": { "image": "registry.giantswarm.io/chrischinchilla/front-end", "ports": 8000, "domains": { "8000": "chris-app.com" }, "links": [ {"component": "redis", "target_port": 6379} ] }, "redis": { "image": "redis:2.6", "ports": 6379 } } }
5. Images in Giant Swarm registry (may be from docker hub or own images)
6. How to start

		swarm up --var=domain=chrisapp-chrischichilla.gigantic.io

#### Google Compute Engine ####
1. Kubernetes
	1. Container hosting and management service
2. Containers sit on Google's hosting service (one of the most reliable)
3. GCE has container registry (beta)
4. GCE has build service for creating docker images from code hosted in Google cloud

#### Microsoft Azure ####
1. Second most popular
2. Best source for windows based VMs
3. Docker Machine Driver (?) is available
4. Pre-build VM extensions are available



	