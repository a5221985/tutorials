# Event Driven Architecture #
## Event Notifiction Pattern ##
1. Event - important part
2. Event-driven
3. Insurance company:
	1. Customer - changes address
		1. Affects insurance quote levels
			1. Trigger new quoting system (send email etc...)
		2. Dependency is created between customer management system and insurance quoting system
			1. Not very good
				1. Solution:
					1. Insurance quoting depends on Customer Management system
						1. Event notifition:
							1. Customer management system emits event (address changed)
							2. Insurance quoting system responds to the event
		3. Events are used as notification system
			1. Queue etc...
		4. Loosely couples Customer management and Insurance quoting
4. GUI and rest of the code etc...
	1. Text box generates event and logic responds to it
5. Event is treated as an abject
6. Cons: 
	1. Events can be talked about
7. Commands & events
	1. Command: Customer management system explicitly tells what to do
	2. Event: Customer management just says something changed and doesn't expect anything
		1. Doesn't want to care - use event
8. Pros:
	1. Other systems can subscribe to the notification without telling customer management system
		1. We don't have to tell them (de-coupling)
9. Cons:
	1. Difficult to figure out what is going on
		1. Solution: Need to look at the flow of messages
			1. Just looking at the code is not sufficient
				1. This is a tradeoff

## Event-Carried State Transfer Pattern ##
1. Previous - knowing that event occurred is sufficient
	1. To find what changed, Insurance Quoting wants to find out Customer Management
		1. Solution: Put more info into the event (no back and fortch required)
			1. This just reduces the burden
				1. Cons: But may be all the information is not required all the time
				2. Listener might need additional information than what exists and need to go back to customer management system
2. Solution: **Event-carried state transfer** (Similar to REST)
	1. Using events to transfer state
		1. Insurance quoting system does not contact customer management system
			1. Insurance quoting system will keep all the data that it is ever going to need
				1. Customer management system broadcasts all the data the downstream ssytems are going to have
					1. Only stuff that I need
		2. Availability: If customer management system goes down, I just don't care
			1. Storage is cheap
	2. Problems:
		1. Replicated data
			1. Eventual consistency (more decoupling)
3. This is less common pattern (as a last resort)

## Event Sourcing Pattern ##
1. What is it?
	1. Changing address
		1. Remove old address
		2. Add new address
	2. Event: Object is constructed when address changed
		1. Popped into separate storage area (log)
	3. The event is then processed
		1. The address is changed when event is processed
2. Log has all the events that ever changed
	1. We can rebuild the entire state from the log (this is vital)
3. Example: Git, SVN, CVS
	1. Snapshots are also used in between
		1. History behind that is not considered for rebuilding current state
4. Example: Counting ledger (credit, debits, ...)
5. How to use?
	1. Pros:
		1. Audit
		2. Debugging (we can re-play the events and check what happened)
		3. Historing state
		4. Alternative state (if anything in between needs to be changed, the rest of the events can be replayed to get the current state)
		5. Memory image (don't have to store in relational database (?))
			1. Everything runs from memory
				1. Memory is very large now
					1. Persistence store is only for logs (and snapshots may be)
	2. Cons:
		1. Unfamiliar (harder to work with)
		2. External Systems (cannot call external system again to rebuild - need to store that)
		3. Event Schema (if I change the code that processes the events, how do I store events to replay them?)
		4. Identifiers (needs to be dealt with to replay)
		5. Asynchrony? hard to reason about
			1. Local commits are synchronous but collaboration is asynchronous
		6. Versioning?
			1. Complicated
				1. If application state is changed can I process last year?
6. What do we record as event?
	1. How to represent?
		1. Suppose changing function name
			1. It only sees textual diffs and commit message
				1. Intension capturing is required (refactoring)
					1. Difficult to capture (Java and Python are different - capturing technology specific details is hairy)
7. We want to capture intension
	1. Internal intension captured as event (reason for changing it)
		1. Input or Internal knowledge of the world (percieved)
	2. Output event broadcast to outside world events
		1. Fix bugs
		2. Replay
		3. Re-announce it
8. Simple solution:
	1. Don't have any business logic in between event and storage (versioning mess can occur)
	2. Store both internal event and outside event

## CQRS Pattern ##
1. Command Query Responsibility Segregation (query, command)
	1. Two components (Separate pieces of software)
		1. One for reads
		2. One for updates
2. Command is used only for update (read is part of it but mainly update logic)
	1. Complex business logic for updates but less frequently updated
		1. Calculate all the derived data in read model (read model can go to UI)
		2. Command model does calculation
3. Problems:
	1. Do we really need it?
		1. Example: Reporting database - read only (generated for reports)
			1. Pipelines of transformations
		2. The key: The command model is used only for updates (not for reads)

## Original Article ##
1. [https://martinfowler.com/articles/201701-event-drivern.html](https://martinfowler.com/articles/201701-event-drivern.html)
	1. Different links
	2. Summary