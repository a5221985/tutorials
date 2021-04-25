# How to Prioritize RTOS Tasks #
1. Pre-emption - required for priorities to work
	1. Running task might be interrupted at any time
		1. An interrupt might occur at any time and CPU might treat it as a higher priority task
		2. Another higher priority task might need to run
2. Two variations to pre-emption
	1. Time slice
	2. Priority based
		1. Focus is on this
3. Each task is assigned a relative priority
	1. Unique static integer (0 or 1 based)
4. Scheduling algorithm
	1. If task with highest priority gets CPU as long as 
		1. It is ready to run
		2. It doesn't need to anything except the CPU
	2. Commercial RTOSs: Pre-emptive, priority based schedulers
		1. Each task is assigned a fixed priority
5. What is RTOS?
	1. Real-time?
		1. If some calculations or decisions have deadlines that must be met
			1. Late answer is the wrong answer
6. Real-Time:
	1. Having timeliness requirements (in the form of deadlines typically)
	2. Hard real-time - must meet deadlines (all of them)
		1. Industrial control, medical devices (pacemaker, respirator, ...)
	3. Soft real-time - it is okay to miss deadlines once in a while
		1. TV set-top box drops frames once in a while
7. Static priority assignment
8. Transient overload - a brief period of time during which processor is overcommitted
	1. If 20 ms work to do but 10 ms left
		1. Someone needs to miss deadline
	2. RMA - Rate Monotonic Algorithm
		1. A mathematical technique to select relative priorities of tasks
		2. It is used with fixed-priority pre-emptive scheduling (i.e. RTOS)
		3. Properties:
			1. Critical set of tasks guaranteed to meet all deadlines
			2. Performance degrades gracefully
				1. During transient overloads
					1. Lowest priority task will yield the CPU, if not enough, next lowest priority task will yield the CPU
		4. Example:
			1. Task1 period = 50 ms
				1. Deadline = 50 ms
			2. Task2 period = 100 ms
				1. Deadline = 100 ms
			3. Each task consumes CPU cycles when it runs
				1. Number of CPU cycles might change each run (because the task might take a different path of execution)
					1. Best case CPU cycles
					2. Worst case CPU cycles
						1. If this is longer than period, it may miss deadlines sometimes (no algorithm can avoid deadline misses for this task)
					3. Average case CPU cycles
			4. Each task has computable worst case cost
				1. Task 1 cost = 25 ms
					1. Period = 50 ms
				2. Task 2 cost = 40 ms
					1. Period = 100 ms
			5. How to select relative priority?
				1. Option A: Task 1 > Task 2
					1. Task 1 runs first
						1. Runs for 25 ms and meets the deadline
					2. Task 2 runs next
						1. Runs for 25 ms
					3. Task 1 runs next
						1. Runs for 25 ms
					4. Task 2 runs next
						1. Runs for 15 ms (meets the deadline of 100 ms)
					5. 10 ms of idle time
					6. Sequence repeats
						1. Both meet their deadlines everytime
				2. Option B: Task 2 > Task 1
					1. Task 2 runs first
						1. Runs for 40 ms and meets the deadline of 100 ms
					2. Task 1 runs next
						1. Runs for 25 ms (misses the deadline of 50 ms)
					3. Task 2 runs next (at 100 ms)
						1. The cycle repeats
9. Rate Monotonic Algorithm
	1. A priority assignment algorithm for use with a real-time operating system that uses fixed-priority pre-emptive scheduling.
	2. The optimal fixed-priority scheduling algorithm
		1. Liu & Layland Journal of the ACM 1973
	3. How does it work?
		1. Assign task priorities according to relative period
			1. Highest frequency task (with shortest period) is highest priority
			2. ...
			3. Lowest frequency task (with longest period) is lowest priority
		2. Rationale?
			1. Less frequent tasks may span high frequency deadlines
				1. Task 2 (with period 100 ms) consumed 40 of 50 ms!
	4. Example:
		1. Task, Period, Priority
			1. R, 10 ms, 3
			2. T, 30 ms, 4
			3. G, 1 ms, 1
			4. A, 3 ms, 2
			5. C, 1 ms, 1
			6. L, 40 ms, 5
		2. Lower the number, higher the priority
	5. Aperiodics
		1. Aperiodic tasks: Recur (or don't) at random times (like some interrupts)
		2. Sporadic tasks: Recur at random intervals, but with a minimum inter-arrival
			1. Like sequence of human key presses (chars cannot come faster than baud rate)
		3. Two options:
			1. Poll hardware rather than using interrupts
				1. Works even for true periodics
					1. Guaranteed worst-case response time equal to polling period (polling time can be changed to get faster response time)
			2. Worst-Case period
				1. Assign a period equal to its worst-case inter-arrival time
					1. Assuming UART character arrivals at baud rate 24/7 (fastest possible - worst case)
				2. Assign a priority based on that period
				3. We don't waste CPU cycles polling for true aperiodics
					1. We do perform RMA as if they were periodic
						1. Assuming aperiodics are periodic with minimum interval time
				4. Example: 3 tasks and 1 interrupt (highest priority task regardless of frequency or RMA priority)
					1. ISR may not be the most frequent task (even under worst case)
						1. ISR effectively adds a "blocking time" (to worst case execution times of all tasks)
							1. It should be below in RMA priority
				5. Example: ISR priority vs task priority
					1. Entity, RMA priority, Cost, Period, Ui
						1. ISR, 2, .500, 10, 5% (but CPU treats it as priority 1)
						2. A, 1, .750, 3, 25%
						3. T, 3, .300, 30, 1%
						4. L, 4, 8.00, 40, 20%
					2. If we make ISR period as 2.9, then RMA priority becomes 1 (which matches reality - CPU priority)
10. Take away
	1. Don't use "most important" to assign priority
		1. Unless there is only one task with a deadline
		2. Failure to adhere to RMA fully limits predictability
	2. Both tasks & ISRs must be assigned priorities using RMA
	3. Remember that even lowest priority interrupt is treated by CPU as higher priority than highest priority task