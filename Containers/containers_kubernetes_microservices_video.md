## Containers ##
1. Independent packages:
	1. Apps carry all dependencies
2. Namespace Isolation:
	1. Network isolation
3. Containers are similar to VMs but light weight

### Installing Images with Docker ###
1. Docker abstracts underlying OSs package manager
2. Install Docker:
	1. `sudo apt-get install docker.io`
3. Check if there are any images in the system:
	1. `sudo docker images`
4. Install nginx 1.10.0
	1. `sudo docker pull nginx:1.10.0`
5. Verify if the nginx pulled from docker hub is same as the one installed in the system
	1. `sudo docker images` **(M)**
	2. `sudo dpkg -l | grep nginx` **(M)**
6. Run nginx 1.10.0 container
	1. `sudo docker run -d nginx:1.10.0` **(M)**
	2. `sudo docker ps` **(M)**
7. Install another version of nginx:
	1. `sudo docker pull nginx:1.9.3`
	2. `sudo docker run -d nginx:1.9.3`
8. Check if all three nginx instances are running:
	1. `sudo ps aux | grep nginx`

### Talking to Docker Instances ###
1. Inspecting the containers
	1. `sudo docker ps`
	2. `sudo docker inspect <container-id-from-ps>`
		1. Get IP address
			1. `curl <IP>` (returns nginx default page)
2. Cleanup:
	1. `sudo docker stop <container-id-1> <container-id-2> <container-id-3> ...` **(M)**
	2. `sudo docker rm <container-id-1> <container-id-2> <container-id-3> ...`
2. Verify if images are running:
	1. `sudo docker ps -aq`

### My own Images ###
1. Build own images:
	1. Dockerfile:
		1. It is a textfile that contains step-by-step instructions for building Docker images from commandline
	2. `cat app/hello/Dockerfile`
		
			FROM alpine:3.1
			# This is a commend
			MAINTAINER Kelsey Hightower <kelsey.hightower@gmail.com>
			ADD hello /usr/bin/hello
			ENTRYPOINT ["hello"]

		1. FROM: which base image to build from
			1. `alpine`: small, easy to debub, default for docker
		2. MAINTAINER: who is maintaining the image
		3. ADD: takes file from host machine and add it to the directory of the container
		4. ENTRYPOINT: when container starts, it will run the app specified

### Using Docker as Build Environment ###
1. `wget http://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz`
2. `rm -rf /usr/local/bin/go`
3. `sudo tar -C /usr/local -xzf go1.6.2.linux-amd64.tar.gz`
4. `export PATH=$PATH:/usr/local/go/bin`
5. `export GOPATH=~/go`
6. `mkdir -p $GOPATH/src/github.com/kelseyhightower`
7. `cd $GOPATH/src/github.com/kelseyhightower`
8. `git clone https://github.com/kelseyhightower/app.git`
9. `cd app/monolith`
10. `go build -tags netgo --ldflags '-extldflags "-lm -lstdc++ -static"'`
11. `cat Dockerfile`
12. Build Docker image:
	1. `docker build -t monolith:1.0.0 .`
13. List the image:
	1. `docker images monolith:1.0.0`
14. Run a container from the image
	1. `sudo docker run -d monolith:1.0.0`
15. Get IP address
	1. `sudo docker inspect <container-id>`
16. Test the app
	1. `curl <IP-address>`

### Docker Images for auth and hello ###
1. auth
	1. `cd ../auth`
	2. Build auth
		1. `go build -tags netgo --ldflags '-extldflags "-lm -lstdc++ -static"'`
	3. `cat Dockerfile`
	4. Build Docker image:
		1. `docker build -t auth:1.0.0 .`
	5. List the image:
		1. `docker images auth:1.0.0`
	6. Run a container from the image
		1. `sudo docker run -d auth:1.0.0`
2. hello
	1. `cd ../hello`
	2. Build auth
		1. `go build -tags netgo --ldflags '-extldflags "-lm -lstdc++ -static"'`
	3. `cat Dockerfile`
	4. Build Docker image:
		1. `docker build -t hello:1.0.0 .`
	5. List the image:
		1. `docker images hello:1.0.0`
	6. Run a container from the image
		1. `sudo docker run -d hello:1.0.0`

### Public vs Private Registries ###
1. We can host and download docker images from cloud registries.
	1. Eases distribution of docker images
2. Options for Registries:
	1. Docker Hub:
		1. Sign up for it [https://hub.docker.com/](https://hub.docker.com/)
3. Quay:
	1. Registry which has automated workflow for building containers from github [https://quay.io/](https://quay.io/)
4. Google Cloud Registry:
	1. For large enterprises [https://cloud.google.com/container-registry/docs/](https://cloud.google.com/container-registry/docs/)
5. Comparison of the 4 registries:
	1. [http://rancher.com/comparing-four-hosted-docker-registries/](http://rancher.com/comparing-four-hosted-docker-registries/)

### Push Images ###
1. Docker tag command help
	1. `docker tag -h`
2. Add a username:
	1. `docker images monolith`
	2. `docker tag monolith:1.0.0 abdm03142014/monolith:1.0.0`
3. Push image to docker hub
	1. `docker login`
		1. username: abdm03142014
		2. password
	2. `docker push abdm03142014/monolith:1.0.0`

### Deep Dive Into Architecture ###
1. Serverless computing:
	1. Bring up a container per request and shut it down immediately
2. Conwey's law: The structure of an organization guides the structure of code they produce
3. A lot of automation is required

### Kubernetes ###
1. Concerns:
	1. App configuration
	2. Service discovery
	3. Managing updates
	4. Monitoring
2. Kubernetes:
	1. Higher level of abstraction where a cluster is viewed as a single logical machine

### Setting up Kubernetes ###
1. `cd $GOPATH/src/github/com/ucacity/ud615/kubernetes` OR
2. `cd kubernetes`
	1. Cleanup: `cleanup.sh`
3. Provision Kubernetes Cluster with GKE using gcloud
	1. Bootstrap Kubernetes using Google Container Engine (GKE)
		1. GKE: hosted kubernetes by Google.
			1. supports different kinds of machines
			2. supports different number of nodes
			3. supports different network settings
	2. Run the following command for creating cluster [https://cloud.google.com/sdk/downloads#apt-get](https://cloud.google.com/sdk/downloads#apt-get)
		1. `export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"`
		2. `echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list`
		3. `curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -`
		4. `sudo apt-get update && sudo apt-get install google-cloud-sdk`
		5. Additional Components:
			1. `sudo apt-get install google-cloud-sdk-app-engine-python`
			2. `google-cloud-sdk-app-engine-java`
			3. ...
		6. `gcloud init`
		7. `gcloud compute zones list`
		8. `gcloud config set compute/zone asia-east1-b`
		5. `gcloud container clusters create k0`

