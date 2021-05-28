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
1. Dynamic re-configuration: 
	1. We can change configuration and changes get applied without restart
	2. Lightweight and modern web application firewall
	3. Authorization and authentication with standard battle-tested signe sign-on (SSO) solutions like OpenID Connect (OIDC)
	4. 24/7 support to help quickly move production workloads to Kubernetes
2. NGINX Ingress Controller
	1. Production grade ingress controller (daemon) that runs along NGINX Open Source or NGINX Plus instances in Kubernetes environment
		1. The daemon monitors NGINX Ingress resources and Kubernetes Ingress resources to discover requests for services that require ingress load balancing