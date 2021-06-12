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
