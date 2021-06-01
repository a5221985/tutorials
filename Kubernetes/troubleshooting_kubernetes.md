# Troubleshooting Kubernetes #
## Introduction ##
1. It has two sections
	1. [Troubleshooting your application](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application/) - useful for users who are deploying code into Kubernetes and wondering why it is not working
	2. [Troubleshooting your cluster](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/) - useful for cluster adinistrators and people whose Kubernetes cluster is unhappy

## Getting help ##
1. If problems weren't answered by the guides, there are a variety of ways for us to get help from Kubernetes community

### Questions ###
1. Documentation on the site has been structured to provide answers to a range of questions
2. [Concepts](https://kubernetes.io/docs/concepts/) - explains Kubernetes architecture and how each component works
3. [Setup](https://kubernetes.io/docs/setup/) - provides practical instructions for getting started
4. [Tasks](https://kubernetes.io/docs/tasks/) - Show how to accomplish commonly used tasks
5. [Tutorials](https://kubernetes.io/docs/tutorials/) - comprehensive walkthroughs of real-world, industry-specific, or end-to-end development scenarios
6. [Reference](https://kubernetes.io/docs/reference/) - provides detailed documentation on [Kubernetes API](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.21/) and command-line interfaces (CLIs) such as [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/)

## Help! My question isn't covered! I need help now! ##
### Stack Overflow ###
1. Kubernetes team also monitors [posts tagged Kubernetes](https://stackoverflow.com/questions/tagged/kubernetes)
2. We can [ask a new one!](https://stackoverflow.com/questions/ask?tags=kubernetes)

### Slack ###
1. `#kubernetes-users` channel
	1. We can [request and invitation](https://slack.kubernetes.io/)
	2. Registration is open for everyone
	3. We can ask any questions
	4. We can access [Kubernetes organisation in Slack](https://kubernetes.slack.com/) via web browser or Slack app
	5. We can browse channels for various subjects of interest
		1. `#kubernetes-novice` - for people new to Kubernetes [#kubernetes-novice](https://kubernetes.slack.com/messages/kubernetes-novice)
		2. `#kubernetes-dev` - for developers [#kubernetes-dev](https://kubernetes.slack.com/messages/kubernetes-dev)
		3. Country specific or local language specific channels
			1. `#cn-users`, `#cn-events`
			2. ...
			3. `#in-users`, `#in-events`

### Forum ###
1. [discuss.kubernetes.io](https://discuss.kubernetes.io/) - Official Kubernetes forum

### Bugs and feature requests ###
1. [Github issue tracking system](https://github.com/kubernetes/kubernetes/issues) - If we possibly discover a bug, we can make a feature request
	1. See existing issues to see if issue is already covered
	2. We can include detailed information about how to reproduce the problem
		1. Kubernetes version: `kubectl version`
		2. Cloud provider, OS distro, network configuration, and Docker version
		3. Steps to reproduce the problem

# Troubleshoot Applications #
1. To help users debug applications deployed into Kubernetes and not behaving correctly

## Diagnosing the Problem ##
### Debugging Pods ###
1. Check current state of the Pod and recent events:

		kubectl describe pods ${POD_NAME}
		
	1. Check the status of containers in the pod
		1. Are all of them **Running**?
		2. Have there been any recent restarts
		3. Debug based on the state of the pods

#### My pod stays pending ####
1. If Pod is stuck in **Pending** - it cannot be scheduled onto a node
	1. Usually because there are insufficient resources of one type or another that prevents scheduling
		1. `kubectl describe ...` has messages from scheduler about why it can not schedule a pod
			1. Reasons can be:
				1. **No enough resources** - exhausted CPU or Memory in cluster
					1. Solution: 
						1. Delete pods
						2. Adjust resource requests OR add new nodes to cluster
 
### Debugging Replication Controllers ###
### Debugging Services ###