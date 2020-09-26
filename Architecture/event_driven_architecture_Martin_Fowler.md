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