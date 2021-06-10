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
	2. Best practice - specify pod disruption budget for the pods
		1. [Pod disruption budgets](https://kubernetes.io/docs/tasks/run-application/configure-pdb/) - Avoids kubernetes administrators to avoid disriptions to critical pods and ensure desired number of the pods is always running
	3. Consider number of replicas of pods provisioned by default
		1. Kube-dns is only system pod that has multiple running replcas by default
			1. Most others run as single instance pods and restarting them could result in disruptions to cluster
		2. Best practice - Avoid building disruption budget for single instance pods (like metrics-server)

### Specify PodDisruptionBudget for Application Pods ###
1. Another best practice - specify pod disruption budget for [application pods](https://kubernetes.io/docs/tasks/run-application/configure-pdb/#protecting-an-application-with-a-poddisruptionbudget)
	1. Ensures that pod autoscaler does not scale down pod replicas below certain minimum number
		1. Protects critical applications from disruptions and ensures high availability
		2. Can be specified using `.spec.minAvailable` and `.spec.maxUnavailable` fields
			1. `.spec.minAvailable` - Specifies number of pods that must be available after eviction
				1. Absolute number or percentage
			2. `.spec.maxUnavailable` - Specifies maximum number of pods that can be unavailable after eviction
				1. Absolute number or percentage

### Avoid using the Cluster Autoscaler with more than 1000 Node Clusters ###
1. For cluster autoscaler to remain responsive
	1. Ensure cluster does not exceed certain size
2. [Offical](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/proposals/scalability_tests.md#ca-scales-to-1000-nodes) - scalability and responsiveness service level (for cluster autoscaler) is 1000 nodes with each node running 30 pods.
3. Best practice - Ensure cluster footprint does not exceed specified scalability limit

### Ensure Resource Availability for the Cluster Autoscaler Pod ###
1. Ensure resource availability for autoscaler to work for larger clusters
	1. Best practice - set resource requests of cluster autoscaler pod to minimum of 1 CPU
2. Ensure that the node the cluster autoscaler is running on has enough resources available to support it
	1. Running cluster autoscaler pod on a node with resource pressure can lead to degraded performance
		1. Cluster autoscaler might even become non-responsive

### Ensure Resource Requests are Close to Actual Usage ###
1. Cluster autoscaler makes scaling decisions based on the pressure of pending pods and utilization of individual nodes
	1. Node utilization - sum of requested resources of all pods divided by the capacity
2. If we over provision requests, it can cause pods not utilizing requested resources efficiently
	1. Leads to lower overall node utilization
	2. If resource requests are high, cluster autoscaler calculates higher utilization level for node and may not scale it down
3. Best practice: Ensure pod's requested resources are comparable to actual resource usage/consumption
	1. Use virtual pod autoscaler (VPA) - good starting point
	2. Decision can be based on historical resource usage and consumption of pods

### Over-Provision Cluster to Ensure head room for Critical pods ###
1. [Service Level Objective](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#what-are-the-service-level-objectives-for-cluster-autoscaler) - Cluster autoscaler has SLO of 30 seconds latency between time a pod is marked as unschedulable to time that it requests scale-up to cloud provider
	1. The latency benchmark is for smaller clusters (< 100 nodes)
		1. ~ 60 seconds for clusters up to 1000 nodes
2. Time taken for pod to be scheduled (for scale up) and new node getting provisioned (as a result) depends on cloud provider
	1. It can be several minutes
	2. Solution: To avoid delay and ensure pods spend as little time as possible in unschedulable state
		1. Over provision the cluster
			1. Accomplished by using a deployment with pause pods
			2. **Pause pods: Dummy pods spun up exclusively to reserve space for other higher priority pods**
				1. Pause pods are assigned very low priority & Kubernetes scheudler will remove then to make space for unscheduled pods with higher priority
					1. This ensures that critical pods do not have to wait for new node to be provisioned by cloud provider
						1. The critical pods can be quickly scheduled on already existing nodes (replacing pause pods)
					2. When pause pods re-spawn, they become unschedulable resulting in cluster scaling up
						1. The head room for over provisioned Cluster can be controller by specifying size of pause pods

#### To recap here are the recommended best practices for the cluster autoscaler on Kubernetes: ####
1. Use correct version of Cluster autoscaler
2. Ensure cluster nodes have same capacity
3. Ensure every pod has resource requests defined
4. Specify PodDisruptionBudget for kube-system pods
5. Specify PodDisruptionBudget for application pods
6. Avoid using Cluster autoscaler with more than 1000 node clusters
7. Ensure resource availability for cluster autoscaler pod
8. Ensure resource requests are close to actual usage
9. Over-provision cluster to ensure head room for critical pods

## HorizontalPodAutoscaler (HPA) Best Practices ##
1. It scales number of pods in a replication controller, deployment, replica set or stateful set based on CPU utilization
2. It can also be configured to make scaling decisions based on [custom](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#support-for-custom-metrics) or [external](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-metrics-not-related-to-kubernetes-objects) metrics
3. It can be used to ensure that critical applications are elastic and can scale out to meet increasing demand and scale down to ensure optimal [resource usage](https://www.replex.io/blog/7-things-you-can-do-today-to-reduce-aws-kubernetes-costs)

### Ensure all Pods have Resource Requests Configured ###
1. HPA makes scaling decisions based on observed CPU utilisation values of pods that are part of Kubernetes controller
	1. [Utilisation](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/autoscaling/horizontal-pod-autoscaler.md#horizontalpodautoscaler-object) - values calculated as percentage of resource requests of individual pods
		1. Missing request values for some containers might throw off utilisation calculations of HPA controller leading to suboptimal operation and scaling decisions
2. Best practice - Ensure that resource request values are configured for all containers for each individual pod (it is part of Kubernetes controller being scaled using HPA)

### Install metrics-server ###
1. HPA makes scaling decisions based on per-pod resource metrics retrieved from resource metrics API (metrics.k8s.io)
	1. metrics.k8s.io API - provided by metrics-server
	2. **Best practice** - [launch](https://kubernetes.io/docs/tasks/debug-application-cluster/resource-metrics-pipeline/#metrics-server) metrics-server in Kubernetes cluster as cluster add-on
	3. **Best practice** - set `--horizontal-pod-autoscaler-use-rest-clients` to `true` or unset
		1. Important - If set to `false`, gets reverted to Heapster (depreacted as of Kubernetes 1.11)

#### Configure Custom or External Metrics ####
1. Two types of cusotm metrics supported
	1. pod and object metrics
		1. [Pod metrics](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-multiple-metrics-and-custom-metricshttps://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-multiple-metrics-and-custom-metrics) - Averaged across all pods and only support `target` type of `AverageValue`
			1. Object metrics can describe any other object in same namespace and support `target` types of `Value` and `AverageValue`
2. **Best practice** - Ensure correct `target` type is used for pod and object metrics
3. External metrics
	1. Allows HPA to autoscale applications based on metrics provided by third party monitoring sytems
		1. External metrics support `target` types of `Value` and `AverageValue`

### Prefer Custom Metrics over External Metrics whenever Possible ###
1. Prefer custom metrics over external metrics
	1. External metrics API takes more effort to secure than custom metrics API
	2. It could potentially allow access to all metrics

### Configure Cooldown Period ###
1. Scaling events might be received in quick succession without a period between the scaling events
	1. Leads to [thrashing](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#support-for-cooldown-delay) - where number of replicas fluctuates frequently (not desirable)
2. To get around this and specify cooling period:
	1. Configure `--horizontal-pod-autoscaler-downscale-stabilization`
		1. This is passed to kube-controller manager
		2. The default value is 5 minuts
			1. Duration HPA waits after downscale event before initiating another downscale operation
3. HPA tolerates 10% change in desired to actual metrics ratio before scaling
	1. The value can be changed by configuring `horizontal-pod-autoscaler-tolerance` flag
		1. [configurable flags](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#algorithm-details)
			1. `--horizontal-pod-autoscaler-cpu-initialization-period`
			2. `--horizontal-pod-autoscaler-initial-readiness-delay`
			3. `--horizontal-pod-autoscaler-sync-period`
		2. The values depend on cluster and application requirements

### To recap here are the Horizontal Pod Autoscaler (HPA) best practices ###
1. Ensure all pods have resource requests specified
2. Install metrics-server
3. Configure custom or external metrics
4. Prefer custom metrics over external metrics
5. Configure cool-down period

## Vertical Pod Autoscaler (VPA) Best Practices ##
1. [VPA](https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler) - automatically sets resource request and limit values of containers based on usage
	1. Aims to reduce maintenance overhead of configuring resource requests and limits for containers and improve utilization of cluster resources
	2. VerticalPodAutoscaler can
		1. Reduce request value for containers whose resource usage is consistently lower than requested amount
		2. Increase request values for containers that consistently use high percentage of resources requested
		3. Automatically set resource limit values based on limit to request ratios specified as part of container template

### Use the Correct Kubernetes Version ###
1. Version 0.4 and later of `VerticalPodAutoscaler` requires custom resource definition capabilities (min Kubernetes version 1.11)
	1. Version 0.3 is recommended for earlier Kubernetes versions

### Install metrics-server and Prometheus ###
1. VPA makes scaling decisions based on usage and utilization metrics from Prometheus and metrics-server

### Avoid using HPA and VPA in tandem ###
### Use VPA together with Cluster Autoscaler ###
### To recap here are the recommended best practices for VPA: ###
