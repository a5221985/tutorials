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
1. `curl http://169.254.169.254/latest/meta-data`
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
		9. C++
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

### EC2 Quiz ###

## S3 ##
### S3 Essentials ###
### Creation of an S3 Bucket Using The Console ###
### Creation of an S3 Website ###
### CORS Configuration ###
### S3 Version Control ###
### Cross Region Replication ###
### S3 Lifecycle Management & Glacier ###
### Cloud Front Overview ###
### Creation of CDN ###
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
	

				