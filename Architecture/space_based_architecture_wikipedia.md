# Space Based Architecture #
1. It is an approach to distributed computing systems
	1. Components interact with each other by exchanging tuples or entries via one or more shared spaces
		1. Contrasting message queuing service (exchange messages through message broker)
			1. Distinction between the two is how messages are exchanged with a central agent
				1. Difference: Message broker - an academic conference where each presenter has the stage and presents in order they are scheduled
					1. Tuple space is like unconference - participants can write on a common whiteboard concurrently and all can see it at the same time
2. Tuple spaces:
	1. Each space is like channel in a message broker system
		1. Components can interact with each space
	2. Components can write a 'tuple' or 'entry' into a space
		1. Other components can read entries/tuples from the space
			1. More powerful mechanisms are used than message brokers
	3. Entries to a space is generally not ordered as in message broker
		1. It can be ordered if necessary
	4. Designing applications using this approach is less intuitive to most people
		1. Can present more cognitive load to appreciate and exploit
3. Message Brokers:
	1. Each broker typically supports multiple 'channels' that components can choose to interact with
	2. Components can write 'messages' to a channel
		1. Other components read messages from the channel
	3. Messages (writing) to a channel is generally in order
		1. The messages are generally read out in the same order
	4. Designing applications using the approach is more intuitive to most people
		1. NoSQL is more intuitive than SQL say
4. Goals of both systems:
	1. To construct loosely-coupled systems
		1. loosely-coupled: 
			1. components are weekly associated (have breakable relationship) with each other
				1. Changes in one component least affect existence or performance of another component
				2. Each of the components has or maskes use of little or no knowledge of definitions of other separate components
		2. 

## Components of Space-Based Architecture ##
### Processing Unit ###
### Virtual Middleware ###
### POJO-Driven Services Model ###
### SLA-Driven Container ###