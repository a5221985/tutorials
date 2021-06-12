# Consul #
## Kubernetes ##
### Introduction ###
1. Many integrations with Kubernetes
2. Consul can be deployed to Kubernetes using Helm chart
3. We can sync services between Consul and Kubernetes
4. We can run Consul Connect Service Mesh
5. Topics:
	1. Official integrations between Consul and Kubernetes

### Use Cases ###
#### Running a Consul server cluster ####
1. Consul server cluster can be run directly on Kubernetes
	1. It can be used by nodes within Kubernetes and nodes external to Kubernetes (there should be communication to server via network)

#### Running Consul Clients ####
1. Can run as pods on every node and expose API to running pods
	1. Enables envconsul, consul-template, ... to work on Kubernetes (since local agent is available)
		1. Since local agent is available
	2. Registers node with Consul catalog (for full visibility into the infrastructure)

#### Consul Connect Service Mesh ####
1. Consul can inject Consul connect sidecar into pods
	1. To accept and establish encrypted and authorized network connections via mutual TLS.
2. Allows pods to communicate with external services (and vice versa) over fully encrypted connection

#### Service Sync to Enable Kubernetes and non-Kubernetes Services to Communicate ####
1. Consul can sync Kubernetes services with its own service registry
	1. Allows Kubernetes services to use native Kubernetes service discovery to discover and connect to external services registered in Consul & for external services to use Consul service discovery to discover and connect to Kubernetes services

#### And more! ####
1. Consul can run on Kubernetes
2. Any other tool built for Kubernetes can choose to leverage Consul

### Getting Started with Consul and Kubernetes ###
1. Ways to try Consul with Kubernetes

#### Tutorials ####
1. [Getting Started with Consul Service Mesh](https://learn.hashicorp.com/tutorials/consul/service-mesh?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS)
	1. For installing Consul as service mesh for Kubernetes using Helm chart
	2. Deploying services in service mesh
	3. Using intensions to secure service communications
2. [Migrate to Microservices with Consul Service Mesh on Kubernetes](https://learn.hashicorp.com/collections/consul/microservices?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS)
	1. Uses example application to illustrate why and how organizations can migrate from monolith to microservices using Consul service mesh on Kubernetes
		1. Info for understanding how to develop services that leverage Consul during any stage of microservices journey
3. [Consul and Minikube guide](https://learn.hashicorp.com/tutorials/consul/kubernetes-minikube?utm_source=consul.io&utm_medium=docs)
	1. Quick step-by-step guide for deploying Consul with official Helm chart on local instance of Minikube
4. Production best practices and cloud-specific configurations for deploying Consul on managed Kubernetes runtimes
	1. [Consul on Azure Kubernetes Service (AKS)](https://learn.hashicorp.com/tutorials/consul/kubernetes-aks-azure?utm_source=consul.io&utm_medium=docs)
		1. Complete step by step guide on how to deploy Consul on AKS
		2. Practice deploying two microservices
	2. [Consul on Amazon Elastic Kubernetes Service (EKS)](https://learn.hashicorp.com/tutorials/consul/kubernetes-eks-aws?utm_source=consul.io&utm_medium=docs)
		1. Step by step guide on how to deploy Consul on EKS
		2. Provides guidance on interacting with datacenter with Consul UI, CLI, and API
	3. [Consul on Google Kubernetes Engine (GKE) Tutorial](https://learn.hashicorp.com/tutorials/consul/kubernetes-gke-google?utm_source=consul.io&utm_medium=docs)
		1. Step by step guide on how to deploy Consul on GKE
		2. Provides guidance on interacting with datacenter with Consul UI, CLI, and API
5. [Consul and Kubernetes Reference Architecture](https://learn.hashicorp.com/tutorials/consul/kubernetes-reference-architecture?utm_source=consul.io&utm_medium=docs)
	1. Provides recommended practices for production
6. [Consul and Kubernetes Deployment](https://learn.hashicorp.com/tutorials/consul/kubernetes-deployment-guide?utm_source=consul.io&utm_medium=docs)
	1. Necessary steps to install and configure new Consul cluster on Kubernetes in production
7. [Secure Consul and Registered Services on Kubernetes](https://learn.hashicorp.com/tutorials/consul/kubernetes-secure-agents?in=consul/kubernetes)
	1. Necessary steps to secure a Consul cluster running on Kubernetes in production
8. [Layer 7 Observability with Consul Service Mesh](https://learn.hashicorp.com/tutorials/consul/kubernetes-layer7-observability)
	1. Covers monitoring Consul service mesh running on Kubernetes with Prometheus and Grafana

#### Documentation ####
1. [Installing Consul](https://www.consul.io/docs/k8s/installation/install)
	1. How to install Consul using Helm chart
2. [Helm Chart Reference](https://www.consul.io/docs/k8s/helm)
	1. Different options for configuring Helm chart

## Deploy Consul on Azure Kubernetes Service (AKS) ##
### Introduction ###
1. Task: Deploy Consul Datacenter on Azure Kubernetes Service (AKS) with official Helm Chart
	1. No need to update any values in Helm chart for basic installation
		1. But we can define values file with parameters to allow access to Consul UI
			1. Azure Friday Demo
2. Security
	1. The demo will install insecure configuration of Consul
		1. Refer to [Kubernetes Documentation](https://www.consul.io/docs/platform/k8s/index.html) to determine how can we secure Consul on Kubernetes in production
	2. It is recommended to use secured Kubernetes cluster or make sure we understand and enable recommended security features

### Prerequisites ###
1. An Azure account
2. [Azure Cloud Shell](https://shell.azure.com/)
	1. All tools needed are installed
		1. [Cloud Shell](https://shell.azure.com/)
			1. To run the examples (Linux bash shell is used)
3. Code:

		git clone https://github.com/hashicorp/demo-consul-101.git
		
	1. Clone the repo in cloud shell first
	2. The example uses Terraform 0.12 and Helm 3 wich are installed on Azure Cloud Shell

### Watch the Azure Friday Demo - Optional ###
1. [Video](https://youtu.be/Y6mXqn1faFo)

### AKS Configuration ###
1. We will instantiate a Kubernetes Cluster on Azure Kubernetes Service
2. Run Consul on it (with few microservices) which use Consul to discover each other and communicate securely with Consul Connect (Consul's service mesh feature)

#### Construct an AKS Cluster with Terraform ####
1. Generate AKS cluster
	1. Terraform is used with the features needed for the demo
	2. Change to `k8s/terraform/azure/01-create-aks-cluster` directory
	
			cd demo-consul-101/k8s/terraform/azure/01-create-aks-cluster
			
2. Run `az` command with arguments to instantiate an Active Directory service principal account for the demo
	1. We get JSON snippet that includes `appId`, `password`, ...

			az ad sp create-for-rbac --skip-assignment
			
			{
				"appId": "aaaa-aaaa-aaaa",
				"displayName": "azure-cli-2019-04-11-00-46-05",
				"name": "http://azure-cli-2019-04-11-00-46-05",
				"password": "aaaa-aaaa-aaaa",
				"tenant": "aaaa-aaaa-aaaa"
			}
			
	2. Use the values to configure Terraform
		1. Open new `terraform.tfvars` file in in-browser text editor (`code`)

				code terraform.tfvars
		
			1. Edit contents

					# terraform.tfvars
					appId="<paste-addId>"
					password="<paste-password>"
					
3. Initialize Terraform project

		terraform init
		
4. Run `terraform apply` to instantiate cluster
	1. Respond with `yes` when prompted
	2. It may take upto 10 minutes to providion the AKS cluster
	3. Review Terraform files to check config code needed for AKS
		1. `role_based_access_control` must be used

				resource "azurerm_kubernetes_cluster" "default" {
					# ...
					
					role_based_access_control {
					enabled = true
					}
					
					# ...
				}

### Enable the Kubernetes Dashboard ###
1. To use Kubernetes dashboard, we have to instantiate `ClusterRoleBinding`

		kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard
		
2. Run the following command to open a new web browser tab with Kubernetes dashboard

		az aks browse --resource-group demo-rg --name demo-aks
		
	1. Dashboard should open in web browser

### Consul Configuration ###
1. We can now install Consul to cluster
2. Consul can run inside or outside of Kubernetes cluster
	1. In this demo, we use containers to run Consul inside Kubernetes pods

#### Install Consul with Helm ####
1. Move out to `k8s` directory in project

		cd ~/demo-consul-101/k8s
		
2. Add Helm Chart repository

		helm repo add hashicorp https://helm.releases.hashicorp.com
		
	1. Optionally open `helm-consul-values.yaml` (`code config.yaml`) file with `code` to review config that Helm chart will use
		1. Datacenter name is specified
		2. Load balancer is configured
		3. Consul UI will be exposed through load balancer
	
				# code helm-consul-values.yaml
				code config.yaml
				
3. Use `helm` to install Consul using `hashicorp/consul` chart

		# helm install azure hashicorp/consul -f helm-consul-values.yaml
		helm install azure hashicorp/consul -f config.yaml
		
	1. Wait for few minutes for pods to spin up
4. View Consul UI in browser

		kubectl get service azure-consul-ui --watch
		
	1. Open the `EXTERNAL-IP` in browser
	2. Core DNS lookups might fail for few minutes (which may prevent Consul from starting properly)
	3. Nodes screen shows Consul servers and agents running

### Deploy Microservices ###
1. Deploying few containers that container microservices
2. `counting` service returns JSON (backend) snippet with an incrementing number
3. `dashboard` service displays the numberthat it finds from `counting` service + displays debugging info when backend service can be found or is unreachable
4. `04-yaml-connect-envoy` contain yaml files for the microservices
5. Use `kubectl` to apply

		kubectl apply -f 04-yaml-connect-envoy
		
	1. A `counting` pod and `dashboard` pod should get created
	2. A load balancer for `dashboard` should get created
6. Run the following command to get IP address of dashboard

		kubectl get service dashboard-load-balancer --watch
		
	1. Open `EXTERNAL-IP`
	2. The page shows number that was fetched from backend `counting` API.
		1. Increments count every few seconds

### Configure Intentions ###
1. Consul can be configured to allow access between services or block access
	1. Go to Consul UI IP
	2. Find **Intentions** tab
	3. Click **Create**
		1. Source Service: * (All Services)
		2. Destination Service: * (All Services)
		3. Deny
		4. Save
2. Refresh browser 
	1. (Counting Service is Unreachable)
3. Go to Consul UI IP
	1. Add another Intention
		1. Click **Create**
		2. Select **Source Service** of **dashboard** and a **Destination Service** of **counting**
		3. Select **Allow**
		4. Click **Save**
4. Refresh Browser
	1. Shows **Connected**

### Destroy the Demo ###
1. Go to `terraform/azure/01-create-aks-cluster`

		cd terraform/azure/01-create-aks-cluster
	
2. Run the following:

		terraform destroy
		
	1. The operation can take upto 10 minutes

### Explanation ###
1. Additional steps:
	1. Creation of Golang web application
	2. Building Docker containers for each part of the application
	3. Configuring Consul and Kubernetes from init containers
	4. Writing YAML to deploy containers and associated environment variables
2. The code can be reviewed for the additional steps
	1. [Entire application and all configuration](https://github.com/hashicorp/demo-consul-101/tree/master/k8s) in `k8s`
	2. [YAML for Kubernetes](https://github.com/hashicorp/demo-consul-101/tree/master/k8s/04-yaml-connect-envoy) - in `04-yaml-connect-envoy`
		1. Includes configuration for `counting` and `dashboard` services
			1. Including annotations to enable Consul Connect service mesh sidecar proxies and send environment variables to relevant Docker containers
	3. [Application containers](https://github.com/hashicorp/demo-consul-101/tree/master/k8s/counting-service)
		1. In `counting-service` and `dashboard-service`
		2. They run several microservices and accept configuration via environment variables

### Next Steps ###
1. Terraform config for AKS and Helm can make the process more consistent and automated
2. Helm charts and Docker containers run microservices and connect to each other securely with Consul Connect service mesh
3. Further steps can be taken to
	1. Secure the entire datacenter
	2. Connect to other Consul datacenters
	3. To deploy additional microservices that can find each other with Consul service discovery
	4. Connect securely with Consul Connect service mesh
4. Additional reference documentation on Azure Kubernetes Services or HashiCorp Consul
	1. [Azure Kubernetes Workshop](https://aksworkshop.io/)
	2. [Consul API Docs](https://www.consul.io/api/index.html)