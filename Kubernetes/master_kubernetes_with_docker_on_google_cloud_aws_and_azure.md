# Master Kubernetes with Docker on Google Cloud, AWS & Azure #
## Section 11: GKE - Using Helm to Automate Microservices Deployment on Kubernetes ##
### Step 01 - Understanding Helm Basics and Setting up Kubernetes Cluster ###
1. Register in GCP
2. Click on CREATE CLUSTER
	1. Name: helm-cluster
	2. Create
3. Helm:
	1. It is package manager for Kubernetes
		1. Why?
			1. If many scripts exist
			2. If scripts get complex
		2. We can use one package to deploy the application (we don't need multiple files)
			1. Helm makes us easy to define application package
			2. One way to kickstart the execution
				1. We give one name
				2. If we ask helm to execute using the name, all the scripts will be executed
		3. Helm has more functionality
			1. Takes care of releases
			2. We can upgrade package
			3. We can roll back to a specific version of a package
			4. We can manage releases
			5. ...
		4. Helps (charts) us define, install, and upgrade even most complex Kubernetes application
			1. Chart - It is a package
				1. Package of scripts used to deploy the application
				2. We can version the charts
				3. We can publish the charts out to a repository (Helm repository)
					1. It is like Maven repository
			2. Release
				1. It is installation of a specific version of a chart on a Kubernetes cluster
		5. Helm has both client and server side components
			1. Both can be installed
			2. Client - called Helm client
				1. Installed on local machine (or where cluster is accessed)
			3. Server - called Helm tiller
				1. Installed on Kubernetes cluster
4. Open cloud shell
	1. It provides a version of helm client
	2. We can install helm client
		1. Search for helm client
5. Helm tiller installation:
	1. Connect to the cluster: (configure kubectl)
	
			gcloud container clusters get-credentials helm-cluster --zone us-central1-c --project oauth2-poc-project
			
	2. Script to install helm tiller
		1. `/in28minutes/git/kubernetes-crash-course/12-helm`
			1. `helm-tiller.sh` (we can drag and drop it into cloud shell)
			2. Run the following to check status:

					kubectl get deploy,svc tiller-deploy -n kube-systemrangaraokaranam

### Step 02 - Using Helm Charts to deploy Spring Boot Microservice to Kubernetes ###
1. Example: Currency Exchange Microservice
	1. `/helm`
		1. `Chart.yaml` - meta-information
		
				apiVersion: v1
				appVersion: "1.0"
				description: A Helm chart for Any Microservice
				name: currency-exchange-alone
				version: 0.1.0
				
		2. `templates`
			1. All yaml files are here
				1. microservice-deployment.yaml (It is a template that can be used for any microservice)

						apiVersion: apps/v1
						kind: Deployment
						metadata:
							name: {{ .Values.name }} # Go template syntax
							labels:
								app: {{ .Values.name }}
						spec:
							replicas: {{ .Values.replicas }}
							selector:
								matchLabels:
									app: {{ .Values.name }}
							template:
								metadata:
									labels:
										app: {{ .Values.name }}
								spec:
									containers:
									- name: {{ .Values.name }}
									  image: {{ .Values.image }}
									  env:
									  - name: CURRENCY_EXCHANGE_URI
									    value: http://currency-exchange:8000
									  ports:
									  - containerPort: {{ .Values.port }}
						---
						apiVersion: v1
						kind: Service
						metadata:
							name: {{ .Values.name }}
							labels:
								app: {{ .Values.name }}
						spec:
							type: {{ .Values.servicetype }}
							ports:
							- port: {{ .Values.port }}
							  protocol: TCP
							selector:
								app: {{ .Values.name }}
			
		3. `values.yaml`

				image: in28min/currency-exchange:0.0.1-RELEASE
				port: 8000
				servicetype: LoadBalancer
				replicas: 1
				name: currency-exchange
				
			1. We can have a hierarchical structure as well
		4. Deployement:

				helm install ./currency-exchange/ --name=currency-services
				
		5. Check
		
				kubectl get all
				kubectl get service --watch
				
				http://<external-ip>:8000/currency-exchange/from/USD/to/INR
	2. Copy and paste the files for currency-conversion
		1. values.yaml (only contains resource specific values)

				image: in28min/currency-conversion:0.0.1-RELEASE
				port: 8200
				serviceType: LoadBalancer
				replicas: 1
				name: currency-conversion
				
		2. Install

				helm install ./currency-conversion/ --name=currency-service-1
				
				http://<external-ip>/currency-conversion/from/USD/to/INR/quantity/10
				
		3. Exercise: `helm create microservice` - generates a template folder

### Step 03 - Using Helm Charts to manage Releases to Kubernetes Cluster ###
1. Tips:
	1. `helm install ./currency-conversion/ --name=currency-service-1 --debug --dry-run` - dry run
		1. Shows all templates that would get created
	2. `helm history currency-service-1`
	3. Increasing replicas: `replicas: 2`
		1. `helm upgrade currency-service-1 ./currency-conversion/`
	4. Rollback: `helm history currency-services-1`
		1. `helm rollback currency-services-1 1` - rolls back to earlier version
	5. Multiple yaml files
		1. `helm upgrade currency-service-1 ./currency-conversion/ --debug --dry-run`
			1. New yaml will also be evaluated
		2. `helm history currency-service-1`
		3. `helm rollback currency-service-1 1`
		4. `kubectl get cm` - automatically deleted

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

			curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
			sudo mv /tmp/eksctl /usr/local/bin
			eksctl version
			
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
		--nodes-max 7 --managed --asg-access --profile default
		
	1. t2 - 4 GB Mem
	2. nodes-max - if there is more demand it can go upto 7
	3. asg-access - auto scaling (cluster autoscaling)
		1. Adding nodes based on load
	4. managed - entire cluster is managed automatically
		1. AWS manages it
			1. If there is any patch, AWS applies the patch without any downtime
	5. Deleting cluster:

			eksctl delete cluster --region=us-east-1 --name=in28minutes-cluster --profile default
			
	6. [Installing Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/)

### Step 09 - Quick Review of AWS Basics - Region, AZ, VPC and Subnet ###
1. AWS has different regions
	1. Each region has availability zones
		1. For 
			1. High availability 
			2. Low latency
	2. Regions:
		1. US East (Ohio) - us-east-2
		2. US East (N. Virginia) - us-east-1
		3. ...
2. VPC & Subnect
	1. VPC
		1. It is used to controll access to resources (Virtual Private Cloud)
		2. We can have different resources inside
			1. We don't want to allow access to all of those resources
			2. We want to allow access only to the web-server
		3. Solution: Private sub-nets, public sub-nets
			1. Public sub-nets: we can access from outside
				1. We can put HTTP servers
			2. Private sub-nets: Not allowed access outside virtual network
				1. Only resources inside VPC can access
				2. Examples:
					1. DBs
					2. App servers
					3. ...

### Step 10 - Quick Review of the AWS EKS Kubernetes Cluster ###
1. Availability zones: us-east-1f, us-east-1d (6 azs)
2. eksctl - uses cloud formation (Infrastructure as Code - YAML definition can be used to bring up the resources)
3. Node-group - group of EC2 instances (nodes inside the cluster)

		saved kubeconfig as "/Users/am/.kube/config" 
		
	1. Local kubectl is connected to the cluster
		1. If we run kubectl commands, they will be executed against the cluster created
	2. `kubectl get nodes` **(M)**
	3. `kubectl version` **(M)**
		1. Shows client version and server version
4. Go to AWS console: Search for EKS
	1. Open cluster
		1. Node groups
		2. Networks
		3. ...
5. Solution to changing `aws sts get-caller-identity --profile default` to `aws sts get-caller-identity` is:
	
		unset AWS_ACCESS_KEY_ID
		unset AWS_SECRET_ACCESS_KEY
		export AWS_PROFILE=default
		
	1. Because `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` take precedence of `AWS_PROFILE` [https://stackoverflow.com/questions/49987458/aws-profile-not-working-with-aws-cli#:~:text=You%20have%20to%20unset%20both,then%20it%20should%20work%20correctly.&text=You%20can%20see%20that%20when,time%20you%20make%20this%20post.](https://stackoverflow.com/questions/49987458/aws-profile-not-working-with-aws-cli#:~:text=You%20have%20to%20unset%20both,then%20it%20should%20work%20correctly.&text=You%20can%20see%20that%20when,time%20you%20make%20this%20post.)

### Step 11 - Review Hello World and Web Apps from GKE Section ###
1. Pre-requisites
	1. 4 applications in GKE

### Step 12 - Deploy Hello World Rest API to AWS EKS Kubernetes Cluster ###
1. `kubectl create deployment hello-world-rest-api --image=in28min/hello-world-rest-api:0.0.1.RELEASE`
	1. `kubectl get deployment`
	2. `kubectl get replicaset`
		1. 1 replicaset
		2. 1 desired instance
	3. `kubectl get pod`
2. `kubectl expose deployment hello-world-rest-api --type=LoadBalancer --port=8080`
	1. Defines as service
	2. `kubectl get svc`
		1. External IP is available - from outside world
			1. `https://<domain-name>:8080/hello-world`

### Step 13 - Deploy Web App H2 to AWS EKS Kubernetes Cluster ###
1. `kubectl create deployment todowebapp-h2 --image=in28min/todo-web-application-h2:0.0.1-SNAPSHOT` (talks to h2 database)
2. `kubectl expose deployment todowebapp-h2 --type=LoadBalancer --port=8080`
	1. `kubectl get svc`
		1. `http://<ip>:8080` (took about 5 minutes)
			1. in28minutes
			2. dummy
3. We did not have to change anything to deploy to EKS (the same instructions used to deploy to GKE)

### Step 14 - Deploy Web App with MySQL to AWS EKS Kubernetes Cluster ###
1. Two containers
	1. Todo Web app
	2. MySQL
2. `Kompose` was used to generate the configuration files
	1. Kubernetes related config
		1. `02-final-backup` folder at the end of the course
			1. `config-map.yaml`
			2. `mysql-database-data-volume-peristentvolumeclaim-aws.yaml`
			3. `secret.yaml`
		2. `cd` into the folder `02-final-backup-at-end-of-course`
			1. Execute the following command:

					kubectl apply -f mysql-database-data-volume-persistentvolumeclaim-aws.yaml,mysql-deployment.yaml,mysql-service.yaml
					
				1. Everything required for creation of mysql database
					1. Persistent volume claim

							apiVersion: v1
							kind: PersistentVolumeClaim
							metadata:
								name: mysql-database-data-volume
								labels:
									io.kompose.service: mysql-database-data-volume
							spec:
								storageClassName: mysql-database-ssd
								accessModes:
								- ReadWriteOnce
								resources:
									requests:
										storage: 100Mi
							status: {}
							---
							apiVersion: storage.k8s.io/vi # required
							kind: StorageClass
							metadata:
								name: mysql-database-ssd
							provisioner: kubernetes.io/aws-ebs
							parameters:
								type: gp2
							reclaimPolicy: Retain
							allowVolumeExpansion: true
							mountOptions:
								- debug
							volumeBindingMode: Immediate
							
						1. StorageClass
							1. It is mapping to Elastic Block Store
								1. EBS: Easy to use, high performance block storage service in AWS
						2. General Purpose SSD (gp2)
						3. Provisioned IOPS SSD (io1)
						4. Throughput Optimized HDD (st1)
						5. Cold HDD (sc1)
					2. Deployment
					3. Service
			2. Application configuration

					kubectl apply -f config-map.yaml,secret.yaml,todo-web-application-deployment.yaml,todo-web-application-service.yaml
					
				1. `config-map.yaml` - config needed to talk to database

						apiVersion: v1
						data:
							RDS_DB_NAME: todos
							RDS_HOSTNAME: mysql
							RDS_PORT: "3306"
							RDS_USERNAME: todos-user
						kind: ConfigMap
						metadata:
							name: todo-web-application-config
							namespace: default
				
				2. `secret.yaml` - password

						apiVersion: v1
						kind: secret
						data:
							RDS_PASSWORD: ZHVtbZl0b2Rvcw==
						metadata:
							name: todo-web-application
				
				3. `todo-web-application-deployment.yaml` - deployment
					1. `configMapKeyRef` - DB Name, Hostname - from todo-web-application-config
						1. password - todo-web-application-secrets

								echo -n dummytools | base64
						
				4. `todo-web-application-service.yaml` - service
5. `kubectl get svc`
	1. Open app in browser
		1. Add todo

### Step 15 - Delete Web App and Hello World Deployments ###
1. `kubectl delete all -l app=hello-world-rest-api`
2. `kubectl delete all -l app=todowebapp-h2`
3. `kubectl delete all -l io.kompose.service=todo-web-application`
4. `kubectl delete all -l io.kompose.service=mysql`
	1. `-l` - label
		1. `app=hello-world-rest-api` - label
	2. Label?
		1. `mysql-deployment.yaml`
		
				labels:
					io.kompose.service: mysql
					
		2. `todo-web-application-service.yaml`

				labels:
					io.kompose.service: todo-web-application

### Step 16 - Review of Microservices on GKE ###
1. CCS and CES services
	1. Ingress
		1. Can distribute traffic to multiple microservices
	2. Istio
	3. Helm
	4. Google Stackdriver - logs of all microservices
2. They are similar for EKS or GKE
3. Minor differences
	1. Ingress - minor differences between EKS & GKE
	2. Logging - Alternatives are provided by EKS (Google Stackdriver is not provided by AWS)
		1. Setion 7 - 11 of GKE

### Step 17 - Deploy Microservices to AWS EKS Kubernetes Cluster ###
1. Commands: Run from `kubernetes-crash-course` folder

		kubectl apply -f 04-currency-exchange-microservice-basic/deployment.yaml
		kubectl apply -f 05-currency-conversion-microservice-basic/deployment.yaml
		
	1. Review of services:
		1. Currency Conversion Service
			1. Returns for amount of currency (10 USD to INR)
		2. Currency Exchange Service (connects to database)
			1. Converts from one currency to another (1 USD = 73.25)
			2. Name and value

					env:
						- name: CURRENCY_EXCHANGE_URI
						- value: http://currency-exchange

				1. Exposed usin the URL given
2. `kubectl get svc`
	1. `https://<dns>:8000/currency-exchange/from/USD/to/INR`
	2. `https://<dns>:8100/currency-conversion/from/USD/to/INR/10`
3. The deployment is same as in GKE
4. `kubectl get pods` - 2 instances
	1. replica-sets - 2

### Step 18 - Setup Ingress Controller and Ingress ###
1. `kubectl get svc`
	1. 2 load-balancers created
		1. It is expensive
			1. Solution: Ingress (one load balancer)
				1. It can distribute traffic to multiple instances
2. Search for EC2
	1. LOAD BALANCING
		1. Load Balancers
			1. Description - port (8000/ 8100)
			2. Tags - currency-conversion/currency-exchange
3. Ingress:
	1. Requires ingress controller
		1. Steps:
			1. [https://docs.aws.amazon.com/eks/latest/userguide/alb-ingress.html](https://docs.aws.amazon.com/eks/latest/userguide/alb-ingress.html)
	2. Setup controller
		1. IAM OIDC provider and associate it with cluster

				eksctl utils associate-iam-oidc-provider \
					--region us-east-1 \
					--cluster in28-minutes-cluster \
					--approve
					
		2. IAM policy called `ALBIngressControllerIAMPolicy` for ALB ingress controller pod that allows it to make calls to AWS APIs on our behalf

				aws iam create-policy \
					--policy-name ALBIngressControllerIAMPolicy \
					--policy-document https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.4/docs/examples/iam-policy.json
					
		3. Kubernetes service account named `alb-ingress-controller` in `kube-system` namespace, cluster role, cluster role binding for ALB ingress controller to use

				kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.4/docs/examples/rbac-role.yaml
		4. IAM role for ALB ingress controller and attach role to service account created in previous step

				eksctl create iamserviceaccount \
					--region us-east-1 \
					--name alb-ingress-controller \
					--namespace kube-system \
					--cluster in28minutes-cluster \
					--attach-policy-arn arn:aws:iam:111122223333:policy/ALBIngressControllerIAMPolicy \
					--override-existing-serviceaccounts \
					--approve
					
			1. Copy `arn` from a previous command
		5. Deploy ALB ingress controller

				kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.4/docs/examples/alb-ingress-controller.yaml
				
		6. Open ALB ingress controller deployment manifest for editing with following command

				kubectl edit deployment.apps/alb-ingress-controller -n kube-system
				
			1. Modifications

					spec:
						containers:
						- args:
						  - --ingress-class=alb
						  - --cluster-name=in28minutes-cluster
						  - --aws-vpc-id=vpc-<code> # from EKS open in28minutes-cluster
						  - --aws-region=us-east-1

		7. Confirm that ALB ingress controller is running

				kubectl get pods -n kube-system
				
			1. `-n` - namespace
		8. Ingress resource:

				apiVersion: extensions/v1beta1
				kind: Ingress
				metadata:
					name: gateway-ingress
					annotations: # load balancer related
						kubernetes.io/ingress.class: alb
						alb.ingress.kubernetes.io/scheme: internet-facing
				spec:
					rules:
					- http:
						paths:
						- path: /currency-exchange/*
						  backend:
						  	serviceName: currency-exchange
						  	servicePort: 8000
						- path: /currency-conversion/*
						  backend:
						  	servcieName: currency-conversion
						  	servicePort: 8100
						  	
			1. redirection from `/currency-exchange/*` to currency-exchange service
			2. Adding ingress

					kubectl apply -f 05-currency-conversion-microservice-basic/ingress_aws.yaml
					
				1. Under `kubernetes-crash-course`
				2. `kubectl get ingress`
					1. `https://<dns>`

### Step 19 - Quick Review of Ingress ###
1. `https://<dns>/currency-conversion/from/USD/to/INR/quantity/10`
2. `https://<dns>/currency-exchange/from/USD/to/INR`

### Step 20 - Setup Container Insights and AWS Cloud Watch Logs ###
1. Cloud Watch
	1. Adding Application insights - behind the scenes view
		1. [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Container-Insights-setup-EKS-quickstart.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Container-Insights-setup-EKS-quickstart.html)
			1. Start from second command:

					curl https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-containter-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/quickstart/cwagent-fluentd-quickstart.yaml | sed"s/{{cluster_name}}/in28minutes-cluster/;s/{{region_name}}/us-east-1/" | kubctl apply -f -
					
				1. Downloads a file from github
				2. Replaces `{{cluster_name}}`
				3. Replaces `{{region_name}}`
			2. Cloud-watch - used for monitoring and logging
				1. We can get all logs coming from the service
		2. Attach `CloudWatchAgentServerPolicy` to the all nodes (to stream logs)
			1. Services > EC2 > Virtual Servers
				1. Running Instances
					1. Select IAM Role
						1. Permissions
							1. Attach Policies
								1. Search for `CloudWatchAgentServerPolicy`
								2. Check
								2. Attach policy
	2. Execute requests
	3. Services > CloudWatch
		1. Log groups
			1. `/aws/containerinsights/*`
				1. `application`
		2. Search Log Group
			1. `<sleuth-id>`
				1. We can see the flow through multiple services

### Step 21 - Setup Cluster Autoscaling on AWS EKS Kubernetes ###
1. Configuration:
	1. [https://docs.aws.amazon.com/eks/latest/userguide/cluster-autoscaler.html](https://docs.aws.amazon.com/eks/latest/userguide/cluster-autoscaler.html)
		1. It configures new nodes automatically
		2. It can decrease the number of nodes
	2. The cluster was created at the start using `--managed` and `--asg-access`
	3. `eksctl` - Takes care of IAM policy
	4. Tags are automatically configured
	5. Deploy the cluster:

			kubectl apply -f https://raw.githubusercontent.com/kubernetes/autoscaler/master/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml
			
	6. Add `cluster-autoscaler.kubernetes.io/safe-to-evict` annotation to deployment

			kubectl -n kube-system annotate deployment.apps/cluster-autoscaler cluster-autoscaler.kubernetes.io/safe-to-evict="false"
			
	7. Edit cluster autoscaler deployement

			kubectl -n kube-system edit deployment.apps/cluster-autoscaler
			
		1. Edit `cluster-autoscaler` container command to replace `<YOUR CLUSTER NAME>` with cluster's name and add following options:

				--balance-similar-node-groups
				--skip-nodes-with-system-pods=false
				
			1. Add as below:

					spec:
						containers:
						- command:
							- ...
							- --node-group-auto-discovery=asg:tag=k8s.io/cluster-autoscaler/enabled,k8s.io/cluster-autoscaler/in28minutes-cluster
							- --balance-similar-node-groups
							- --skip-nodes-with-system-pods=false

	8. Open Cluster Autosclaer releases
		1. Find `kubectl` version
			1. `kubectl version` (1.14.9)
				1. Cluster Autoscaler 1.14.7 (matches `kubectl` version <= `kubectl` version)
		2. Run the following:

				kubectl -n kube-system set image deployment.apps/cluster-autoscaler cluster-autoscaler=k8s.gcr.io/cluster-autoscaler:v1.14.7
	9. View Cluster Autoscaler logs

			kubectl -n kube-system logs -f deployment.apps/cluster-autoscaler
			
2. Testing:

		kubectl create deployment autoscaler-demo --image=nginx
		kubectl get pods
		
		kubectl scale deployment autoscaler-demo --replicas=50
		kubectl get pods
		kubectl get nodes (few more nodes might get created)
		
		kubectl scale deployment autoscaler-demo --replicas=0
		kubectl get pods

### Step 22 - Delete AWS EKS Kubernetes Cluster ###
1. Istio and Helm are the same
2. Clean up the cluster
	1. Delete all LoadBalancer services

			kubectl get svc --all-namespaces
			kubectl delete svc <service-name>
			
			kubctl get ingress
			kubctl delete ingress gateway-ingress
			
	2. Delete the cluster

			eksctl delete cluster --name in28minutes-cluster
			
	3. [https://docs.aws.amazon.com/eks/latest/userguide/delete-cluster.html](https://docs.aws.amazon.com/eks/latest/userguide/delete-cluster.html)
	4. CloudFormation
		1. Delete cluster
			1. We must not have any EC2 instances running
			2. We must not have any Elastic Load Balancers
			3. We must not have any EKS clusters

## Kubernetes on Azure with AKS ##
### Step 01 - Kubernetes on Azure with AKS - Section Introduction ###
1. Deploying Kubernetes to Azure
	1. AKS - Azure Kubernetes Service
2. Assumption: GKE is completed (Section 2 to Section 11)
3. Kubernetes is cloud neutral (nearly 99% remain the same)
4. ISTIO and HELM are same (GKE part)
5. Download again: [https://github.com/in28minutes/kubernetes-crash-course](https://github.com/in28minutes/kubernetes-crash-course)
6. Import all the projects into STS
	1. instructions-aws-and-azure.md
		1. Contains instructions to do things with Azure

### Step 02 - Creation of an Azure Account ###
1. Azure Account
	1. Two things
		1. Personal details
		2. Valid credit or debit card (even for free trial account)
	2. Google for azure free trial
		1. Open first link
		2. azure.microsoft.com
			1. Start free
			2. Sign in
				1. Click: Create one!
				2. Enter email address: valid email address only (verified)
				3. Password
				4. Enter verification code from email
				5. Go through captchas
			2. Subscription creation
				1. Enter personal details
				2. Organization details
			3. Enter phone number
				1. Enter verification code
			4. Enter credit or debit card details
			5. Get verified
			6. Sign Up
		3. https://portal.azure.com

### Step 03 - Creation of a Resource Group, Service Principal and AKS Kubernetes Cluster ###
1. Open Azure
	1. Open Kubernetes Services
	2. Click on Azure Cloud Shell (top right corner)
	3. Bash
	4. Maximize
	5. Settings:
		1. Text-size - Large
	4. Commands:
		
			az version
			
		1. `az` - Azure cli
		2. `kubectl` is also installed

				kubectl version
				
		3. Cluster creation
			1. Resource - Must be part of a resource group
				1. Resource group: westeurope (recommended)
			2. Comand:

					az group create --name kubernetes-resource-group --location westeurope
					
		4. We are already logged in in Azure shell
			1. Else we need to login

					az login
					
		5. Azure service principal - identity created for use with automated tools to access Azure resources
			1. Needed for Kubernetes cluster (service principal credentials are required)

					az ad sp create-for-rbac --skip-assignment --name kubernetes-cluster-service-principal
					
				1. Copy the App id and password
		6. Command for creation of cluster

				az aks create --name in28minutes-cluster --node-count 4 --enable-addons monitoring --resource-group kubernetes-resource-group --vm-set-type VirtualMachineScaleSets --load-balancer-sku standard --enable-cluster-autoscaler --min-count 1 --max-count 7 --service-principal <<appId>> --client-secret <<password>>
				
			1. Replace `<<appId>>` and `<<password>>` generated above
			2. Cluster with 4 nodes
			3. Enabled monitoring
			4. Resource group - cluster is attached to this
			5. Enabled auto-scaling
				1. VM Set type - VirtualMachineScaleSets
				2. Load balancer - standard
				3. Min count - 1 node
				4. Max count - 7 nodes
			6. Credentials are used
	
2. Open portal.azure.com

### Step 04 - Deploy Hello World Rest API to Azure AKS Kubernetes ###
1. State - succeeded
2. portal.azure.com
	1. Search: Kubernetes
	2. Kubernetes Services
		1. Cluster: in28minutes-cluster
			1. Resource group: kubernetes-resource-group
			2. Location: West Europe
			3. Click
				1. Details about Kubernetes cluster

### Step 05 - Deploy Web App H2 to Azure AKS Kubernetes Cluster ###
### Step 06 - Deploy Web App with MySQL to Azure AKS Kubernetes ###
### Step 07 - Delete Deployments and Review of Microservices on GKE ###
### Step 08 - Deploy Microservices to Azure AKS Kubernetes Cluster ###
### Step 09 - Review Dev Spaces, Insights and Logs in Azure AKS Kubernetes Cluster ###
### Step 10 - Setup Ingress Controller and Ingress ###
### Step 11 - Review Cluster Autoscaling on Azure AKS Kubernetes Cluster ###
### Step 12 - Delete Azure AKS Kubernetes Cluster ###

## Bonus Section ##
### Bonus Lecture ###
1. Where is the technology world heading?
	1. Cloud
		1. AWS
		2. Azure
		3. Google Cloud
	2. DevOps
		1. Docker
		2. Kubernetes
		3. Azure DevOps
	3. Microservices/APIs
	4. Full Stack Development
2. AWS
	1. 6 courses
3. DevOps
	1. Master DevOps with Docker, Kubernetes and Azure DevOps
4. Deeper into Docker and Kubernetes
	1. Master Kubernetes with Docker on Google Cloud, AWS, & Azure
	2. Master Docker with Java - DevOps for Spring Microservices
5. Full Stack Development
6. Architecture and Design
7. Programming
8. Unit Testing
9. Interview Guides
10. Search for github in28minutes learn

## GKE - Integrating Java Spring Boot Microservices on Kubernetes with Istio ##
### Step 01 - Constructing new Kubernetes Cluster for Playing with Istio ###
1. Istio - Service mesh
	1. Another container exists along with ours in the same pod
		1. More powerful cluster is required
			1. GKE - Kubernetes Engine
				1. Create Cluster (Only 8 vCPUs allowed with free trial, another project? upto 12 vCPUs in total)
				2. Series: N2
				3. Do not enable Enable Istio (beta)
				4. Click **Create**

### Step 02 - Understanding Service Mesh, Istio and Sidecar Pattern ###
1. Import > 09-currency-exchange-istio
2. Import > 10-currency-conversion-istio
3. Kubernetes Architecture
	1. If microservices are in the same pod, they are scaled together
	2. The microservices have common functionality
		1. Service discovery
		2. Logging
		3. Distributed tracing
		4. Release Automation (Release Strategy)
	3. A container can be deployed along side the microservice to take care of common functionality
		1. The requests get routed through second container (Itio)
			1. Can be used to implement logging, distributed tracing, ...
		2. This is known as side-car

### Step 03 - Installing Istio on Kubernetes Cluster - CRD and Istio Components ###
1. Launch Cloud Shell
	1. `gcloud container clusters get-credentials in28minutes-cluster-istio --zone us-central1-a --project solid-course-258105`
		1. Careful with the cluster
	2. Install Istio related stuff
		1. `kubectl create namespace istio-system`
		2. `curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.2.2 sh -`
			1. `istio-1.2.2` directory
			2. `ls istio-1.2.2/install/kubernetes/helm/istio-init/files/crd*yaml`
				1. Used to initialize istio (Custom Resource Definitions (CRD))
		3. `cd istio-1.2.2`
		4. `for i in install/kubernetes/helm/istio-init/files/crd*yaml; do kubectl apply -f $i; done`
		3. `helm template install/kubernetes/helm/istio --name istio --set global.mtls.enabled=false --set tracing.enabled=true --set kiali.enabled=true --set grafana.enabled=true --namespace istio-system > istio.yaml`
			1. Enable Kiali
			2. Enable Grafana
			3. ...
		4. `kubectl apply -f istio.yaml`
		5. `kubectl label namespace default istio-injection=enabled`

### Step 04 - Review Istio Installation and Deploy Spring Boot App with Side Cars ###
1. `kubectl get pods --namespace istio-system`
2. `kubectl get services --namespace istio-system`
	1. Kiali
	2. Prometheus
	3. Grafana
	4. Jaeger
3. `gcloud container clusters get-credentials in28minutes-cluster-istio --zone us-central1-a --project solid-course-258105`
4. `pwd`
	1. `in28minutes/git/kubernetes-crash-course/11-istio-scripts-and-configuration`
	2. `ls`
	3. We can expose only Cluster IP of a service (Istio can be used to expose the endpoints)
	4. `kubectl apply -f 01-helloworld-deployment.yaml`
	5. `kubectl get pods`
	6. `kubectl get all -o wide`
	7. `kubectl describe pod <pod-id>`
		1. Enable adding Istio Side Cars in each pod
			1. `kubectl label namespace default isito-injection=enabled` - injects into each pod
	8. `/in28minutes/git/kubernetes-crash-course/11-istio-scripts-and-configuration`
	9. `kubectl apply -f 01-helloworld-deployment.yaml`
	10. `kubectl logs hello-world-rest-api-<num> hello-world-rest-api -f`
		1. `pod` name and `container` name
			1. No sufficient ports
			2. `kubectl get pods`
				1. `kubectl delete pods <pod-name>`

### Step 05 - Increasing Kubernetes Cluster Size to 3 Nodes ###
1. 

### Step 06 - Understanding Gateways and Virtual Services for Istio ###
### Step 07 - Basic Deployment Strategies - Rolling Updates and Recreate ###
### Step 08 - Setting up Multiple Versions of Spring Boot Applications ###
### Step 09 - Configure Destination Rules and Subsets to Implement Mirroring ###
### Step 10 - Executing Blue Green and Canary Deployments with Kubernetes ###
### Step 11 - Review Spring Boot Microservices Integration with Istio ###
### Step 12 - Observing Istio Service Mesh with Kiali ###
### Step 13 - Monitoring Istio Service Mesh with Graphana and Prometheus ###
### Step 14 - Distribute Tracing for Spring Boot Microservices with Istio and Jaegar ###
### Step 15 - Delete Kubernetes Cluster for Playing with Istio ###