# Redis Cluster Setup #
## Introduction ##
1. This tutorial is about clustering. This is based on [http://redis.io/topics/cluster-tutorial](http://redis.io/topics/cluster-tutorial) and [http://redis.io/topics/cluster-spec](http://redis.io/topics/cluster-spec)
2. Redis cluster is a distributed Redis deployment aiming to tackle:
	1. Ability to automatically split dataset among multiple nodes
	2. Ability to provide high performance and linear scalability
	3. Abilty to retain all writes originating from clients connected with majority of nodes (write safety/consistency)
	4. Ability to survive network patitions where majority of master nodes are eachable and there is at least a reachable slave for every master node that is no longer reachable.

## Redis Clustering Limitations ##
## Sharding (Partitioning) Scheme ##
### Keys hash tags ###
## Redis Clustering in Nutshell ##
## Consistency, availability and scalability ##
### Consistency ###
### Avaiability ###
### Scalability ###
## Installing Redis with Clustering Support ##
## Configuring Redis Cluster ##
### Configure Redis Cluster master nodes ###
### Configure Redis Cluster slave nodes and replication ###
### Verifying Redis Cluster is working properly ###
### Adding and removing nodes to the running Redis Cluster ###
## Redis Cluster Commands ##
## Redis Sentinel ##
## What's next ##