# Event Driven Architecture #
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

## Variation - Event Driven ##
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

## Event Sourcing ##
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
		5. Memory image (
	2. Cons:
		1. Unfamiliar
		2. External Systems
		3. Event Schema
		4. Identifiers
		5. Asynchrony?
		6. Versioning?