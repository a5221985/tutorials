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
		2. It is schemaless
			1. It can manage structured or semistructured data
				1. Including JSON docs
		3. Wants us to do most of data **querying ourself within application**
			1. Either read single value or get contiguous range of data
		4. Filter or sort has to be aggregated ourselves (after receiving requested data range)
	2. Relational DB
		1. Good for
			1. Ad-hoc queries
			2. Data warehousing
			3. OLAP (on-line analytical processing)
		2. Requires well defined schema (structure is based on relational model)
			1. Data is normalized into
				1. Tables
				2. Rows
				3. Columns
		3. Most of data querying and processing is done close to data side
		4. Data aggregation and sorting is done on data side & final summary sent to application

#### Query Processing ####
1. Query processing on application side is inconvenient
	1. Also has performance implications
2. RDBMS run queries close to data
	1. To calculate sum total value of orders per customer
		1. Rollup gets done while reading data
		2. Final summary (one row per customer) gets sent over network
3. To do this with DynamoDB
	1. Get all customer orders (one row per order)
		1. It involves more data over network
		2. Rollup is done in application
			1. This is far from data
4. **This aspect can be considered to determine if DynamoDB is a viable choice for our needs**

#### Storage Cost ####
1. Storage in DynamoDB costs more as compared to S3
	1. 1 TB in DynamoDB - $256/ month
	2. 1 TB in S3 - $23.55 / month
2. Data can be compressed more efficiently in S3
	1. Can make the cost difference even bigger
		1. However, to decide whether DynamoDB is a viable option,
			1. request pricing matters most (rather than storage cost - as per author)

#### Request Pricing ####
##### On-Demand #####
1. Start with DynamoDB's on-demand pricing
	1. Consider provisioned capacity as cost opitmization
		1. On-demand cost: 
			1. $1.25 per million writes
			2. $0.25 per million reads
	2. DynamoDB is a simple data structure
		1. It is not hard to estimate how many requests are needed
			1. We can inspect application and map every logical operation to a number of DynamoDB requests
				1. Example: Serving web page will require 4 DynamoDB read requests
					1. If serving million pages per day, requests might cost
						1. $1 / day
	3. Example: \$0.25 per million reads, \$1.25 per million writes

##### Provisioned Capacity #####
1. Consider switching to provisioned capacity if:
	1. Performance characteristics of DynamoDB are compatible with application
	2. On-demand request pricing is in ballpark of acceptability
2. Workload that costs \$1/ day to serve 1 million pages would only cost \$0.14/ day with provisioned capacity
	1. Cost reduction (seemingly)
		1. Calculation assumes
			1. Requests are evently distributed over course of day
			2. There is zero capacity headroom (would get throttled if there were million + 1 rquests in a day)
		2. The assumptions could be impractical
			1. We may have to provide abundant headroom to deal with peak request rate & general uncertainty in demand
				1. We might end up with a burden to monitor utilization and proactively provision necessary capacity
	2. Example: $0.00012 cost per read capacity unit (RCU) per hour
		1. Number of read requests per hour (for serving a web page)
			1. 50000 -> 50000 * 0.00013 ~ $ 6.49999....

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