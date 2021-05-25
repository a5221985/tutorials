# DevOps Tools and AWS for Java Microservice Developers #
## The Fundamentals ##
### What are Microservices ###
1. Monolithic application
	1. Hospital Management Application
		1. Patient Registration
		2. Patient Clinical
		3. Bed Management
		4. Claim Management - Insurance
	2. One Huge Codebase containing all the modules
	3. Fix A Bug
		1. Difficult to find
		2. Entire application must be deployed
	4. New features
		1. We need to ensure that other modules are not impacted when we make a change to one of the modules
2. Micro-services
	1. Small and Focussed services
		1. They gather those pieces that change for the same reason
			1. Clinical service
			2. Registration service
			3. Claim Management service
			4. Bed Management service
		2. Code boundaries are defined by the business problem that is being solved
		3. They should not grow too large (focussed)
	2. They are autonomous
		1. Packaged and deployed to their own machines (container, vm, serverless environment etc...)
	3. Communication happens through network calls
		1. Clinical -> Registration
		2. Bed Management -> Registration
		3. Claim Management -> Clinical, Registration
	4. Each service exposes API for other services to communicate
	5. Golden rule: Can we change and deploy our application with out changing/ impacting other service(s)?
	6. Micro-service - small, focussed, autonomous, expose API (network calls are used to communicate)

### Why Microservices ###
1. Heterogenous
	1. Each microservice can be written in a different programming language and can run on a different platform
		1. Clinical - Java
		2. Registration - Python
		3. Bed Management - .Net
		4. Claim Management - NodeJS
	2. We can choose the technology based on what suits the requirement
	3. Monolith:
		1. Same technology needs to be used across
		2. Difficult to migrate to newer or different technology
2. Robustness
	1. If a module fails, it does not bring down the entire system
		1. We can gracefully degrade the service (rest of the system will work)
3. Scalable
	1. As userbase grows
	2. We need to scale
		1. Monolith: We need to deploy the entire application on multiple machines (even if load is on few modules)
		2. Microservices: If only registration is happening, we can only scale Registration service only (independently)
4. Easy to deploy
	1. Monolith: Small bug fix needs deploying entire application
	2. Microservices: Only the service that has bug fix needs to be deployed
		1. If new feature is added to microservice, only that service can be upgraded (re-deployed)
		2. Quickly pushing features without much impact
5. Reusable and Replaceable
	1. Reusable - Registration module - used by multiple microservices
	2. Replaceable - we can switch Bed management management to a different vendor

### What is Cloud Computing ###
1. Cloud provides
	1. Storage
	2. Networking
	3. DB Security
	4. Scaling
	5. Load Balancing
	6. ...
2. Features
	1. On Demand - only charged for usage
	2. Ubiquitous - we can access from anywhere over a network
	3. Network - over network
	4. Shared - someone can share and others can use (cloud provider will charge only for usage)
		1. 100 GB of storage - 40 GB is used and other 60 GB can be used by other companies
			1. Turns out to be cheaper
3. AWS:
	1. A lot of services are provided
	2. We can access from anywhere over network
	3. They are all shared (by applications within company or across companies)
4. Other providers
	1. AWS
	2. Azure
	3. GCP
	4. Oracle
	5. IBM
	6. Alibaba
	7. Own cloud
		1. There is initial investment
		2. High maintenance

### Types of Cloud ###
1. Public
	1. We can open an account and use the services
		1. AWS
		2. Azure
		3. GCP
		4. Oracle Cloud
	2. Charged based on usage
	3. They provide maintenance service
2. Private
	1. Own cloud
		1. Dell
		2. 3M
		3. Siemens
		4. ...
		5. Maintained by the company
			1. DevOps team maintains the cloud environment
3. Hybrid
	1. public + public
		1. RDS (AWS) + Azure (.Net) (integration is required)
	2. public + private
		1. Example: Date (secure) will be on data center + public services (web server, java, load balancing, ...) hosted on AWS or Azure 
	3. private + private
		1. Organizations can combine
			1. At some point it may become public (for access across organisations)

### Service Models ###
1. Which service model is provided by the organisation
	1. ANy application needs all the following
	
			Application
			Data (RDBMS, Unstructured, ...)
			Runtime (JVM, .Net, Python runtime)
			Middleware (across microservices)
			OS
			Virtualization
			Services (app services)
			Storage
			Networking
			
	2. Service models:
		1. IaaS - Infrastructure as a Service
			1. If organization is using this:
				1. It is relying on third party for (They are in place)

						Virtualisation
						Services
						Storage
						Networking
						
					1. AWS, Azure, ...
				2. Rest of the services are taken care off by the organisation (OS, Middleware, ...)
				3. AWS
					1. Networking: Security Groups, VPC
					2. Virtualisation: EC2
					3. CloudFormation: For automating entire infrastructure setup
				4. Terraform
					1. Text file provisions all infrastructure
		2. PaaS
			1. The following are provided by the cloud

					Runtime
					Middleware
					OS
					Virtualization
					Services
					Storage
					Networking
					
				1. Rest of the services are taken care off by the organization (Data and application)
				2. AWS:
					1. Elastic Bean Stalk
					2. SNS (notifications)
		3. SaaS
			1. We only have to develop the application (as a developer) everything else is available on a button click
			2. The following are provided by the cloud

					Data
					Runtime
					Middleware
					OS
					Virtualization
					Services
					Storage
					Networking
					
				1. SaaS
					1. AWS:
						1. RDS
						2. S3
						3. Lambda - quickly write code and execute code in any language (serverless - we don't worry about which server is used to run the application)

### AWS ###
1. AWS introduction from Microservices developer's perspective
	1. 4 microservices
		1. Clinicals
		2. Ben Management
		3. Patient Registration
		4. Claims
	2. Other things to take care of
		1. Environment - should be ready - (AWS EBS)
		2. Security - securely accessed - (AWS IAM/Security Groups)
		3. Load Balancing - laod balancer (AWS ELB)
		4. Scaling - auto-scaling (AWS Auto Scaling)
		5. Health Checks and Monitoring (Cloud Watch - monitoring and notification)
	3. The above are required for readiness for cloud and for CD
2. If we learn AWS, it is easy to transition to other services

### Continuous Integration, Delivery and Deployment ###
1. End goal - get products or features as fast as possible to customer
	1. As soon as developer commits
		1. Build is performed
		2. Tests are run
		3. Deployed to Dev/QA
		4. Deployed to Stage
		5. Deployed to Production
	2. CI: We write several tests and run them on a continous basis as new code keeps coming in from developers
		1. Application is built
		2. Tests are run
		3. Validate to check if application is still working as expected
		4. Stops at Build stage
	3. CD: Continous Delivery - Deployed to a production like environment (Stage)
		1. Stage - mimics Prod environment (mimics Production)
		2. There will usually be some manual process involved
			1. Approval from DevOps architect or Manager
		3. Production level tests are run
		4. Continous Deployemnt
			1. No manual intervention involved (upto production)
2. Steps:

		Source		Build		Test	Deploy	Monitor
		Commit		Compile	Integ	Pre-	Health and
		Code 					ration	Prod	Unusual
		Review		Unit		System	Prod	Activities
					Test 		Load
		Program	war/jar/	UI
					dll
					Image
					(docker)

### Devops ###
1. Enables us to do Continous Delivery and Continous Deployment
2. It is a process we follow, we can use different tools
	1. Source
		1. Git - push to central repository
	2. Build
		1. Maven
		2. Gradle
		3. Docker (Image)
	3. Test
		1. Integration tests
		2. Container
	4. Deploy
		1. WAR/JAR
		2. Container
		3. Kubernetes (orchestrates containers)
		4. AWS (EBS)
	5. Monitor
		1. AWS: Cloud Watch
		2. Kubernetes: Prometheus
3. Jenkins
	1. Pipelines

## Construct Or Download Spring Boot Microservices Projects ##
### Completed Projects for Download ###
1. [Resources](https://www.udemy.com/course/devops-tools-and-aws-for-java-microservice-developers/learn/lecture/20332837#content)
	1. flightservices - for our own

### Usecase ###
1. Microservices
	1. MS1: Product Service -> DB (has price and description passed by client)
		1. -Coupon Code-> MS2 (for getting discount)
		2. Client -> MS1
	2. MS2: Coupon Service -> DB (has coupon details)
		1. REST API
			1. Creation of Coupon
			2. Get Coupon details

### Construct the DB Tables ###
1. Download SQL from: https://www.udemy.com/course/devops-tools-and-aws-for-java-microservice-developers/learn/lecture/19384786#content
2. Import it in MySQLWorkbench
3. id - auto_increment

### Construct the Project ###
1. New > Spring Starter
	1. Name: couponservice
	2. Group: com.bharath.springcloud
	3. Artifact: couponservice
	4. Package: com.bharath.springcloud
	5. Dependencies:
		1. Spring Web
		2. Spring Data JPA
		3. MySQL Driver

### Construct Model and Repository ###
1. Right click on package:
	1. New class: com.bharath.springcloud.model.Coupon

			@Entity
			public class Coupon {
				@Id
				@GeneratedValue(strategy = GenerationType.IDENTITY) // **(M)**
				private long id;
				private String code;
				private BigDecimal discount;
				private String expDate;
			
				// Setters and getters
			}
			
	2. New interface: com.bharath.springcloud.CouponRepo
		1. Extends: JPARepository<Coupon, Long>

### Construct RestController ###
1. New class: com.bharath.springcloud.controllers.CouponRestController
	
		@RestController
		@RequestMapping("/couponapi")
		public class CouponRestController {
		
			@Autowired
			CouponRepo repo;
		
			@RequestMapping(value = "/coupons", method = RequestMethod.POST)
			public Coupon create(Coupon coupon) {
				return repo.save(coupon); // has id
			}
			
			@RequestMapping(value = "/coupons/{code}", method = RequestMethod.GET)
			public Coupon getCoupon(String code) {
				return repo.findByCode(code); // generate this
			}
		}

### Configure DataSource ###
1. application.properties

		spring.datasource.url=jdbc:mysql://localhost:3306/mydb
		spring.datasource.username=root
		spring.datasource.password=password
		
2. CouponRestController

		public Coupon create(@RequestBody Coupon coupon) {
			...
		}
		
		public Coupon getCoupon(@PathVariable("code") String code) {
			...
		}

### Test ###
1. Open PostMan:
	1. Run: POST: http://localhost:8080/couponapi/coupons

			{
				"code": "SUPERSALE",
				"discount": 10
				"expDate": "12/12/2020" 
			}
			
	2. Run: GET: http://localhost:8080/couponapi/coupons/SUPERSALE

			{
				"id": 1
				"code": "SUPERSALE",
				"discount": 10
				"expDate": "12/12/2020" 
			}

### Construct the Product Microservice Project Model and Repository ###
1. Construct Project, Model, Repository
	1. New project > productservice
	2. Description: Product Service
	3. Dependencies:
		1. MySQL Driver
		2. Spring Data JPA
		3. Spring Web
2. New class > com.bharath.springcloud.model.Product

		@Entity
		public class Product {
		
			@Id
			@GeneratedValue(strategy = GenerationType.IDENTITY)
			private Long id;
			private String name;
			private String description;
			private BigDecimal price;
			
			// Getters and setters
		}
		
3. New interface: ProductRepo

		public interface ProductRepo extends JpaRepository<Product, Long> {
		}

### Construct the RestController ###
1. New class > ProductRestController

		@RestController
		@RequestMapping("/productapi")
		public class ProductRestController {
		
			@Autowired
			private ProductRepo repo;
		
			@RequestMapping(value = "/products", method = RequestMethod.POST)
			public Product create(@RequestBody Product product) {
				return repo.save(product);
			}
			
		}

### Configure DataSource ###
1. application.properties
	1. Product service: Copy from coupon service

### Test ###
1. Product service: application.properties

		server.port = 9090
		
2. Run as Spring Boot App
3. Test endpoint

		http://localhost:9090/productapi/products

		{
			"name": "IPhone",
			"description": "Awesome",
			"price": 1000
		}

### Integrating Microservices ###
1. ProductRestController

		@Entity
		public class Product {
			...
			@Transient // only used to handle incoming data
			private String couponCode;
			...
			// getters and setters
		}
		
		@RestController
		@RequestMapping("/productapi")
		public class ProductRestController {
			...
			@Autowired
			private RestTemplate restTemplate;
			
			@Value("${couponService.url}")
			private String couponServiceUrl;
			...
			@RequestMapping(value = "/products", method = RequestMethod.POST)
			public Product create(@RequestBody Product product) {
				Coupon coupon = restTemplate.getForObject("http://localhost:8081/couponapi/coupons/" + product.getCouponCode(), Coupon.class);
				product.setPrice(product.getPrice().subtract(coupon.getDiscount()));
				return repo.save(product);
			}
			...
		}
		
		com.bharath.springcloud.dto.Coupon
		
		public class Coupon {
			// copy from Coupon entity
		}
		
	1. Product Service: application.properties

			couponService.url = http://localhost:8081/couponapi/coupons
			
	2. Main class:

			@SpringBootApplication
			public class ProductServiceApplication {
				public RestTemplate restTemplate() {
					return new RestTemplate();
				}
				...
			}
		

### Integration Test ###
1. Product Service: application.properties

		couponService.url = http://localhost:9091/couponapi/coupons/
		
2. Coupon Service: application.properties

		server.port = 9091
		
3. Run couponservice as spring boot app

		{
			"name": "MAC",
			...
			"couponCode": "SUPERSALE"
		}
		
	1. deducts discount

## Manual Deployment to AWS using EC2 using S3 ##
### S3 ###
1. AWS S3 service
	1. S3: Simple Storage Service
		1. Object based storage
			1. EC2 - uses Elastic block storage (EBS) or Elastic File Storage (EFS)
		2. Buckets need to be defined
			1. Upto 100 buckets (if exceeding, AWS needs to be requested for more)
			2. Upto 5 GB (for free tier)
			3. Upto 20000 GETs (downloads per month)
			4. Upto 2000 PUTs (uploads per month)
2. Goto AWS Console
	1. Search for S3
		1. Buckets
			1. Create Bucket
				1. Naming convension: Unique across AWS (read the rules)
					1. Cannot start or end with . (can start with lowercase letter or number)
					2. Region: Default region (accessible across all regions)
					3. Name: bharaths3demo
					4. Block all public access?
		2. Open bucket
			1. Folders can be created, files can be uploaded, other actions are possible
				1. Example: New file
				2. Drag and drop in console
					1. If it is selected, all properties are shown (download, copy path, select from (move form one location to another))
			2. Access: Using object URL
				1. https://bharaths3demo.s3.us-east-2.amazonaws.com/s3.txt
					1. Permissions: (bucket level & object level)
						1. Public access
							1. Turn off Block all public access
				2. Select object
					1. Make public
					2. Click s3.txt
						1. This can be used to host html sites
						2. This can be used by DevOps engineers to pick files

### Launch Instance and Setup the Instance ###
1. EC2 and S3
	1. Launch an EC2 instance
	2. Upload jar to S3
	3. Access the jar from ec2 and test
2. Launch EC2 instance
	1. Amzon Linux 2 - free tier
	2. Defaults are good
	3. Key pair is generated
	4. Run the following commands in AWS EC2

			yum install -y mariadb-server (open source version of mysql (has most features of mysql)
			systemctl enable mariadb
			systemctl start mariadb
			mysql_secure_installation (to reset password - hit enter (no password) then set password)
			mysql -uroot -p
			----- Java -----
			yum install java-1.8.0-openjdk
			alternatives --config java (check what jdks are installed and enter 1)
			
		1. Connect to EC2
		2. `sudo -i`
		3. Run the commands
		4. Creation of database

				create database mydb;
				
			1. copy and paste product and coupon table creation commands
		5. Install java

### Use S3 Deploy Jar and Test ###
1. Deploy couponservice:
2. Upload spring boot jar file
3. Go to bucket
	1. Upload: spring boot jar file - couponservice-0.0.1-SNAPSHOT.jar
4. Select the jar
	1. Make it public:
		1. Actions
			1. Make Public
		2. Unselect & Select: Click on the link - jar will get downloaded
	2. Copy the object url
5. Go to EC2 instance
	1. `wget <object-url>`
	2. `ls`
	3. `java -jar couponeservice-0.0.1-SNAPSHOT.jar`
		1. Tries to connect to mysql server
6. Expose the port:
	1. Services > EC2
	2. Security Group:
		1. Inbound Rules:
			1. Add rule
				1. Type: Custom TCP
				2. Port range: 9091
				3. Source: Anywhere
7. Go to EC2: Grab dns-name
8. PostMan:
	1. http://<dns-name>:9091/couponapi/coupons
9. Connect to aws ec2 and check if coupon is created in database
10. GET: http://<dns-name>:9091/couponapi/coupons/SUPERSALE

### Automate App Launch ###
1. Stop spring-boot app
2. As soon as EC2 is up and running, spring boot application should start
	1. `cat /etc/rc.local` **(M)** - most linux distros have this
		1. The commands in this file are executed when system is started
	2. copy jar file to ec2-user: `cp couponservices-0.0.1-SNAPSHOT.jar /home/ec2-user/`
	3. `vi /etc/rc.local`

			java -jar /home/ec2-user/couponservice-0.0.1-SNAPSHOT.jar
			
	4. Give execute permission to `rc.local`

			chmod +x /etc/rc.d/rc.local
	
	4. Restart intance
		1. Instance state > Stop
		2. Connect > use new public ip
		3. Copy public IP
			1. paste the following in browser: http://<public-dns-name>:9091/couponapi/coupons/SUPERSALE
	5. MySQL is already configured as a service when EC2 starts (not to worry about automating it)

### Install Stress Command ###
1. AMI:
	1. Once an AMI is created, it will have all the setup that was done in first instance (MySQL, DBs, Current Data, JDK, Spring Boot application, configuration)
		1. Any number of instances with the configuration can be spun up
		2. All the instances will have the setup
		3. Useful for load balancing and autoscaling
2. Connect to AWS box:
	1. Pre-requisite: `amazon-linux-extras install epel -y`
	1. Install stress command: `yum install stress -y` **(M)** - we can stress the OS and CPU
		1. Useful for load testing
		2. It artificially stresses CPU
			1. Alarms - Cloud Watch
			2. Auto-scaling - automatically instances will be created

### Construct Custom AMI and Scale the APP Manually ###
1. The image can be used to launch vm anywhere on the planet
	1. Select instance
	2. Actions
		1. Image
			1. Create image
				1. Image name: couponservice
					1. Select default volume (custom volume can be used)
						1. AWS will take snapshot of the volume
2. AMIs
	1. Take out filter
	2. Custome image:
		1. EC2 dashboard:
			1. We can re-use the security group of the original EC2 instance (or new one needs to be created)
			2. Launch Instances
			3. My AMIs
				1. couponservice AMI
				2. Configure security group: Select an existing group
				3. Review and Launch
					1. We can directly connect to the couponservice
						1. http://<dns-name>:9091/couponapi/coupons/SUPERSALE
							1. Even data is replicated

## AWS Elastic Load Balancer ##
### Introduction ###
1. Microservice Instance 1
	1. If all requests are routed to one instance, it may crash
		1. Solution: multiple instances are spun up and requests are routed across them
			1. EBS - Elastic Load Balancing (automatically balances load)
2. Three ways EBS can be constructed
	1. Application load balancer
	2. Classic load balancer
	3. Network load balancer
3. The type depends on the kind of application and where they are deployed
	1. The commonalities between them:
		1. Application and network load balancer: They will work with VPC (Virtual Private Cloud) that is created within the organisation for the projects on AWS
		2. Classical load balancer: works with EC2 instances
		3. Application and classic load balancer: They work at application level - 7th layer of networking
			1. They can deal with http and https traffic
				1. Routing is done based on content of the request
		4. Network load balancer:
			1. It does not know about the content of the request because it works at network layer (4th layer in networking - TCP/UDP level)
			2. It is very fast load balancer
				1. For high efficiency

### Construct Load Balancer ###
1. How to configure EBS between multiple instances
	1. Copy first instance's name and change it to <name>2 for second instance
2. Select Load Balancers:
	1. Create Load Balancer
		1. Classic Load Balancer
			1. Name: couponserviceloadbalancer
			2. LB inside: Default VPC
			3. Listener configuration: important
				1. Which port the load balancer should listen on (80 on Load Balancer port)
					1. Instance Port: 9091
			4. Default security group
			5. Configure Health Check - health check is done by load balancer by hitting a URL we provide in the Ping Path
				1. Ping Protocol
				2. Ping Port: 9091
				3. Ping Path: /couponapi/coupons/SUPERSALE (provide a URL that works - alternatively we can provide a ping service in API that can always be pinged)
					1. Default HTML page can also be provided
				4. Advanced Details:
					1. Response Timeout: 5 s (after 5 seconds if the above url does not work)
					2. Interval: 30 s (every 30 s it will try)
					3. Unhealthy threshold: 2 (tries only 2 times if it fails - and brings down instance automatically)
					4. Healthy threshold: 10 (It will ping again after some time and if it works for 10 times then it will bring that instance back up)
						1. Number of successive health check successes before declaring an EC2 healthy
				5. Next:
					1. Add EC2 Instances:
						1. Select the two instances
				6. Optionally give a tag
				7. Review
				8. Create
3. Select ELB:
	1. Actions:
		1. Edit health check
		2. Edit instances (add or remove)
		3. Edit listeners (configuration)
		4. Edit security groups
		5. Delete

### Test ###
1. Select load balancer:
	1. Copy DNS name:
		1. Browser: http://<dns-name>/couponapi/coupons/SUPERSALE
	2. Go to instance:
		1. Second one:
			1. Connect to it
				1. Change to `ec2-user`
2. Change data in MySQL db
	1. `mysql -uroot -p`
		1. password
			1. `use mydb`
			2. `select * from coupon`
			3. `update coupon set discount = 20 where id = 1`
3. Refresh the page:
	1. Load balancing is happening in Round Robbin fashion

### Troubleshooting ###
1. Timeout issue:
	1. Port 80 should be enabled in security group
		1. Add inbound rule:
			1. port: 80

## AWS Auto Scaling Group ##
### Introduction ###
1. Auto-scaling:
	1. Scales up or down EC2 instances
		1. Launches as many instances as required (as configured)
		2. Brings down as many instances as required if load goes down (saving cost)
2. Two step process:
	1. Define launch configuration
		1. Similar to creation of instance
			1. We pick all config to scale up and down
				1. AMI - own AMI as well
				2. Storage
				3. ...
	2. Configuring auto scaling group using the launch configuration
		1. Scaling policy - decides when to scale up and down
			1. Alarms are defined
				1. If CPU usage goes above 80%
				2. If CPU usage goes below 40%
				3. ...

### Construct Auto Scaling Group ###
1. Stop all instances:
2. Go to Auto Scaling
	1. Launch Configuration - what instance details to launch
		1. At the end we can configure auto scaling group
		2. Steps:
			1. My AMIs
				1. Select couponservice
			2. t2.micro
			3. Name: couponservicelaunchconfig
			4. Skip to review
			5. Click on Create lanunch configuration
			6. Click Create Auto Scaling group using the lanunch configuration
				1. Group name: couponserviceasg
				2. Group size: start with 1 instances
				3. Network: default
				4. Subnet: Pick first one
				5. Configure scaling policy
					1. Use scaling policies to adjust the capacity of this group
						1. scale between 1 and 5 instances
						2. Scale group size:
							1. name: coupongroupsize
							2. Click on **Scale the Auto Scaling group using step or simple scaling policies** (makes it easier)
								1. name: Increase Group Size
								2. Execute policy when: Add new alarm
									1. Disable Send a notification to ...
									2. Whenever Average of CPU Utilization Is >= 60 Percent
									3. For at least 1 consecutive period of 5 minutes (if CPU utilization is consistently 60% or more for 5 minutes, the alarm will be triggered)
									4. Name: leave it
								3. Take the action: Add 1 (set to is another option) capacity units when 60 <= CPUUtilization < +infinity
						3. Decrease Group Size
							1. Name: Leave it
							2. Execute policy when: Add new alarm
								1. Whenever Average of CPU Utilization Is <= 40 Percent for at least 1 consecutive period(s) of 5 minutes (min time available)
							3. Take the action: Remove 1 capacity units when 40 >= CPUUtilization > -infinity
				6. Review
				7. Click Create Auto Scaling group
				8. Click View creation log
					1. Actions
						1. Edit
						2. Delete
				9. Go to EC2 instances:
					1. 1 EC2 instance is automatically created
	2. Auto scaling group

### Test ###
1. Login to an instance
	1. `sudo -i`
	2. `stress --cpu 1` **(M)** - the processor will be stressed out completely and it will go more than 60%
		1. Alarm should trigger after 5 minutes of stressing
2. Go to Auto scaling group:
	1. We can configure Load Balancer: Classical load balancer that was configured before can be used
3. Note: Don't delete auto scaling group instances directly.
	1. Delete auto-scaling group
		1. The instances that got created will automatically get delete

## AWS Cloudwatch Monitoring and SNS ##
### Cloudwatch Service ###
1. To monitor microservices:
	1. On local machine: CPU usage, top, htop, ...
	2. On cloud:
		1. Collect health data of apps (logs, cpu usage, ...)
		2. Monitor continously
		3. Analyze data (realtime or past instances)
		4. Act - P1, P2, P3, ...
	3. The steps specified above can be automated using AWS Cloudwatch service
		1. Cloud Watch service integrates with other services
			1. EBS
			2. RDS
			3. EC2
			4. SNS
		2. Cloud Watch can continously monitor those services
			1. It will be continously checking status
				1. Done using Cloud Watch Alarms
					1. AWS Alarm:
						1. Send a notification to ...
						2. Whenever *Average* of *CPU Utilization* Is *>=* *60* Percent
						3. For at least *1* consecutive period(s) of *5 minutes*
						4. Name of Alarm: ...
						5. Save
					2. Certain actions can be taken when notifications are sent out

### Simple Notification Services ###
1. SNS (Simple Notification Service)
	1. Used to capture events and send notifications
		1. Two components:
			1. Topic - virtual channels which will receive messages and whichever subscriber subscribes to the topic, they will all get the message (who can react by sending notification or do whatever)
			2. Subscription
				1. Subscribers can:
					1. Send email notifications
					2. Do HTTP push
					3. Run AWS Lambda expression
					4. Put message on queue
						1. Other applications can receive messages on the queue
		2. Sender can be: cloud watch alarm which when goes off:
			1. It will put event on topic
			2. Subscriber will use the event to do whatever it is supposed to do
				1. Fixing of issues can be automated as well
		3. Messages need not be from cloud watch alarm
			1. Any other service within AWS can use the topics to exchange messages
			2. They can also be our microservices (we deploy)
				1. They can use this service to communicate messages to other services as well
2. Topic:
	1. SNS
		1. Topics
			1. Create topic
				1. Name: 
				2. Encryption: optional
					1. ...
				3. Access policy:
					1. Basic
					2. Advanced - who can access based on permissions
				4. Delivery policy
				5. Delivery status logging
				6. Tags
3. Subscriptions:
	1. Create subscription
		1. Topic ARN - Amazon Resource Name (unique name assigned to an Amazon resource)
			1. Topic is assigned a unique name:
				1. Assign
		2. Protocol:
			1. HTTP - push message using HTTP
			2. HTTPS
			3. Email
			4. Email-JSON
			5. Amazon SQS
				1. Queue Service - put message in queue which could be read by other service
			6. AWS Lambda - Endpoint
		3. Subscription filter policy - optional
			1. Filters messages so that subscriber will not react to all messages
		4. Redrive policy (dead-letter queue) - optional
			1. Sends undeliverable messages to dead letter queue
4. Next:
	1. Simple Notification Service
		1. Topics
		2. Subscriptions
	2. Define Alarm and attach SNS (email)
	3. Test

### Construct Topic and Subscription ###
1. SNS
	1. Topics
		1. Create topic
			1. Name: demotopic
			2. Display name: Demo Topic
			3. Create topic
	2. Subscribers:
		1. Create subscription
			1. Topic ARN: Select the topic ARN (unique across AWS accounts)
			2. Protocol: Email
			3. Endpoint: email id
				1. abdm03142014@gmail.com
			4. Create subscription
			5. Pending confirmation
				1. Go to email and confirm subscription
					1. Click on link
						1. Unique subscription id is generated
			6. Refresh page

### Construct Cloudwatch Alarm ###
1. Cloud Watch
	1. Alarms:
		1. Create Alarm
			1. One way
2. Select EC2 service
	1. microservicemanualdeployment - bring it up
		1. Instance state - start
		2. Monitoring - tab
			1. Create Alarm
				1. Send a notification to: topic is automatically selected (if only one topic)
				2. Metric
					1. Whenever **Average** of **CPU Utilization** Is **>=** **60** Percent
					2. For at least: **1** consecutive period(s) of **5 minutes**
				3. Take the action: optional
					1. Recover this instance
					2. Stop this instance
					3. Terminate this instance
					4. Reboot this instance
				4. Create alarm
				5. Insufficient data initially

### Test ###
1. Connect to the instance
2. `sudo -i`
3. `stress --cpu 1` (100%)
4. To alarm to go off, it needs some time
5. Open Monitoring > CPU Unilization
6. Wait for 5 minutes
7. Alarms can be added based on different metrics to receive notifications

## Deploy to AWS Elastic Beanstalk using RDS ##
### Elastic Beanstalk ###
1. To easily and quickly deploy our microservice applications and run them seamlessly
	1. How?
		1. By orchestrating the other AWS services which are already in place
			1. All the infrastructure required for our application can be easily provisioned on the fly by using other services available in AWS
			2. Elastic Beastalk brings the other services together for our applications to use only the services required
				1. RDS - Relational Database Service
				2. S3 - Simple Storage Service
				3. SNS - Simple Notification Service
				4. CloudWatch - Health and Metrics
				5. Autoscaling
				6. Load Balancing
	2. If we use the services through Elastic Bean Stalk, they will be charged
3. Elastic Beanstalk - It can be used to deploy any application written in any language
	1. For Java
		1. Java standard edition is in built
		2. Tomcat can also be used
		3. Spring Boot apps are easy to run
	2. Python
		1. httpd
		2. nginx
	3. .Net
		1. Microsoft IIS
	4. We can dockerize
		1. The container is launched on the fly
	5. Go
		1. Google Go applications can be run
4. Steps:
	1. Take application and give to EBS
	2. We need to give verison
	3. Define a configuration required for the application to run
5. Application will be using RDS - Relational Database Service
	1. RDS - for hosting MySQL DB
6. Developer:
	1. One must know how to deploy application using EBS to test
	2. EBS can be used for production as well

### RDS ###
1. Relational Database Service
	1. MySQL
	2. PostgreSQL
	3. MSSQL
	4. MariaDB
	5. Amazon Aurora - built on top of MySQL and it is super fast (optimised MySQL)
2. Advantages of using RDS:
	1. No worries about (we can simply configure using AWS dashboard)
		1. Replication
		2. Auto backups
		3. Auto recovery
		4. Caching
3. No SQL DBs
	1. MongoDB - integration outside RDS
	2. DynamoDB - Amazon flavor

### Construct MySQL Database on RDS ###
1. Services
	1. RDS
		1. Create database
			1. Standard Create
				1. MySQL
				2. Version: Default
				3. Templates: Free Tier (no charge)
				4. DB instance identifier - productcouponservice (not db name)
				5. Master username: root
				6. Master password: test1234
				7. Connectivity:
					1. Additional connectivity configuration
						1. Pubcly accessible - Yes (can connect from outside - Workbench)
				8. Create database
		2. Endpoint: copy that
2. MySQL Workbench:
	1. rdsinstance: paste
	2. Password: test1234
	3. grab from tables.sql
		1. `create database mydb;`
		2. <paste> 

### Deploy the Coupon Service ###
1. Copy database endpoint from RDS:
	1. couponservice: 
		1. application.properties: 
			1. `spring.datasource.url = jdbc://mysql://<rds-endpoint>:3306/mydb`
			2. `server.port = 5000`
				1. EBS by default exposes 5000 (changing config is chargeable)
	3. `mvn clean install -DskipTests`
2. Services
	1. Elastic Beanstalk
		1. Create Application
			1. Application name: couponservice
			2. Tag:
				1. name: couponservice
			3. Platform: Java
			4. Platform branch: Corretto 11 running on 64bit Amazon Linux 2 (Amazon's version of openjdk 11)
			5. Platform version: default
			6. Application code:
				1. Upload you code
				2. Local file (S3 URL can also be given)
					1. choose: couponservice-0.0.1-SNAPSHOT.jar
				3. Version label
					1. couponservice (new version upload will update this)
			7. Create application
3. Check health
4. Click on link
	1. port number is not required
	2. Copy the link in PostMan
		1. POST: http://<paste-link-here>/couponapi/coupons
		2. GET: http://<paste-link-here>/couponapi/coupons/SUPERSALE

### Deploy the Product Service ###
1. productservice
	1. application.properties
		1. spring.datasource.rul=jdbc:mysql://<rds-endpoint>:3306/mydb
		2. server.port = 5000
		2. couponService.url = http://<couponservice-url>/couponapi/coupons/
2. Same port for both couponservice and productservice?
	1. Both services will run on different machines internally (EC2)
	2. Build: `mvn clean install -DskipTests`
3. Elastic Beanstalk
	1. Create Application
		1. productservice
		2. Platform: Java
		3. Paltform branch: Corretto 11
		4. ...
		5. Upload your code
			1. Choose file: productservice-0.0.1-SNAPSHOT.jar
		6. Create application
4. Click on link:
	1. PostMan:
		1. POST: http://<link>/productapi/products

### Wrap Up ###
1. Elastic Beanstalk:
	1. Productservice-env
		1. Configuration
			1. Load balancer - This configuration does not contain a load balancer
			2. Security - ...
		2. We can edit configuration - charged
		3. Logs
			1. Request Logs:
				1. Last 100 lines
		4. Health
		5. Monitoring
		6. Alarms
2. Environments:
	1. Delete the environments
		1. Go to RDS: Delete the database
			1. Select instance
				1. Actions
					1. Delete
		2. Go to Elastic Beanstalk
			1. Environments
				1. Select the instances
				2. Actions
					1. Delete
	2. Never delete EC2 instances directly (other things configured will not get deleted otherwise)
3. Applications:
	1. Do the same

## Docker ##
### Introduction ###
1. Containerization
	1. Physical machine or VM is required (on cloud)
		1. Softwares required for application need to be installed
			1. JBoss/Django/WCF
			2. Web Server
			3. MySQL
		2. App like war/dll/django app are deployed
		3. This is time consuming and tideous
2. Containers:
	1. Quickly started
	2. Can be moved across environments and machines maintaining consistencies
	3. It contains app and all dependencies
	4. The container image can be moved across environments and scaled
3. Docker:
	1. Follows OCI standard
	2. Container image - artifact to deploy
		1. Used to spin up containers
	3. Options:
		1. One container has the application
		2. Multiple containers host many components of the application
4. Example:
	1. App Server (Centos)
	2. Web Server (Ubuntu)
	3. Db Server (MacOS)
	4. Application (Windows)
5. The containers can communicate with other containers (configuration)
6. Kubernetes:
	1. Used to orchestrate the containers
		1. Scaling - increase or decrease load
		2. Auto launch of other instances if any one goes down - Fault tolerance
7. Image: Has all infra for app to work along with app
	1. Each component can have an image
	2. Can be used to launch containers (on Linux, Windows, ....)
		1. Packages all dependencies
8. PODA: Package Once and Deploy Anywhere

### Docker Architecture and Workflow ###
1. Component:
	1. Registry: Where docker images are stored
	2. Docker Host: Where Docker Engine is installed
	3. Docker Client: Gives ability to run commands
		1. `docker pull <image>`
			1. Sent to docker engine
				1. Pulls image from Registry to docker host (stored locally)
		2. `docker run <image>`
			1. Launches the container on host
		3. `docker build <image>`
			1. Builds docker image (based on base image)
				1. It can be pushed to registry (other apps can start using it)

### Docker in Action ###
1. AWS console:
	1. Launch instance
		1. Default instance
	2. Name it as: **docker**
	3. Connect to machine
		1. `chmod 400 <key>.pem`
		2. `ssh -i "<key>.pem" <username>@<hostname>`
2. Install docker
	1. `sudo -i`
	2. `yum install docker`
3. `docker --version` **(M)**
	1. CE - has everything except security features and support
4. `docker info` **(M)** - fails (docker daemon is not running)
	1. Start docker engine: `service docker start` **(M)**
5. `docker images` **(M)** - all images on the linux box
6. Example: `docker run hello-world` **(M)**
7. Example: `docker run -it ubuntu bash`
	1. `i` - interactive mode
	2. `t` - open up the terminal
8. Exmaple: `docker pull mysql:5.7`

### Docker Run ###
1. `docker run --help` **(M)** (options for `run`)
	1. `-a` - attach to already running container
	2. `-d` - detach from container
	3. `-c` - num of CPUs
	4. `-e` - pass or set env variables on container
	5. `-h` - container's hostname
	6. `-i` - interract with container
	7. `--init` - Run init inside container that forwards signals and processes
	8. `-t` - allocates pseudo-TTY (terminal)
	9. `-v` - volumes
2. Example: `docker run -i -d -t -p 80:80 nginx`
	1. `-p` - publish a container's port(s) to the host
		1. By default container's ports will not be exposed to the outside world
		2. <host-port>:<container-port>
3. `docker images`
4. `docker ps` - process status of a container
5. How to access `nginx`: grab the dns name from aws and paste it in browser
	1. Expose port 80
		1. Security groups
			1. Click on security group
				1. Inbound rule
					1. Custom TCP, 80, my-ip
	2. port 80 of EC2 is mapped to port 80 of container
6. Box can be accessed from anywhere
7. To stop a container:
	1. `docker stop <container-id>` **(M)**
8. `docker ps` - only shows containers which are up and running
9. `docker ps -a` **(M)** - shows all containers

### Docker Clean Up ###
1. `docker info`
	1. 3 containers, 4 images
	2. `docker ps -a`
		1. `docker rm <container-id>` **(M)** (need to stop container before removing)
		2. `docker rm -f <container-id> <container-id> ...` (forcefully remove a container even if it is running)
	3. `docker images`
		1. `docker rmi <image-id>`
2. `docker start <container-id>` **(M)** - starts container again

### Get Comfortable with Docker Run ###
1. `docker images` - clean
2. `docker run -i -t -d nginx`
	1. Pulls image
	2. Launches container
	3. First 12 chars of complete id
3. `docker run -itd nginx`
	1. Launches container directly
	2. `docker ps`
4. Assigning name: `docker run -itd --name mycontainer nginx` **(M)** (image name must come at the end)
5. `docker stop <container-name|container-id>` **(M)**
6. `docker start <container-name>`
7. `docker run -itd -p 8000:80 nginx` (must not have any other app running on the port 8000)
8. `docker restart <container-name|container-id>` **(M)** - stops and starts container
9. To pause container: `docker pause <container-name|container-id>` **(M)**
10. To unpause container: `docker unpause <container-name|container-id>` **(M)**

### Docker Commit ###
1. `docker commit <container-id> image` **(M)** - to save current state of container into image
	1. If apache is installed inside container
		1. The current state can be stored by giving new image name (this can be shared with other developers in the team or move it to another environment)
2. `docker images`
3. `docker pull ubuntu`
4. `docker run -itd <ubuntu-container-id>`
5. `docker ps`
6. `docker exec -it <ubuntu-container-id> bash` **(M)**
7. `apt-get update`
8. `apt-get install apache2`
9. `service apache2 status` **(M)**
10. `service apache2 start` **(M)**
11. `mkdir demo` - just to demo that this will be there when we commit the image
12. `ls` (`demo` folder exists)
13. `exit`
14. `docker commit <container-id> <image-name>` (container should be up and running to commit) (good for temporary sharing of images)
15. `docker images`
16. Run: `docker run -dit --name myweb <image-name>`
	1. `ls` - (`demo` exists)
	2. `service apache2 start`

### Docker Layers and Overlay Storage ###
1. Docker layers and overlay
	1. `docker pull ubuntu`
		1. Pulls one layer at a time (and builds one image)
			1. Final image is a combination of layers
				1. `docker history ubuntu` **(M)**
					1. Bottom layer - kernel layer
					2. Next - min OS required
					3. Next - few commands
		2. CREATED BY: The commands that are run for each layer
			1. ADD: Dockerfile command
			2. CMD: Dockerfile task
2. Where are images stored on machine? `docker info`
	1. Docker Root Dir: /var/lib/docker
		1. `overlay2` - storage driver of docker - takes care of layering and how they are stored
		2. `swarm` - clustering
		3. `trust` - security
		4. `volumes`
3. Example: `docker pull redis`
	1. `docker history redis`
4. Docker uses: Union File System
	1. Where it will integrate all the layers
	
				Container Writable (can write)
				Apache (read only)
				Ubuntu
				Kernel
				
5. `image/overlay2/repositories.json` - image info is stored
6. `containers/<id>` - running containers info

### Launch MySQL Container ###
1. Commands:

		docker run -d -p 6666:3306 --name=bharath-mysql --env="MYSQL_ROOT_PASSWORD=test1234" --env="MYSQL_DATABASE=reservation" mysql
		docker exec -it bharath-mysql bash
		
		# mysql -uroot -p
		test1234
		
		mysql> show databases;
		mysql> show tables;

### Volumes and Bind Mounts ###
1. We want to write data to our writable layer
	1. When we stop contianer, data will exist
	2. When we delete the container, the data is lost
		1. Solution: Persisting data (on host machine)
			1. Bind Mount
			2. Volume
2. If a new container is launched, it will re-use the same bind mount or volume from host
3. Bind mount: (not managed by docker, can be accessed by any other process in host)
	1. This will use any folder on the host machine to store data (pick and folder and mount it on container)
		1. Data can be exchanged through the folder
			1. Any data put in folder in container, it can be seen on host and vice-versa
4. Volume:
	1. Constructed using commands
	2. Docker will maintain volumes inside `/var/lib/docker/volumes` (managed by docker)
	3. Can be mapped to any containers
	4. Recommended way

### Use Volumes ###
1. `docker volume ls` **(M)**
	1. local default volume
2. `docker volume create myvol` **(M)**
3. `docker run -dit --mount source=myvol,destination=/tmp nginx` **(M)**
	1. `ls /var/lib/docker/volumes/myvol/_data/` - empty now (nothing added in container)
	2. `docker exec -it <container-id> bash`
		1. `cd /tmp`
		2. `touch 1.txt`
		3. `touch 2.txt`
		4. `touch 3.txt`
	3. `exit`
	4. `cd /var/lib/docker/volumes/myvol/_data`
	5. `ls`
		1. Files exist
		2. If we put something in host it gets reflected in container
		3. `echo "Volumes are awesome" > 4.txt`
	6. `docker exec -it <container-id> bash`
		1. `cat 4.txt`

### Use Bind Mounts ###
1. `mkdir mydata`
2. `docker run -dit -v /root/mydata:/tmp ubuntu` **(M)** (`--mount` can also be used)
3. `docker exec -it <container-id> bash`
4. `touch /tmp/1.txt`
5. `touch /tmp/2.txt`
6. `exit`
7. `ls mydata/`

### Docker Networking in Action ###
1. `docker network ls` **(M)**
	1. bridge network
	2. host network
	3. none network
2. To know details of a network
	1. `docker network inspect bridge`
3. `docker network create demonw --subnet=172.19.0.0/16` **(M)**
	1. New network is created
4. `docker network ls`
	1. The network can be assigned to a container
		1. `docker run --name webserver2 --net demonw --ip 172.19.0.2 -h web.bharath.com -p 82:80 -ti ubuntu /bin/bash` **(M)**
			1. ctrl + p + q (to come out of the container)
		2. `docker attach webserver2` **(M)**

### Change a Containers Network ###
1. `docker network disconnect demonw webserver2` **(M)** - disconnect from the network (removes container from the network)
2. `docker inspect webserver2` **(M)** (no ip address)
3. `docker network connect bridge webserver2` **(M)**
4. `docker inspect webserver2`

### Windows - Install Docker ###
### Dockerfile Introduction ###
1. Dockerfile has commands to assemble an image
2. Process:
	1. Docker CLI (build) - Dockerfile -> Docker Engine -> image
		1. Any num of containers can be spun up from the image
3. Commands:
	1. `FROM` - first line (from existing base image) and layed over (`FROM ubuntu`)
	2. `COPY` - to copy app files to folder in image (`COPY app.jar /server/deploy`)
	3. `ENV` - to set environment variables (`ENV JAVA_HOME=/opt/java`)
	4. `RUN` - runs any command when image is built (`RUN yum install apache2` - it will become part of the image itself)
	5. `CMD` - it is executed after image is built (`CMD python3 --version` - to check how image is configured)
	6. `EXPOSE` - exposes a particular port (`EXPOSE 80`)
3. Search for sample Dockerfile
4. Example:

		FROM		ubuntu
		VOLUME		["/var/cache/apt-cacher-ng"]
		RUN			apt-get update && apt-get install -y apt-cacher-ng
		EXPOSE		3142
		CMD			chmod 777 /var/cache/apt-cacher-ng && /etc/init.d/apt-cacher-ng ...
		
		docker build -t eg_apt_cacher_ng . **(M)**

### First Dockerfile ###
1. Example: Building own image
	1. Centos - base OS
	2. Httpd
	3. index.html
	4. 80
2. `vi Dockerfile` (`dockerfile` is acceptable)

		FROM			centos
		RUN				yum install -y httpd
		ADD				index.html /var/www/html
		CMD				apachectl -D FOREGROUND
		EXPOSE			80
		MAINTAINER	Bharath
		ENV				myenv myval
		
	1. `vi index.html`

			Dockerfile is awesome!!
			
3. `docker build -t my-webserver .`
4. `docker images`
	1. At every step a layer is constructed
	2. Removes intermediate container at each step

### Beauty of Docker Layers ###
1. `docker images`
2. `docker history my-webserver`
	1. All layers from bottom to top are built in order
3. `vi Dockerfile`

		...
		ENV myenv2 myvar2
		
4. `docker build -t my-webserver .` (doesn't take time)
	1. Just picks layers which are already cached instead of pulling from registry
5. `docker tag my-webserver bharath19/my-webserver` **(M)**
	1. Tagging is required to push image to central hub
6. `docker login` **(M)**
	1. `userid`
	2. `password`
7. `docker push bharath19/my-webserver`
8. Open docker hub
	1. hub.docker.com

## Dockerize Micro Services ##
### Visual Studio Code - The Docker IDE ###
1. VS Code - free IDE from Microsoft
	1. View > Extensions
		1. Add docker extension
			1. containers
			2. images
			3. registers
			4. networks
		2. We can configure containers, delete, ...
		3. We can start and stop containers
2. `docker run mysql` (exited)
3. `docker images`
4. VS Code
	1. Shows status of container
		1. Right click > inspect
		2. ...
	2. Whatever we can do from commandline (mostly) can be done from VS Code
	3. We can add and remove networks
	4. Auto-complete with code assistance
	5. Syntax highlighting
	6. Indentation (auto)

### Install Visual Studio Code IDE ###
1. Download VS Code
2. Extensions: docker (from Microsoft)
	1. Also has Kubernetes support

### Launch MySQL Container ###
1. Containerize microservices:
	1. Product service
	2. Coupon service
	3. DB service
2. Lauch database container:
	1. `docker run -d -p 6666:3306 --name=docker-mysql --env="MYSQL_ROOT_PASSWORD=test1234" --env="MYSQL_DATABASE=mydb" mysql`
	2. `docker exec -it <container-id> bash`
	3. `mysql -uroot -ptest1234`
	4. `use mydb;`

### Construct Tables ###
1. Copy and paste from `tables.sql` or
2. `docker exec -i docker-mysql mysql -uroot -p test1234 mydb < tables.sql`
3. Connect to host (using dns name and port 6666) from mysql workbench.

### Dockerize the APPs ###
1. VS Code
2. New file: Dockerfile (under couponservice project) (ctrl + space give options)

		FROM java:8
		ADD target/couponservice-0.0.1-SNAPSHOT.jar couponservice-0.0.1-SNAPSHOT.jar
		ENTRYPOINT [ "java", "-jar", "couponservice-0.0.1-SNAPSHOT.jar" ] # first thing that should be executed once container is launched
		
3. New file: Dockerfile (under productservice project)

		FROM java:8
		ADD target/productservice-0.0.1-SNAPSHOT.jar productservice-0.0.1-SNAPSHOT.jar
		ENTRYPOINT [ "java", "-jar", "productservice-0.0.1-SNAPSHOT.jar" ] # first thing that should be executed once container is launched

### Build Images ###
1. STS:
	1. couponservice
		1. application.properties

				jdbc:mysql://docker-mysql:3306/mydb # exposed port is not required
		2. `mvn clean package -DskipTests`
		3. `docker build -f Dockerfile -t coupon_app .`
				
	2. productservice
		1. application.properties

				spring.datasource.url=jdbc:mysql://docker-mysql:3306/mydb
				...
				couponService.url=http://coupon-app:9091/couponapi/coupons/
		2. `mvn clean package -DskipTests`
		3. `docker build -f Dockerfile -t product_app .`

### Launch the Microservice Containers ###
1. `docker run -t --name=coupon-app --link docker-mysql:mysql -p 10555:9091 coupon_app`
2. ctrl + n (another terminal)
3. `docker run -t --name=product-app --link docker-mysql:mysql --link coupon-app:coupon_app -p 10666:9090 product_app`

### Test ###
1. http://localhost:10555/couponapi
2. http://localhost:10666/productapi
3. Creation:

		POST: http://localhost:10555/couponapi/coupons
		
		{
			"code": "SUPERSALE",
			"discount": "10",
			"expDate": "12/12/2030"
		}
		
4. Creation:

		POST: http://localhost:10666/productapi/products
		
		{
			"name": "MAC",
			"description": "Its Cool",
			"price": 2000,
			"couponCode": "SUPERSALE"
		}
		
5. The images can be used to spawn containers in any cloud

### Sign Up for Docker Hub ###
1. First docker checks if image is available on the local machine and if not it will pull from central repository
2. unique id can be used to push images
	1. public - share with rest of the world
	2. private

### Push to Docker Hub ###
1. `docker tag product_app bharatht19/productservice` (image name)
2. `docker tag coupon_app bharatht19/couponservice`
3. `docker push bharatht19/productservice`
4. `docker push bharatht19/couponservice`
5. Make private: can only be accessed with user-id and password
6. We can also delete the repo

### Docker Prune Command ###
1. `docker container prune` **(M)** - removes all dangling containers (which are not used - stopped)
2. `docker container prune -a` **(M)** - removes all containers
3. `docker image prune` - only dangling images
4. `docker rmi $(docker images -a -d)` - deletes all images
	1. `-d` - ids only **(M)**
5. `docker image prune -a` **(M)** - removes all images
6. `docker system prune` **(M)** - removes everything dangling (containers, volumes, networks, images, ...)
7. `docker volume prune` **(M)**

## Docker Compose ##
### Introduction ###
1. It is a tool to run one or more containers required for our application
	1. We don't need scripts or use any other tools to start containers
		1. Docker commands are not required
			1. Only one config file is sufficient
			2. `docker compose up` will launch all containers (uses `docker-compose.yaml`)
2. `services` are defined
	1. `reservation-app`
		1. `depends_on`: `docker-mysql`
	2. `docker-mysql`
3. Other options:
	1. `up` - provision and start containers
	2. `restart` - all services or containers
	3. `build` - build or rebuild services
	4. `scale` - how many number of containers we want
	5. `stop` - stops services
	6. `kill` - kills abruptly
	7. `logs` - shows logs
	8. `ps` - lists containers that are up and running
	9. `--help` - lists commands that are there
4. We can specify dockerfile (`build: ./`) or image (`image: mysql`)

### YAML Syntax ###
1. Used for Compose, Kubernetes, Ansible
2. `demo.yml`

		# comment - A'int markup language (YAML)
		# Superset of JSON - used in DevOps tools
		# Simple types
		# numeric, char, null
		# Lists
		# Objects
		# Dictionary or Map
		# Using a yaml validator (Docker compose has built in)
		customerName: Bharath # key: value (space is required)
		orderId: 123
		date: 12/12/2020
		shipped: false
		moreData: null
		products: # preferred way
			- name: macBook
			- name: IPhone
			- name: Desktop
		products1: [name: IPhone, name: Mac] # Another way
		address: # dictionary
			street: SpringField
			city: Austin
			
1. Validate using YAML
2. Example:

		version: '3'
		services:
			product-app:
				container_name: product-app
				image: bharatht19/productservice
				restart: on-failure
				ports:
					- 10666:9090
				environment:
					WAIT_HOSTS: mysql:3306
				depends_on:
					- docker-mysql
					- coupon-app
			coupon-app:
				container_name: coupon-app
				image: bharatht19/couponservice
				restart: on-failure
				ports:
					- 10555:9091
				environment:
					WAIT_HOSTS: mysql:3306
				depends_on:
					- docker-mysql
			docker-mysql:
				container_name: docker-mysql
				image: mysql
				restart: always
				environment:
					MYSQL_DATABASE: mydb
					MYSQL_ROOT_PASSWORD: test1234
					MYSQL_ROOT_HOST: '%'
				volumes:
					- ./sql:/docker-entrypoint-initdb.d
				ports:
					- 6666:3306
				healthcheck:
					test: "/usr/bin/mysql --user=root --password=test1234 --execute \"SHOW DATABASES \""
					interval: 4s
					timeout: 20s
					retries: 5
					
3. Kubernetes:

		apiVersion: v1
		kind: Service
		metadata:
			name: webserversvc
		spec:
			type: NodePort
			ports:
				- port: 80
				  protocol: TCP
			selector:
				app: httpd
				
4. List of objects:

		products:
			- name: mac
			  price: 1500
			  quantity: 3

### Important YAML Elements in Docker Compose ###
1. Search docker compose documentation
2. Key elements:
	1. `version`: version of compose
	2. `services`: micro-services (all containers unders this)
	3. `container_name`: unique name to container
	4. `image`
	5. `build`
	6. `restart` - policy for restarted
		1. `always` - always re-launch
		2. `on-failure` - re-launch on failure
	7. `environment` - environment variables
	8. `volumes`
	9. `ports` - to expose out ports
	10. `healthcheck` - optionally check health
	11. `depends_on` - other services on which this service depends on

### Compose in Action ###
1. VS Code
2. New file: devops/dockercomposedemo/docker-compose.yml

		version: '3.3'
		services: 
			web: 
				image: httpd
				container_name: mywebserver
				ports:
					- '8080:80'

	1. Similar to: `docker run dit --name mywebserver -p 8080:80 httpd`
	2. To check syntax: `docker-compose config` **(M)**
	3. `docker-compose up -d` **(M)**
		1. A default network is created - the network is used to connect all the services defined
	4. `docker-compose --help`
		1. `down` - brings down services
		2. `ps` - containers running
		3. `stop` - stops all containers
			1. `docker-compose stop web`
			2. `docker-compose start web`
			3. `docker-compose down` - stops all services and removes default network

### Compose Networks ###
1. default network name is derived from the folder name in which `yml` file is defined and appends `_default`
2. docker-compose.yml

		version: '3.3'
		services:
			web:
				image: httpd
				container_name: mywebserver
				networks:
					- webnetwork # used here
				ports:
					- '8080:80'
		networks: # to define all networks for the services
			webnetwork: 
				driver: bridge
			dbnetwork:
				driver: bridge
		
		or
		
		networks:
			default:
				external: # outside - using docker command
					name: ...
				
	1. Network name: `dockercomposedemo_webnetwork`

### Compose Volumes ###
1. volumes:

		web:
			...
			volumes:
				- myvol:/data # volume is mounted to /data folder
		volumes:
			myvol:
			
2. Bind-mount

		web:
			...
			volumes:
				- type: bind
				  source: data
				  target: data
				  
3. Volume (another syntax)

		web:
			...
			volumes:
				type: volume
				source: myvol
				target: data # any folder

### Compose MySQL Service ###
1. New file: couponservice/docker-compose.yml

		version: '3'
		services:
			docker-mysql:
				container_name: docker-mysql
				image: mysql
				restart: always # everytime it fails
				environment:
					MYSQL_DATABASE: mydb
					MYSQL_ROOT_PASSWORD: test1234
					MYSQL_ROOT_HOST: '%' # which IP addresses can access - wildcard % - from anywhere
				volumes:
					- ./sql:/docker-entrypoint-initdb.d # sql folder contains tables.sql, docker-entrypoint-initdb.d **(M)** - any sql inside this folder are executed automatically (the folder exists)
				ports:
					- '6666:3306'
				healthcheck: # to check if mysql is up an running
					test: "/usr/bin/mysql --user=root --password=test1234 --execute \"SHOW DATABASES \""
					interval: 4s # every 4 seconds
					timeout: 20s # gives up after 20s
					retries: 5 # 5 retries within 20s max

### Compose Micro Services ###
1. couponservice:

		product-app:
			container_name: product-app
			image: bharatht19/productservice
			restart: on-failure # restart until mysql is up
			ports:
				- 10666:9090
			environment:
				WAIT_HOSTS: mysql:3306 # keeps checking if mysql is up
			depends_on:
				- docker-mysql
				- coupon-app
		coupon-app:
			container_name: coupon-app
			image: bharatht19/couponservice
			restart: on-failure # restart until mysql is up
			ports:
				- 10555:9091
			environment:
				WAIT_HOSTS: mysql:3306 # keeps checking if mysql is up
			depends_on:
				- docker-mysql

### Launch and Test ###
1. `docker-compose up`
	1. spring boot applications might fail because mysql might not be up but the policy will restart the spring boot applications until they succeed.
	2. Once everything is up, the log generation will stop
2. Another folder:
	1. `docker-compose --help`
	2. `docker-coponse images` - lists all images
	3. `docker-compose ps`
	4. `docker-compose restart`
	5. `docker-compose pause` - all services will be paused
	6. `docker-compose down` - brings down everything
3. VS Code:
	1. Right click on file and run docker compose commands
		1. Open the folder (not just the file)

## Kubernetes Concepts and Local Setup ##
### Introduction ###
1. Container orchestration:
	1. Running containers on single host is okay for Development and testing but not for production
	2. The containers should be fault-tolerant
		1. If one of the containers goes down, there should be backups (1 or more) - user should not see errors
	3. The containers should scale on demand
		1. If more requests are coming in, more containers should get spawed and spawned down
	4. The containers should make optimal use of system resources and should perform well while communicating with each other
	5. The containers should automatically discover each other for communication to get established
	6. The containers in the cluster should be publically accessible
		1. For other organizations
	7. Auto update and rollback (to a version) - without downtime or minimal downtime
2. The containers are grouped into a cluster and the deployment and management of the containers are automated while all the above non-functional requirements are met.
	1. Kubernetes is a container orchestration tool that gives the above functionality out of the box
3. Kubernetes:
	1. Most popular which helps deploy and connect containers across hosts
	2. Provides services (without downtime)
		1. Self discovery
		2. Scaling
	3. Kubernetes means Helmsman (Ship pilot)
		1. K8S - Kates
	4. CI-CD is made easy
	5. Cloud Native Computing Foundation - Linux Foundation - takes care of Kubernetes development and licensing
	6. Can be installed on premise and cloud
	7. Cloud providers have built in support
		1. AWS Elastic Container Service
		2. Google Kubernetes Engine
		3. Azure Kubernetes Service

### Kubernetes Object Model ###
1. Object model - used to represent different entities in the cluster
	1. Pod
	2. ReplicaSet
	3. Deployment
	4. Namespace
	5. Service
2. The objects are constructed using spec (specification) using YAML configuration.
3. Example:

		apiVersion: apps/v1
		kind: Deployment
		metadata:
			name: mywebserver
			labels:
				app: httpd
		spec:
			replicas: 2
			selectors:
				matchLabels:
					app: httpd
				template:
					metadata:
						labels:
							app: httpd
					spec:
						containers:
							- name: myhttpd
							  image: httpd
							  ports:
							  	
4. Lowest level object: Pod
	1. It is a logical group of similar containers (containers related to each other)
	2. Definition:

			spec:
				containers:
					...
					
		1. Pods are not self healing
		2. Pods are not fault tolerant on their own
	3. Pods are managed through replica sets

			spec:
				replicas: 2
				...
				
		1. We want at-least two pods to be up an running
			1. Components in kubernetes make sure that 2 pods will be up and running
	4. Deployment:
		1. Single deployment contains replicas (deployment takes care of replicas)
			1. Replicas take care of pods
5. Service: It is another object
	1. Later
6. Namespace: Helps us host applications from across organizations by grouping applications in a namespace
	1. Similar to package name in Java
	2. It is a unique namespace for a group of projects or applications within a cluster 
7. `kubectl get namespaces` **(M)**
	1. `default` - used if no namespace is specified
	2. `kube-node-lease` - for heartbeat - healt related data is stored here
	3. `kube-public` - insecure - only for exploration (not for test or production)
	4. `kube-system` - Kubernetes system level namespace. It uses this namespace for storing kubernetes specific things
	5. `kubernetes-dashboard` - dashboard application - used to access all resources from web-browser
8. We can allocate resources (quota) for each of the namespaces
9. Kubernetes uses object model
10. Deployment will group ReplicaSet and Pods

### Architecture ###
1. Architectural components that make up a Kubernetes cluster
	1. All machines in Kubernetes cluster are referred to as nodes
		1. Master node - manages entire cluster
			1. Single master in dev environment
			2. Multiple masters in stage and production environments
			3. It exposes REST API to interact with
				1. API server
					1. kubectl - commandline utility - can interact with API server
						1. Takes YAML or JSON file and hands them to API server
						2. It is a wrapper over curl command
					2. Processes YAML or JSON
					3. It maintains current state of cluster in distributed storage service called etcd (it is a name value storage)
						1. etcd - stored on each of the master nodes (replicas)
				2. Scheduler
					1. Schedules pods on worker nodes
					2. It has all the information about worker nodes and pods and is responsible for launching pods in worker nodes as required
				3. Control manager
					1. Runs in background
					2. Once cluster is in place, it ensures that the cluster is in the desired state
		2. Worker nodes - launches pods and provisioning containers
			1. Kubelet - Each worker node has kubelet setup - (no direct interaction)
				1. It has API that API server can call (to get data) - to get all resources setup (pods, ...)
				2. It can call API server
			2. Proxy (one for each worker) - It is network proxy and a load balancer
				1. When apps from outside want to communicate with containers running, they have to go through proxy and it will balance load across services within worker node
		3. External load balancer - Apps can go through external load balancer to balance load across workers
		4. Docker is used to launch containers
			1. Another container engine supported is Rocket

### Installation Types ###
1. Types:
	1. Single-Node Installation (all components of kubernetes run on one machine)
		1. A master and worker will live on one node (good for development)
		2. Minikube + Docker Desktop give single node cluster (can be used on laptop)
	2. Single-master multi-worker
		1. Master runs on it's own node
		2. Each worker runs on it's own node
		3. Single etcd will hold all the state
	3. Multi-master multi-worker
		1. Highly available - if one master goes down, the other master will take over
		2. etcd is only on a single master
	4. Multi-master multi-worker with multi-etcd
		1. Same as 3 but with multiple etcd for each master
2. Only a little bit more work is required for higher types
	1. More sophistication gives higher availability
3. Configurations:
	1. On-premise bare metal
	2. VMs
	3. On-premise private cloud
		1. IBM & Google - they will come and setup
			1. They provide tools to manage our cloud
	4. Cloud
		1. Hosted solutions on cloud (charged)
			1. Google Kubernetes Engine (GKE)
			2. Azure Kubernetes Service (AKS)
			3. OpenShift Dedicated

### Install Minikube on Mac ###
1. Search for minikube install > first link
	1. check for virtualization if supported
	2. Install hypervisor
		1. Docker desktop installs virtualbox
	3. `brew install minikube`
	4. `minikube start` **(M)** - starts kubernetes cluster
		1. A VM is created. (using VM hypervisor)
		2. A cluster is created.
		3. Launches default container inside the cluster (single node cluster inside virtual box)
	5. `minikube status` **(M)**
2. Installation on EC2/ubuntu-20
	1. kubectl:
	
			curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
			
			chmod +x ./kubectl
			
			sudo mv ./kubectl /usr/local/bin/kubectl
			
			kubectl version --client
			
	2. Docker:

			sudo apt-get update -y &&  sudo apt-get install -y docker.io
			
			sudo docker version
			
	3. minikube:

			curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
			
			minikube version
			
			sudo -i
			
			apt install conntrack
			
			minikube start --driver=none
			
			minikube status
			
	4. Check with `kubectl`:

			kubectl get pods
			
			kubectl get svc
			
			kubectl create deployment hello-node --image=k8s.gcr.io/echoserver:1.4

### Install and use Kubectl ###
1. `brew install kubectl`
2. `kubectl config view` **(M)**
	1. Config file defined by minikube
		1. kubectl uses the file to get info about kubernetes cluster
			1. ip address & port
			2. client certs and keys to login and connect to cluster
		2. `~/.kube/config` - yaml file
	2. Custom config is required for cloud based cluster
3. `kubectl cluster-info` **(M)**
	1. Kubernetes
	2. KubeDNS

### Windows Only - Install Minikube ###
### Windows Only - Install Kubectl ###
### Troubleshooting ###
1. `minikube status` **(M)**
2. If not able to pull docker images:
	1. `minikube stop` **(M)**
	2. `minikube delete` **(M)** - deletes entire cluster started by minikube
	3. `minikube start --vm-driver=hyperkit`
	4. or
	4. `minikube stop`
	5. `minikube delete`
	6. `minikube start --vm-driver=virtualbox` **(M)** (don't use root)
		1. Pre-requisite: VirtualBox
			1. Add `deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian <mydist> contrib` (`<mydist>` is `focal` for Ubuntu 20.04) to `/etc/apt/sources/list`
			2. `wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -`
			3. `wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -`
			4. `sudo apt-get update`
			5. `sudo apt-get install virtualbox-6.1`

### Kubectl Configuration ###
1. kubectl - used to connect to any kubernetes cluster and work with the resources inside cluster
	1. Creation, deletion, description, ...
2. All connection info is stored in config file (like a profile)
	1. `kubectl config view`
		1. clusters: (any no of clusters are possible, aws, on-premise, ...)
			1. One cluster: minikube
		2. users:
			1. minikube (used to connected to cluster)
			2. key - used to connect
		3. contexts:
			1. context: combines cluster to user
				1. name: minikube
			2. current-context: minikube (name of context we are working with) - any command goes against this context
			3. Namespaces can be defined
	2. The info can be changed to work on different kubernetes cluster

## Kubernetes in Action ##
### POD ###
1. It is an abstraction that logically groups a set of related containers
	1. Example: DB server, coupon service, product service - group (one a pod)
		1. We can have multiple pods with the above group
		2. Pods will have all the resources required for the microservices (containers) to work
			1. Resources:
				1. Network
				2. Security
				3. Configuration
				4. Volumes
	2. Good practice: One container per pod (with resources that container needs)
		1. `kubectl` command can be used to provision a pod OR
		2. pod specific yaml config file
	3. Multiple pods:
		1. Constructed using deployments
			1. For replications & maintainance of state
		2. The pods are exposed out to other pods in the cluster through services
			1. The applications outside cluster can access the pods and containers within pods through an object called **service**
2. Pods can be used to:
	1. Set environment variables
	2. Executing commands within pod
	3. Check liveness and readiness of a pod
		1. Has container started?
		2. Is pod ready?
3. Pod is an abstract object that logically groups containers with resources requiered for containers to work

### Construct First POD ###
1. pod using nginx image - example:
	1. `kubectl run firstpod --image=nginx` **(M)**
		1. A container is launched in pod with nginx image
	2. `kubectl get pods` **(M)**
	3. `kubectl describe pod firstpod` **(M)**
		1. Scheduler has assigned default pod to minikube (particular node)
			1. Scheduler is responsible for assigning pod to node
		2. Kubelet - responsible for pulling image from docker hub
		3. Kubelet - responsible for provisioning container firstpod
		4. Kubelet - responsible for starting container firstpod
		5. Other info is available
	4. `kubectl exec -it firstpod -- /bin/bash` **(M)**
		1. `cd /usr/share/nginx/html`
		2. `nginx` image is based on ubuntu machine
		3. `apt-get update && apt-get install -y curl`
		4. `curl localhost`
	5. `kubectl delete pod firstpod` **(M)**
	6. `kubectl run firstpod --image=nginx`
	7. `kubectl get pod firstpod -o yaml`
		1. Details are shown as yaml
			1. yaml file - can be manually defined (here it is generated)
				1. The yaml can be re-used for other configurations

### Construct Pod using YAML ###
1. Example:

		kind: Pod # kind of resource
		apiVersion: v1 # elements might change with version
		metadata: # data about resource (about data - about pod)
			name: firstpod
		spec: # body - how resource should be constructed
			containers:
				- name: db
				  image: redis
				- name: web
				  image: httpd
				  
2. `kubectl delete pod firstpod`
3. `cd devops`
4. `kubectl create -f firstpod.yml` **(M)**
5. `kubectl get pods`
6. `kubectl describe pods`
7. `clear`
8. `kubectl get pods`
9. Inside container: `kubectl exec -it firstpod --container db -- /bin/bash` **(M)**
	1. `exit`
	2. `kubectl exec -it --container web -- /bin/bash`
	3. `kubectl get pods`
	4. `kubectl delete all --all` **(M)** - deletes everything (pod(s) and kubernetes as well)
10. `kubectl create -f firstpod.yml`
	1. `kubectl delete -f firstpod.yml` **(M)** (replication controller is not setup to bring them back up)
	2. Update is also possible with the same resource (yml)
11. General practice: Pods are not constructed in isolation
	1. They are constructed as part of deployment, replication
		1. The above section goes into `template` section

### POD Life Cycle ###
1. Phases
	1. Pending - when pod is just created
		1. API server on master will validate and ensure that the pod config is okay
		2. API server adds an entry in etcd for the pod (an entry is added for every object created)
			1. Helps bring up cluster again if one of the master nodes crashes
		3. API server then asks worker to construct the pod
		4. `kubectl create -f firstpod.yml` - as soon as the statement is executed, the pod will go into pending phase then into running
	2. Running
		1. All containers in pod are created
		2. The pod has been scheduled on one of the worker nodes in cluster
		3. All containers are up and running
	3. Succeeded
		1. All containers have successfully run without any errors
			1. None of the containers will be restarted
				1. No failure are reported
	4. Failed
		1. Every container except a few have executed successfully (they have exited with failure code)
	5. Unknown
		1. If Pod status could not be obtained by master API server
2. `kubectl get pods -o yaml` **(M)**
	1. Status:
		1. Container statuses
			1. Phase: Running
3. `kubectl get pods`
	1. firstpod.yml

			...
			image: httpd3434 # invalid image name
			
		1. `kubectl delete -f firstpod.yml`
		2. `kubectl get pods -o yaml`
			1. `Phase: Pending` - never went to running
			2. container: `pull access denied`
			3. `kubectl get pods`
				1. `STATUS` - `ImagePullBackOff`
		3. `kubectl describe pods` **(M)** - shows all events

### Labels and Selectors ###
1. Labels: key-value pairs that we can assign to any resource in kubernetes cluster
	1. Example:
		1. `app: ps` - product service pod
			1. `app` - key
			2. `ps` - value
		2. `app: db` - mysql pod
		3. `app: cs` - coupon service pod
2. The labels can be used to sort and filter and search (querying)
	1. Using selectors (they are like where clauses in SQL)
	2. We can assign any number of key value pairs to our resources
		1. A selector can be used to group the resources into a deployment
			1. Example: All pods that match `app: ps` should be part of Product deployment
				1. All pods that match `app: cs` should be part of Coupon deployment
				2. All pods that match `app: db` should be part of DB Deployment
	3. Selectors:
		1. The following operators can be used:
			1. `=`
			2. `!=`
			3. `in`
			4. `notin`
			5. `exists`
3. Example:

		matadata:
			name: mywebserver
			labels: # label assignment
				app: httpd
		spec:
			replicas: 2
			selector:
				matchLabels: # which ever pods match this selector will be part of this deployment
					app: httpd
				template:
					metadata:
						labels: # label assignment
							app: httpd
					spec:
						containers:
						
	1. Service:

			apiVersion: v1
			kind: Service
			metadata:
				name: webserver-service
			spec:
				type: NodePort
				selector: # all pods that match this label will be exposed out through this service on the following ports
					app: httpd
				ports:
					- nodePort: 30123
					  port: 80
					  targetPort: 80

### Use Labels and Selectors ###
1. firstpod.yml

		kind: Pod
		...
		metadata:
			name: firstpod
			labels:
				app: fp
				release: stable
				team: red
		...
		
	1. `kubectl get all --show-labels` **(M)**
	2. `kubectl create -f firstpod.yml`
	3. `kubectl get all --show-labels`
	4. Filter: `kubectl get all --selector='app=fp'` **(M)**
	5. Filter: `kubectl get all --selector='app!=fp'`
	6. Filter: `kubectl get all --selector='app in (fp)'`
	7. Filter: `kubectl get all --selector='app=fp,team=red'` - Multiple selectors

### Annotations ###
1. Are metadata
	1. They are key value pairs like labels
	2. They are not used to identify resources
	3. They are just arbitrary data
		1. Can be used by any other tool as required
			1. Example:

					metadata:
						...
						annotations:
							dockerHubUrl: ""
							commitId: ""
							logDir: "/etc/logs"
							
				1. Tools: Prometheus, Graphana can use
					1. Logs can be grabbed and analysed
				2. Other developers or DevOps engineers can process the information

### Namespaces ###
1. DevOps engineer or operations guy may hand over a namespace
	1. If multiple apps are deployed in a cluster
		1. If one of the applications uses up all the resources in the cluster?
			1. Storage
			2. CPU
			3. ...
		2. We don't want one team to delete pods of another team accidentally
			1. Solution: namespace
				1. It is a logical or virtual division for each team or application that is deployed on Kubernetes cluster
				2. Each namespace is allocated a resource quota
					1. CPU
					2. Storage
					3. Limits on kubernetes objects
						1. Pods
						2. Services
						3. Deployments
				3. Example:
					1. Product team - a lot of space used by this team will not affect other teams (due to quota)
					2. Coupon team
2. `kubectl get ns` **(M)**
3. `kubectl create -f firstpod.yml` - created in default namespace
4. `kubectl create ns firstns` **(M)**
5. `kubectl delete -f firstpod.yml`
6. `kubectl create -f firstpod.yml --namespace firstns` **(M)**
7. `kubectl get pods` - search default namespace (no resources)
8. `kubectl get pods --namespace firstns` **(M)**
9. Namespace can be set in config
10. `kubectl config view`
	1. `kubectl config set-context --current --namespace firstns` **(M)**
	2. `kubectl config view`
	3. `kubectl get pods` - `--namespace` is not required
	4. `kubectl config set-context --current --namespace default`

### Kubectl is Cool ###
1. `kubectl get all` - all resources
2. `kubectl --help`
3. `kubectl create -f firstpod.yml --dry-run=client` **(M)** - on client (not on node or server) - to check syntax of yaml
	1. `kubectl get po`
4. `kubectl run demo --image=httpd` **(M)**
5. `kubectl get pod/demo -o yaml --export=true` **(M)**
	1. The yaml can be grabbed and delete unnecessary values and re-use it
6. `kubectl explain pod` **(M)** - documentation
	1. Fields that can be used
	2. `kubectl explain pod.spec`
	3. `kubectl explain deployment`
	4. `kubectl explain service`

### Deployment ###
1. Deployment object:
	1. It helps us manage pods
	2. We can have multiple replicas of a pod (using deployment)
		1. Main goal of Kubernetes is to scale up the pods if incoming requests increase and scale down pods if there are not many requests
	3. If one of the pods goes down for any reason, kubernetes based on deployment, will launch another pod with container running
	4. A deployment is created typically for each application or microservice or for each pod will have a separate deployment
2. `kubectl` - deprecated for deployment
3. Another way: Dashboard
4. Recommended approach: YAML file
5. Three deployments:
	1. DB server
	2. Product service
	3. Coupon service

### Access the Cluster using Dashboard ###
1. Three ways to access:
	1. Web Dashboard
		1. With AWS or cloud, we need to deploy this dashboard (with single command)
		2. With minikube:
			1. `minikube dashboard` **(M)**
				1. Cluster roles
				2. Namespace
					1. Default is selected
				3. Nodes
				4. Persistent volumes
				5. Storage classes
			2. Workloads
				1. Daemon sets
				2. Pods
					1. Default pods
				3. Replica sets
			3. Deployments: Click on +
				1. From input: JSON or YAML
				2. From file: upload file (YAML or JSON)
				3. From form: (can also be used for our containers)
					1. App name: webserver
					2. Image: httpd (can configure repos as well)
					3. Pods: 2
					4. Service: None (Internal or External)
					5. Deploy
						1. Workload status should turn green
							1. Two pods
							2. One replica set
			4. Click on elipses against Pod and can delete or edit
			5. Deployments:
				1. Edit (elipses)
					1. YAML or JSON
						1. Grab the YAML and can work on it
	2. CLI
	3. REST APIs
		1. Programmatically

### Kubernetes YAML Config Explained ###
1. Two YAMLs
	1. Deployment YAML

			apiVersion: apps/v1 # for deployment
			kind: Deployment # kind of resource
			metadata:
				name: mywebserver
				labels:
					apps: httpd
			spec:
				replicas: 2 # replica set - pods
				selectors:
					matchLabels: # matches label in template metadata
						app: httpd
				template: # pod is defined using template
					metadata:
						labels:
							apps: httpd
					spec:
						containers:
							- name: myhttpd
							  image: httpd
							  ports:
							  	- containerPort: 80

		1. Kubernetes adds status at runtime (below metadata & spec)
		2. Every resource will have metadata and spec
		3. Any number of specs can be defined in a deployment
	
	2. Service YAML

			apiVersion: v1 # for services
			kind: Service
			metadata:
				name: webserversvc
			spec:
				type: NodePort # cluster IP is another, ...
				ports:
					- port: 80 # on which port the service can access the deployment - matches containerPort (80)
					# target: port
					  protocol: TCP
				selector:
					app: httpd # matches label in deployment metadata

### Construct Deployment YAML ###
1. kubernetes/webserver/webserver.yml

		apiVersion: apps/v1 # backwards compatible
		kind: Deployment
		metadata:
			name: mywebserver
			labels:
				app: httpd
		spec:
			replicas: 2
			selector:
				matchLabels:
					app: httpd
			template:
				matadata:
					labels:
						app: httpd
				spec:
					containers:
						- name: myhttpd
						  image: httpd
						  ports:
						  	- containerPort: 80

	1. `kubectl create -f webserver.yml`

### Service and Types ###
1. For pods to communicate with each other in the cluster, we need to define Service object
	1. Service: It will logically group a set of pods that need to access each other so that they can communicate with each other seamlessly
		1. Depending on level of access, different services can be configured:
			1. Only cluster
				1. communication required only within the cluster (just pods communicating)
			2. Outside
				1. pods and services need to be accessed outside
			3. Maps to an entity
				1. An entity within organization or outside organization that needs access to pods and vice-versa
2. ClusterIP
	1. Assume there are 4 pods
		1. PodA, PodB, PodC, PodD
			1. PodD needs to work with PodA and PodC (containers)
				1. One way: It can use IP addresses of PodA and PodC
					1. If a Pod goes down
						1. IP address can change
				2. Solution: Cluster IP Service
					1. It decouples the pods
					2. A virtual IP address is generated and all communication happens through this IP address (using **IP Tables**, **IPV4**)
						1. PodD can use the cluster IP service
							1. If same functionality is provided by PodA and PodC, then cluster IP service works as a load balancer (routes incoming requests)
			2. Internally, the virtual IP is mapped to a group of pods
		2. Cluster IP cannot be used from outside
			1. Only pods can communicate over the cluster IP
3. NodePort
	1. A cluster IP is created internally + a higher number port is exposed out (30000 to 32767) - required to test or debug as well
		1. A number is automatically assigned or
		2. We can pick a port number
4. Service config file:

		apiVersion: v1
		kind: Service
		metadata:
			name: webservicersvc
		spec:
			type: NodePort # cluster IP or Load balancer, ...
			ports:
				- port: 80 # target port (default as well if not specified)
				  protocol: TCP
			selector:
				app: httpd
				
5. LoadBalancer Service type:
	1. The service is exposed using cloud provided load balancers (AWS, Azure, ...)
	2. This is built over NodePort & Cluster IP
		1. NodePort is built over Cluster IP (internal load balancing will be handled by NodePort)
	3. For load balancer, NodePort and Cluster IP are automatically defined
	4. Example: AWS ELB
	5. Outside: Balances load across worker nodes
	6. Steps:
		1. Once NodePort and Cluster IP are created, an asynchronous call to cloud provider (tells we are ready and load balancing can be done)
		2. NodePort is used after service type (if nothing happens)
6. Two more types are used:
	1. External Name
		1. No NodePort or Cluster IP are created
		2. It gives an alias to external service that is available outside the cluster
			1. It gives an impression to the containers within the cluster that that service is part of the cluster (like a proxy)
				1. Can be mapped to cluster worker nodes
	2. Ingress (it is not service type but type of its own)
		1. It allows us to expose multiple containers (thousands or hundreds of pods)
		2. It allows us to expose lower number ports (8080 or 80) (instead of higher number ports like 30000 ...)
7. Service object:
	1. Types

### Construct Service ###
1. webserver-svc.yml

		apiVersion: v1
		kind: Service
		metadata:
			name: webserver-service
		spec:
			type: NodePort # clusterIP is default
			selector:
				app: httpd # pod label should match
				ports:
					- nodePort: 30123 # service exposed on this port - we need to change if not available
					  port: 80 # port of pod - default
					  targetPort: 80 # redirected to this from port
					  
	1. `kubectl get services` **(M)** - no services yet
	2. `kubectl create -f webserver-svc.yml`
	3. `kubectl get services`
		1. cluster-ip - can be used for internal access
		2. 80:30123
		3. Accessing: `minikube service webserver-service` - launches on web browser
			1. Gives cluster IP - accessible outside (last value gets incremented on delete)
			2. `curl http://<cluster-ip>:30123`
			3. From outside: http://ec2-34-210-141-228.us-west-2.compute.amazonaws.com:30123
			4. `minikube ip` **(M)**

### Load Balancing ###
1. Service is responsible for load balancing across pods (2 pods)
	1. `kubectl get pods`
	2. `kubectl get services`
2. `kubectl exec -it <pod-name> -- bash`
3. `cd htdocs`
4. `cat index.html`
	1. Change contents: `echo "<b>Kube rocks<b>" > index.html`
	2. `cat index.html`
5. Refresh - takes time to load balance
	1. Round robbin is used (after few number of requests)
6. Cluster IP can be used to communicate withing cluster
	1. Another approach: Service name can be used: `webserver-service`
		1. Product service
		2. Coupon service
	2. Port numer: internal port (not high port)

### Status in YAML ###
1. Status section: added by kubernetes at runtime
2. `kubectl get deployments` **(M)**
3. `kubectl get deployment mywebserver -o yaml` **(M)** [`deploy` can be used]
4. `status` section:
	1. `readyReplicas` - if this goes down, it is brought back to `replicas` number
	2. `replicas`
5. `kubectl get deployment mywebserver -o json` **(M)**
6. `minikube dashboard`
	1. http://ec2-34-210-141-228.us-west-2.compute.amazonaws.com:33391/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/
	2. Click on elipses > Edit
		1. YAML
		2. JSON

### Rolling Updates ###
1. Deployments can be used to update applications with zero downtime
	1. Example: updating httpd version
		1. Kubernetes uses two strategies:
			1. Recreate - Destroys all pods and pods are re-created
				1. Not zero downtime
					1. Brings down all of them
				2. Use-case
					1. We cannot run two versions of microservices on the cluster at the same time
			2. RollingUpdate - Nothing is stopped and zero downtime
				1. Older versions of the applications or pods will be up and running while update happens
					1. New pod is created
					2. Old pods are not brought down
					3. Update happens
				2. Configuration: How it should happen
					1. `maxUnavailable` - Tell kubernetes how many of the pods can go unavailable
						1. If 100 pod cluster and if max unavailable is 60 then kubernetes will bring down 60 pods and updates
						2. As number increases, older pods are destroyed (clients can still access old pods)
					2. `maxSurge` - Tell kubernetes how many new pods it has to start as soon as update is executed
						1. If 100 pods and max surge is 40, kubernetes will add 40 new pods (total will be 140) slowly when new pods are up, kubernetes will destroy old pods and finally the new pods will reach 100 and old pods are destroyed

### Rolling Updates in Action ###
1. webserver.yml

		spec:
			replicas: 10
			strategy:
				type: RollingUpdate
				rollingUpdate: 
					maxSurge: 3
					maxUnavailable: 4
					...
					image: httpd:2
					
2. `kubectl get deployments`
3. `kubectl delete deployment mywebserver`
4. `kubectl create -f webserver.yml`
5. `kubectl get pods`
6. `kubectl get deployments` - shows how many have come up
7. `kubectl replace -f webserver.yml` **(M)**
8. `kubectl get pods` - shows status
9. `kubectl describe deployment mywebserver`

### Rollbacks ###
1. `kubectl rollout history deployment` **(M)**
	1. 2 versions are shown
		1. Kubernetes maintains deployment versions (rollout history)
			1. We can go back to previous version
	2. `kubectl rollout history deployment mywebserver --revision=2` - shows changes
	3. `kubectl rollout history deployment mywebserver --revision=1`
		1. `deployment` - object we want to work with
		2. `mywebserver` - which deployment
	4. `kubectl rollout undo deployment mywebserver --to-revision=1` **(M)**
		1. If `--to-revision` is not mentioned, it goes back to previous version
		2. `kubectl rollout --help`
2. History is maintained for:
	1. deployments
	2. daemonsets
	3. statefulsets
3. Commands:
	1. `history`
	2. `pause`
	3. `restart`
	4. `resume`
	5. `status`
	6. `undo`

### Manual Scaling ###
1. `kubectl get deployments`
2. `kubectl scale deployment mywebserver --replicas=20` **(M)**
3. `kubectl get deployments`
4. `kubectl scale deployment mywebserver --replicas=8`
5. `kubectl get deployments`
6. Auto-scaling is also possible based on different parameters

## Kubernetes Volumes ##
### Volumes ###
1. If a docker container is deleted and if it were using some data or files, all the files will be lost
	1. Next container will not have that data
2. Volume:
	1. Kubernetes: Connection is between container and pod
		1. Each container gets a space in pod (`/config/data`) and it is mounted in the container
			1. `/etc/config`
		2. Other containers on the pod can exchange data with any other containers on the pod
3. Volume is declared at Pod level
	1. Once defined, it is mounted on container
4. Different types of volumes are supported
	1. `emptyDir` - some space on pod - all containers in the pod can use this space (mounted to any folder)

			spec:
				containers:
					...
					volumeMounts:
						- name: demoval
						  mountPath: /data
				volumes:
					- name: demoval
					  emptyDir: {}
	
	2. `nfs` - network file system
		1. It can be anywhere on the network (not just on pod)
			1. Does not die with the pod
			2. Use case: If we want to pre-populate data in our application
	3. `hostPath` - similar to docker volume
		1. container data will live on node (machine) on which pod is running (good for dev but not for production - because nfs can be used in production)
	4. There are many other types: Kubernetes documentation
		1. AWS EBS
		2. AzureDisk
		3. ...
	4. Config Map and Secret (both live on kubernetes cluster)
		1. Two other types of objects in kubernetes
			1. Config Map: configuration information for our application (internally it is also a volume)
				1. It has it's own yaml file
				2. It is used to define any number of key-value pairs (passwords, database info, ...) - can be stored along with other files in git

						apiVersion: v1
						kind: ConfigMap
						metadata:
							name: demo-configmap
						data:
							initdb.sql:
								select * from product;
								create table coupon();
							keys:
								123j324jk3jkl32j5343lj
								klasjgjlasfklsdfklsjglsf
								
			2. Secret: Used to store secret information (this is also a volume internally)
				1. Passwords for kubernetes apps or microservice apps

### Mount Volumes ###
1. Define volumes:

		spec:
			replicas: 2
			...
			template:
				...
				spec:
					containers:
					...
						volumeMounts: # mounted to this container
							- name: demovol
							  mountPath: /data # to which mount path on container - can be any folder
					volumes: # can be before containers as well (all containers can use it in the pod
						- name: demovol
						  hostPath:
						  	path: /data
						  	type: Directory # or file
						  	
2. `kubectl delete deployment mywebserver`
3. `kubectl create -f webserver.yml`
4. Another terminal:
	1. `minikube ssh` - taken to minikube node - where pods are running
		1. All folders of pods are here
5. `kubectl get pods`
6. `kubectl exec -it <pod-name> -- bash`
7. `ls`
8. `cd /data`
9. `touch index.html`

### Use ConfigMaps ###
1. `demo-config-map.yml`

		apiVersion: v1
		kind: ConfigMap
		metadata:
			name: demo-configmap
		data: # instead of spec
			initdb.sql: # key - next is value
				select * from product; # for database
				create table coupon();
			keys:
				123k24123kj14jk12k23kj
				lsdkgjksjgkljdkfjlfjjlk
				
2. `webserver.yml`

		...
		containers:
			...
			volumeMounts:
				...
				- name: demo-configmap-vol # mounted as volume
				  mountPath: /etc/config
		volumes:
			- name: demovol
			...
			- name: demo-configmap-vol
			  configMap:
			  	name: demo-configmap # should match configmap in yml
			  	
	1. `kubectl delete deployment mywebserver`
	2. `kubectl create -f demo-config-map.yml`
	3. `kubectl get configmaps` **(M)**
	4. `kubectl create -f webserver.yml`
	5. `kubectl exec -it <pod-name> -- bash`
	6. `ls /etc/config`
		1. `initdb.sql`, `keys` - keys and values are available as files
		2. `cat initdb.sql`
3. Used for initializing database

### Secrets ###
1. They store sensitive info: username, password, tokens to connect to other servers, ...
2. `demo-secret.yml`

		apiVersion: v1
		kind: Secret
		metadata:
			name: demo-secret
		type: Opaque
		data:
			userName:
				YmhhcmF0aAo=
			password:
				YmhhcmF0aAo=
				
	1. Kubernetes stores the sensitive information inside `tmpf`s (temporary folders) - not on particular node
		1. It is made available only when a pod requests for it
			1. When pod is done with the secret, kubernetes will delete that secrets from node
3. Types of secrets:
	1. `Opaque` - arbitrary key value pairs (unstructured)
	2. `kubernetes.io/service-account-token` - kubernetes auth token
	3. `kubernetes.io/dockercfg` - Docker registry auth - to connect to registry
	4. `kubernetes.io/dockerconfigjson` - Latest Docker registry auth
4. Value is base64 encoded

### Using Secrets ###
1. `demo-secret.yml`

		apiVersion: v1
		kind: Secret
		metadata:
			name: demo-secret
		type: Opaque # arbitrary data
		data:
			userName:
				YmhhcmF0aAo=
			password:
				YmhhcmF0aAo=
				
	1. from commandline: `echo "bharath64" | base64` **(M)**
2. `kubectl create -f demo-secret.yml`
3. `kubectl get secret`
	1. Kubernetes also has a secret
4. Mount secret as a volume:

			volumeMounts:
				...
				- name: my-secret
				  mountPath: /etc/mysecrets
		volumes:
			...
			- name: my-secret
			  secret:
			  	secretName: demo-secret # should match the name in demo-secret.yml
			  	
	1. `kubectl create -f demo-secret.yml`
	2. `kubectl delete -f webserver.yml`
	3. `kubectl create -f webserver.yml`
	4. `kubectl get pods`
	4. `kubectl exec -it <pod-name> -- bash`
	5. `cd /etc/mysecrets`
	6. `cat userName`
		1. `bharath`
	7. `cat password`
		1. `bharath`

### Persistent Volumes ###
1. Topics:
	1. PersistentVolume
	2. PersistentVolumeClaim
2. If we want storage beyong lifecycle of a pod or nodes in the cluster, then we use can use persistent volume
	1. PersistentVolume: It is a space at cluster level
		1. A pod that wants to use it, can request for it through a PersistentVolumeClaim
3. Every microservice deployed can request for certain amount of space from persistence volume through persistent volume claim
	1. There can be multiple persistent volumes and multiple pods can have a claim on a single pesistent volume
4. Lifecycle of PV: As long as the cluster lives
5. Steps:
	1. Creation of persistent volume - certain space on cluster (a resource)
		1. Example: demo-persistent-volume.yml

				apiVersion: v1
				kind: PersistentVolume
				metadata:
					name: demo-persistent-volume
				spec:
					capacity:
						storage: 128M
					accessModes:
						- ReadWriteOnce # how the volume can be accessed
					hostPath:
						path: /data/demo-persistent-volume # where data is stored - on minikube, aws or azure storage can also be used - Read through documentation (configured by admins)
						
			1. Access Modes:
				1. `ReadWriteOnce` - only one node in the cluster can read and write to this volume (?)
				2. `ReadOnlyMany` - any number of nodes in the cluster can read only
				3. `ReadWriteMany` - any number of nodes can read and write to the allocated space at cluster level
	
	2. Creation of persistent volume claim - request for whatever space is required through this (a resource)
		1. Example: demo-persistent-volume-claim.yml

				apiVersion: v1
				kind: PersistentVolumeClaim
				metadata:
					name: demo-pvc
				spec:
					resources:
						requests:
							storage: 64M # out of 128M
					accessModes:
						- ReadWriteOnce

			1. Once it's job is done, the space (64M) is freed up automatically
	
	3. Mount the volume claim (just like any other volume)
		1. webserver.yml

				containers:
					...
					volumeMounts:
						...
						- name: demo-pvc
						  mountPath: /data/clustervol
				volumes:
					...
					- name: demo-pvc
					  persistentVolumeClaim:
					  	claimName: demo-pvc # should match the one in demo-persistent-volume-claim.yml 

### Construct PV ###
1. demo-persistent-volume.yml

		apiVersion: v1
		kind: PersistentVolume
		metadata:
			name: demo-persistent-volume
		spec:
			capacity:
				storage: 128M
			accessModes: # gives a list of access modes supported and access claim can select one or more from the list
				- ReadWriteOnce # only to one node
			hostPath: # where should volume be stored in minikube cluster, storage classes can be used based if admins have configured storage
				path: /data/demo-persistent-volume
				
	1. `kubectl get pv` **(M)** - no resources
	2. `kubectl create -f demo-persistent-volume.yml`

### Construct PVC ###
1. demo-persistent-volume-claim.yml

		apiVersion: v1
		kind: PersistentVolumeClaim
		metadata:
			name: demo-pvc
		spec:
			resources:
				requests:
					storage: 64M
			accessModes:
				- ReadWriteOnce # This is the only one supported by PV in this case

	1. `kubectl get pvc` **(M)** - no resources
	2. `kubectl create -f demo-persistent-volume-claim.yml`
	3. `kubectl get pvc`
		1. Standard storage class (admins can use different kinds of storage classes)

### Mount PVC ###
1. webserver.yml

		containers:
			...
			volumeMounts:
				- name: demo-pod-pvc
				  mountPath: /data/clustervol # cluster lifetime is indicated
		volumes:
			...
			- name: demo-pod-pvc
			  persistentVolumeClaim:
			  	claimName: demo-pvc # should match the name in demo-persistent-volume-claims.yml
			  	
	1. `kubectl delete -f webserver.yml`
	2. `kubectl create -f webserver.yml`
	3. `kubectl get pv`
		1. Shows allocation `default/demo-pvc`
	4. `kubectl get pvc`
	5. `kubectl delete all --all` - delete everything
	6. `kubectl get pv` - pv and pvc still exist (because cluster still exists)

## Deploy Microservices to Kubernetes ##
### Introduction ###
1. Steps:
	1. MySQL deployment
		1. Mounting volumes
			1. automatically executes sql inside folder
				1. ConfigMap is used
	2. MySQL Service
		1. Exposed on NodePort
	3. Coupon deployment
		1. Pulling image from docker hub
	4. Coupon service
		1. Exposed on NodePort
	5. Product deployment
		1. Pulling image from docker hub
	6. Product service
		1. Exposed on NodePort

### How Applications on the Cluster Communicate ###
1. Communication: (same names can be used and internal ports can be used)
	1. application.properties
		1. docker-mysql:3306
		2. coupon-app:9091
		3. product-app:9090
	2. Internally, service names can be used to communicate

### Construct DB Deployment ###
1. kubernetes/microservices/docker-mysql-deployment.yml

		apiVersion: apps/v1
		kind: Deployment
		metadata:
			name: docker-mysql
			labels:
				app: docker-mysql
		spec:
			replicas: 1
			selector:
				matchLabels:
					app: docker-mysql
			template:
				metadata:
					labels:
						app: docker-mysql
				spec:
					containers:
						- name: docker-mysql
						  image: mysql
						  env:
						  	- name: MYSQL_DATABASE
						  	  value: mydb
						  	- name: MYSQL_ROOT_PASSWORD
						  	  value: test1234
						  	- name: MYSQL_ROOT_HOST
						  	  value: '%'

### Construct ConfigMap ###
1. kubernetes/microservices/docker-mysql-configmap.yml

		apiVersion: v1
		kind: ConfigMap
		metadata:
			name: mysql-initdb-config
		data:
			initdb.sql:
				use mydb;
				
				create table product(
				id int AUTO_INCREMENT PRIMARY KEY,
				name varchar(20),
				description varchar(100),
				price decimal(8,3) 
				);
				
				create table coupon(
				id int AUTO_INCREMENT PRIMARY KEY,
				code varchar(20) UNIQUE,
				discount decimal(8,3),
				exp_date varchar(100) 
				);

### Mount Volumes ###
1. docker-mysql-deployment.yml

		template:
			...
			spec:
				volumes:
					- name: mysql-initdb-vol
					  configMap: 
					  	- name: mysql-initdb-config
				containers:
					...
						volumeMounts:
							- name: mysql-initdb-vol
						 	  mountPath: /docker-entrypoint-initdb.d
						  
2. docker-mysql-service.yml

		apiVersion: v1
		kind: Service
		metadata:
			name: docker-mysql
			labels:
				app: docker-mysql
		spec:
			selector:
				app: docker-mysql
			type: NodePort
			ports:
				- port: 3306
				  targetPort: 3306
				  nodePort: 30287

### Deploy and Test DB ###
1. `minikube stop`
2. `minikube delete` - clusters are deleted
3. `minikube start` - starts fresh cluster
4. `kubectl create -f docker-mysql-configmap.yml,docker-mysql-deployment.yml,docker-mysql-service.yml` **(M)**
5. `minikube ip`
6. `kubectl get configmaps`
7. `kubectl get pods`
8. `kubectl get service`
9. `kubectl get deployments`
10. `kubectl get pods`
11. Go to MySQL Workbench: 
	1. microservicemysql
	2. <minikube-ip>
	3. <high-port>
	4. password: test1234
	5. `use mydb;`
	6. `select * from product;`
	7. `select * from coupon;`

### Construct Coupon and Product YAMLs ###
1. coupon-service-deployment.yml

		apiVersion: apps/v1
		kind: Deployment
		metadata:
			name: coupon-app
			labels:
				app: coupon-app
		spec:
			replicas: 1
			selector:
				matchLabels:
					app: coupon-app
			template:
				metadata:
					name: coupon-app
					labels:
						app: coupon-app
				spec:
					containers:
						- name: coupon-app
						  image: bharatht19/couponservice
						  
2. coupon-service-svc.yaml

		apiVersion: v1
		kind: Service
		metadata:
			name: coupon-app
			labels:
				app: coupon-app
		spec:
			type: NodePort
			ports:
				- port: 9091
				  targetPort: 9091
				  nodePort: 30288
			selector:
				app: coupon-app
				
3. product-service-deployment.yml

		apiVersion: apps/v1
		kind: Deployment
		metadata:
			name: product-app
			labels:
				app: product-app
		spec:
			replicas: 1
			selector:
				matchLabels:
					app: product-app
			template:
				metadata:
					name: product-app
					labels:
						app: product-app
				spec:
					containers:
						- name: product-app
						  image: bharatht19/productservice

4. product-service-svc.yml

		apiVersion: v1
		kind: Service
		metadata:
			name: product-app
			labels:
				app: product-app
		spec:
			type: NodePort
			ports:
				- port: 9090
				  targetPort: 9090
				  nodePort: 30289
			selector:
				app: product-app

### Deploy Product and Coupon Apps ###
1. `kubectl create -f coupon-service-deployment.yml,coupon-service-svc.yml,product-service-deployment.yml,product-service-svc.yml`
2. `kubectl get deployments`
3. `kubectl get pods`
4. Give it time to start the applications

### Test ###
1. `kubectl get pods`
2. PostMan: http://<minikube-ip>:30288/couponapi/coupons
3. PostMan: http://<minikube-ip>:30289/productapi/products
4. Retrieval: GET: http://<minikube-ip>:30288/couponapi/coupons/SUPERSALE
5. `kubectl get deployments`

## Eclipse JKube Quick Start ##
### Introduction ###
1. Eclipse JKube plugin
	1. Spring boot application can be deployed to kubernetes cluster without writing a single line of code (no dockerfile or yaml)
	2. pom.xml

			...
			<properties>
				<jkube.enricher.jkube-service.type>NodePort</jkube.enricher.jkube-service.type> <!-- yaml files will use nodeport instead of cluster ip -->
			</properties>

			<build>
				<plugins>
					...
					<plugin>
						<groupId>org.eclipse.jkube</groupId>
						<artifactId>kubernetes-maven-plugin</artifactId>
						<version>1.0.0-alpha-4</version>
					</plugin>
				</plugins>
			</build>
			
		1. `mvn k8s:build k8s:resource k8s:apply k8s:log k8s:debug`
			1. `k8s:build`: A docker image gets created on the fly
				1. `application.properties` - are scanned
			2. `k8s:resource`: All yaml files are generated to deploy the application (pods and services) on kubernetes cluster
			3. `k8s:apply`: application is deployed on kubernetes cluster
			4. `k8s:log`: tails log
			5. `k8s:debug`: to debug onto application from within ide
2. Search for JKube plugin
	1. Docs
	2. Demos
	3. Community
	4. Gitter - post problems
3. Eclipse JKube internally supports 3 types of configuration: (Opinionated defaults are used - can be changed using xml in pom.xml)
	1. Zero configuration
	2. XML configuration
	3. Fragments and Our Own Docker files (the fragments can be placed in certain folders in the project and jkube can automatically read the fragments which can be used to control how the docker files are going to be generated and how kubernetes yaml files are generated)

### Generate Docker Image ###
1. New > Spring Boot Project
	1. jkube-demo
	2. spring-web dependency
	3. Finish
2. New class: JKubeController.java

		@RestController
		public class JKubeController {
		
			@GetMapping("/hello")
			public String hello() {
				return "JKube is cool!";
			}
			
		}
		
3. pom.xml

		<plugin>
			<groupId>org.eclipse.jkube</groupId>
			<artifactId>kubernetes-maven-plugin</artifactId>
			<version>1.0.0-alpha-4</version> <!-- Go to: https://mvnrepository.com/artifact/org.eclipse.jkube/jkube for latest version -->
		</plugin>

4. Download resource for commands and info
5. `cd jkubedemo/`
6. `mvn clean install`
7. `mvn k8s:build` **(M)**
	1. `docker images`
8. `docker login`
9. We can tag and push to docker repo

### Deploy to Kubernetes ###
1. `minkube status`
2. `kubectl get pods`
3. `eval $(minikube -p minikube docker-env)` **(M)**
	1. This will start using docker daemon on the minikube
	2. `docker images` - shows images on minikube (not on local machine)
4. `mvn k8s:resource` - kubernetes resources are generated
	1. devops/jkubedemo/target/classes/META-INF/jkube/kubernetes/jkubedemo-deployment.yml
	2. devops/jkubedemo/target/classes/META-INF/jkube/kubernetes/jkubedemo-service.yml
	3. We can make copy and make changes or we can add xml based config in pom.xml
5. If port is changed in application.properties - it will be scanned and changed in service.yml
6. `mvn k8s:apply` - applies files to minikube kubernetes cluster
7. `kubectl get pods`
	1. New pod is launched
8. `kubectl get services`
	1. Cluster IP is used by default
	2. `minikube ssh`
		1. `curl <cluster-ip>:8080/hello`

### Use NodePort ###
1. pom.xml

		<properties>
			...
			<jkube.enricher.jkube-service.type>NodePort</jkube.enricher.jkube-service.type>
		</properties>
		
2. `mvn k8s:undeploy` **(M)** - will cleanup deployment
3. `mvn k8s:resource`
4. `mvn k8s:apply`
5. `minikube ip`
	1. `kubectl get svc`
		1. Grab the NodePort higher order port number
	2. `curl http://<minikube-ip>:<high-order-port>/hello`

### Logs and Debugging ###
1. `mvn k8s:debug` - starts services and pods in debug mode
	1. Enables port forwarding on 5005
2. `kubectl get svc` - node port might have changed
3. IDE: Debugger > Debug Configurations > Remote Java Application > +
	1. JKubeDebug
	2. Product: jkubedemo
	3. Host: localhost
	3. Port: 5005
		1. `mvn k8s:debug -Djkube.debug.port=8000` can be used to change the debug port
	4. Debug
	5. Place a breakpoint in java file
	6. `minikube ip`
	7. `curl http://<ip>:<node-port>/hello` - goes to IDE and stops at the breakpoint
4. We are able to debug the application that is running in kubernetes cluster
5. `mvn k8s:log` - fetches spring-boot log from within kubernetes cluster
	1. Same log that we see on IDE console for spring boot app
		1. Opens in tail mode - keeps generating logs

## Docker Swarm ##
### Introduction ###
### How Swarm Works ###
### Architecture ###
### Construct EC2 Instances ###
### Setup Swarm ###
### Add Another Manager ###
### Construct a Service ###
### Multiple Replicas and Scaling ###
### Update and Rollback ###
### Drain Worker Node ###
### Docker Stack Deploy ###
### Stack Deploy ###
### Remove Worker Node ###
### Switch Managers ###
### Replicas in the Swarm ###

## Jenkins: Continous Deployment ##
### Jenkins Introduction ###
1. CI/CD tool -> It is now a continuous delivery framework
	1. Tasks that can be done:
		1. Code and Commit
			1. GitHub
			2. SVN
		2. Build and Configuration
			1. Maven
			2. Gradle
			3. Ant
			4. Docker
		3. Testing
			1. Junit
			2. Sonar
			3. Selenium
			4. Cucumber
		4. Release
			1. XL Release
			2. uDeploy
			3. UrbanCode
		5. Deploy - plugins
			1. AWS
			2. GCP
			3. Web Logic
			4. OpenStack
			5. ...
2. It is very light weight to start with but pugins add functionality
	1. Comes up on Apache Tomcat on port 8080

### Jenkins Prerequisites ###
1. AWS EC2 Linux Instance:
	1. Launch Instance
	2. amazon - AWS command line tools, Python, ...
	3. Review and Launch
	4. Name: Linux
	5. Install maven and construct project on Linux
		1. Commands:
			1. Java:
				1. `wget https://download.java.net/java/GA/jdk15.0.2/0d1cfde4252546c6931946de8db48ee2/7/GPL/openjdk-15.0.2_linux-x64_bin.tar.gz`
				2. `tar xvfz openjdk-15.0.2_linux-x64_bin.tar.gz`
				3. `vi ~/.bashrc`
				
						export JAVA_HOME=/home/ec2-user/openjdk-15.0.2
						export PATH=$JAVA_HOME/bin:$PATH
						
				4. `source ~/.bashrc`
				5. `java -version`
			2. Maven:
				1. `wget https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz`
				2. `tar xvfz apache-maven-3.6.3-bin.tar.gz`
				3. `vi ~/.bashrc`
				
						export MAVEN_HOME=/home/ec2-user/apache-maven-3.6.3
						export M2_HOME=$MAVEN_HOME
						export PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH
						
				4. `source ~/.bashrc`
				5. `mvn -v`
			3. `mvn archetype:generate -DgroupId=com.bharath -DartifactId=java-project -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false`
				1. Paste the following in pom.xml

						<project>
							...
							<build>
							    <plugins>
							      <plugin>
							        <artifactId>maven-compiler-plugin</artifactId>
							        <configuration>
							          <source>1.8</source>
							          <target>1.8</target>
							        </configuration>
							      </plugin>
							    </plugins>
							</build>
						</project>
						
				2. `mvn clean install`
				
			4. `mvn archetype:generate -DgroupId=com.bharath -DartifactId=java-web-project -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false`

### Setup Jenkins ###
1. Connect to Linux instance
2. `sudo -i`
3. Pre-requisite: JDK
4. Commands:

		sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
		sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
		sudo yum upgrade
		sudo yum install jenkins java-1.8.0-openjdk-devel
		sudo systemctl daemon-reload
		sudo systemctl start jenkins
		sudo systemctl status jenkins

		cat /var/lib/jenkins/secrets/initialAdminPassword
		
		service jenkins start
		
		yum remove jenkins
		
		rm -rf /var/lib/jenkins # settings are stored here - clean this folder if you remove jenkins (outdated settings)
		
		Java Path:
		
		/lib/jvm/java-1.8.0-openjdk-1.8.0.242.b08-0.amzn2.0.1.x86_64
		
		Maven Path:
		
		/usr/share/maven
		
		Git Path:
		
		/usr/bin/git
		
		Assign Root User and Permissions:
		
		vi /etc/sysconfig/jenkins
		
		chown -R root:root /var/lib/jenkins
		chown -R root:root /var/cache/jenkins
		chown -R root:root /var/log/jenkins
		
		# service jenkins restart
		
		Tomcat Installation and Integration:
		
		yum install tomcat
		
		yum install tomcat-webapps tomcat-admin-webapps 
		
		vi /usr/share/tomcat/conf/tomcat-users.xml
		
		Uncomment Admin roles and user and Add:
		
		<user username="deployer" password="deployer" roles="manager-script" />
		
		Deploy war/ear to a container:
		
		**/java-web-project.war

	1. Open port 8080 for connecting to Jenkins
	2. Open: http://<dns-name>:8080
	3. Copy the default password from `/var/lib/jenkins/secrets/initialAdminPassword` and paste to unlock Jenkins
	4. Install suggested plugins
	5. `mvn -version`
		1. Java home: we need this path in jenkins
	6. First admin user:
		1. username: admin
		2. password: admin
		3. Full name: admin
		4. E-mail address: admin@admin.com
	7. Save and Finish
	8. Start using Jenkins

### Jenkins Dashboard ###
1. New Item
	1. New job
2. People
	1. More users can be added
		1. Permissions can be managed
3. Build History
	1. History of jobs
		1. Failed or succeeded jobs
4. Manage Jenkins
	1. Configuration system
		1. Home directory: /var/lib/jenkins - jobs, config info
		2. Plugins are also displayed - configuration
	2. Configure Global Security
	3. Configure Credentials - username password
	4. Global Tool Configuration - java, maven, ...
		1. Add JDK
			1. Install automatically
			2. Java home: /lib/jvm/...
		2. Git: /usr/bin/git
		3. Maven: MAVEN_HOME: /usr/share/maven
	5. Roload Configuration from Disk - sync up config from local disk
	6. Manage plugins
		1. updates - check now
		2. Available - select and install
			1. Install without restart
		3. Installed plugins
		4. Advanced
			1. Proxies
			2. Own plugin uploads
5. My Views
	1. We can configure the jobs that we want to see
	2. New view:
		1. View name: test
		2. List View
		3. My View - current user
6. Credentials - username, password, ...
7. Lockable Resources
8. Build Queue
	1. Jobs that is executed is shown here
9. Build Executor Status - status of jobs when they are run

### Configure root User Permissions ###
1. `sudo vi /etc/sysconfig/jenkins` # when jenkins runs, it uses root user to run
	1. `JENKINS_USER="root"`
2. Change ownership to certain folders - root

		sudo chown -R root:root /var/lib/jenkins
		sudo chown -R root:root /var/cache/jenkins # cache for jenkins
		sudo chown -R root:root /var/log/jenkins # logs are stored here
		
		sudo systemctl restart jenkins

### First Job ###
1. Shell script:
	1. EC2 instance: hello.sh

			echo "Hello Jenkins!!"
			
	2. `chmod +x ./hello.sh`
	3. `./hello.sh`
2. New Item:
	1. Item name: firstjob
	2. Freestyle project
	3. Options:
		1. Source Code Management
			1. Git or SVN
		2. Build Triggers
			1. Poll
			2. ...
		3. Build Environment
		4. Build
			1. Execute Shell
			2. Command: /root/hello.sh
		5. Save
	4. Workspace - no jobs are builds
	5. Hit play button
		1. Blue - success
		2. Click
			1. Console output
				1. `/var/lib/jenkins/workspace/firstjob`
	6. Click on job
		1. Configure
			1. Configuration screen
			2. Post Build Actions
				1. After build completes
		2. Workspace
			1. browse
			2. Wipe Out Current Workspace

### Configuring a Maven Project ###
1. New item
	1. javaproject
	2. Free Style
	3. Build
		1. Invoke top-level Maven targets
			1. Select maven
			2. Goals: clean install
			3. Advanced
				1. POM: /root/java-project/pom.xml
		2. Save
	4. Build Now
		1. Click on the arrow
		2. Console Output
			1. `/usr/share/maven/bin/mvn -f /root/java-project/pom.xml clean install`

### Assignment - Buid a Maven Web Project ###
1. `java-web-project`

### Work with GIT Repo ###
1. Pull project from Github and build it
	1. Push `java-project` to Github
2. New item:
	1. githubjavamavenproject
	2. Select: maven project
	3. Source Code Management
		1. Git
			1. Grab URL from Github
				1. Hit tab - Jenkins verifies the repo (`git` command is executed internally)
			2. Branch - */master
				1. We can add more branches
	4. Select Build
		1. Root POM: pom.xml
		2. Goals and options: clean package
	5. Save
3. Build Now
4. Console Output
	1. Git commands are executed and project is pulled

### Build Triggers ###
1. Automation:
	1. Select project:
		1. Configure
			1. Build Triggers
				1. Build whenever a SNAPSHOT dependency is built
					1. When SNAPSHOT versions of dependent projects are built, this project will be built
						1. Click on ? - to see more information
				2. Tirgger builds remotely
					1. Authentication token - used to trigger jenkins jobs remotely (from another machine, shell script, ...)
				3. Build after other projects are built
					1. Build this project when another project is built
						1. Upstream and downstream projects can be defined using **Project Relationship**
							1. This project is built after upstream project is built
					2. Projects to watch - select project to build after
						1. Trigger only if build is stable (continuosly building successfully)
						2. Trigger even if the build is unstable (once in a while there are failures)
						3. Trigger even if the build fails
				4. Build periodically
					1. Schedule: * * * * *
						1. Hit tab - every minute
							1. Minutes Hours Day Month-of-year Day-of-Week
								1. Minutes - minutes within the hour (0 - 59)
								2. Hour - hour of the day (0 - 23)
								3. DOM - day of the month (1 - 31)
								4. Month - month (1 - 12)
								5. DOW - day of the week (0 - 7) where 0 and 7 are Sunday
						2. Wildcards: Hit ?
							1. * - every (minute, hour, ...)
							2. M - N (range)
							3. M - N / X or * / X - steps by intervals of X through the specified range of whole valid range
							4. A, B, ..., Z - enuberates multiple values
							5. @yearly, @annually, @monthy, @weekly, @daily, @midnight, @hourly - aliases
						3. Poll SCM
							1. Similar to schedule - cron job
								1. How frequently should it poll the repo
							2. If selected but value not given:
								1. No schedules so will only run due to SCN changes if triggered by a post-commit hook (Github can be configured for hooks)
									1. Can select Ignore post-commit hooks
							3. If there are changes in repo this is used

### Configure Security ###
1. More users and granting permissions
	1. Jenkins > Manage Jenkins > Manage Users
		1. Create User
			1. username: john
			2. password: john
			3. email: john@john.com
		2. Can delete users
	2. Jenkins > Manage Jenkins > Configure Global Security
		1. Authentication:
			1. Security Realm - Jenkin's own user database (default) (select Allow users to sign up)
				1. Other options:
					1. LDAP
					2. Unix user/ group database
					3. None
				2. Delegate to servlet container
					1. Tomcat - tomcatusers.xml - users can be configured here
		2. Log out
	3. create an account - link
		1. bob
		2. bob
		3. bob@bob.com
		4. bob
		5. Create an account
			1. Logs in as bob
		6. Jenkins > Manage Jenkins > Configure Global Security
			1. Authorization
				1. Different options
					1. Anyone can do anything
					2. Legacy mode
					3. Logged-in users can do anything
					4. Matrix-based security - default
						1. Roles - columns
						2. Rows - users
							1. Authenticated Users - Anything (default)
								1. Uncheck
							2. Point at the options to read more about it
				2. Columns
					1. Overall
					2. Credentials
					3. Agent
					4. Job
					5. Run
					6. View
					7. SCM Lockable Resources
			2. Add user group...
				1. admin - first option (anything)
					1. click on x to remove
			3. Add user - john
				1. Overall - read (agent, job, ...)
			4. Save
				1. Bob has no permissions
			5. Log in as admin
				1. Add user or group...
					1. bob
					2. overall - create
			6. Log-in as John
				1. Only read (limited options)

### Understanding Deployment ###
1. Deploy app to apache tomcat
	1. Launch EC2 instance
	2. Install Tomcat on EC2
	3. Add a deployment user - in admin console
	4. Install deployment plugin in Jenkins (to deploy on Tomcat)
		1. Tomcat URL
2. CI in action

### Tomcat Installation and Configuration ###
1. Commands:

		Tomcat Installation and Integration:

		yum install tomcat
		
		yum install tomcat-webapps tomcat-admin-webapps
		
		vi /usr/share/tomcat/conf/tomcat-users.xml
		
		Uncomment Admin roles and user and Add:
		
		<user usernmae="deployer" password="deployer" roles="manager-script"/>
		
		Deploy war/ear to a container:
		
		**/java-web-project.war
		
2. New Instance > Amazon Linux AMI > Launch
	1. Connect to it
		1. `sudo -i`
		2. `yum install java-1.8.0-openjdk-devel`
		3. `java -version`
		4. `yum install tomcat`
		5. `yum install tomcat-webapps tomcat-admin-webapps` - server web pages + admin pages
		6. `service tomcat start` **(M)**
		7. `service tomcat status` **(M)**
		7. Expose port 8080
		8. http://<dns-name>:8080
			1. Manager App - admin web application
				1. We need to add users to `tomcat-users.xml` **(M)**

### Configure Users ###
1. `vi /usr/share/tomcat/conf/tomcat-users.xml`
		1. Roles and users can be added
			1. `admin-gui`, `admin`
			2. Admin has access to all the roles
				1. uncomment `<user name="admin".../>`
					1. `password="admin"`
					2. Uncomment all the roles
		2. Add the following user:

				<user name="deployer" password="deployer" roles="manager-script"/>
				
2. Restart tomcat: `service tomcat restart`
3. Click on Manager App
	1. admin
	2. admin

### Install Deployment Plugin ###
1. Manage Jenkins
	1. Mangage Plugins
		1. Available
			1. Search for `deploy to container`
				1. Select - Install without restart
2. Dashboard
	1. New item

### Continous Integration in Action ###
1. Jenkins
	1. New Item
		1. javawebautodeploy
		2. Free style
		3. Source code management
			1. grab github url of java-web-project
			2. Add: Jenkins
				1. Github: username
				2. Github: password
			3. Select the credentials
		4. Build
			1. Add build step
				1. Invoke top-level Maven targets
					1. Maven Version: Select
					2. Goals: clean package
				2. Click on **Add post-build action**
					1. Deploy war/ear to a container (if plugin is installed)
						1. WAR/EAR: **/java-web-project.war (any folder in jenkins workspace)
						2. Context path: javawebapp (any name)
						3. Containers:
							1. Tomcat 7.x Remote
								1. Credentials: Add > Jenkins
									1. username: deployer
									2. password: deployer
									3. Add
								2. Tomcat URL: Grab the tomcat url - http://<dns-name>:8080
							2. Save
					2. Build Now
						1. Pulls project from Git
						2. Builds
						3. Deploys to Tomcat
					3. Refresh Manager Link
						1. Click on context path link: Hello World!
			2. If build fails:
				1. Add Inbound rule to tomcat instance for public and private ip addresses of jenkins instance

### Webhooks Introduction ###
1. We don't want to poll continuously (not efficient)
	1. Solution: webhooks
		1. Go to repo
			1. Settings
				1. Webhooks
					1. Add webhooks
						1. Payload URL: jenkins url (fires an event - json or x-www-form-urlencoded)
						2. This triggers a build

### GitHub Webhooks in Action ###
1. `githubjavamavenproject`
	1. Build
2. Github
	1. `javaproject`
		1. Settings:
			1. Webhooks
				1. Add webhook
					1. Payload URL: http://<dns-name>:8080/github-webhook/ (unique name at the end)
					2. Content type: application/json (or the other one) - we don't care about data here
					3. Secret - not required here (used to sign the message - using digital signature)
						1. Jenkins can verify
					4. Which events would you like to trigger this webhook?
						1. Just the push event - select this
						2. Send me everything
						3. Let me sleect individual events
							1. Can selet
					5. Add webhook
						1. Check mark should appear
3. Jenkins
	1. Project
		1. Build Triggers
			1. GitHub hook trigger for GITScm polling (checks if changes exist and pull)
				1. Save
4. Github:
	1. open pom.xml (master branch and not main branch)
		1. edit
			1. Add space
		2. Commit changes
			1. Git hook changes
	2. Go to Jenkins
		1. Build gets triggered
	3. Click on Webhook link
		1. Recent Deliveries
			1. List of triggers
				1. Payload data is shown
				2. Response - from Jenkins

### Master and Agent ###
1. If load increases or if we want to run job on a specific machine with a specific architecture or operating system
	1. Master-slave architecture (one master multiple slaves)
		1. Master pushes the builds to the agents
2. Steps:
	1. New EC2 Agent instance
	2. Configure SSH Communication (between master and slave)
	3. Configure a Node/Agent on Master
3. Another use case: When load on master is high, master automatically pushes job on agents (scalability)
4. Steps:
	1. Manage Jenkins
		1. Manage Nodes and Clouds
			1. New Node
5. If two jobs are running in parallel, one of the jobs will go to agent (example)

### Step 1: Generate the Keys on Master ###
1. SSH Key Setup
	1. `ssh-keygen` - generates key-pair
		1. `.ssh/id_rsa` - private key
		2. `.ssh/id_rsa.pub` - public key
	2. Connect to master:
		1. `ssh-keygen` **(M)**
			1. Hit enter (default location)
			2. passphrase: hit enter
			3. password: hit enter
		2. By default it uses RSA algorithm
		3. `ls /home/ec2-user/.ssh`
			1. `cat ~/.ssh/id_rsa` - copy the private key
				1. Save it in a file
			2. `cat ~/.ssh/id_rsa.pub` - copy the public key
				2. Save it in another file

### Step 2: Launch the Agent Instance ###
1. New AWS agent
	1. Launch AWS instance > Defaults
2. Connect to instance (name - jenkinsagent)
3. Connect to jenkinsagent
3. Copy public key
	1. `ls ~/.ssh/authorized_keys` - all public keys should live here to communicate with other machines
	2. `vi ~/.ssh/authorized_keys` - paste (after one line space)
4. `sudo -i`
	1. `yum install java`

### Step 3: Construct a Node Using the Agent ###
1. Jenkins > Manage Jenkins > Manage Nodes and Clouds
	1. New Node
		1. Node name: node1
		2. Permanent Agent
			1. plugins can be installed for more types of instances
		2. Ok
		3. Remote root directory: /home/ec2-user (home folder on agent)
		4. Usage: Use this node as much as possible
		5. Launch method: Launch agents via SSH
		6. Host: grab private IP of jenkins-agent
		7. Credentials: Add
			1. SSH Username with private key
			2. Username: ec2-user
			3. Private key: Enter directly
				1. Copy and paste the private key
			4. Add
		8. Select the ec2-user credential
		9. Host key verification strategy: Manually trusted key verification strategy
		10. Save
		11. Click on Node
			1. Clock on Log
2. Copy existing node - option appears for more nodes
3. Labels - used when you want to run a particular job on that node

### Step 4: Agent 007 in Action ###
1. New Item
	1. agenttest
	2. Freestyle project
	3. Build
		1. Execute shell
		
				sleep 30s
				
	4. Save
2. `firstjob`
	1. Build
		1. Execute shell

				sleep 30s
				
		2. Save
	2. Build now
3. `agenttest`
	1. Build now
4. Note: Any software dependencies that jobs require need to be installed in Jenkins agent
5. Click on Node to get more details
6. Note: If we stop and start a node, we would mostly be getting new public DNS and private IP which needs to be updated in the Jenkins master

## Jenkins Pipelines ##
### Introduction ###
1. Pipeline
	1. Repeatable, reliable automated system for getting product to production or customer quickly
		1. Example:

				Development -> Commit -> Build -> Test -> State -> Deploy Dev/QA -> Production
				
			1. Made up of multiple stages
				1. Each state is like a pipe and they are joined to construct a pipeline
2. Pipeline using `Jenkinsfile` - (Jenkins dashboard can be used to generate the code) - the following is generated by Jenkins

		pipeline{
			agent any #jenkins server decides where to run
			stages{
				stage('Build'){
					steps{
						sh "mvn clean package"
					}
				}
				stage('Deploy'){
					steps{
						deploy adapters: [tomcat7(credentialsId: '9732kldf9ulksdjf979sd', path: '',
						url: 'http://<dns-name>:8080/')],
						contextPath: 'javawebapp', war: '**/java-web-project.war'
					}
				}
			}
		}
		
	1. There can be multiple stages
	2. Each stage can have multiple steps
3. Pipeline jobs are shown in Jenkins UI

### First Pipeline ###
1. New item
	1. firstpipeline
	2. Pipeline (orchestrates long-runngin activites ...)
	3. Build Triggers
	3. Advanced Project Options
	4. Pipeline (we can select sample script)
		1. Select `Hello World`
	5. Save
2. Build Now
	1. Pipeline view
		1. Stages are shown
			1. Click on logs (Hello World!)
	2. Console output
		1. Complete output
3. Configure
	1. Pipeline
		1. Change (auto complete is avaialable)

				pipeline{
					agent any
					stages{
						stage("Hello"){
							steps{
								echo "Jenkins is Awesome!"
							}
						}
					}
				}
				
4. Build Now
	1. Open logs - Jenkins is Awesome!

### Multi Stage Pipeline ###
1. New item
	1. multistagepipeline
	2. Pipeline
	
			pipeline{
				agent any
				stages{
					stage("Checkout"){
						steps{
							echo 'Checking out'
						}
					}
					stage("Build"){
						steps{
							echo 'Build'
						}
					}
					stage("Test"){
						steps{
							echo 'Testing'
						}
					}
					stage("Deploy"){
						steps{
							echo 'Deploying'
						}
					}
				}
			}
			
		1. Build now
			1. 4 blocks are shows in the pipeline
				1. See logs for each stage
			2. Console output

### Reading Environment Variables ###
1. Jenkins environment variables - within jobs
	1. Copy Jenkins url: Paste in new tab
		1. http://<dns-name>:8080/env-vars.html (displays all variables we can use)
			1. BUILD_NUMBER
			2. BUILD_TAG
			3. BUILD_URL
			4. BRANCH_NAME
			5. ...
2. Select: multistagepipeline
	1. "Checkout"

			echo "Running ${env.BUILD_NUMBER} on ${env.JENKINS_URL}"
			
	2. Build now
	3. Check logs

### Pass Parameters to the Pipeline ###
1. Configure:
	1. Delivery Pipeline configuration
	2. Pipeline speec/durability orverride
	3. This project is parameterized (the parameters are passed at runtime when we run this job)
		1. Add Parameter
			1. Boolean Parameter (check box)
				1. name: skiptests
				2. Default Value - check (true)
				3. Go to Pipeline
					1. "Test"

							echo "${skipTests}"
							
			2. String Parameter
			3. ...
		2. Now dashboard shows: Build with Parameters
			1. Click on that
				1. Uncheck
				2. Build
			2. Check the log

### Requesting User Input ###
1. multistagepipeline
	1. Pipeline
		1. New stage

				stage("Approve Deployment"){
					steps{
						input "Deploy the application?"
					}
				}
				
			1. Click on blue box: Proceed
	2. Build now
		1. Now select: Abort

### Construct a Java Project Pipeline ###
1. Pipeline for java-project
2. New Item
	1. javaprojectpipeline
	2. Build Triggered
		1. GitHub hook trigger for GITSCM polling
	3. Pipeline: (Can select Pipeline script from SCM if required)
	
			pipeline{
				agent any
				stages{
					stage("Build"){
						steps{
							sh 'mvn -DskipTests clean package'
						}
					}
					stage("Test"){
						steps{
							sh 'mvn test'
						}
					}
				}
			}
			
		1. Copy the code
		2. Change Definition to Pipeline script from SCM
		3. Git URL (java-project)
			1. master
			2. Script Path: Jenkinsfile (copy here and commit)

### Test Pipeline ###
1. Build Now - this is necessary (Pipeline is not working otherwise)
2. Pipeline didn't need any checkout commands (done automatically)
3. Webhooks
	1. AWS Server public IP must be configured
4. Try commit in `master` branch

### Construct a Java Web Project Pipeline ###
1. Github Repo:
	1. `java-web-project`
2. New item
	1. `javawebpipeline`
	2. Build Triggers
		1. GitHub hook trigger for GITSCM polling
	3. Pipeline

			pipeline{
				agent any
				stages{
					stage('Build'){
						steps{
							sh 'mvn clean package'
						}
					}
					stage('Build'){
						steps{
							
						}
					}
				}
			}
			
		1. Click on Pipeline Syntax
			1. Snippet Generator
				1. Sample Steps
					1. deploy: Deploy war/ear to container
						1. WAR/EAR file: **/java-web-project.war
						2. Context path: javawebapp
						3. Containers: Tomcat 7.x
							1. Tomcat URL: grab the URL from previous job (or from Tomcat instance)
							2. Credentials:
								1. Select deployer
				2. Generate Pipeline Script
					1. copy the code and paste in "Deploy" step
		2. Copy the whole script
		3. Switch to **Pipeline script from SCM**
		4. Give Github URL and credentials
		4. Save
	4. Add `Jenkinsfile` in java-web-project
		1. Paste the script
		2. Commit the change

### Test Pipeline ###
1. We can undeploy javawebapp from manager console
2. Run manually first
3. Configure webhook for `java-web-project`
4. Edit `pom.xml`
5. Commit
6. Check Jenkins
	1. Automatically builds and deploys

## AWS IAM Service ##
### Introduction ###
1. Root user - has access to all the services (account that was created first)
2. For each developer, tester or devops engineer, IAM user accounts
	1. IAM: Identity and Access Management
	2. Root user can add IAM users and assign roles (permissions) to the IAM users
3. Developer, Tester and DevOps may not have access to same services
4. Go to IAM
5. Options:
	1. Users can be defined
	2. Groups of users can be defined
	3. Assign roles directly to users
	4. Assign roles to user groups
	5. Policies can be added
		1. Enables users to access certain services

### Constructing an IAM User ###
1. IAM user who will have access to only the EC2 service (no access to other services)
2. Services > IAM
	1. Users
		1. Add user
			1. username: demoiamuser
			2. Access type:
				1. Programmatic access - access key id and secret access key are generated to access AWS, API, CLI, SDK and dev tools (using programming languages)
				2. AWS Management Console access
			3. Console password:
				1. Autogenerated password
				2. Custom password: give this - test1234
			4. Require Password reset - check this
				1. When user logs in for the first time, he/ she has to change the password (or else the simple password will be used)
			5. Next - Permissions
				1. We can add user to a group (assign policies or permissions to the group) - need not assign to each user
				2. Copy permissions from existing user
				3. Attach existing policies
					1. Security policies or rules defined by AWS
					2. We can select any number of them
						1. `AmazonEC2FullAccess` - give this
							1. `AmazonEC2ReadOnlyAccess` - cannot stop, delete instances, ...
			6. Review
			7. Click on `Create user`
				1. A unique URL is generated to access console: copy the URL
					1. Open in in-cognito mode (cmd + shift + n)
					2. Paste the new URL
						1. Give: demoiamuser
						2. password: test1234
						3. new password: whatever
				2. Go to services
					1. EC2 - full access
					2. S3 - Insufficient permissions to list buckets
			8. Another policy that has got attached automatically is:
				1. `IAMUserChangePassword` - to every user

### Construct Custom Policy ###
1. Granular level:
	1. Own policies:
		1. Policies > Create Policy
			1. Visual Editor
				1. Select service
					1. EC2
				2. Actions that can be performed
					1. List - listing options (DescribeVolumes, DescribeVPC, ...) - DescribeInstances (only instance description) - select everything
					2. Read - Full read permission
					3. Tagging - give both permissions
						1. Creation of tags
						2. Deletion of tags
					4. Write - RunInstances, StartInstances
					5. Permission Management - user will be able to give permissions to other users
				3. Resources to which the policies will take effect
					1. ARN - Amazon Resource Name can be assigned to this
						1. Specific - ARN is required (only one bucket or one EC2)
						2. All resources - choose this
				4. Request conditions - The policy takes into effect this these conditions are met
					1. MFA required - To which ever user this policy is assigned, that user should have MFA (Multi Factor Authentication) enabled (Code)
					2. Source IP - User should always connect from that IP address or else the user is rejected
			2. JSON - need to know the syntax
		2. Review
		3. Create Policy
		4. Search for: demopolicy
		5. Select
		6. Attach - demoiamuser
2. Remove other policies:
	1. Go to Users
	2. demoiamuser
	3. Remove:
		1. AmazonEC2FullAccess - click on x
3. Login as demoiamuser
	1. Try to terminate an instance - not authorized to perform this operation
4. Go to demopolicy
	1. Check the JSON - auto generated

### Construct and Assign Role ###
1. Roles: Secure way to grant perisions to entities that we trust.
	1. Entities:
		1. IAM user in another account
		2. Application code running on an EC2 instance that needs to perform actions on AWS resources (EC2 instance is assigned a role with certain permissions)
		3. An AWS service that needs to act on resources in your account to provide its features
		4. Users from a corporate directory who use identity federation with SAML
	2. IAM roles issues keys that are valid for short durations (making them more secure way to grant access)
2. Create Role:
	1. EC2
	2. Permissions:
		1. AmazonS3FullAccess
		2. AmazonRDSFullAccess
	3. Review
	4. Name: EC2CustomRole
	5. Click on **Create role**
3. Create EC2:
	1. Launch Instances
	2. Pick any AMI
	3. IAM role
		1. **EC2CustomRole** - only S3 and RDS

## AWS CLI QuickStart ##
### Introduction ###
1. AWS Command Line Interface
	1. Can be used to access AWS services from comamndline
	2. Execute commands to do CRUD on services
		1. EC2
		2. S3
	3. Can be used in shell scripts or any other scripts
2. Steps:
	1. A user is required with programmatic access
		1. AWS access key
		2. Secret access key
	2. Install AWS CLI (desktop, laptop or EC2 instance)
	3. Configure and Use AWS CLI (keys)

### Construct Programmatic User ###
1. Go to IAM service
	1. Users
		1. Username: awscliuser
		2. Acces type*: Programmatic access
			1. For AWS, CLI, SDK, Dev tools
	2. Attach existing policies
		1. AmazonEC2FullAccess
		2. AmazonS3FullAccess
	3. Review
	4. Create user
	5. Copy the access key ID
	6. Copy the Secret access key

### Install and Configure CLI ###
1. Launch EC2 instance
2. Default instance
3. `sudo -i`
3. `yum install awscli` **(M)**
	1. Amazon instance already has this
4. Commands:
	1. `aws configure` **(M)**
		1. paste access key id
		2. paste secret access key
		3. Default region: can check dashboard - us-east-2
		4. Default output format: (text|json|yaml|...) json

### Run Commands ###

		aws help # to see all the aws command can do
		aws <command> help
		aws <command> <subcommand> help
		
		aws ec2 describe-instances --output table
		
		aws ec2 start-instances --instace-ids <instaceId>
		
		aws ec2 stop-instances --instance-ids <instanceId>
		
		aws ec2 run-instances --image-id <imageid> --count 1 --instance type t2.micro --key-name <keyname> --security-group-ids <your security group id here> --region <your region here>
		
		aws ec2 terminate-instances --instance-ids <instanceId>
		
		aws s3 ls
		
		aws s3 help
		
1. `--output (format)`
2. Services:
	1. Autoscaling
	2. Load balancing
	3. Cloud Formation
	4. ...
3. `aws <service-name> help`
	1. sub-commands
		1. allocate-hosts
		2. allocate-address
		3. provision and terminate instances
		4. ...
	2. `aws ec2 describe-instances help` - describes all instances
	3. `aws ec2 describe-instances --output table`
	4. `aws ec2 describe-instances --output text`
4. `aws ec2 start-instances --instance-ids <instance-id>` - multiple ids can be passed
5. `aws ec2 stop-instances --instance-ids <instance-id>`
6. `aws ec2 terminate-instances --instance-ids <instance-id>`
7. `aws s3 ls`
	1. `cp` - one bucket to another
	2. `mv` - moves from one bucket to another
	3. `rm` - removes from bucket

### Construct and Terminate EC2 Instance ###
1. Other options can be used:
2. `aws ec2 run-instances --image-id <free-tier-image-id> --count 1 --instance-type t2.micro --key-name awskeys --security-group-ids <copy-default-security-group-if-not-specified-one-is-created> --region us-east-2`
	1. `<free-tier-image-id>` - copy from dashboard
	2. `count` - 1 instance
	3. `--key-name` - don't give `.pem`
2. `aws ec2 terminate-instances --instance-ids i-06f388892f07945b2`

## Ansible-Configuration Management ##
### Introduction ###
1. It is a provisioning or configuration management tool
	1. Using it we can push softwares microservices across multiple nodes
		1. It is agentless
			1. Unlike Puppet and Cheff (which need installation of agent)
				1. We can setup ansible in master machine and execute adhoc commands using `ssh`
					1. The commands can
						1. Install software
						2. Change configuration files
						3. Copy files
						4. ...
				2. The commands can be compiled into playbooks
					1. When playbook is played, the required softwares and configuration are run on the host machines (nodes)
2. Configuration management - ensures consistency across multiple machines (softwares, configuration)
3. Mster/ Control node
	1. It controls all machines (managed nodes)
		1. Java
		2. Tomcat
		3. Node.js
		4. Express.js
		5. ...
4. Inventory - configuration file where info of all managed nodes (ip addresses, hostnames, ...) are stored
5. Modules - provided by ansible
	1. Used to perform certain tasks on host machines
		1. Copy files
			1. Files module
		2. Install software
			1. Specific modules for installation
6. Tasks:
	1. ansible master
		1. Install ansible
		2. establish ssh connection with agent
		3. Run ad-hoc commands from master to agent
		4. Define playbooks and play them
	2. ansible agent

### Master and Agent ###
1. Launch new instance
	1. Ubuntu ami
		1. Free-tier version
	2. 2 instances
	3. Launch
2. Name them:
	1. ansiblemaster
	2. ansibleagent
3. Connect to ansiblemaster
	1. `sudo -i`
	2. Install ansible (only on master)
		1. Search for ansible installation
			1. Ansible docs
				1. Installing Ansible on Ubuntu

						sudo apt update
						sudo apt install software-properties-common
						# sudo apt-add-repository --yes --update ppa:ansible/ansible # repository from which we can pull ansible # not required for focal (Ubuntu 20.04)
						sudo apt install ansible
				
				2. `ansible --version`
						
4. Connect to agentinstance
	1. `sudo -i`
	2. `python --version`
		1. Grab the command and install
			1. `sudo apt install python3`
			
### Establish SSH Between Master and Agent ###
1. Ensure machines can communicate with each other
	1. ansiblemaster
		1. security groups
			1. select the security group
				1. Edit inbound rules
					1. All ICMP - IPv4 (for ping command) - Anywhere
				2. We can ping from master to agent
					1. `ping <public-ip-of-agent>`
		2. `ssh-keygen` - private and public key generation
			1. `/root/.ssh/id_rsa` - hit enter
			2. passphrase - hit enter
			3. `cd /root/.ssh`
				1. `id_rsa.pub` - public key that should be copied to agent
				2. `cat authorized_keys` - public key of the aws server
	2. ansibleagent
		1. `cat authorized_keys` - public key of agent machine
			1. `vi authorized_keys`
				1. Paste the public key of master at the end of the file
2. The keys can be used for communication
	1. In Master: `ssh root@<agent-public-ip>`
		1. Say `yes`
			1. Connects to agent
			2. `exit`
3. Run ansible commands against agent:
	1. `ansible <agent-public-ip> -m ping` **(M)**
		1. Only localhost is avaialable
			1. Fix: `cd /etc/ansible`
				1. `vi hosts`

						# [group]
						<agent-public-ip>
						
		2. Re-try the ansible command
			1. `SUCCESS`
4. Next: How to execute a command on all agents

### Configure Hostname and Execute Remote Commands ###
1. `ansible <group> -m <module>`
	1. `<group>` - single ip or a group
	2. Executing command:

			ansible agent1 -m command -a "apt install apache2" (-a is arguments)
			
		1. Open master:
			1. `vi /etc/hosts`
				1. Copy agent private IP (since public IP changes)
				
						<agent-private-ip>	agent1
						
		2. `vi /etc/ansible/hosts`
			1. Remove public ip of agent
			2. Add agent hostname

					agent1
					
		3. `ansible agent1 -m ping`
		4. `ansible agent1 -m command -a 'ls'`
		5. `ansible agent1 -m command -a 'pwd'`
		6. `ansible agent1 -m file -a 'path=/root/test.txt state=touch mode=0770 owner=root'` (file module is for files and directories)
		7. `ansible agent1 -m file -a 'path=/root/test state=directory'` (directory is created)

### Web Server Creation Through Master ###
1. Apache installation:
	1. `ansible all -m command -a 'apt update'` - update on all agents
	2. `ansible all -m command -a 'apt upgrade -y'`
	3. `ansible all -m command -a 'apt install apache2 -y'`
2. Go to security group and open port 80 (for us to access from web browser)
	1. `ansible all -m service -a 'name=apache2 state=started'`
	2. Open: http://<agent-public-dns-name>
	3. `ansible agent1 -m command -a 'apt -y remove apache2'` - to remove apache2

### Construct and Run First Playbook ###
1. First playbook
	1. Copies a file to agent and adds contents to the file
		1. Go to master
			1. `sudo -i`
			2. `vi filecopy.yml`

					- hosts: agent1
					  vars: 
					  			msg: "Hello Ansible Playbook"
					  tasks:
					  			- name: Copy File with Content # tells what task does
					  			  copy: # module 
					  			  			dest: /root/abc.txt # src is also supported
					  			  			content: "{{msg}}"
					  			  			
				1. `ansible-playbook filecopy.yml` **(M)**
					1. `hosts: <group>` - allowed

### Looping in Action ###
1. `with_items` - loop to execute code multiple times
2. Go to master:
	1. `sudo -i`
	2. `loop.yml`

			- hosts: agent1
			  tasks:
			  			- name: add multiple directories
			  			  file:
			  			  			path: "{{item}}"
			  			  			state: directory
			  			  with_items:
			  			  			- dir1
			  			  			- dir2

		1. `ansible-playbook loop.yml`
		2. Check the agent for two directories

### Install Packages ###
1. Git and MySQL
2. Go to agent box:
	1. `git` - should not find `git`
		1. `apt-get remove git` or `apt remove git`
3. Go to master
	1. `sudo -i`
	2. `vi install_packages.yml`

			- hosts: agent1
			  tasks:
			  			- name: Install Packages
			  			  apt:
			  			  		name: # new syntax - with_items is not required
			  			  				- git
			  			  				- mysql-server
			  			  		update_cache: yes # updates package's cache (to get latest software)

### Tag Tasks ###
1. Add new task to start mysql server

		tasks:
			...
			- name: Start MySQL
			  service: name=mysql state=started
			  
	1. `ansible-playbook install_packages.yml`
2. To skip a few tasks: tags are used

		tasks:
				...
				update_cache: yes
			  tags:
				- install
			- name:
				...
			  tags:
			  	- start

	1. `ansible-playbook install_packages.yml --tags "start"` **(M)**
	2. To skip:
		1. `ansible-playbook install_packages.yml --skip-tags "install"` **(M)**

### More Tags ###
1. To list all tasks:
	1. `ansible-playbook install_packages.yml --list-tasks` **(M)**
	2. `ansible-playbook install_packages.yml --list-tags` **(M)**
2. Two special tags: always, never
	1. Gathering Facts - marked with `always`
		1. We can use this for our tasks
			1. `vi install_packages.yml`

					tags:
						- install
						- always # this will always run unless we explicitly skip it

				1. `ansible-playbook install_packages.yml --tags "start"` - install packages also runs (marked with always)
					1. `ansible-playbook install_packages.yml --tags "start" --skip-tags "install"`
	2. `never` - task will never be executed unless we explicitly mention it to run
		1. `vi install_packages.yml`

				tags:
					- start
					- never
		
		1. `ansible-playbook install_packages.yml --tags "start"`
3. We can re-use tag names

		tags:
			- install
			...
			- mysql
		...
		tags:
			- start
			- mysql

	1. We can group tasks using tags (both will run)

## Micro Service Creation Assignment Solution ##
### Setup the Database ###
### Construct the Project, Entities and Repo ###
### Construct the API and Test ###

## Docker Assignment Solution ##
### Launch a MySQL Docker Container ###
### Dockerize the Flight Services APP ###
### Launch the Flight Service Container ###

## Docker Compose Assignment Solution ##
### Compose the MySQL Container ###
### Compose in Action ###
### Compose Flight Service App ###

## Wrap Up ##
### Bonus Lecture ###
