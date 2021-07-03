# Software Architecture Monday #
## Architecture Decision Records ##
1. Architecturally significant
	1. We will keep a collection of records (architecture decision records) for architecturally significant decisions: those that affect the structure (overall style - microservices, micro-kernel, service based, layered, ...), non-functional characteristics (ilities), dependencies (between services and components), interfaces (apis, ...), or construction techniques (processes, procedures, platforms and languages, ...) - Michael Nygard
2. Sections:
	1. Short text file: 1-2 pages long, one file per decision
	2. Markdown, textile, asciidoc, plaintext, etc...
	3. One document has only one decision
		1. Sections: (of ADR)
			1. Title
				1. Short noun phrase & numbered
				2. Describes actual architectural decision
			2. Status
				1. Proposed
				2. Accepted
				3. Superseded
			3. Context (describes the problem and why I am needing to make this architecture decision)
				1. Forces at play
				2. Alternative choices
			4. Decision
				1. Architecture decision
				2. Response to forces with justification
			5. Consquences
				1. Context after decision is applied
					1. Good or bad
				2. Document them
			6. Metadata
				1. Author
				2. When was it approved
				3. Who approved
				4. If it is modified who modified this decision
			7. Measurements for Compliance
				1. Document how it is going to be measured
					1. Using automated or manual fitness function
3. Scenario (customer info say)
	
		http-client -> Mule -> ActiveMQ -> DB
		external -> Mule
		b2b -> Mule
		
	1. REST - Messaging
	2. Decision:
		1. Should we have dedicated ActiveMQ per client or centralized one?
			1. Show alternatives and justify
	3. ADR:
		1. 21. Centralized message broker for federated gateway hub
		2. Status
			1. Accepted
		3. Context
			1. The incoming gateway hub is federated into 3 separate hubs.
			2. Access to the customer information functionality in the application is only through JMS using ActiveMQ via the hub. The two options are to use a centralized broker or to use dedicated broker instances for each hub instance
		4. Decision
			1. We will use a centralized message broker instance for all federated gateway hubs
				1. It must be an affirmative decision
			2. We currently have low request volumes (200 requests/sec) and anticipate this will remain stable for the foreseable future. Therefore we do not see a performance bottleneck issue.
			3. We will leverage the ActiveMQ failover protocol coupled with clustered ActiveMQ broker instances to address any single point of failure issues
		5. Consquences
			1. The customer information application will only require a single connection to the ActiveMQ broker instance (instead of 3 connections)
			2. The gateway hubs can be expanded and consolidated without any coding changes to the application