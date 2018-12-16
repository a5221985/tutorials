# Four Distributed Systems Architectural Patterns by Tim Berglund #
1. Patterns or ways people build distributed systems
2. Examples of companies using the patterns
3. Reference Architectures:
	1. Four of them
	2. Plusses and minueses
	3. Who uses them
4. Examples:
	1. Modern Three-Tier
		1. Presentation tier, business tier, data tier
			1. JSP, EJB/Servlet, Oracle
		2. What went wrong?
		3. Then came MVC
			1. React.JS, Node.JS, Cassandra (better)
		4. Scaling
			1. React.JS - scalable (more and more functionality can be pushed here)
			2. NGINX/ELB (load balancers)
			3. Node.JS - scalable
			4. Cassandra (cluster)
		5. More info:
			1. Cassandra
				1. All nodes are same (peer to peer)
				2. Each node has unique token
				3. We draw them in a circle
				4. It is a key-value store
					1. Run key through has hash function (write to that node)
					2. Do the same for reading
			2. Assuming some node may be failing at some time
				1. Write replicas to two more nodes
					1. If it is mutable data (difficult to manage)
						1. Consistency is the problem (cassandra has elegant answers)
				2. academy.datastacks.com (articles on cassandra)
		6. Strengths:
			1. Rich front-end framework (scale, UX)
				1. Response
				2. Much functionality
				3. Push compute to front-end
			2. Hip, scalable middle tier
				1. Easier
			3. Basically infinitely scalable data tier
				1. available
				2. scalable
		7. Example: Electrode (React/Node.js) apps
		8. Weeknesses
			1. State in middle tier
				1. Impediment for scaling (need to write them as stateless - harder than it sounds - difficult for low latency)