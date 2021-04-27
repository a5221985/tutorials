# Master Kubernetes with Docker on Google Cloud, AWS & Azure #
## Kubernetes on AWS with EKS ##
### Step 01 - Kubernetes on AWS with EKS - Section Introduction ###
1. [https://github.com/in28minutes/kubernetes-crash-course](https://github.com/in28minutes/kubernetes-crash-course)
	1. `instructions-aws-and-azure.md`
2. Managed service for Kubernetes - EKS
3. Approach:
	1. Learn Kubernetes Basics on GCP (Google Cloud) - Google Kubernetes Engine (GKE)
		1. It is not free tier on AWS
4. Download Github repo again

### Step 02 - Constructing an AWS Root Account ###
1. aws.amazon.com
	1. Account creation
2. Free Tier - Read about it
3. Sign in to the Console

### Step 03 - Constructing an IAM User for your AWS Account ###
1. Making AWS account more secure
	1. IAM (Identity and Access Management) - IAM User
		1. Email id and password used for registration - Root user
			1. Can access console
			2. Has programmatic access
			3. Complete access (Can even close the account)
			4. This account must only be used for creation of IAM users
		2. IAM User
			1. Sign into console
				1. IAM
					1. Users can be created
					2. Users can be assigned to groups
					3. Give permissions
						1. Directly assign policies to User
						2. Assign policies to group and add user to the group
							1. Create New Group
								1. Group Name: Developers
								2. Attack Policy: (Pre-defined policies called **Managed Policies**)
									1. AdministratorAccess (for now)
							2. Create New User
								1. User name: in28minutes_dev
								2. Select AWS access type: (there are two types of users - human users, programs)
									1. Programmatic access (select this)
										1. Enables an access key ID and secret access key for AWS API, CLI, SDK, and other development tools
									2. AWS Management Console access (select this - to login using user id and password to console and perform access)
								3. Select Custom password
								4. Uncheck **Require password reset**
								5. Group: Developers
								6. Click **Create user**
									1. Copy the link provided and use it to login (it is specific to the account)
										1. Sign in

### Step 04 - Its Your Responsibility to Monitor Billing in Cloud - 5 Recommendations ###
1. Reducing billing recommendations:
	1. Set billing alerts (next)
	2. Monitor billing dashboard every day (first thing in the morning)
		1. Login as root: Click in28minutes > MyAccount
			1. Search for IAM
				1. Edit
					1. Activate IAM Access
					2. Update
		2. Login as IAM user
			1. Billing
				1. Shows:
					1. Free Tier usage limit
					2. How much have we used
	3. Stop resources
		1. When we are not using them
			1. EC2
			2. RDBMs
			3. Load Balancers
		2. Terminate them if using only for training
	4. Understand Billing: Hard to do
		1. Understand free tier and 12 month limit
			1. Open free tier info and read about it
				1. Google for aws pricing
					1. Storage
						1. Transactions
						2. Storage used
		2. Understand how pricing works for different resources

### Step 05 - Monitor AWS Billing - Setting Billing Alerts ###
1. Setting billing alerts
	1. Login using IAM account (recommended)
	2. My Billing Dashboard
		1. Billing Preferences
			1. Receive PDV invoice by Email
			2. Receive Free Tier Usage Alerts
			3. Receive Billing Alerts
		2. Save preferences
	3. Click Manage Billing Alerts (Using cloud watch)
		1. Cloud watch: Used for monitoring service and trigger alarms if something un-expected happens
			1. Usage of CPU is beyond certain limit
		2. Select Billing
			1. Ensure US East (N. Virginia) is selected
			2. Click Billing
				1. 10 free alarms and 1000 free e-mail notifications each month as part of AWS Free Tier
			3. Click Create Alarm:
				1. Estimated Charges
				2. Period: 6 hours
				3. Greater
				4. 0 USD
				5. Next
				6. An Alarm
				7. Create new topic (SNS - Simple Notification Service)
					1. Sends email
				8. Email id: <id>
				9. Validate email address
				10. Next
				11. Name: Billing Alert
				12. Next
				13. Click Create Alarm
		3. Another option:
			1. Search for Budget (recent addition)
				1. Create a budget
					1. Cost budget
						1. Name: Monthly Cost Budget
						2. Budget amount: Fixed
						3. Budgeted amount: $1
						4. Configure alerts
							1. Actual Costs
							2. 10 % budgeted amount
							3. Email: <id>
								1. Check email box and validate email id to receive alerts
							4. Confirm Budget
							5. Click Create

### Step 06 - Installing AWS CLI ###
1. Install aws cli (to use commandline to interact with AWS account)
	1. Version V1
		1. Using bundled installer
			1. Follow the instructions
		2. Using pip (if the above doesn't work)

### Step 07 - Install EKS CTL and Configure AWS CLI with IAM User ###
1. eksctl - similar to kubectl
	1. It is a simple CLI tool for instantiating clusters on EKS
	2. Install from [https://eksctl.io](https://eksctl.io)
		1. `eksctl version`
2. Configure AWS CLI
	1. `aws configure`
		1. Access Key: <paste-key-id>
		2. Secret: <paste-secret-key>
		3. Use default region
		4. Output format (default)
	2. We need IAM user to access AWS from commandline
		1. Add user
			1. user name: aws-kubernetes-user
			2. Acces type: Programmatic access
			3. Next: Permissions
				1. Developers
			4. Next: Tags
			5. Review
			6. Create user
		2. Copy access key id
		3. Copy secret access key

### Step 08 - Construct a Kubernetes Cluster on AWS with EKS ###
1. Visit Gihub: Copy command for creation of cluster

		eksctl create cluster --name in28minutes-cluster \
		--nodegroup-name in28minutes-cluster-node-group \
		--node-type t2.medium --nodes 3 --nodes-min 3 \
		--nodes-max 7 --managed --asg-access
		
	1. t2 - 4 GB Mem
	2. nodes-max - if there is more demand it can go upto 7
	3. asg-access - auto scaling (cluster autoscaling)
		1. Adding nodes based on load
	4. managed - entire cluster is managed automatically

### Step 09 - Quick Review of AWS Basics - Region, AZ, VPC and Subnet ###
### Step 10 - Quick Review of the AWS EKS Kubernetes Cluster ###
### Step 11 - Review Hello World and Web Apps from GKE Section ###
### Step 12 - Deploy Hello World Rest API to AWS EKS Kubernetes Cluster ###
### Step 13 - Deploy Web App H2 to AWS EKS Kubernetes Cluster ###
### Step 14 - Deploy Web App with MySQL to AWS EKS Kubernetes Cluster ###
### Step 15 - Delete Web App and Hello World Deployments ###
### Step 16 - Review of Microservices on GKE ###
### Step 17 - Deploy Microservices to AWS EKS Kubernetes Cluster ###
### Step 18 - Setup Ingress Controller and Ingress ###
### Step 19 - Quick Review of Ingress ###
### Step 20 - Setup Container Insights and AWS Cloud Watch Logs ###
### Step 21 - Setup Cluster Autoscaling on AWS EKS Kubernetes ###
### Step 22 - Delete AWS EKS Kubernetes Cluster ### 