# Master Kubernetes with Docker on Google  Cloud, AWS & Azure #
## Introduction ##
### Kubernetes Crash Course for Java Developers - Course Overview ###
1. Basics of Kubernetes
2. Pods, Cluster, Deployments, Replica Sets ...
3. Config maps, secrets, Persistent Volumes
4. Microservices with Kubernetes DNS, Service Discovery and Load Balancing
5. Spring Cloud Kubernetes - Ribbon and Centralized Configuration!
6. Centralized Logging and Distributed Tracing with StackDriver
7. Service Mesh with Istio - Release Strategy, Tracing...
	1. Release strategy
		1. Blue green
		2. Canery
	2. Distributed tracing - Open API
8. Automate Deployments with Helm
9. [https://github.com/in28minutes/kubernetes-crash-course](https://github.com/in28minutes/kubernetes-crash-course)
10. Software
	1. JDK 8+
	2. Latest version of Eclipse Java EE IDE

### Github Repository for the Course ###
1. [https://github.com/in28minutes/kubernetes-crash-course](https://github.com/in28minutes/kubernetes-crash-course)

## Getting Started with Kubernetes and Google Kubernetes Engine (GKE) ##
### Getting Started with Docker, Kubernetes and Google Kubernetes Engine ###
1. Why Docker?
	1. Run one single command - within few seconds, application is deployed
	2. Framework free, OS free, language free, configuration free
	3. Standardizes packaging and deployment
	4. Increase number of instances or decrease - using Kubernetes
2. Quickly deploy application
	1. Deploy
	2. Expose
3. Quickly increase instances
4. Load balancing is automatic
5. Delete one of the instances, and application does not goes down
	1. Another instance comes up automatically
6. Increase number of instances for certain time and bring it down
	1. autoscale (upto M instances) - single command
7. Release without any downtime
	1. Line of code: `minReadySeconds: 15`
		1. execute one command to go to new release
			1. seamlessly switches from older version to newer version
8. Declarative method to configure kubernetes
9. Kubernetes is cloud neutral
10. Kubernetes cluster:
	1. Setup is not easy
		1. GKE (Google Kubernetes Engine)
			1. Handles it easily
	2. Google uses this same technology for Gmail, YouTube, ...

### Constructing Google Cloud Account ###
1. Features:
	1. Declarative
	2. Easy scaling
	3. Load balancing
	4. Self healing
	5. Zero downtime deployments
2. Google Cloud Free Trial account
	1. cloud.google.com
	2. Country
	3. 12 months $300 account

### Constructing Kubernetes Cluster with Google Kubernetes Engine (GKE) ###
1. Cluster:
	1. Resource manager: manages resources
		1. resource: servers (in the cloud - virtual servers)
			1. AWS EC2
			2. Azure VMs
			3. GC Compute Engine
			4. Kubernetes: Nodes (thousands)
		2. Managers: Master Nodes
			1. For high availability - multiple master nodes
		3. Cluster:
			1. Combination of nodes and master nodes
				1. Worker nodes or simply nodes
				2. Master nodes - ensure nodes are available and are dealing with some work
	2. How to provision:
		1. Dashboard:
			1. Clusters: Create Cluster
			2. Workloads: manage applications or containers want to deploy into cluster
			3. Services & Ingress: to provide access to external world
			4. Configuration: Application configuration
			5. Storage: Persistant data storage
	2. Creation of Cluster:
		1. Create Cluster
			1. Type of nodes
			2. Number of nodes
			3. Location
		2. Take defaults and get started
			1. 

### Review Kubernetes Cluster and Learn Few Fun Facts about Kubernetes ###
### Deploy Your First Spring Boot Application to Kubernetes Cluster ###
### Save Your Free Credits ###
### Quick Look at Kubernetes Concepts - Pods, Replica Sets and Deployment ###
### Commands Executed During the Course ###
### Understanding Pods in Kubernetes ###
### Understanding ReplicaSets in Kubernetes ###
### Quick Review of Kubernetes Concepts - Pods, Replica Sets & Deployment ###
### Understanding Services in Kubernetes ###
### Quick Review of GKE on Google Cloud Console ###
### Understanding Kubernetes Architecture - Master Node and Nodes ###
### Understand Google Cloud Regions and Zones ###

## GKE - Using Kubernetes and Docker with Spring Boot Hello World Rest API ##
### Importing First 3 Spring Boot Projects into Eclipse ###
### Setting up 01 Spring Boot Hello World Rest API in Locat ###
### Quick Tip for Windows 10: Enable "Expose Demon without TLS option ###
### Build Docker Image and Push to Docker Hub for Hello World Rest API ###
### Installing GCloud ###
### Installing Kubectl ###
### Deploy 01 Spring Boot Hello World Rest API to Kubernetes ###
### Generate Kubernetes YAML Configuration for Deployment and Service ###
### Understand and Improve Kubernetes YAML Configuration ###

## GKE - Playing with Declarative Configuration for Kubernetes ##
### Understanding Kubernetes YAML Configuration - Labels and Selectors ###
### Quick Fix to Reduce Release Downtime with minReadySeconds ###
### Understanding Replica Sets in Depth - Using Kubernetes YAML Config ###
### Configure Multiple Kubernetes Deployments with One Service ###

## GKE - Using Kubernetes and Docker with Java Spring Boot Todo Web Application ##
### Setting up 02 Spring Boot Todo Web Application in Local ###
### Pushing Docker Image to Docker Hub for Spring Boot Todo Web App ###
### Using Kubernetes YAML Config to Deploy Spring Boot Todo Web App ###
### Playing with Kubernetes Commands - Top Node and Pod ###

## GKE - Using Kubernetes and Docker with Java Todo Web Application using MySQL ##
### Code Review of 03 Java Todo Web Application MySQL ###
### Running MySQL as Docker Container on Local ###
### Connect Spring Boot Java Todo Web App to MySQL on Local ###
### Construct Docker Image for 03 Todo Web Application and Use Link to Connect ###
### Update: Launching Containers in Custom Network ###
### Playing with Docker Compose ###
### Using Kompose to generate Kubernetes Deployment Configuration ###
### Review Kubernetes YAML for MySQL and Java Web Application ###
### Deply MySQL Database to Kubernetes Cluster ###
### Understanding Persistent Storage with Kubernetes - PV and PVC ###
### Using Config Maps for Centralized Configuration with Kubernetes ###
### Using Secrets with Kubernetes ###
### Construcing a ClusterIP Kubernetes Service for MySQL Database ###

## GKE - Using Kubernetes and Docker with Java Spring Boot Microservices ##
### Introduction to Microservices ###
### Advantages of Microservices ###
### Microservices - Challenges ###
### Overview of CCS and CES Spring Boot Microservices ###
### Push Docker Images and Construct Kubernetes Config for Microservices ###
### Deploying Spring Boot Microservices to Kubernetes Cluster ###
### Microservices and Kubernetes Service Discovery - Part 1 ###
### Microservices and Kubernetes Service Discovery - Part 2 ###
### Microservice Discovery, Centralized Configuration and Load Balancing ###
### Using Kubernetes Ingress to Simplify Microservice Access ###
### Review Google Cloud Load Balancer Backend and Frontends with Ingress ###

## GKE - Integrating Java Spring Cloud Kubernetes and Spring Boot Microservices ##
### Using Spring Cloud Kubernetes with Microservices - Project Review ###
### Deploying Spring Cloud Kubernetes Microservices ###
### Using RBAC to Allow Ribbon to Access Services Discovery APIs ###
### Using Spring Cloud Kubernetes Config to Load ConfigMaps ###
### Understanding Auto Scaling Approaches with Kubernetes ###
### Implementing Horizontal Pod Autoscaling with Kubernetes ###
### Deleting Your Kubernetes Cluster ###

## GKE - Integrating Spring Boot Microservices - Kubernetes with Google Stackdriver ##
### Constructing New Cluster to Play With Google Stackdriver ###
### Review Spring Boot Microservices Integrated with Google Stackdriver ###
### Enabling Stackdriver APIs for Your Google Cloud Account ###
### Deploying Spring Boot Microservices and Explore Google Stackdriver ###
### Exploring Google Stackdriver Error Reporting and Logging ###

## GKE - Integrating Java Spring Boot Microservices on Kubernetes with Istio ##
### Constructing new Kubernetes Cluster for Playing with Istio ###
### Understanding Service Mesh, Istio and Sidecar Pattern ###
### Installing Istio and Kubernetes Cluster - CRD and Istio Components ###
### Review Istio Installation and Deploy Spring Boot App with Side Cars ###
### Increasing Kubernetes Cluster Size to 3 Nodes ###
### Understanding Gateways and Virtual Services for Istio ###
### Basic Deployment Strategies - Rolling Updates and Recreate ###
### Setting up Multiple Versions of Spring Boot Applications ###
### Configure Destination Rules and Subsets to Implement Mirroring ###
### Executing Blue Green and Canary Deployments with Kubernetes ###
### Review Spring Boot Microservices Integration with Istio ###
### Observing Istio Service Mesh with Kali ###
### Monitoring Istio Service Mesh with Graphana and Prometheus ###
### Distribute Tracing for Spring Boot Microservices with Istio and Jaegar ###
### Delete Kubernetes Cluster for Playing with Istio ###

## GKE - Using Helm to Automate Microservices Deployment on Kubernetes ##
### Understanding Helm Basics and Setting up Kubernetes Cluster ###
### Using Helm Charts to Deploy Spring Boot Microservices to Kubernetes ###
### Using Helm Charts to Manage Releases to Kubernetes Cluster ###

## Kubernetes on AWS with EKS ##
### Kubernetes on AWS with EKS - Section Introduction ###
### Constructing an AWS Root Account ###
### Constructing an IAM User for your AWS Account ###
### Its Your Responsibility to Monitor Billing in Cloud - 5 Recommendations ###
### Monitor AWS Billing - Setting Billing Alerts ###
### Installing AWS CLI ###
### Installing EKS CTL and Configure AWS CLI with IAM User ###
### Construct a Kubernetes Cluster on AWS with EKS ###
### Quick Review of AWS Basics - Region, AZ, VPS and Subnet ###
### Quick Review of the AWS EKS Kubernetes Cluster ###
### Review Hello World and Web Apps from GKE Section ###
### Deploy Hello World Rest API to AWS EKS Kubernetes Cluster ###
### Deploy Web App H2 to AWS EKS Kubernetes Cluster ###
### Deploy Web App with MySQL to AWS EKS Kubernetes Cluster ###
### Delete Web App and Hello World Deployments ###
### Review of Microservices on GKE ###
### Deploy Microservices to AWS EKS Kubernetes Cluster ###
### Setup Ingress Controller and Ingress ###
### Quick Review of Ingress ###
### Setup Container Insights and AWS Cloud Watch Logs ###
### Setup Cluster Autoscaling and AWS EKS Kubernetes ###
### Delete AWS EKS Kubernetes Cluster ###

## Kubernetes on Azure with AKS ##
### Kubernetes on Azure with AKS - Section Introduction ###
### Constructing an Azure Account ###
### Constructing a Resource Group, Service Principal and AKS Kubernetes Cluster ###
### Deploy Hello World Rest API to Azure AKS Kubernetes ###
### Deploy Web App H2 to Azure AKS Kubernetes Cluster ###
### Deploy Web App with MySQL to Azure AKS Kubernetes Cluster ###
### Delete Deployments and Review of Microservices on GKE ###
### Deploy Microservices to Azure AKS Kubernetes Cluster ###
### Review Dev Spaces, Insights and Logs in Azure AKS Kubernetes Cluster ###
### Setup Ingress Controller and Ingress ###
### Review Cluster Autoscaling on Azure AKS Kubernetes ###
### Delete Azure AKS Kubernetes Cluster ###

## Appending - Introduction to Docker in 8 Steps ##
### Installing Docker - Docker ###
### Quick Tip for Windows 10: Use 192.168.99.100 in URL instead of localhost ###
### Your First Docker Usecase - Deploy a Spring Boot Application ###
### Important Docker Concepts - Registry, Repository, Tag, Image and Conta ###
### Playing with Docker Images and Containers ###
### Understanding Docker Architecture - Docker Client, Docker Engine ###
### Why is Docker Popular ###
### Playing with Docker Images ###
### Playing with Docker Containers ###
### Playing with Docker Commands - stats, system ###
### Before You Go - Ensure You Delete All Your Clusters ###

## Bonus Section ##
### Bonus Lecture ###
