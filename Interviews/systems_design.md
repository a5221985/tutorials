# Systems Design #
## Topics ##
1. Communication
	1. Think out loud
	2. Show how you arrived at it
	3. Ask questions
		1. For clarification
	4. Questions may be under-specified
2. Designing to Scale
	1. It should reach wide audience
	2. It should be reliable (meets user needs)
	3. Should make efficient use of resources
	4. Questions
		1. How can we tell that the system is working?
		2. Is there a bottleneck in the design?
		3. How do the components work together? (what are the APIs?)
		4. How do we provide great service to everyone?
		5. Examples:
			1. How to shard large data sets among multiple worker machines
			2. Requests ansered by any one in the pool of machines
			3. Identify the fastest machine and discard the rest
	5. Discuss system properties
		1. Latency (numberic estimates)
		2. Throughput
		3. Storage
	6. Discuss how the design backs up the numbers
3. Concrete and Quantitative Solutions
	1. Consider reality and laws of physics
	2. Have a general idea of costs and latencies of general ops
		1. Read from disk
		2. Read from memory
		3. Local Area Network (LAN) round-trip
		4. Cross-Continental network
	3. Use whiteboard to estimate the resources to run the system
	4. **Understand insdustry solution patterns**
		1. Sharding Data
		2. Replication Types
		3. Write-Ahead Logging
		4. Separating Data and Metadata Storage
		5. Load Distribution
4. Trade-offs and Compromises
	1. Identify systematic shortcommings and describe how system responds to various failures
	2. Layout the tradeoffs and compromises made and explain the reasoning
		1. Do you store in rotating disk? cheaper but increased latency
		2. Do you store on a flash drive? expensive but very fast
	3. Process
		1. Consider multiple solutions
		2. Commit to one
		3. Iterate on the one
5. Best Practices
	1. Explain the thought process during hte interview
	2. How we solve problems is important
	3. Questions may be deliberately open ended to see how we solve those problems
	4. Ask for clarification
	5. Think about ways to improve upon the solution (let the interviewer know)
	6. Practice on paper or whiteboard

## Constraints ##
1. No coding
2. Time constraint (20 minutes)