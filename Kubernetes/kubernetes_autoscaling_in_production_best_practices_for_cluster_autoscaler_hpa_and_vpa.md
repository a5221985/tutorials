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