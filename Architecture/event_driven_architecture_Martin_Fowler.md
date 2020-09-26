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