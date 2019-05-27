# Exploring Docker [1] - Getting Started #
1. Topics
	1. Containers
	2. Images
	3. Docker Hub
	4. Simple Dockerfile
	5. Docker compose file (multiple containers)
	6. DigitalOcean Droplet and run container there
2. Run software inside containers (separate from OS)
3. Container runs on any machine
4. Container vs vm
	1. vm - runs full OS and app runs in it
	2. container - process that runs in machine - they share a kernel (lighter)
		1. Easy to port
		2. Easy to deploy
5. Large companies are moving towards containerization
	1. Know the basics
6. Docker installation:
	1. Download
	2. Old OS: Docker toolbox is used
	3. Login into docker account
7. Management commands:
	1. Sub commands
		1. `docker container`
8. Commands:
	1. `docker version`
		1. Docker is built on Go
	2. `docker info`
		1. Containers
		2. Running containers
		3. Images
	3. Nginx: `docker container run -it -p 80:80 nginx`
		1. `it` - interactive mode
		2. `-p` - publish
			1. `80:80` - computer port:container port
		3. If local image does not exist, it pulls from docker hub
	4. Foreground shows logs
9. [hub.docker.com](https://hub.docker.com)
	1. `nginx` - official image
		1. `nginx pull nginx` - to pull
		2. Dockerfile - extends base image Debian
	2. Example of how to run
	3. Example of docker compose file
	4. Environment variables (mysql root password)
10. `docker container ls`
	1. shows running containers
	2. `docker container ls -a`
		1. all containers whether running or not
			1. container id
			2. container name - adjective-<scientist/hacker>
11. `docker container rm 95a` (full id is not required)
	1. `docker container ls -a`
12. `docker images`
	1. image is in the system
	2. `docker image rm c82`
		1. Next time we have to pull from dockerhub
	3. `docker pull nginx`
		1. Pulls image but doesn't run
13. Running docker container in the background
	1. `docker container run -d -p 8080:80 --name mynginx nginx`
		1. `docker container ls`
	2. `docker container ps`
		1. `docker ps` also works
14. `docker container run -d -p 8081:80 --name myapache httpd`
	1. `docker ps`
15. MySQL:
	1. `docker container run -d -p 3306:3306 --name mysql --env MYSQL_ROOT_PASSWORD=123456 mysql`
		1. `docker container ls`
	2. Stopping:
		1. `docker container stop mysql`
			1. `docker ps -a` - all containers (not running as well)
	3. Remove running container:
		1. `docker container rm myapache` - cannot remove running container
			1. `docker container rm -f myapache` - removes
				1. `docker ps -a`
	4. Edit files: Volume or bind mount
		1. Bashing into container
			1. `docker container exec -it mynginx bash`
				1. Run bash commands
					1. `cd /usr/share/nginx/html`
					2. `ls`
					3. `exit`
				2. `Git bash` on windows:
					1. `winpty docker container run -it --name [NAME] nginx bash` - powershell doesn't need this
		2. Mapping the folder in container to local file system
			1. `mkdir test`
			2. `docker rm $(docker ps -aq) -f` - removes all containers
			3. `docker container run -d -p 8080:80 -v $(pwd):/usr/share/nginx/html --name nginx-website nginx`
			4. `code .` - index.html

					<!DOCTYPE html>
					<html lang="en">
					<head>
						<meta charset="UTF-8">
						<meta name="viewport" content="width=device-width, initial-scale=1.0">
						<meta http-equiv="X-UA-Compatible" content="ie=edge">
						<title>Hello World</title>
					</head>
					<body>
						<h1>Hello World</h1>
					</body>
					</html>

				1. Reload: `http://localhost:8080`
				2. about.html

						<!DOCTYPE html>
						<html lang="en">
						<head>
							<meta charset="UTF-8">
							<meta name="viewport" content="width=device-width, initial-scale=1.0">
							<meta http-equiv="X-UA-Compatible" content="ie=edge">
							<title>About</title>
						</head>
						<body>
							<h1>About</h1>
						</body>
						</html>		

					1. http://localhost:8080/about.html
16. Dockerfile

		FROM nginx:latest

		WORKDIR /usr/share/nginx/html
		
		COPY . .

	1. Building image:
		1. `docker image build -t btraversy/nginx-website .`
		2. `docker images`
	2. `docker container ls`
	3. `docker rm nginx-website -f`
	4. Container:
		1. `docker container run -d -p 8082:80 btraversy/nginx-website`
		2. `docker ps`
17. Push the image to Docker hub
	1. `docker push btraversy/nginx-website`
		1. `docker login` for authentication
			1. We can add description

# Exploring Docker [2] - Docker Compose With Node & MongoDB #
1. Take nodejs app that uses MongoDB
2. [Example Project](https://github.com/bradtraversy/docker-node-mongo)
	3. Dockerfile

			FROM node:10
			WORKDIR /usr/src/app
			COPY package*.json ./
			RUN npm install
			COPY . .
			EXPOSE 3000
			CMD ["npm", "start"]

	4. Docker compose - `docker-compose.yml`

			version: '3'
			services:
				app: 
					container_name: docker-node-mongo
					restart: always #restarts if it fails
					build: . # to build image
					ports:
						- '80:3000'
					links:
						- mongo
				mongo:
					container_name: mongo
					image: mongo # pulls from docker hub
					ports:
						- '27017:27017'

	5. `.dockerignore`

			node_modules
			npm-debug.log

	6. `docker-compose up`
		1. `localhost`
		2. ctrl+c
		3. `docker-compose up -d` - detached
		4. `docker-compose down`
			1. Removes containers
			2. Remove networks - of containers (docker-node-mongo_default)
3. Push the stuff to github
	1. `git add .`
	2. `git commit -m 'Added Docker to app'`
	3. `git push`
4. digitalocean
	1. Ubuntu
	2. One-click apps
	3. Pre-installed Docker
	4. Cheapest one
	5. New SSH key
	6. `cat ~/.ssh/id_rsa_do.pub`
		1. Copy
		2. New SSH Key
			1. Paste
			2. `imac`
	7. Create
	8. Copy IP address
		1. `ssh-add ~/.ssh/id_rsa_do` - identity gets added
		2. `ssh root@<IP>`
5. Clone app from github
	1. Generate github key
		1. `ssh-keygen`
			1. default
		2. `cat ~/.ssh/id_rsa.pub`
			1. Copy
			2. Go to github
			3. Settings
			4. SSH Keys
			5. New
			6. Paste
				1. do_server
				2. Give password
	2. `git clone <link>`
		1. `cd docker-node-mongo`
		2. `docker-compose up`
		3. http://<ip>
		4. ctrl+c
		5. `docker-compose down`

# Quick Wordpress Setup With Docker #
1. hub.docker.com - search for wordpress
	1. search for mysql
	2. search for phpmyadmin (viewing tables and columns)
2. open vs code
	1. `touch docker-compose.yaml`

			version: '3'
			services:
				# Database
				db:
					image: mysql:5.7
					volumes: 
						- db_data:/var/lib/mysql
					restart: always
					environment:
						MYSQL_ROOT_PASSWORD: password
						MYSQL_DATABASE: wordpress
						MYSQL_USER: wordpress
						MYSQL_PASSWORD: wordpress
					networks:
						- wpsite
				# phpmyadmin
				phpmyadmin:
					depends_on:
						- db
					image: phpmyadmin/phpmyadmin
					restart: always
					ports:
						- '8080:80'
					environment:
						PMA_HOST: db
						MYSQL_ROOT_PASSWORD: password
					networks:
						- wpsite
				# Wordpress
				wordpress:
					depends_on:
						- db
					image: wordpress:latest
					ports:
						- '8000:80'
					restart: always
					volumes: ['./:/var/www/html'] # webroot for apache
					environment:
						WORDPRESS_DB_HOST: db:3306
						WORDPRESS_DB_USER: wordpress # should match the above
						WORDPRESS_DB_PASSWORD: wordpress
					networks:
						- wpsite # same network
			networks:
				wpsite:
			volumes:
				db_data:

3. `docker-compose up -d`
	1. wait until all files are populated
	2. http://localhost:8000
		1. Go through and install wordpress
	3. http://localhsot:8080
		1. Password: password
		2. DB tables can be seen