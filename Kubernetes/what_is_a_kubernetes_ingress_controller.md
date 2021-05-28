# What is a Kubernetes Ingress Controller? #
## Introduction ##
1. **Kubernetes Ingress Controller**
	1. Specialized load balancer for Kubernetes environments
	2. It abstracts away the complexity of Kubernetes application traffic routing and provides a bridge between Kubernetes services and external ones
2. They
	1. Accept traffic from outside Kubernetes platform and load balance it (traffic) to pods (containers) running inside platform
	2. Can manage egress traffic within a cluster for services which need to communicate with other services outside of cluster
	3. Are configured using Kubernetes API to deploy objects called "Ingress Resources"
		1. Example: [https://kubernetes.io/docs/concepts/services-networking/ingress/](https://kubernetes.io/docs/concepts/services-networking/ingress/)

				apiVersion: networking.k8s.io/v1
				kind: Ingress # only supports HTTP(S)
				metadata:
				  name: minimal-ingress # valid DNS subdomain name (RFC 1123 standard compliant)
				  annotations:
				    nginx.ingress.kubernetes.io/rewrite-target: /
				spec: # has info about how to configure load balancer or proxy server
				  rules: # List of rules to match all incoming requests
				  - http:
				      paths:
				      - path: /testpath
				        pathType: Prefix
				        backend:
				          service:
				            name: test
				            port:
				              number: 80

	4. Monitor pods in kubernetes and automatically update load-balancing rules when pods are added or removed from a service

## How Can NGINX Help? ##
1. 