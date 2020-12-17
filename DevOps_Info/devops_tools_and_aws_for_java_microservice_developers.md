# DevOps Tools and AWS for Java Microservice Developers #
## Construct Or Downlod Spring Boot Microservices Projects ##
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

### Integrating Microservices ###
### Integration Test ###

## Manual Deployment to AWS using EC2 using S3 ##
### S3 ###
### Launch Instance and Setup the Instance ###
### Use S3 Deploy Jar and Test ###
### Automate App Launch ###
### Install Stress Command ###
### Construct Custom API and Scale the APP Manually ###

## AWS Elastic Load Balancer ##
### Introduction ###
### Construct Load Balancer ###
### Test ###
### Troubleshooting ###

## AWS Auto Scaling Group ##
### Introduction ###
### Construct Auto Scaling Group ###
### Test ###

## AWS Cloudwatch Monitoring and SNS ##
### Cloudwatch Service ###
### Simple Notification Services ###
### Construct Topic and Subscription ###
### Construct Cloudwtch Alarm ###
### Test ###

## Deploy to AWS Elastic Beanstalk using RDS ##
### Elastic Beanstalk ###
### RDS ###
### Construct MySQL Database on RDS ###
### Deploy the Coupon Service ###
### Deploy the Product Service ###
### Wrap Up ###

## Docker ##
### Introduction ###
### Docker Architecture and Workflow ###
### Docker in Action ###
### Docker Run ###
### Docker Clean Up ###
### Get Comfortable with Docker Run ###
### Docker Commit ###
### Docker Layers and Overlay Storage ###
### Launch MySQL Container ###
### Volumes and Bind Mounts ###
### Use Volumes ###
### Use Bind Mounts ###
### Docker Networking in Action ###
### Change a Containers Network ###
### Windows - Install Docker ###
### Dockerfile Introduction ###
### First Dockerfile ###
### Beauty of Docker Layers ###

## Dockerize Micro Services ##
### Visual Studio Code - The Docker IDE ###
### Install Visual Studio Code IDE ###
### Launch MySQL Container ###
### Construct Tables ###
### Dockerize the APPs ###
### Build Images ###
### Launch the Microservice Containers ###
### Test ###
### Sign Up for Docker Hub ###
### Push to Docker Hub ###
### Docker Prune Command ###

## Docker Compose ##
### Introduction ###
### YAML Syntax ###
### Important YAML Elements in Docker Compose ###
### Compose in Action ###
### Compose Networks ###
### Compose Volumes ###
### Compose MySQL Service ###
### Compose Micro Services ###
### Launch and Test ###

## Kubernetes Concepts and Local Setup ##
### Introduction ###
### Kubernetes Object Model ###
### Architeture ###
### Installation Types ###
### Install Minikube on Mac ###
### Install and use Kubectl ###
### Windows Only - Install Minikube ###
### Windows Only - Install Kubectl ###
### Troubleshooting ###
### Kubectl Configuration ###

## Kubernetes in Action ##
### POD ###
### Construct First POD ###
### Construct Pod using YAML ###
### POD Life Cycle ###
### Labels and Selectors ###
### Use Labels and Selectors ###
### Annotations ###
### Namespaces ###
### Kubectl is Cool ###
### Deployment ###
### Access the Cluster using Dashboard ###
### Kubernetes YAML Config Explained ###
### Construct Deployment YAML ###
### Service and Types ###
### Construct Service ###
### Load Balancing ###
### Status in YAML ###
### Rolling Updates ###
### Rolling Updates in Action ###
### Rollbacks ###
### Manual Scaling ###

## Kubernetes Volumes ##
### Volumes ###
### Mount Volumes ###
### Use ConfigMaps ###
### Secrets ###
### Using Secrets ###
### Persistent Volumes ###
### Construct PV ###
### Construct PVC ###
### Mount PVC ###

## Deploy Microservices to Kubernetes ##
### Introduction ###
### How Applications on the Cluster Communicate ###
### Construct DB Deployment ###
### Construct ConfigMap ###
### Mount Volumes ###
### Deploy and Test DB ###
### Construct Coupon and Product YAMLs ###
### Deploy Product and Coupon Apps ###

## Eclipse JKube Quick Start ##
### Introduction ###
### Generate Docker Image ###
### Deploy to Kubernetes ###
### Use NodePort ###
### Logs and Debugging ###

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
### Jenkins Prerequisites ###
### Setup Jenkins ###
### Jenkins Dashboard ###
### Configure root User Permissions ###
### First Job ###
### Configuring a Maven Project ###
### Assignment - Buid a Maven Web Project ###
### Work with GIT Repo ###
### Build Triggers ###
### Configure Security ###
### Understanding Deployment ###
### Tomcat Installation and Configuration ###
### Configure Users ###
### Install Deployment Plugin ###
### Continous Integration in Action ###
### Webhooks Introduction ###
### GitHub Webhooks in Action ###
### Master and Agent ###
### Step 1: Generate the Keys on Master ###
### Step 2: Launch the Agent Instance ###
### Step 3: Construct a Node Using the Agent ###
### Step 4: Agent 007 in Action ###

## Jenkins Pipelines ##
### Introduction ###
### First Pipeline ###
### Multi Stage Pipeline ###
### Reading Environment Variables ###
### Pass Parameters to the Pipeline ###
### Requesting User Input ###
### Construct a Java Project Pipeline ###
### Test Pipeline ###
### Construct a Java Web Project Pipeline ###
### Test Pipeline ###

## AWS IAM Service ##
### Introduction ###
### Constructing an IAM User ###
### Construct Custom Policy ###
### Construct and Assign Role ###

## AWS CLI QuickStart ##
### Introduction ###
### Construct Programmatic User ###
### Install and Configure CLI ###
### Run Commands ###
### Construct and Terminate EC2 Instance ###

## Ansible-Configuration Management ##
### Introduction ###
### Master and Agent ###
### Establish SSH Between Master and Agent ###
### Configure Hostname and Execute Remote Commands ###
### Web Server Creation Through Master ###
### Construct and Run First Playbook ###
### Looping in Action ###
### Install Packages ###
### Tag Tasks ###
### More Tags ###

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