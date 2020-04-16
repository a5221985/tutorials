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
					1. tasks that cannot! go to sleep and that cannot run in interrupt context
			2. Work Queues
				1. Process context
				2. tasks that can go to sleep
				3. Scheduled like other tasks
			3. Threaded IRQs
				1. Kernel thread
					1. Initialize thread when driver is loaded and send it to sleep
					2. When there is work, wake up and then go to sleep again
				2. Threaded IRQ (same thing)
		3. Tasklets are part of generic softirqs (8 types)
			1. HI_SOFTIRQ - priority 0 - High-priority tasklets (it is like a timer with expiration time of 0)
			2. TIMER_SOFTIRQ - 1 - Scheduled timers
			3. NET_TX_SOFTIRQ - 2 - Network packet transmission
			4. NET_RX_SOFTIRQ - 3 - Network packet reception
			5. BLOCK_SOFTIRQ - 4 - Block device related work
			6. TASKLET_SOFTIRQ - 5 - Normal-priority tasklets
			7. SCHED_SOFTIRQ - 6 - Used in the CFS Scheduler
			8. HRTIMER_SOFTIRQ - 7 - Used if high resolution timers are present
8. When are SOFTIRQs executed:
	1. When returned from hardware or software interrupts, syscalls and excepiton handler...  system checks to see if there are any softirqs to be run and then runs them
		1. Tasklet storm - tasklets issues others...
			1. Tasklets are not scheduled
			2. Ksoftirq daemon
				1. Consumes 10 times and then stops and then is scheduled like any other task on the system
9. Tasklets run with infinite priority - cause latencies for other tasks
	1. Network drivers have used tasklets (cannot get rid of them)
	2. Avoid tasklets for new handlers, use threaded IRQ or work queues
10. Work Queue APIs
11. Pool of threads on each CPU (efficient)
	1. Old API is wrapped around new API
12. Internal kernel thread of execution:
	1. [<name>] - kernel thread
	2. API:
		1. `struct task_struct *kthread_run (int (*threadfn) (void *data), void *data, const char namefmt[], ...)` - like exec (runs immediately)
		2. `struct task_struct *kthread_create (int (*threadfn) (void *data ...)` - like fork (created in sleeping state) - to bind
		3. `void kthread_bind (struct task_struct *k, unsigned int cpu)` - binds to a CPU before running (then run wakeup)
			1. We can run one thread per CPU
		4. `int kthread_stop (struct task_struct *k);`
			1. Stops task
			2. `do { ... } while (!kthread_should_stop());`
		5. `int kthread_should_stop (void);`
13. Threaded interrupt handlers:
	1. API:
		1. `int request_threaded_irq (unsigned int irq, irq_handler_t handler_fn, irq_handler_t thread_fn, unsigned long flags, const ...)`
			1. Second handler: thread function - bottom half (threaded)
		2. Top half:
			1. `IRQ_WAKE_THREAD` - wakes the bottom half to be run
14. `linux kernel /vmlinuz-... ... threadirqs` - converts all interrupts to threaded irqs (another flag to make exceptions)
15. If first handler is null, no top half, only bottom half exists which is always a scheduled handler (scheduled when there is an interrupt which does not run in interrupt context)
16. Interrupt handlers in user space:
	1. Better security and stability
	2. Code base is smaller (we don't have to put it in drivers not used)
	3. Proprietary driver can be used (syscalls and library calls) - no licensing constraints (of kernel)
	4. Problem: No code review, may go out of sync with kernel
	5. Example: Printer drivers (done as filters on various ports)
	6. Problem: There was no good method to handler interrupts in user space:
		1. Solution: An API in Kernel - UIO (userspace I/O)
			1. Gives interrupt access to userspace
				1. Application can find out about them and take action
17. Multiple handlers: one handler and another specific handler
18. Producer consumer problem: top half produces and bottom half consumes but they may go out of sync because production is much faster than consumption
	1. Multiple methods