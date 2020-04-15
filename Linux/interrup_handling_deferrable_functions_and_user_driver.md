# Interrup Handling: Deferrable Functions and User Driver #
1. Device driver mapping to hardware
2. Sharing interrupt handlers
3. Different handers for same device
4. Top halves and Bottom halves
	1. Tasklets
	2. Work Queues
	3. Threaded IRQs
5. Own kernel threads:
	1. New API for threaded interrupt handlers
6. Handling interrupts from user space
7. Efficient interrupt handlers have top and bottom
	1. Top halves: driver does what is required as quickly as possible
		1. Getting data off
		2. ...
		3. It should get ready to handle more interrupts as quickly as possible
		4. This is the interrupt handler
		5. Ensure that it came from the device (not from another on the IRQ line)
		6. Clear interrupt bit on line
	2. Bottom halves:
		1. Used for deferring work that can be done later and doesn't have to be done as soon as interrupt comes in
		2. Three types
			1. Tasklets
				1. Runs on the CPU on which it is requisted to run on
					1. Simple to handle
					2. Serialization is easy
					3. We can ensure it does not run before top half is done
					4. Runs only on CPU that scheduled them
				2. Runs in soft interrupt context
			2. Work Queues
				1. 
			3. Threaded IRQs