# The Good Parts of AWS: Cutting Through the Clutter #
## Part 1: The Good Parts ##
### The Default Heuristic ###
1. The technique helps solve our struggle for searching best AWS services and features
2. Topics
	1. Optmization fallacy
	2. Default heuristic
	3. Default choice

#### Optimization Fallacy ####
1. Chasing best tool for job is a trap for making progress (especially at the beginning of project)
	1. Relentless search for best tool is an **optimizatin fallacy**
		1. It falls in the same category as pre-mature optimization
2. Search for optimal option is:
	1. Almost always expensive
	2. Belief that we can easily discover best option by exhaustively testing each one is delusional
3. To make matters worse:
	1. Developers enjoy tinkering with new technology and figure out how things work - this amplifies vicious cycle of such a pursuit

#### The Default Heuristic ####
1. Better technique recommended - default heuristic
	1. Premise: When the cost of acquiring new info is high and the consequence of deviating from default choice is low, sticking with default will likely be optimal choice
	2. What is default choice?
		1. Any option that gives very high confidence that it will work
		2. Something I have used before
		3. Something I understand well
		4. Something that has proven itself to be a realiable way for getting things done in space you're operating in
		5. Doesn't have to be the theoretical best choice
		6. Doesn't have to be the most efficient (or latest and greatest)
		7. It needs to be a reliable option to get you to your ultimate desirable outcome
		8. It should be very unlikely to fail you
			1. I need to be confident that it's a very safe bet (that is the only requirement)
	3. All the choices are made based on the defaults
		1. Deviate from defaults only if we absolutely have to

#### Our default choice ####
1. If little experience, we might not have a default choice for everything we want to do
2. This course
	1. Author's default choices for AWS services and features
	2. Why some things are default choices and others are not considered
3. The default choices in the course helps us make choices for next project quickly and confidently
4. Next: Good parts of AWS one-by-one

### Database: DynamoDB ###
1. What will be covered?
	1. DynamoDB features
	2. Pros and cons of DynamoDB indexes
	3. When is DynamoDB a great default choice for db
	4. Recommendations on use of DynamoDB indexes
2. Topics
	1. DynamoDB vs relational database
	2. Query processing
	3. Storage cost
	4. Request pricing
		1. On-demand
		2. Provisioned capacity
	5. DynamoDB indexes
		1. Local indexes
		2. Global indexes

#### Data Structure in the Cloud ####
1. It is seen as database but it is highly durable data structure in the cloud
	1. It is a partitioned B-Tree data structure

					3|9
				  /  | \	
				1|2  5  ...
		     /  |   \
			...	 Bob  ...
			    (data for key 2)
			    
		1. DynamoDB is similar to Redis (than to MySQL)
			1. Differences:
				1. Immediately consistent
				2. Highly-durable
			2. How?
				1. It is centred around the single data structure
					1. If we put something into DynamoDB, we can get it immediately and it will not be lost
		2. Why does it not replace RDBMS?
			1. It stores data in a primitive B-Tree - unlike RDBMS

#### DynamoDB vs Relational Database ####
1. Differences
	1. DynamoDB
		1. Good for web applications
			1. Social networks
			2. Gaming
			3. Media sharing
			4. Internet of Things (IoT)
	2. Relational DB

#### Query Processing ####
#### Storage Cost ####
#### Request Pricing ####
##### On-Demand #####
##### Provisioned Capacity #####

#### DynamoDB Indexes ####
##### Local Indexes #####
##### Global Indexes #####
#### Our Recommendations ####

### Storage: S3 ###
### Compute: EC2 ###
### Compute: EC2 Auto Scaling ###
### Compute: Lambda ###
### Networking & Content Delivery: ELB ###
### Networking & Content Delivery: Route 53 ###
### Management & Governance: CloudFormation ###
### Application Integration: SQS ###
### Media Service: Kinesis ###
### Quiz - Basic AWS Services ###

## Part 2: The Bootstrap Guide ##
### Starting from Scratch: Basic Web Application ###
### Starting from Scratch: Manual AWS Infrastructure ###
### Infrastructure as Code: Construct CloudFormation Stack ###
### Infrastructure as Code: Deploy CloudFormation Stack ###
### Automatic Deployments: CodeBuild ###
### Automatic Deployments: Install CodeDeploy Agent on EC2 ###
### Automatic Deployments: Construct a CodePipeline ###
### Load Balancing: Add a Second EC2 Instance ###
### Load Balancing: Add an Application Load Balancer ###
### Scaling: Add an Auto Scaling Group ###
### Scaling: Remove Instances ###
### Production: Add Stack Name to our Application ###
### Production: Construct Staging Stack ###
### Production: Construct Production Stack ###
### Custom Domains: Register Domain with Route 53 ###
### Custom Domains: Map our Domain to Load Balancers ###
### HTTPS: Construct a TLS Certificate ###
### HTTPS: Add an HTTTPS Endpoint ###
### HTTPS: Make the Application Speak HTTPS ###
### Network Security: Set up SSM for SSH Access ###
### Network Security: Add Private Subnets with NAT Gateway ###
### Network Security: Enabling HTTPS port in Public Subnets ###