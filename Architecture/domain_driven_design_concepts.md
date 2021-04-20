# Domain Driven Design Concepts #
## Building Blocks ##
### Entity ###
1. Object not defined by it's attributes but by thread of continuity and identity
	1. Example: A seat is uniquely identified (id) in a flight
		1. Southwest Airlines does not distinguish between every seat (all seats are same)
			1. In this case, seat is a value object

### Value Object ###
1. Object that contains attributes but has not conceptual identity
	1. Treated as immutable
	2. Each business card is not distinguished uniquely from the others
		1. Only information printed is essential
			1. Business card (in this context) is a value object

### Aggregate ###
1. Group of objects bound together by root entity (aggregate root)
	1. Outside objects are allowed to hold references to root but not not any other object of aggregate
	2. Aggregate root is responsible for checking consistency of changes in aggregate
	3. Example: Car - aggregate root, engine, wheels, spark plug, ... are other objects of the aggregate
		1. We have access to the car (and not to the individual parts mentioned)

### Domain Event ###
1. Domain object that defines an event (something happened)
	1. It is the event that domain experts care about

### Service ###
1. An operation that does not conceptually belong to an object (outside functions) can be implemented in services

### Repository ###
1. Methods retrieving domain objects deligate the task to specialized repository object
	1. Alternative storage implementations can be easily interchanged with repository objects

### Factory ###
1. Methods for constructing domain objects delegate the task to specialized factory object
	1. Alternative implementations of the factory can be easily interchanged