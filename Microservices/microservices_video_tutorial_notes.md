# Microservices Video Tutorial Notes #
## Setup GCE and Enable Cloud Shell ##
1. Need a Google Compute Engine (GCE) account
	1. Used for provisioning VMs, Networks, Storage volumes
	2. Cloud Shell

### Creation of GCE Account ###
1. Credit card is required

### Creation of Project ###
1. A new project may be created

### Enable Compute Engine and Container Engine APIs ###
1. Enable the following APIs
	1. Compute Engine API
	1. Container Engine API

### Enable and Explore Cloud Shell ###
1. Provides command-line access to computing resources hosted on Google cloud platform (Open Google cloud platform console).
	1. Enable to manage cloud platform console and resources without installing Google Cloud SDK and other tools.

#### Explore Google Cloud Shell ####
1. [Google Cloud Shell getting started guide](https://cloud.google.com/shell/docs/quickstart)

#### Configure Your Cloud Shell Environment ####
1. Open two cloud shell sessions
2. Run the following commands
	1. `gcloud compute zones list`
	2. `gcloud config set compute/zone europe-west1-d`

### Download Go: ###

		wget https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz
		sudo rm -rf /usr/local/go
		sudo tar -C /usr/local -xzf go1.6.2.linux-amd64.tar.gz
		echo "export GOPATH=~/go" >> ~/.source ~/.bashrcbashrc

1. Get the code:

		mkdir -p $GOPATH/src/github.com/udacity
		cd $GOPATH/src/github.com/udacity
		git clone https://github.com/udacity/ud615

2. Get ready for next lesson

		cd ud615/app

## Example Microservices App ##
1. app
	1. Monolith: Consists of `auth` and `hello`
	2. auth: microservice
	3. hello: microservice
2. Running the app
	1. Build the app
		1. `mkdir bin`
		2.  `go build -o ./bin/monolith ./monolith`
	2. If you get error install dependencies by running the following command:
		1. `go get -u`
	3. On shell 1 run:
		1. `sudo ./bin/monlith -http :10080`
	4. On shell 2 run:
		1. `curl http://127.0.0.1:10080`
		2. `curl http://127.0.0.1:10080/secure`
	5. On shell 2 - authenticate (password is `password`)
		1. `curl http://127.0.0.1:10080/login -u user` (prints out token)
	6. On shell 2 - assign JWT token to a variable
		1. `TOKEN=$(curl http://127.0.0.1:10080/login -u user | jq -r '.token')` 
		2. `echo $TOKEN`
	7. On shell 2 - access the secure endpoint using JWT
		1. `curl -H "Authorization: Bearer $TOKEN" http://127.0.0.1:10080/secure`   
	8. On shell 2 - check out dependencies
	
			ls vendor
			cat vendor/vendor.json   
		
## Twelve-Factor Apps ##
1. [12-factor manifesto](http://12factor.net/)
	1. It defines best practices for building deployable software-as-a-service apps
		1. Portable
		2. Continually Deployable (Cloud)
		3. Scalable (users demand using same tools)
2. Microservices address most of the factors, docker and kubernetes address the rest of the factors

## Breaking Monolithic Apps into Microservices ##
1. Each component must be independent
2. Running microservices
	1. `go build -o bin/hello ./hello/`
	2. `go build -o bin/auth ./auth/`
	3. Shell 1
		1. `sudo ./bin/hello -http :10081`
	4. Shell 2
		1. `sudo ./bin/auth -http ":10091" -health ":10191"`
	5. Shell 3	
		1. `TOKEN=$(curl http://127.0.0.1:10091/login -u user | jq -r '.token')`
		2. `curl -H "Authorization: Bearer $TOKEN" http://127.0.0.1:10081/secure`  

## Jason Web Tokens (JWT) ##
1. Sends info that can be verified using a digital signature
2. Compact (decode and encode)
3. For authentication
4. JWT has 3 parts
	1. Header
	2. Payload
	3. Signature
5. Example:
	1.`eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InVzZXJAZXhhbXBsZS5jb20iLCJleHAiOjE0Nzk5ODIzNTUsImlhdCI6MTQ3OTcyMzE1NSwiaXNzIjoiYXV0aC5zZXJ2aWNlIiwic3ViIjoidXNlciJ9.qeSwvsEc4E5u5m245QDAiuKkWiYoGp8co-cpzcd9-io`
	2. Header: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9`
	3. Payload: `eyJlbWFpbCI6InVzZXJAZXhhbXBsZS5jb20iLCJleHAiOjE0Nzk5ODIzNTUsImlhdCI6MTQ3OTcyMzE1NSwiaXNzIjoiYXV0aC5zZXJ2aWNlIiwic3ViIjoidXNlciJ9`
	4. Signature: `qeSwvsEc4E5u5m245QDAiuKkWiYoGp8co-cpzcd9-io`
6. Decode the JWT token in [jwt.io](jwt.io)

## Running Application without containers ##
1. `gcloud compute instances create ubuntu --image-project ubuntu-os-cloud --image ubuntu-1604-xenial-v20160429`
2. Login
	1. `gcloud compute ssh ubuntu`
3. Install dependencies
	1. `sudo apt-get update`
	2. `sudo apt-get upgrade -y`
	3. Nginx:
		1. `sudo apt-get install nginx-full -y`
		2. `nginx -v`
		3. `sudo systemctl start nginx`
		4. `sudo systemctl status nginx`
		5. `curl http://127.0.0.1`