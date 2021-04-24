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