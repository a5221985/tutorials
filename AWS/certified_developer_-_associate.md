## Certified Developer - Associate
1. AWS: Amazon Web Services
	1. Fastest growing cloud platform
	2. Largest public cloud computing platform
	3. Organizations are outsourcing their IT to AWS
	4. AWS certifications are most popular IT certifications
	5. Safest place to be in IT
	6. http://bit.ly/1hzUUXI
2. Certifications:
	1. Associate:
		1. Certified Solutions Architect - Associate
		2. Certified SysOps Admin - Associate
	2. Professional:
		1. Certified Solutions Architect - Professional
			1. Pre-requisite: Certified Solutions Architect - Associate
		2. Certified DevOps - Professional
			1. Pre-requisites: Certified Developer - Associate OR Certified Sysops Administrator - Associate
	3. Easiest to Hardest:
		1. Developer Associate
		2. Solutions Architect - Associate
		3. Sysops Administrator - Associate
		4. Devops Pro
		5. Solutions Archietect Pro
3. Website
	1. https://acloud.guru
4. What the course does not teach:
	1. How to code
		1. Android, iOS, JavaScript, Java, .Net, Node.js, PHP, Python, Ruby, Go, C++: should know one of them
5. Exam Blue Print:
	1. Objectives:
		1. AWS Fundamentals 10%
		2. Desiging and Developing 40%
		3. Deployment and Security 30%
		4. Debugging 20%
	2. 80 minutes
	3. Aim for 70%
6. Exam Guru: App, not free
7. What do we need to do this course:
	1. AWS Free Tier Account
		1. https://aws.amazon.com/free
			1. free for 12 months
		2. Set billing alarm
		3. Computer with SSH terminal
		4. Optionally domain name (GoDaddy)
		5. Route53?

### How to get development experience with AWS ###
### What you'll Need to Do This Course ###
### The Free Alexa Skill for Amazon Echo ###

## History of AWS
1. SQS was launched in 2004
2. Jeff Bass blog
3. AWS officially launched in 2006
4. 180,000 developers on platform 2007
5. amazon.com moved over to aws in 2010
6. First Re-invent conference 2012
7. First certifications: 2013
8. To achieve 100% renewable energy usage
9. AWS breaks out it's revenue, $6 billion USD per annum growing at 90% year on year
10. Gartner's quadrant
	1. AWS is leader

### Concepts & Components
1. AWS Global Infrastructure
	1. Region: Geographical area
	2. Availability zone: a data center (2 or more in a region)
	3. Edge location?
		1. CDN (Content Distribution Network) end points for CloudFront (CDN service)
		2. 50 edge locations
	4. Regions in North America:
		1. US East (North Virginia)
			1. Availability zones - 5
		2. US West (Northern California)
			1. Availability zones - 3
		3. US West (Oregon) Region
			1. Availability zones - 3
		4. AWS GovCloud (US) Region (US Government)
			1. Availability zones - 2
	5. Regions in South America:
		1. Sao Paulo
			1. Availability zones - 3
	6. Europe/Middle East/ Africa
		1. Ireland Region
			1. Availability zones - 3
		2. Frankfurt Region
			1. Availability zones - 2
	7. Asia pacific
		1. Singapore
			1. 2
		2. Tokyo
			1. 3
		3. Sydney
			1. 2
		4. Beiging
			1. 2
2. One top is Networking
	1. VPC: Virtual Private Cloud: Virtial data center
		1. We can have multiple and pair them
		2. They can be in different regions
	2. Direct Connect
		1. Connecting to AWS environment without using Internet connection
	3. Route 53:
		1. Amazons DNS service
		2. Port 53: DNS service sits on this port*
3. On top is Compute, Storage, Databases
	1. Compute:
		1. EC2: Virtual server, privision and log in
		2. EC2 Container:
			1. Container service to run manage docker containers (may not come for exam)
		3. Elastic Beanstalk:
			1. Service for deploying and scaling web applications developed in Java, .Net, PHP, Ruby ..., Docker on services such as apache, nginx, passenger and IIS
			2. You just upload your code and aws examines the code and provisions resources (high level but in DeOps pro)
		4. Lambda: To run code without provisioning servers. You only pay for compute time.
	2. Storage
		1. S3 *: Object based storage, for storing flat files
			1. durabel, scalable
			2. Pay only for storage
		2. Cloud Front (back of S3): 
			1. Content Delivery Web Service
			2. Integrates with others like S3
			3. Edge location: place that caches files.
		3. Glacier:
			1. For long term storage like archiving
			2. Secure,durable, low cost
			3. For offline storage
		4. EFS: 
			1. Elastic File System
			2. File storage for EC2 instance
			3. Block level storage
			4. Can connect to multiple EC2 instances
			5. Centralized storage
		5. Snowball: 
			1. Amazon's import export service
			1. Like We can send hard disks to AWS and they will load data from harddisk.
			3. We do not have to send harddisks, amazon gives a suitcase like looking device and we have to pay on a daily basis. Petabyte scale data transfer
		6. Storage Gateway:
			1. For connecting on premise software appliance of VM with cloud based storage.
			2. Replicates info to and from AWS platform
	3. Databases:
		1. RDS:
			1. Relational Database Service:
			2. Mysql, sql server, postgres, Roara, mariadb
		2. DynamoDB *:
			1. No SQL db service:
			2. Push button scalability
		3. Elasticache:
			1. Caching queries
			2. NCacheD and Redis
			3. To cache products up in memory for performance
		4. Redshift (Architect solutions):
			1. Business intelligence service
		5. DMS: Database Migration Service:
			1. To migrate from legacy based (oracle) to modern like mysql (RDS)	
4. On top is Analytics, Security & Management tools
	1. Analytics:
		1. EMR: Elastic Map Reduce
			1. For processing big data
		2. Data Pipeline (Solution Architect Pro):
			1. To move data from one servcie to another
		3. Elastic Search:
			1. Managed service to deploy operate and scale elastic search in cloud
			2. OpenSource search and analytics engine
		4. Kinesis:
			1. For straming data on aws
			2. Ex: Google glasses, generate streaming data, we can use this.
		5. Machine Learning:
			1. For developers of machine learning.
			2. What other products you might want
		6. Quick Sight:
			1. Business Intelligence Service:
			2. Like a compatitor to cognose:
			3. To build visualizations, perform adhoc analysis, business insites from data
	2. Security and Identity:
		1. IAM: Identity Access Management *:
			1. groups, roles, users,
			2. Password rotation policies
		2. Directory Service
		3. Inspector:
			1. Store agents on EC2 instances.
			2. Inspects EC2 instances for security vulnerabilities
				1. allowing root login remotely
		4. WAF:
			1. Web Application Firewall Service:
		5. Cloud HSM (Professional):
			1. Hardware Security Module
			2. for securing cloud based infrastructure using HSM devices
		6. KMS:
			1. Key management service
	3. Management Tools: (SysOps Associate)
		1. Cloud Watch:
			1. monitoring tool for aws env
			2. Performance monitoring
		2. Cloud Formation (Solutions Architecture, DevOps):
			1. script infrastructure: turn datacenter into scripts
			2. Ex: Deploy wordpress stack using scripts and exact copies of stack around the world
		3. Cloud Trail:
			1. Auditing
			2. If something makes a change in cloud env, it can be recorded by cloud trail
		4. Opsworks *:
			1. Configuration management servers
			2. For configuring and operating applications using cheff
			3. Creation of opsworks stack
		5. Config:
			1. Managed service
			2. aws resource inventory, configuration history, configuration notifications
			3. For governance and security
			4. Set rules to check configuration of aws resources recorded by config
				1. all ebs volumes of ec2 instances are encrypted
		6. Service Catalog:
			1. Creation and management of catalogs for it services
		7. Trusted Advisor:
			1. automated service that scans the environment and tells ways to save money, increase security
				1. Free tier
				2. Business and enterprise
5. On top is Application Services, Developer Tools, Mobile Services
	1. Application Services:
		1. API Gateway:
			1. Creation, publish,  maintenance, monitor and scale APIs
		2. AppStream:
			1. AWS version of zen app
			2. Stream existing windows apps from cloud without any code modifications
			3. App is deployed and rendered in aws infrastructure output is streamed to pcs, tabs etc...
		3. CloudSearch:
			1. Setup manage and scale search solution for website/app
			2. 34 languages
			3. highlighting, autocomplete, geospacial search
		4. Elastic Transcoder *:
			1. Media transcoding service
			2. To transcode source into formats that can be played on devices like smartphones, tabs, pcs...
		5. SES:
			1. Simple Email Service:
			2. Send marketing emails, content to customers, receive emails
			3. can be integrated with lambda, s3, SNS etc...
		6. SQS:
			1. Simple Quing Service
			2. Decaupling infrastructure
		7. SWF:
			1. Simple WorkFlow Servcie 
			2. For developers to build background jobs that have parallel or sequential steps
			3. Amazon.com uses it
	2. Developer Tools (new, read FAQs)
		1. CodeCommit
			1. Fully managed source control service
			2. Git repositories (like GitHub)
		2. CodeDeploy
			1. Automates code deployment to EC2 or any one on premise
		3. CodePipeline
			1. Continuous Delivery Service
			2. Builds, tests, deploys code whenever there is code change
	3. Mobile Services:
		1. Mobile Hub:
			1. Building and testing and monitoring mobile apps
		2. Cognito:
			1. Save mobile user data like, preferences, game state ...
		3. Device Farm:
			1. Improve quality of mobile apps by testing against real smartphones and tablets
		4. Mobile Analytics:
			1. For monitoring app usage, app revenue, new vs returning users
		5. SNS *:
			1. Simple Notification Service
			2. Set, operate and send notifications from cloud
6. On top is Enterprise Applications, Internet of Things (IOT)
	1. Enterprise Applications:
		1. WorkSpaces:
			1. VDI: run windows etc...
		2. WorkDocs:
			1. Fully managed secure and enterprise storage and sharing service with admin controls
				1. DropBox for enterprise
				2. To store files
		3. WorkMail:
			1. Like Exchange: email service
	2. Internet of Things:

### My Console Looks Different! Help! ###
	
## Indentity Access Management 101 ##

1. What is it?
	1. Setting up users and granting access to users to AWS console
	2. It is used to manage users and their level of access to the AWS console
2. What does IAM give?	
	1. Centralized control of AWS account
	2. Shared Access to AWS account
	3. Granular Permissions
	4. Identity Federation (Active directory, Facebook, Linkedin)
		1. Federate with identity providers
	5. Multifactor Authentication
		1. Two factor authentication
	6. Provide temporary access for users/devices and services where necessary
		1. Give access to services
	7. Allows to set up own password rotation policy
	8. Supports PCI DSS compliance
2. Terms:
	1. Users: End users
	2. Groups: collection of users under one set of permissions
		1. admins, developers
	3. Roles: 
		1. assign roles to AWS resources
			1. ex: assign a role to EC2 instance to access S3 (for EC2 to write directly to S3)
	4. Policy:
		1. A document that defines one or more permissions
			1. Assign to users, groups or roles
3. Lab:
	1. IAM:
		1. Log into console
		2. Region: Default: Oregon
			1. Chose the closest for better performance and low latency
		3. IAM is not region specific
		4. Click IAM
			1. Sign-in link:
				1. for others to sign in
				2. We can customize: give another domain name
			2. Security Status:
				1. Activate MFA (Multifactor Authentication) on your root account:
					1. root account: main email address: complete admin access
					2. Activation:
						1. Click **Manage MFA**
						2. Select Virtual MFA
							1. For Android phone: AWS Virtual MFA, Google Authenticator
							2. ...
						3. Download
						4. With phone scan QR code
						5. Enter Authentication Code 1
						6. Wait for the first Authentication code to expire and then get the second Authentication code
						7. Enter Authentication Code 2
						8. Click Finish
				2. Individual IAM Users:
					1. Click **Create New Users**
					2. Enter upto 5 user names
					3. Generate access key for each user
						1. Access Key ID: User name
						2. Secret Access Key: password
						3. For API, or for Commandline tools
					4. Download them
					5. Close
					6. Give passwords:
						1. Select a user
						1. Click **User Actions**
						3. Assign an auto-generated password
						4. Click generate
						5. Download the password
				3. By default users do not have permission to do anything
					1. Click **Policies**
					2. Click on a policy
					3. Policy document: JSON file
							
							{
								"Version": "2012-10-17",
								"Statement": [
									{
										"Effect": "Allow",
										"Action": "*",
										"Resource": "*"
									}
								]
							}
					4. Click **Policy Actions**
					5. Click **Attach**
					6. Select a user
					7. Click **Attach Policy**
				4. Creation of Groups:
					1. Click **Groups**
					2. Give **Group Name**
					3. Click **Next**
					4. Attach policies to group
				5. Add users to group
					1. Click **Group Actions**
					2. Add users to the group
				6. To see permisions
					1. Click the group
						1. Access Advisor: service permissions
				7. IAM Password policy:
					1. Click on it
					2. Check the boxes, set min password lenght
					3. Click **Apply password policy**
			3. Roles:
				1. Allows AWS resources to use other resources
				2. Set **Role Name**
				3. Types of roles:
					1. AWS Service Roles
						1. Select Amazon EC2
						2. Type S3
						3. Select Amazon S3
						4. Attach the policy
					2. Role for Cross-Account Access
					3. Role for Identity Provider Access

#### Federate Active Directory
1. The flow is initiated when a user (let's call him Bob) browses to the ADFS sample site (https://Fully.Qualified.Domain.Name/adfs/ls/ldpInitiatedSignOn.aspx) inside his domain. When you install ADFS, you get a new virtual directory named adfs for your default website, which includes this page.
2. The sign-on page authenticates Bob against AD. Depending on the browser Bob is using, he might be prompted for his AD username and password.
3. Bob's browser receives a SAML (Security Assertion Markup Language) assertion in the form of an authentication response from ADFS.
4. Bob's browser posts the SAML assertion to the AWS sign-in endpoint for SAML (https://signin.aws.amazon.com/saml). Behind the scenes, sign-in uses the AssumeRoleWithSAML API to request temporary security credentials and then constructs a sign-in URL for the AWS Management Console.
5. Bob's browser receives the sign-in URL and is redirected to the console.
	1. From Bob's perspective, the process happens transparently. He starts at an internal web site and ends up at the AWS Management Console, without ever having to supply any AWS credentials.

##### Possible Exam Questions:
1. Can you authenticate using AD?
	1. Yes, using SAML
2. Are you authenticating against AD first and then getting temporary credentials or the other way?
	1. First AD authentication and then get temporary credentials
3. Protocol (Solutions Architect - Associate)

#### Web Identity Federation with Mobile Application (out of scope of exam)
1. [https://aws.amazon.com/articles/4617974389850313](https://aws.amazon.com/articles/4617974389850313)
2. Web Identity Federation Playground
	1. Goto IAM
	2. Click [Web Identity Federation Playgroun]()
	3. Click **Facebook**
	4. Enter username and password
	5. Access Token:
		1. Response
3. Methodology:
	1. First we give Facebook credentials
	2. On success, we receive an access token
	3. Obtain Temporary Security Credentials
		1. ProviderId: graph.facebook.com
		2. RoleArn: Amazon Resource Name*
		3. RoleSessionName
		4. WebIdentityToken
		5. Click **Call AssumeRoleWithWebIdentity** 
			1. We get request and response
	4. Step 3:
	 	1. Actions: That we can perform
	 	
#### Summary of IAM
1. IAM is management console for managing access to AWS resources
2. It consists of
	a. Users
	b. Groups
	c. Roles
3. User: Individual
4. Group: collection of users with only one set of permissions
5. Roles: applicable to users and AWS services (Lambda, EC2, ...)
6. How users, groups and roles are created
7. Enabling multifactor authentication
8. SSO for users in an organization
9. Set password policy

#### Exam Tips
1. Steps
	1. SAML
	2. Authenticate against Idenity Provider (Facebook/AD)
	3. Obtain temporary Security Credentials
		1. AssumeRoleWithWebIdentity
	4. Able to access AWS resources
5. Roles:
	1. EC2: we cannot switch roles for running instance, we can change permissions for that role
	2. AssumeRoleWithSAML*
	
## EC2
### EC2 101 - Part 1 ###
### EC2 101 - Part 2 ###

1. Web service that provides resizable compute capacity in cloud. Recudes time required to obtain boot new server instances to minutes allowing scaling capacity up and down quickly.
2. Pricing models:
	1. On demand: Fixed pay by hour with no commitment.
		1. Ex: Black friday sales for 48 hours
		2. Reasons:
			1. low cost and flexibility of EC2 without up-front payment or long-term commitment.
			2. short term, spiky, or unpredictable workloads that cannot be interrupted.
			3. Applications developed or tested in EC2 for the first time.
			4. Supplemant reserved instances (if traffic increases in a particular season)
	2. Reserved: capacity reservation, offer discount on hourly charge (1 to 3 years)
		1. For steady state: 1
		2. Purpose:
			1. Apps with steady state or predictable usage
			2. Apps requiring reserved capacity
			3. Users can make upfront payments to reduce their total computing costs
		3. Example: Specification is clear (RAM, Disk Space, CPUs ...) for a fixed period of time, then chose reserved instances.
	3. Spot: we can bid a price that you want to pay for the instance capacity, if the spot price is equal to or less than the bid price, we can buy the instance. Spot price moves around. If spot price increases over the bid price, then aws will give 1 hour notice and then terminate the instance.
		1. For Hadoop, high performance
		2. Check pricing and then bid
		3. 50 to 90% savings
		4. Get EC2 Spot Prices chart and select
		5. Purpose:
			1. Flexible start and end times
			2. apps feesible only at low compute prices
			3. urgent computing needs with large amounts of additional capacity
		6. Example:
			1. Feesible: spot
		7. If spot instance is terminated within an hour, no charge. But if we terminate it ourselves then there is charge.
3. Instance types:
	1. T2 (cheap general purpose): Lowest cost, General Purpose
		1. Use case: Web servers/Small DBs
	2. M4: General Purpose
		1. Use case: App servers
	3. M3 (Main choice): General Purpose
		1. Use case: App servers
	4. C4: Compute Optimized
		1. Use case: CPU Intensive Apps/DBs
	5. C3 (Compute): Compute Optimized
		1. Use case: CPU Intensive Apps/DBs
	6. R3 (RAM): Memory Optimized
		1. Use case: Memory Intensive Apps/DBs
	7. G2 (Graphics): Graphics/General Purpose GPU:
		1. Use case: Vido Encoding/Machine Learning/3D Application Streaming
	8. I2 (IOPS): High Speed Storage
		1. Use case: NoSQL DBs, Data Warehousing etc...
	9. D2 (Density): Dense Storage
		1. Use case: Fileservers/Data Warehousing/Hadoop
		1. DIRTMCG
4. EBS: Elastic Block Storage
	1. Amazon EBS allows creation of storage volumes and attach them to Amazon EC2 instances.
	2. Once EBS volumes are attached, one can create filesystems on top of them, run databases...
	3. EBS volumes are placed in special availability zones (they are automatically replicated to protect from failure of single component)
	4. One EBS volume cannot be attached to multiple EC2 instances
	5. Types of EBS volumes:
		1. General Purpose SSD (GP2)
			1. 99.999% availability
			2. 3 IOPS per GB with upto 10,000 IOPS
			3. Ability to burst upto 3000 IOPS for short periods for volumes under 1 GB
		2. Provisioned IOPS SSD (IO1)
			1. Designed for I/O intensive applications such as relational or NoSQL databases.
			2. > 10,000 IOPS
		3. Magnetic (Standard)
			1. Lowest cost per gigabyte of all EBS volume types.
			2. Magnetic volumes
			3. Ideal for workloads where data is accessed infrequently, and apps where the lowest storage cost is important
				1. File Service (infrequently accessed storage)
5. Topics:
	1. AWS Command Line
	2. IAM Roles with EC2
	3. Bootstrap Scripts
	4. How to setup the PHP SDK on EC2
	5. Running some PHP Scripts that interact with S3
	6. Elastic Load Balancer Configuration
	7. HTTP Codes
	8. Available SDK's (for AWS)
6. Exam Tips:
	1. Differences between On Demand, Spot, Reserved
	2. EBS types
	3. DIRTMCG

#### Lab - User User Credentials
1. Log into AWS console
2. EC2
3. New EC2 instance
4. AMI instance
5. Next ...
6. Name: mytestec2
7. Security Group:
	1. TCP port 80
	2. TCP port 22
8. Use key
9. IAM:
	1. Set new user
		1. MyS3User
		2. Download Credentials
	2. New Group
		1. Attach the following policies
			1. AmazonS3FullAccess
		2. Next
	3. Add user to Group (user will inherit permissions of the group)
		1. MyS3User
10. Loginto EC2 instance
	1. `ssh <user>@ec2-.... -i MyEC2Key.pem`
11. Configure AWS CLI
	1. `aws configure` **(M)**
	2. Enter Access Key ID
	3. Enter Secret Access Key
	4. Default Region name: us-east-1
	5. Default output format: 
12. Creation of bucket
	1. `aws s3 mb s3://hellocloudgurusthisisatest`
	2. `aws s3 ls`
13. Open S3 bucket in Management Console
14. Where are the credentials stored
	1. Open `~/.aws/credentials` **(M)**
15. Where are other configuration settings
	1. `~/.aws/config` **(M)**
	
##### Roles
1. Log into console
2. Goto IAM
3. Click **Roles**
4. Click **Create New Role**
	1. Give a **Role Name**
5. Select **Amazon EC2**
	1. What is Role for Cross-Account Access? It is used for another account to access resources of my account
	2. What is Role for Identity Provider Access? Like facebook, google etc...
6. Select policy/policies
	1. **AmazonS3FullAccess**
7. Click **Next Step**
8. Click **Create Role**
9. Associating Roles to EC2 instance
	1. Note: We cannot associate roles to existing EC2 instance
	2. New instance must be created
		1. In the **Configure Instance Details** screen, goto **IAM role** and select the role that was created wich Full S3 access
		2. In the **Tag Instance** screen give a value to **Name**
		3. In teh **Configure Security Group** screen, select existing security group or add a new security group with port 80 and 22 enabled
		4. Select existing key and launch the instance
10. Loginto the instance using ssh as follows:
	1. `ssh -i ~/Downloads/<key-name>.pem ec2-user@<doman-name>`

##### Setting Up the PHP SDK
1. Download bootstrap script
	1. [https://s3-eu-west-1.amazonaws.com/acloudguru/s3bootstrap.sh](https://s3-eu-west-1.amazonaws.com/acloudguru/s3bootstrap.sh)
2. Launch a new EC2 Instance
	1. Select **Amazon Linux AMI (HVM)**
	2. Select **t2.micro**
	3. In Configure Instance Details screen, select **S3-admin-access** role for **IAM role**
	4. Open **Advanced Details** section and copy and paste the contents of the bootstrap script
	5. Give a value of **Name**
	6. In the **Configure Security Group** screen, Select and existing security group with port 80 and 22 open to the world
	7. Launch the instance
3. Testing:
	1. Open the following link in a browser: `http://<ip-address-or-domain-name-of-the-new-instance>/test.php`
4. Install SDK
	1. `ssh -i <key-name>.pem ec2-user@<domain-name>`
	2. `sudo su`
	3. `cd /var/www/html`
	4. Search for `aws php sdk`
	5. Click on **AWS SDK for PHP**
	6. Install as follows:
		1. `curl -sS https://getcomposer.org/installer | php` (installs composer)
		2. `php composer.phar require aws/aws-sdk-php` (runs composer command to install latest stable version of SDK)
	7. Open and see `/var/www/html/vendor/autoload.php`

##### AWS SDK for Ruby
1. Installing the AWS SDK for Ruby
	1. Prerequisites
		1. AWS account
		2. Ruby version >= 1.9
	2. To sign up for AWS
		1. Installation using Bundler
			1. Add `gem aws-sdk` to `Gemfile`
		2. Installation using RubyGems
			1. `[sudo] gem install aws-sdk` (latest version)
2. Configuring the AWS SDK for Ruby
		1. AWS access credentials are used by AWS SDK for Ruby to verify access to AWS services and resources 
		2. Select AWS region
	2. Set AWS credentials OR AWS STS access token
		3. Order of search for AWS access credentials
			1. Setting Credentials in a Client Object
			2. Setting Credentials Using Aws.config
			3. Setting Credentials Using Environment Variables
			4. Setting Shared Credentials
			5. Setting Credentials Using IAM
	1. Setting AWS Credentials
		1. Setting Shared Credentials
			1. `~/.aws/credentials` OR `%HOMEPATH%\.aws\credentials` (On Windows)
			2. Format:
			
					[default]
					aws_access_key_id = <access-key-id>
					aws_secret_access_key = <secret-access-key>
			
		2. Setting Credentials Using Environment Variables
			1. Set the following environment variables
			
					export AWS_ACCESS_KEY_ID=<access-key-id>
					export AWS_SECRET_ACCESS_KEY=<secret-access-key>
					
				OR in Windows run
			
					set AWS_ACCESS_KEY_ID=<access-key-id>
					set AWS_SECRET_ACCESS_KEY=<secret-access-key> 
				
				
		3. Setting Credentials Using Aws.config
			1. In Ruby code add the following to Aws.config hash
			
					Aws.config({
						:access_key_id => '<access-key-id>',
						:secret_access_key => '<secret-access-key>'
					})
					
		4. Setting Credentials in a Client Object
			1. Set credentials in Ruby code when an AWS client is created
			
					s3 = Aws::S3::Client.new(
						access_key_id: creds['<acces-key-id>'],
						secret_access_key: creds['<secret-access-key>']
					)
		
		5. Setting Credentials Using IAM
				1. One IAM role must be created
				2. Give EC2 instance the role
			1. Creation of AWS STS Access Token
				1. `linked::account::arn`: Amazon Resource Name (ARN) of role
				2. `session-name`: id for assumed role session
				
						role_credentials = Aws::AssumeRoleCredentials.new(
							client: Aws::STS::Client.new,
							role_arn: "linked::account::arn",
							role_session_name: "session-name"
						)
					
	2. Setting a Region
			1. AWS SDK for Ruby searches for regions in the following order
		1. Setting the Region Using Environment Variables
			1. `export AWS_REGION=us-west-2`
			2. `set AWS_REGION=us-west-2`
		2. Setting the Region Using Aws.config
			1. `Aws.config.update({region: 'us-west-1'})`
		3. Setting the Region in a Client or Resource Object
				1. s3 = Aws::S3::Resource.new(region: 'us-west-1')
			1. Setting a Non-Standard Endpoint
3. Using the AWS SDK for Ruby REPL
4. Using teh SDK with Ruby on Rails
	1. Integrating the AWS SDK for Ruby with Rails
	2. Amazon SES Support for ActionMailer
	3. Logging

##### Hello World Tutorial
1. Using AWS SDK for Ruby in Program
	1. Add `require 'aws-sdk'` to use AWS SDK for Ruby classes and methods
2. Creation of Amazon S3 Resource
	1. `s3 = Aws::S3::Resource.new(region: <region>)`
3. Creation of a Bucket
	1. `my_bucket = s3.bucket('my_bucket')`
	2. `my_bucket.create`
4. Adding a File to the Bucket
	1. Add a file named `my_file` to bucket named `my_bucket`
		
			name = File.basename 'my_file'
			obj = s3.bucket('my_bucket').object(name)
			obj.upload_file('my_file')
		
5. Listing the Contents of a Bucket
	1. List upto 50 items for bucket
		
			my_bucket.objects.limit(50).each do |obj|
				puts " #{obj.key} => ${obj.etag}"
			end
				
6. Complete Program 
	1. `hello-s3.rb`
	
			require 'aws-sdk'
			
			NO_SUCH_BUCKET = "The bucket '%s' does not exist!!"
			
			USAGE = <<DOC
				Usage: hello-s3 bucket_name [operation] [file_name]
				
				Where:
					bucket_name (required) is the name of the bucket
					operation	is the operation to perform on the bucket:
								create	-	creates a new bucket
								upload	-	uploads a file to the bucket
								list	-	(default) lists up to 50 bucket items
								
					file_name	is the name of the file to upload,
								required when operation is 'upload'
			DOC
			
			# Set the name of the bucket on which the operations are performed.
			# This argument is required
			bucket_name = nil
			
			if ARGV.length > 0
				bucket_name = ARGV[0]
			else
				puts USAGE
				exit 1
			end
			
			# The operation to perform on the bucket
			operation = 'list' # default
			operation = ARGV[1] if (ARGV.length > 1)
			
			# The file name to use with 'upload'
			file = nil
			file = ARGV[2] if (ARGV.length > 2)
			
			# Get an Amazon S3 resource
			# Don't forget to change your_region to the appropriate region
			s3 = Aws::S3::Resource.new(region: <your-region>)
			
			# Get the bucket by name
			bucket = s3.bucket(bucket_name)
			
			case operation
			when 'create'
				# create a new bucket if it doesn't already exist
				if bucket.exists?
					puts "The bucket '%s' already exists!" % bucket_name
				else
					bucket.create
					puts "Create new S3 bucket: %s" % bucket_name
				end
	
7. Running the program
8. Next Steps

### Launch Our First EC2 Instance - Part 2 ###
### How to use Putty (Windows Users Only) ###
### Securty Groups ###
### Volumns vs Snapshots ###
### CLI Commands For The Developer Exam ###
### Bash Scripting ###
### Lambda ###
### EC2 Instance Meta-data ###
1. `curl http://169.254.169.254/latest/meta-data/`
	1. list of resources
2. `curl http://169.254.169.254/latest/meta-data/public-ipv4`
3. `yum install httpd php php-mysql -y`
	1. `service httpd start`
4. `yum install git`
5. `cd /var/www/html`
	1. `git clone https://github.com/acloudguru/metadata`
6. `cd metadata`
	1. PHP code for getting Public IP address

### Elastic Load Balancers - Exam Tips ###
1. Lab:
	1. It spreads load across different web servers
2. Open EC2 Service
	1. Click Running Instances
	2. Actions > Instance State > Start
3. `ssh ec2-user@<public-ip> -i <file>.pem`
	1. `service httpd status` (`service httpd start`)
	2. `chkconfig httpd on` (httpd starts everytime ec2 instance starts)
4. `cd /var/www/html`
	1. `nano index.html`
	1. `nano healthcheck.html`
		
			This instance is healty

5. Goto Console:
	1. Services > EC2
6. Goto Load Balancers
	1. Click Create
	2. Two types of load balancers:
		1. Application load balancer: They work at application layer (layer 7) - for http and https say
		2. Classic load balancer (most exam questions)
			1. Does routing at TCP layer and can do some load balancing at application layer (layer 4 load balancer)
	3. Click `Classic Load Balancer` (costs money)
		1. Load Balancer name: MyClassicELB
		2. LB Inside: Default VPC
		3. Create an internal load balancer? (no)
		4. Enable advanced VPC configuration? (no)
		5. Listener Configuration:
			1. Load Balancer Protocol: HTTP on 
			2. Load Balancer Port: 80 
			3. Instance Protocol: HTTP (where it is passed on)
			4. Instance Port: 80
	4. Select a security group
		1. Ignore warning about using HTTPs instead of HTTP
	5. Configure Health Check
		1. Ping Protocol: HTTP
		2. Ping Port: 80
		3. Ping Path: /healthcheck.html
		4. Advanced Details:
			1. Response Timeout: 2 seconds - amount time it waits to recieve response from health check
			2. Interval: 5 - Time between health checks
			3. Unhealthy threshold: 2 - Number of consecutive health check failures before declaring an EC2 instance is unhealthy
			4. Healthy threshold: 3 - Number of health checks it has to pass to be considered healthy again
		5. Add EC2 instances
		6. Key - value pair
			1. Key: ProductELB
			2. Value: ON
		7. Review and Create
		8. Create
7. Configuration:
	1. Name:
	2. DNS Name (copy it)
	3. VPC ID
	4. Availability zones
	5. Type: Classic
8. Health Check
9. Simulating Health Check failure:
	1. Delete `healthcheck.html` from EC2 instance
	2. Check `Instance` (OutOfService)
		1. EC2 will not receive any more traffic from the load balancer
10. `echo 'I am healthy cloud gurus' > healthcheck.html`
11. Open the ELB DNS link in browser: Points to index.html
	1. We don't get Public IP address for ELBs
		1. Since public IP address changes
12. Second type of load balancer: Application load balancer:
	1. There is a course on acloudguru platform
	2. Select and continue:
		1. Name: MyApplicationELB
		2. Scheme: Inernet-facing
		3. Listeners:
			1. HTTP
		4. Availability zones:
			1. VPC: default
			2. Subnets:
				1. One subnet per availability zone
				2. Add both
		5. Next
	3. Use HTTP
	4. Security Group
	5. Configure Routing:
		1. Target Group: New Target Group
		2. Name: MyAppELBTG
		3. Protocol: HTTP
		4. Port: 80
		5. Health Checks: (on)
			1. Protocol: HTTP
			2. Path: /healthcheck.html
		6. Advanced health check settings:
			1. Port: traffic port
			2. Healthy threshold: 2
			3. Unhealthy threshold: 2
			4. Timeout: 2
			5. Interval: 5 seconds
			6. Success codes: (can be multiple values) - 200-209
	6. Register Targets:
		1. Click **Add to registered** on port 80
	7. Click **Create**
	8. Copy DNS (no Public IP)
	9. Listeners:
		1. Port 80
	10. Monitoring
		1. Errors
	11. Paste the DNS in browser
13. Summary:
	1. Instances monitored by ELB are reported as:
		1. InService, or OutOfService
	2. Health checks check the instance health by talking to it (HTTP/HTTPS and look at individual files)
	3. Have their own DNS name. You are never given an IP address
	4. Read the ELB FAQ for Classic Load Balancers (very important)
	5. What to deep dive on application load balancers? Check out deep dive course!

### SDK's - Exam Tips ###
1. Exam Tips:
	1. Available SDK's [https://aws.amazon.com/tools/](https://aws.amazon.com/tools/)
		1. Android, iOS, JavaScript (Browser)
		2. Java
		3. .Net
		4. Node.js
		5. PHP
		6. Python
		7. Ruby
		8. Go
		9. C++ (new)
	2. Default regions:
		1. US-EAST-1: some SDK's have this (Java)
		2. Some do not have default region: (Node.js)

### Summary of EC2 Section ###
1. Very important module (Read EC2 FAQ for exam)
2. Summary:
	1. Know the differences between:
		1. On Demand
		2. Spot
		3. Reserved
		4. Dedicated Hosts
	2. For spot instances:
		1. If you terminate, pay for the hour (if usage is for 2 1/2 hours, I pay for 3 hours)
		2. If AWS terminates, when bid price is lower then I pay for 2 hours since third hour is free
	3. Instance Types:
		1. Need to know them (not for exam)
			1. D2: Dense storage - fileservers/data warehousing/hadoop
			2. R4: Memory optimized - memory intensive apps/dbs
			3. M4: General purpose - application servers
			4. C4: Compute optimized - CPU intensive apps/DBs
			5. G2: Graphics intensive - Video encoding/ 3D application streaming
			6. I2: Hish speed storage - NoSQL, DBs, Data warehousing, ...
			7. F1: Field Programmable Gate Array: Hardware acceleration for code
			8. T2: Lower cost, general purpose - Web servers/ small DBs
			9. P2: Graphics/GPU - Machine learning, Bit coin mining ...
			10. X1: Memory optimized - SAP HANA/Apache Spark ...
		2. DR MC GIFT PX
	4. EBS:
		1. SSD, General Purpose - GP2 - (Up to 10,000 IOPS)
		2. SSD, Provisioned IOPS, IO1 - (More than 10,000 IOPS)
		3. HDD, Throughput Optimized - ST1 - frequently accessed workloads (cannot be used as root volumes)
		4. HDD, Cold - SC1 - less frequently accessed data (cannot be used as root volumes)
		5. HDD, Magnetic - Standard - cheap, infrequently accessed storage (can be used as boot volumes)
		6. We cannot mount 1 EBS volume to multiple EC2 instances, instead we can use EFS
	5. EC2 Lab Exam:
		1. Termination Protection is turned off by default, you must turn it on
		2. On an EBS-backed instance, default action is for root EBS volume to be deleted when instance is terminated (root EBS volume - deleted):
			1. We can turn it off
		3. Root volumes cannot be encrypted by default, you need third party tool (bit locker) to ancrypt root volume
		4. Additional volumes can be encrypted
	6. Volumes vs Snapshots
		1. Volumes exist on EBS
			1. Virtual harddisk
		2. Snapshots exist on S3
		4. We can take snapshot of volume and this will store the volume on S3
		5. Snapshots are point in time copies of volumes
		6. Snapshots are incremental, (only blocks that have changed since that last snapshot are moved to S3)
	7. Volumes vs Snapshots - Security
		1. Snapshots of encrypted volumes are encrypted automatically
		2. Volumes restored from encrypted snapshots are encrypted automatically
		3. You can share snapshots only if they are unencrypted
			1. Can be shared with other AWS accounts or made public
	8. Snapshots of Root Device Volumes:
		1. For creation of Amazon EBS volumes that serve as root devices, you should stop the instance before taking the snapshot
	9. EBS vs Instance Store -Exam Tips:
		1. Instance Store volumes are also called ephemeral storage
		2. Instance store volumes cannot be stopped. If host fails, the data is lost
		3. EBS backed instances can be stopped. We do not lose data on the instance if it is stopped
		4. Rebooting both will not lose data
		5. Both root volumes will be deleted on termination but EBS volumes can be retained by explicitly requesting.
			1. We can set a flag for EBS backed storage to not delete it on termination
	10. How to take snapshot of a raid array?
		1. Problem: Taking snapshot excludes data held in cache by applications and OS. For single volume it may not be an issue but for mutiple volumes in RAID array, it could cause problems due to interdependency of the array.
		2. Solution: Take application consistent snapshot (?)
			1. Stop the application from writing to disk
			2. Flush all caches to the disk
			3. How to achieve the above? (Three ways) - aim: prevent any IO before taking a snapshot of RAID array
				1. Freeze the file system
				2. Unmount the RIAD Array
				3. Shut down the associated EC2 instance
	11. Amazon Machine Images - Exam Tip
		1. AMI's are regional. We can launch an AMI from the region in which it is stored.
			1. Solution: Copy AMI to other regions using console/command line/Amazon EC2 API
	12. Cloud Watch: (for performance monitoring)
		1. Standard monitoring (5 minutes) is enabled by default for EC2
		2. We can enable Detailed Monitoring (every 1 minute) - pay extra
		3. What do I get with CloudWatch:
			1. Dashboards - Custom dashboards to see what is happening with AWS environment
			2. Alarms - they send notifications when particular thresholds are hit
				1. Can be used for auto scaling events
			3. Construct Events: Help to respond to state changes in AWS resources
			4. Send Logs: help to aggregate, monitor, and store logs
	13. CloudTrail: for auditing
	14. Roles: more secure than storing access key and secret access key on individual EC2 instances
		1. Roles are easier to manage
		2. Roles can only be assigned only when EC2 instance is being provisioned
			1. However, we can change permission later on
		3. Roles are universal, we can use them in any region
	15. Instance Meta-data
		1. Used to get information about an instance (public ip ...)
		2. `curl http://169.254.169.254/latest/meta-data/`
		3. No user-data for an instance
	16. EFS: Elastic File System
		1. Supports Network file systm v4 (NFS v4) protocol
		2. We pay only for the storage we use (no pre-provisioning required)
			1. 30 c pre gig
		3. Can scale up to petabytes
		4. Can support thousands of concurrent NFS connections
		5. Data is stored across multiple availability zones within a region
		6. Read after write consistency
			1. We can immediately read an object that was written last
		7. Use case for file server: We can apply both file level and directory level permissions within EFS	
	17. Exam Tips:
		1. How to Use different terms
			1. AWS EC2 DESCRIBE-INSTANCES
			2. AWS EC2 DESCRIBE-IMAGES
			3. AWS EC2 RUN-INSTANCES
				1. START-INSTANCES: starts a stopped instance
				2. RUN-INSTANCES: provisions a new instance
	18. Lambda:
		1. What is Lambda? AWS Lambda is a compute service where you can upload your code and build a Lambda function. AWS lambda takes care of provisioning and managing the servers that you use to run the code. You don't have to worry about OS, Patching, Scaling ...
		2. Usage of lambda:
			1. As an event-driven compute service where AWS Lambda runs your code in response to events. These events could be changes to data in an Amazon S3 bucket or an Amazon DynamoDB table.
			2. As a compute service to run code in response to HTTP requests using Amazon API Gateway or API calls made using AWS SDKs. This is what is used at A Cloud Guru.

## S3 ##
### S3 Essentials ###
1. Simple Storage Service:
	1. Provides developers and IT teams with secure, durable, highly-scalable object storage. Amazon S3 is easy to use, with a simple web services interface to store and retrieve any amount of data from anywhere on the web.
	2. Place to store files.
	3. It is object based storage
		1. Object: files, documents, flat files
		2. Not used for installing OS or Database server (we have to use block based storage)
	4. Data is spread across multiple devices and facilities
		1. Designed to withstand failure
2. Basics:
	1. S3 is object based
	2. Files can be from 0 bytes to 5TB
	3. There is unlimited storage:
		1. If more storage is required, new SAN is provisioned
	4. Files are stored in Buckets
		1. Bucket: folder
	5. Universal namespace: names must be unique globally across users as well
	6. Example: https://s3-eu-west-1.amazonaws.com/acloudguru
		1. region
		2. bucket name
	7. If upload to S3 is successful, we receive HTTP code of 200
3. Data consistency Model for S3:
	1. Read after Write consistency for PUTS of new objects
		1. We can read an object immediately after a write
	2. Eventual consistency for overwrite PUTS and DELETES (can take some time to propagate)
		1. Updates and deletes take some time before we can read
	3. Updates to S3 are atomic: we get new data or old data (not partial or corrupted data)
4. S3 is simple key value store:
	1. Key: name
	2. Value: data (sequence of bytes)
	3. Version ID (versioning) *
	4. Metadata (Data about data)
		1. Date we have uploaded the file
		2. Last time we updated a file
5. S3 is designed to sort objects into alphabetical order
	1. key: 
	2. Subresources:
		1. Underneath objects April 20,2017 13:02:43
			1. Access Control Lists
				1. Who can access this object
				2. Individual file level
				3. 
	3. Supports Torrent protocol
6. It is built for 99.99% availability
	1. Amazon guarantees 99.9% availability (SLA: Service Level Agreement)
	2. Amazon guarantees 99.999999999% durability for S3 information (how durable the data is)
	3. Tiered Storage available
	4. Lifecycle Management
		1. First 90 days store here
		2. Next 90 days store here
		3. After that archive it
	5. Versioning: one object, many versions
	6. Encryption: 
	7. Secure data using ACSs and Bucket Policies
7. Storage tier classes:
	1. S3 - 99.99% availability, 99.999999999% durability (11 9s), stored redundantly across multiple devices in multiple facilities and is designed to sustain loss of 2 facilities concurrently
	2. S3 - IA (Infrequently accessed) for data that is accessed less frequently, but requires rapid access when needed. Lower fee than S3, but you are charged a retrieval fee.
	3. Reduced Redundancy Storage: Designed to provide 99.99% durability and 99.99% availability of objects over a given year
		1. cheaper
		2. Use case: data that can be generated again (thumb nails of images)
		3. Concurrent facility fault tolerance: 1
		4. First byte latency: milliseconds
		5. Lifecycle management policies: yes
	4. Gacier: Very cheap, but used for archival only. It takes 3 - 5 hours to restore from Glacier
8. Glacier: is extremely low-cost storage service for data archival. It stores data for as little as $0.01 per gigabyte per month. It is optimized for data that is infrequently accessed and for which retrieval times of 3 to 5 hours are sutable.
	1. Durability: 99.999999999%
	2. Availability: N/A
	3. Availability: SLA: N/A
	4. Miniumum object size: N/A
	5. Maximum Storage Duration: 90 days
	6. Per GB Retrieved
	7. First byte latency: select minutes or hours
	8. Storage class: object level
	9. Lifecycle transitions: yes
9. Charges:
	1. For storage
	2. No of requests
	3. Storage Management Pricing:
		1. We can tag data (for HR, Developers ...): track cost per tag
	4. Data transfer pricing
		1. In coming data is free
		2. Moving data around, Replication say to another region is chargeable
	5. Amazon S3 Transfer acceleration: enables fast, easy, and secure transfers of files over long distances between end users and an S3 bucket. It takes advantage of Amazon CloudFront's globally distributed edge locations. As data arrives at an edge location, data is routed to Amazon S3 over an optimized network path.
		1. Upload is to edge locatoin (closer to user)
		2. Superior network exists between AWS region and edge location
10. Exam tips:
	1. S3 is object based. Allows upload of files
	2. Files can be from 0 bytes to 5 TB
	3. Unlimited storage.
	4. Files are stored in buckets
	5. S3 is universal namespace (names must be unique globally)
	6. Link: `https://s3-<regions>.amazonaws.com/<bucketname>`
	7. Consistency models:
		1. Read after write consistency
		2. Eventual consistency for overwrite PUTS and DELETES
	8. S3 Storage Classes/Tiers:
		1. S3 (durable, immediately available, frequently accessed)
		2. S3 - IA (durable, immediately available, infrequenty accessed)
		3. S3 - Reduced Redundancy Storage
		4. Glacier
	9. Core fundamentals:
		1. Key (name)
		2. Value (data)
		3. Version ID
		4. Metadata
		5. Subresources
			1. ACL
			2. Torrent
	10. Success upload generates 200 HTTP code
	11. S3 FAQ before taking the exam

### Creation of an S3 Bucket Using The Console ###
1. AWS console:
	1. Services:
		1. S3
	2. Create Bucket:
		1. Bucket Name: acloudguru02017 (lowercase characters for any region)
		2. Region: London
2. Properties;
	1. Click **Properties**
3. Storage management:
	1. Click **Opt-In** to try storage management (new console)
		1. Click on Bucket > Properties
			1. Versioning: Same object different versions
			2. Static website hosting: plain html static (serverless) - scales automatically
				1. Low cost
			3. Logging:
				1. Setup access log records: tells who is doing what with the bucket
					1. access requests
			4. Advanced settings:
				1. Tags: used to track costs against projects or other criteria (HR tag, Developers tag ...)
				2. Cross region replication: automating copying objects across different AWS regions
			5. Events:
				1. Receive notifications when specific events occur in bucket
					1. File upload -> invoke lambda function (converts to thumbnail)
		2. Lifecycle Management:
			1. Moving data between storage types based on how old it is
		3. Permissions:
			1. ACL: Private by default for S3
		4. Management:
			1. Analytics: do analytics of storage classes (to decide on storage type)
			2. Metrics: 
			3. Inventory: Reports
				1. Of what is in the bucket or subfolder in the bucket
		5. Click **Objects**
			1. Upload
			2. Add File
			3. Next
			4. Permission: Default
			5. Storage class: Standard
			6. Encryption: None
			7. Metadata
			8. Upload
		6. Click the file
			1. Open link (access denied)
			2. Click Permissions
				1. Add grantee > Everyone
				2. Read access
			3. Overview > Open the link
		7. Properties:
			1. Storage class: standard IA
			2. Encryption: AES-256
			3. Metadata
			4. Tags

### Creation of an S3 Website ###
1. Create Bucket
	1. Bucket name: mys3websitelondon
	2. Region: EU (London)
2. Next
3. Next
4. Create Bucket
5. Properties > Static Website hosting
	1. Endpoint: (URL Pattern is important for exam)
		1. `http://<bucket-name>.s3-website.<region>.amazonaws.com`
	2. Check **Use this bucket to host a website**
		1. Index document: index.html
		2. Error document: error.html
6. index.html

		<html>
			<head>
				<title>Hello Cloud Gurus</title>
			</head>
			<body>
					<h1>Hello Cloud Gurus</h1>
					<h2>Welcome to my website</h2>
			</body>
		</html>
		
7. error.html

		<html>
			<head>
				<title>Hello Cloud Gurus</title>
			</head>
			<body>
					<h1>Hello Cloud Gurus</h1>
					<h2>There has been an error</h2>
			</body>
		</html>

8. Click **Upload**
9. Click **Add files**
10. Select `index.html` and `error.html`
11. Next
12. Set permissions
	1. Any authenticated AWS user: nothing
	2. Everyone: Objects - Read
13. Next
14. Click **Upload**
15. Click **Properties**
16. Click **Static website hosting**
	1. Click on endpoint
17. Change permissions of index.html
	1. Click **Objects**
	2. Select `index.html`
	3. Click **Permissions**
	4. Click **All Users**
		1. Remove **Read**
		2. Hit **Save**
18. Hit the endpoint: error.html will be executed
19. Important points:
	1. It scales automatically (no worries about load balancers, servers)
	2. It can handle any load
	3. Only static websites

### CORS Configuration ###
1. Cross origin Resource Sharing (CORS) Lab
	1. JavaScript in one S3 bucket to share code in another S3 bucket
2. New Bucket:
	1. Bucket Name: myindexwebsitelondon
	2. Region: London
	3. Permissions:
		1. Everyone: Object - Read
	4. Properties:
		1. Static website hosting
		2. Use this bucket to host a website
	5. Objects:
		1. index.html
		
				<script>
					$("#get-html-from-other-s3").load("loadpage.html")
				</script>
				
	6. Click **Upload**
	7. Select all three files
	8. Permissions: Object - Read
	9. Click on `index.html`
	10. Delete `loadpage.html`
		1. Check `loadpage.html`
		2. More > Delete
		3. Delete
3. New bucket:
	1. Bucket name: mycorstestbucketlondon
	2. Region: EU (London)
	3. Next
	4. Permissions: Object - Read
	5. Create
	6. Properties:
		1. Static website hosting
		2. Use this bucket to host a website
		3. Save
	8. Objects > Upload > Add files
		1. loadpage.html
		2. Permissions: Objects - read
		3. Next
		4. Upload
		5. Properties:
			1. Click on link
			2. <link>/loadpage.html
			3. Copy the URL
4. index.html

		<script>
			$(...).load("<paste-the-link>")
		</script>
		
5. Objects
	1. Check `index.html`
	2. More > Delete
	3. Upload
		1. index.html
	4. Permissions: objects -read
	5. Click `index.html`
	6. Click the link
6. Configuration:
	1. `myindexwebsitelondon` > Properties > Static website hosting
	2. Copy the link
	3. `mycorstestbucketlondon`
		1. Permissions:
			1. Access Control List > CORS configuration
			
					<AllowOrigin><link></AllowOrigin>
					
			2. Save
	4. `myindexwebsitelondon` > index.html
		1. Click the link (does not word)
			1. Paste the copied url and hit enter
	
### S3 Version Control ###
1. Services > S3
2. New Bucket
	1. Bucket name: mylondonbucket
	2. Region: London
	3. Versioning:
		1. Enable Versioning
	4. Permissions:
		1. User permissions: 
			1. Objects:
				1. Grant permissions to the user to list, create, overwrite, or delete objects in the bucket.
				2. read and Write
			2. Object permissions:
				1. Grant permissions to the user to read or write to an access control list (ACL) for the bucket
		2. Public permissions:
			1. Any authenticated AWS user:
			2. Everyone: 
	5. Create bucket
3. If versioning is turned on for bucket, the bucket can only be disabled but cannot be removed
4. New file:
	
		Hello Cloud Gurus
		
5. Objects > Upload
	1. Permissions:
		1. Owner: Read, Write, Read, write
		2. Everyone: Read
	2. Next
	3. Finish
	4. Click the object
	5. Click on the link
6. Make a small change to the file

		This is the second version
		
7. Upload
	1. Permission:
		1. Everyone: Read
8. Click Latest version drop down
	1. Select the version
9. Note: It shows only the latest version under objects
10. Deleting the latest version:
	1. Click the latest version dropdown and click delete
11. Restoring an object:
	1. Upload the latest version
	2. More > Delete
	3. Amazon S3 > Switch to old console
		1. Click the bucket
		2. Show
		3. Check the delete marker object
			1. Actons > Delete
		4. Hide
			1. Restored object
12. Goto the new console:
	1. Click properties
	2. Storage management
	3. Opt-in
	4. Click the bucket
13. We can download by clicking the drop down
14. Summary:
	1. Stores all versions of an object (including all writes and even if you delete an object)
	2. Great backup tool
	3. Once enabled, versioning cannot be disabled, only suspended.
	4. Integrates with Lifecycle rules
	5. Versioning's MFA delete capability (multi-factor authentication to provide additional layer of security)
		1. Security code may be required (complicated setup)

### Cross Region Replication ###
1. Replicate objects from a bucket in one region to a bucket in another region.
2. Services > S3
3. New Bucket:
	1. mysydneybucket-2
	2. Asia Pacific
	3. Next
	4. Finish
4. Select London Bucket
	1. Advanced Settings
	2. Cross-region replication (must enable versioning on both buckets)
	3. Enable cross-region replication
		1. Source: Whole bucket (Prefix in this bucket - subfolder)
		2. Region: Asia Pacific (Sydney)
		3. mysydneybucket-2
		4. Destination storage class:
			1. Standard - IA
		5. Select role: (Enables AWS services to talk to each other)
			1. Create new role
		6. Save
5. Enable versioning for mysydneybucket-2
6. Repeat Cross-region replication procedure (select the created role)
7. Note: Objects which are already in the buket are not replicated but only new objects
8. Modify the file and save it:

		This is version 3
		
9. Upload the file
	1. Everyone: Read
10. Open syndey bucket
	1. If we update a verion, it replicates the older versions as well
11. Old console:
	1. New bucket
	2. Bucket name: mydublinbucket
	3. Region: Ireland
	4. Select the new bucket
		1. Click **Enable Versioning**
		2. Click Enable Cross-Region Replication
			1. Source: This bucket
			2. Region: Tokyo
			3. Destination bucket: mytokyobucket-1
			4. Destination Storage class: S3 Standard - Infrequent Access
		3. Click **Create/Select IAM Role**
			1. Click on the role
				1. Go through the policy
		4. Allow
		5. Save
12. Upload file
	1. Select ireland bucket > Click **Upload**
	2. Add Files > hellocloudgurus.txt
	3. Open Tokyo bucket (check if it replicated)
		1. Click on **Versions** tab to see the different versions of the file

13. We cannot push to multiple buckets and we cannot chain replication as well
14. Update the file:
	
		This is version 5
		
15. Upload > Add Files > hellocloudgurus.txt
	1. Go to Tokyo bucket (check for replication)
16. Delete the file from dublin bucket:
	1. Select the object
	2. Actions > Delete
		1. Click **Show** (the previous versions exist but the last version has a delete marker)
	3. Open Tokyo bucket
		1. Check if the object has got replicated
17. Open dublin bucket
	1. Click **Show**
	2. Check the object with the delete marker
	3. Click **Actions**
	4. Click **Delete** (restores the object)
	5. Goto Tokyo bucket and click **Show** (It does not replicate the deletion of delete marker)
	6. Click **Actions** > **Delete** (deletes the delete marker)
18. Delete the newest version in dublin bucket
	1. **Show**
	2. Check the newest version
	3. **Actions**
	4. **Delete**
	5. Goto Tokyo bucket and click **Show** (it still has version 2)
19. Note: When we delete an individual version or delete a delete marker, it does not get replicated. Only when we delete an object, it gets replicated in the destination bucket
20. Summary:
	1. Versioning must be enabled on both the source and destination buckets
	2. Regions must be unique (we cannot use same region for cross region replication)
	3. Files in an existing bucket are not replicated automatically. All subsequent updated files will be replicated automatically.
		1. If we upload a newer version of an existing file, then all the versions of the file will get replicated
	4. You cannot replicate to multiple buckets or use daisy chaining (at this time)
	5. Delete markers are replicated
	6. Deleting individual versions or delete markers will not be replicated
	7. Exam: Understand what is Cross Region Replication is at a high level (how to architect it for disaster recovery)

### S3 Lifecycle Management & Glacier ###
1. Topics: Lifecycle Management, IA S3 & Glacier Lab
2. Log in to AWS console
	1. Services > Storage > S3
	2. Delete all buckets (if you want to)
		1. Click on a bucket
		2. Hit **Delete bucket**
		3. Type the name of the bucket again
		4. Click **Confirm**
3. Switch to old console
	1. Click on **Switch to the old console**
	2. Click **Create bucket**
		1. Bucket name: mylifecyclebucketlondon
		2. Region: London
		3. Click **Create**
4. Goto Glacier:
	1. Services > Storage > Glacier
	2. Change the region (make sure the S3 bucket is not is Asia Pacific (Singapore) and South America (Sao Paulo) because glacier does not exist in those regions)
5. Select the bucket
	1. Click **Enable Versioning**
	2. Click **Lifecycle**
		1. Click **Add rule**
			1. Choose rule target: While bucket (Prefix: it is a folder in bucket)
			2. Rules:
				1. Action on Current Version
					1. Transition to the Standard - Infrequent Access Storage Class: 30 Days (after object's creation)
					2. Archive to the Glacier Storage Class: 60 Days (after object's creation)
					3. Expire (puts deleter marker): 61 days (after object's creation)
				2. Action on Previous Versions (shown only when versioning is enabled on S3 bucket)
					1. Transition to the Standard - Infrequent Access Storage Class: 30 days after becoming a previous version
					2. Archive to the Glacier Storage Class: 60 Days after becoming a previous version
					3. Permanently Delete: 150 (Objects archived to Glacier Storage Class incur costs for at least 90 days of storage even if they are deleted or overwritten earlier)
				3. Action on Incomplete Multipart Uploads (will clean up multipart uploads that are not completed within a predefined number of days after initiation)
					1. End and Clean up Incomplete Multipart Uploads: 7 days
				3. Rule Name: mylifecyclerule
				4. Click **Create and activate the rule**
	3. Switch to new console
		1. Storage Management
			1. Opt-in
		2. Hit **Create bucket**
			1. Bucket name: mylifecyclebucketlondon2
			2. Region: EU (London)
			3. Hit **Next**
		3. Click **Versioning**
			1. Click **Enable versioning**
			2. Click **Save**
			3. Click **Next**
			4. Click **Create bucket**
		4. Click the new bucket
		5. Click **Lifecycle**
		6. Click **Add lifecycle rule**
			1. Enter a rule name: lifecyclerule2
			2. Add filter to limit scope to prefix/tags (blank applies to the entire bucket)
			3. Click **Next**
			4. Configure transition:
				1. Check **Current version**
				2. Check **Previous versions**
				3. Click **Add transition**
					1. Transition to Standard-IA after: 30 Days
				4. Click **Add transition**
					2. Transition to Glacier after: 60 Days
			5. For Previous versions:
				1. Click **Add transition**
					1. Transition to Standard-IA after: 30 Days
					2. Transition to Amazon Glacier after: 60 Days
				2. Configure Expiration:
					1. Check Current version
					2. Check Previous versions
					3. Expire current version of object
						1. After: 61 Days from object creation
					4. Permanently delete previous versions
						1. After: 61 Days from becoming in pervious version
					5. Clean up incomplete multipart uploads
						1. After 7 Days from start of upload
				3. Save
		7. Select the bucket
			1. Click **LIfecycle**
			2. Click the rule
			3. Click **Edit** (see transitions)
6. Exam tips:
	1. Can be used in conjunction with versioning
	2. Can be applied to current versions and previous versions
	3. Following actions can now be done:
		1. Transition to the Standard - Infrequent Access Storage Class (128Kb and 30 days after the creation date).
		2. Archive to the Glacier Storage Class (30 days after IA, if relevant)
	4. Permanently Delete (objects using lifecycle management policies)

### Cloud Front Overview ###
1. CDN: Content delivery Network is a system of distributed servers (network) that deliver webpages and other web content to a user based on the greographic locations of the user, the origin of the webpage and a content delivery server
	1. Ordinarily there is difference of latencies when connecting to a server in a particular region from different parts of the world
2. CloudFront: 
	1. Edge location: Location where content will be cached. This is separate to an AWS Region/AZ (there may not be a region but there may be an edge location)
	2. Origin: This is the origin of all the files that the CDN will distribute. This can be either an S3 Bucket, an EC2 Instance, an Elastic Load Balancer or Route53
	3. Distribution: This is the name given to the CDN which consists of a collection of Edge Locations.
3. A request would go to an edge location first
	1. If the object is not cached, the edge location pulls it down from the S3 bucket (from Ireland) and caches it for TTL (Time To Live)
	2. When second user accesses the file, it is downloaded from the edge location (speeds up delivery)
4. Amazon CloudFront can be used to deliver your entire website, including dynamic, static, streaming, and interactive content using a global network of edge locations. Requests for your content are automatically routed to the nearest edge location, so content is delivered with the best possible performance.
5. Amazon CloudFront is optimized to work with other Amazon Web Services, like Amazon Simple Storage Service (Amazon S3), Amazon Elastic Compute Cloud (Amazon EC2), Amazon Elastic Load Balancing, and Amazon Route 53. Amazon CloudFront also works seamlessly with any non-AWS origin server, which stores the original, definitive versions of your files.
6. CloudFront Key Terminology:
	1. Web Distribution: Typically used for Websites
	2. RTMP: Used for Media Streaming
7. Exam:
	1. Edge Location: This is the location where content will be cached.
		1. This is separate to an AWS Region/AZ
	2. Origin: (Can also be custom location)
	3. Distribution
		1. Web Distribution: For Websites
		2. RTMP: Media streaming
	4. Edge Locations are not READ only, you can write to them too.
	5. Objects are cached for the life of TTL (Time To Live)
	6. You can clear cached objects, but you will be charged
		1. If there are updates at the origin say

### Creation of CDN ###
1. Log into AWS console
2. Take note of region
3. Open S3
	1. Click **Create bucket**
	2. Fill out the form:
		1. Bucket name: mysydneycloudfrontdist (farthest region possible)
		2. Region: Asia Pacific (Sydney)
	3. Next
	4. Click **Create bucket**
4. Click the new bucket
	1. Click **Upload**
	2. Click **Add files**
	3. Select `logo-large`
	4. Next
	5. Manage public permissions:
		1. Everyone: Objects -> Read
	6. Next
	7. Click **Upload**
5. click on object name
	1. Click on the Link (image takes time to load)
6. Services -> CloudFront
	1. Click **Create distribution**
		1. Two types:
			1. Web: for websites (html, css, php, graphics)
				1. Distribute media files using HTTP or HTTPS
				2. Add, update, or delete objects, and submit data from web forms
				3. Use live streaming to stream an event in real time
				4. Store files in an origin (S3 or web server). Can add more origins after distribution is created
			2. RTMP:
				1. For speeding up distribution of streaming media files using Adobe Flash Media Server's RTMP protocol
				2. Allows end user to begin playing a media file before the file has finished downloading from CloudFront edge location.
					1. Store media file in Amazon S3 bucket
					2. Build a web distribution to use CloudFront for live streaming
	2. Click **Get Started** under Web
	3. Options:
		1. Origin Domain Name: AWS resource - Amazon S3 Bucket/ Elastic load balancer
		2. Origin Path (sub folder within origin)
		3. Origin ID: 
		4. Restrict Bucket Access: Yes (prevent accessing S3 URL) 

### S3 - Security & Encryption ###
### Storage Gateway ###
### Snowball ###
### S3 Transfer Acceleration ###
### S3 Summary ###
### S3 Quiz ###

## Databases Overview & Concepts ##
### Database Essentials ###

## DynamoDB ##
### Introduction to DynamoDB ###
### Creation of DynamoDB Table ###
### DynamoDB Indexes ###
### Scan vs Query API Calls ###
### DynamoDB & Provisioned Throughput ###
### Using Web Identity Providers To Connect To Authenticate To DynamoDB ###
### Other important aspects of DynamoDB ###
### DynamoDB Summary ###
### Quiz 5: DynamoDB ###

## Simple Queue Service (SQS) ##
### What is SQS? ###
### SQS Developer Exam Tips ###
### Quiz 6: SQS Quiz ###

## Simple Notification Services (SNS) ##
### Introduction to SNS ###
### Creation of SNS Topic ###
### SNS Summary ###
### SNS Quiz ###

## Simple Workflow Service (SWF) ##
### Introuction to SWF ###
### Quiz 8: SWF Quiz ###

## CloudFormation ##
### Using Cloud Formation ###
### Quiz 9: Cloud Formation Quiz ###

## Elastic Beanstalk ##
### Using Elastic Beanstalk ###
### Quiz 10: Elastic Beanstalk Quiz ###

## Virtual Private Cloud (VPC) ##
### VPC Overview ###
### Building our own custom VPC ###
### Build A Custom VPC - Part 2 ###
### Network Address Translation (NAT) ###
### Access Control Lists (ACLs) ###
### Custom VPC's and ELBs ###
### NAT's vs Bastions ###
### VPC Flow Logs ###
### VPC Clean Up ###
### VPC Summary ###
### Quiz 11: VPC Quiz ###

## Route53 & DNS ##
### DNS 101 ###
### Route53 - Register Your Domain Lab ###
### Setup Our EC2 Instances ###
### Simple Routing Policy Lab ###
### Weighted Routing Policy Lab ###
### Latency Routing Policy Lab ###
### Failover Routing Policy Lab ###
### Geolocation Routing Policy ###
### DNS Summary ###

## AWS Shared Responsibility ##
### Shared Responsibility Model ###
### Quiz 12: Shared Responsibility Quiz ###

## The Exam ##
### What to expect? ###
### Quiz 13: Mega Quiz! ###

## What's next? ##
### Thank You and What's Next? ###
### Questions? Check out our discussion forums! ###
	

				