# Kubernetes Autoscaling in Production: Best Practices for Cluster Autoscaler, HPA and VPA #
## Introduction ##
1. Topics
	1. Deep dive into Kubernetes autoscaling tools
		1. Cluster autoscaler
		2. Horizontal Pod Autoscaler (HPA)
		3. Vertical Pod Autoscaler (VPA)
	2. Best practices that developers, DevOps and Kubernetes admins should follow when configuring the tools
2. Kubernetes is scalable
	1. It has tools that allow application and infrastructure (apps are hosted on) to scale in and out based on
		1. Demand
		2. Efficiency
		3. Number of other metrics
3. [Checklist with Checks, Recipes, and Best Practices for Resource Management, Security, Scalability, and Monitoring for Production-Ready Kubernetes](https://www.replex.io/cs/c/?cta_guid=1e51607c-2f30-40af-ae29-fd5adfe33636&signature=AAH58kFNtNlablh8wOOMKScq5Jz--n6NpQ&pageId=22857668200&placement_guid=52c459a8-6841-49da-9b79-67355ea6f632&click=183c8086-425a-4bf8-b05c-fb64e3920ee6&hsutk=cf6746a63092abe03f4e19e25e568b58&canon=https%3A%2F%2Fwww.replex.io%2Fblog%2Fkubernetes-in-production-best-practices-for-cluster-autoscaler-hpa-and-vpa&utm_referrer=https%3A%2F%2Fwww.google.com%2F&portal_id=1799265&redirect_url=APefjpGNRWFk98b1B18TBTIj9FJ0QFhNtOvTupgmmp5eO8JnOlEmnW10ftr6ZatU5enDqAyuHn0UdI6vGn1RRJKppAdEs6da6ViAF0xOhcGWtFOvcXm6cWBbS-MOq8ND83s40X_CRVmiwtxDsmZqNIx70ni1voaB0szMyQXY93KKMRCVzHRkuzkBty8QR4FolibXI3K3T_9GeUGdd3dFD7LvYOXMPVPCl1qFlzSc-UJhR3zayPLG_3GoMOEn-LQ-e58jLz02C2A1soP2Q8_yK9au28sA88ua53p2geiuREAxxAVmXx_-yjk&__hstc=218672774.cf6746a63092abe03f4e19e25e568b58.1622134716251.1622508672195.1622896954105.3&__hssc=218672774.1.1622896954105&__hsfp=1179866729&contentType=blog-post)

## Kubernetes Autoscaling ##
1. Kubernetes has 3 scalability tools
	1. Horzontal Pod Autoscaler (HPA)
	2. Vertical Pod Autoscaler (VPA)
	3. Cluster Autoscaler (works at infrastructure layer)
2. The article outlines best practices for all three auto scaling tools

## What is the Cluster Autoscaler? ##
1. [Cluster Autoscaler](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler) - Kubernetes tools that increases or decreases size of a Kubernetes cluster (by adding or removing nodes) based on the presence of pending pods and node utilization metrics

### The Cluster Autoscaler ###
	1. Adds nodes to cluster whenever it detects pending pods (could not be scheduled due to resource shortages)
	2. Removes nodes from cluster, whenever utilization of node falls below certain threshold defined by cluster administrator
3. It ensures that underlying cluster infrastructure is elastic and scalable and can meet changing demands of workloads on top of it

## Cluster Autoscaler Best Practices ##
### Use the Correct Version of Cluster Autoscaler ###
1. Cluster autoscaler can be used with recommended Kubernetes version (because new features are being released periodically)
	1. [List of compatibility of different cluster autoscaler versions with Kubernetes versions](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler#releases)

### Ensure Cluster Nodes have the Same Capacity ###
1. Cluster autoscaler works correctly only with Kubernetes node groups/instance groups that have nodes with same capacity
	1. Works under the assumption that each individual node in the node group has same CPU and memory capacity ([Assumption](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#how-does-scale-up-work))
	2. Template nodes are created for each node group and autoscaling decisions are made based on the template node
	3. Best practice: Ensure that instance group that is being autoscaled via cluster autoscaler has instances/nodes of same type
		1. For Public cloud providers (AWS say) - not optimal
			1. Diversification and availability considerations dictate use of multiple instance types
			2. Cluster autoscaler supports node groups with mixed instance types but we must ensure that the instance types have same resource footprint
				1. They have same amount of CPU and memory resources

### Ensure Every Pod has Resource Requests Defined ###
1. Specifying resource requests is essential for it to function correctly
	1. Since scaling decisions are based on
		1. Scheduling status of pods
		2. Utilization of individual nodes
	3. Scale down - cluster autoscaler will scale down nodes that have a utilization less than specified threshold
		1. [Utilization](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#what-are-the-parameters-to-ca) - calculated as sum of requested resources divided by capacity
			1. They might be off if any pods or containers without resource requests are present (it leads to suboptimal functioning)
	4. Best practice: Ensure that all pods, scheduled to run in autoscaled node group/ instance group have resource requests specified

### Specify PodDisruptionBudget for kube-system Pods ###
1. Kube-system pods - by default prevent cluster autoscaler from [scaling down](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#how-to-set-pdbs-to-enable-ca-to-move-kube-system-pods) the node the pods are running on
	1. If the pods end up on different nodes, they prevent cluster from scaling down
2. To avoid situations where nodes cannot be scaled down due to system pods
	1. Best practice - specify pod disruption budget for the pods
		1. [Pod disruption budgets](https://kubernetes.io/docs/tasks/run-application/configure-pdb/) - Avoids kubernetes administrators to avoid disriptions to critical pods and ensure desired number of the pods is always running

### Specify PodDisruptionBudget for Application Pods ###
### Avoid using the Cluster Autoscaler with more than 1000 Node Clusters ###
### Ensure Resource Availability for the Cluster Autoscaler Pod ###
### Ensure Resource Requests are Close to Actual Usage ###
### Over-Provision Cluster to Ensure head room for Critical pods ###
#### To recap here are the recommended best practices for the cluster autoscaler on Kubernetes: ####

## HorizontalPodAutoscaler (HPA) Best Practices ##
### Ensure all Pods have Resource Requests Configured ###
### Install metrics-server ###
#### Configure Custom or External Metrics ####
### Prefer Custom Metrics over External Metrics whenever Possible ###
### Configure Cooldown Period ###
### To recap here are the Horizontal Pod Autoscaler (HPA) best practices ###

## Vertical Pod Autoscaler (VPA) Best Practices ##
### Use the Correct Kubernetes Version ###
### Install metrics-server and Prometheus ###
### Avoid using HPA and VPA in tandem ###
### Use VPA together with Cluster Autoscaler ###
### To recap here are the recommended best practices for VPA: ###
