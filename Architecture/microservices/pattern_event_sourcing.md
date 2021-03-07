# Pattern: Event Sourcing #
## Context ##
1. Service command might need to update database
2. To do so service sends messages/ events
3. Example:
	1. Service wants to automatically update database and sends messages/ events
	2. Service that publishes domain event must automatically update an aggregate and publish an event
4. Database update and sending messages must be automatic
	1. To avoid data inconsistencies and bugs
		1. It is not viable to use distributed transaction that spans the database **and** message broker to automatically update database and publish messages/events

## Problem ##
1. How to reliably/ automatically update database and publish messages/events?

## Forces ##
1. 2PC is not an option (?)

## Solution ##
1. Event sourcing
	1. Persists state of business entity (such as Order or Customer) as a sequence of state-changing events
		1. Whenever state of business entity changes, new event is appended to list of events
			1. Saving of event is a single operation (it is inherently atomic)
		2. Application re-constructs an entity's current state by replaying the events
	2.  

## Example ##
## Resulting Context ##
## Related Patterns ##
## See Also ##