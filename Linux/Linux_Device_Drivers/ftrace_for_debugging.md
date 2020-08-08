# FTrace - For Debugging #
1. What is Ftrace?
	1. Stands for function tracer: internal tracer of kernel useful to find out what is going on in the Linux kernel
	2. What can be traced?
		1. Function calls
		2. Latencies
		3. Other events
		4. Produce call graphs
2. Options:
	1. CONFIG_FTRACE=y
	2. CONFIG_HAVE_DYNAMIC_FTRACE=y
	3. CONFIG_HAVE_FUNCTION_TRACER=y
	4. CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
	5. CONFIG_STACKTRACE=y
3. Once the options are enabled, Ftrace appears in DebugFS (uses)
	1. DebugFS is pseudo-filesystem and exposes additional debugging info for developers
	2. Mounted at `/sys/kernel/debug`
		1. `mount -t debugfs nodev /sys/kernel/debug`
			1. Run this if not already mounted
4. `whoami`
	1. `root`
5. `ls /sys/kernel/debug/tracing/`
	1. `trace`
	2. `trace_pipe`
	3. `tracing_on`
6. Available tracers:
	1. `available_tracers`
		1. holds different types of tracers that have been compiled into kernel. Tracers listed here can be configured by echoing their name into current_tracer

				cat /sys/kernel/debug/tracing/available_tracers
				> nop function function_graph
				
				- nop: "trace nothing" tracer. Stop all tracers
				- function: Function call tracer to trace all kernel functions. Probe at entry
					1. If function is executed
					2. Who is calling
				- function_graph:
					1. Provides the ability to draw a graph of function calls. Probes entry and exit
						1. call graphs with timing info

	2. `available_events`:
		1. Holds different types of events that have been registered by drivers (predefinded tracepoints) - exported by driver, exported by subsystem itself

				cat /sys/kernel/debug/tracing/available_events
				> hda:hda_send_cmd # hard drive
				> hda:hda_get_response
				...
				> sched:sched_kthread_stop # scheduler
				> sched:sched_kthread_stop_ret
				> sched:sched_wakeup
				> sched:sched_wakeup_new
				> sched:sched_switch
				...
				
	3. `current_tracer`:
		1. Used to set or display current tracer that is configured - easy to setup and use even on embedded systems

				cat /sys/kernel/debug/tracing/current_tracer
				nop
				
				echo function > /sys/kernel/debug/tracing/current_tracer
				cat /sys/kernel/debug/tracing/current_tracer
				function
				
	4. `trace`:
		1. file holds output of trace (helps us read from ftrace ring buffer)

				cat /sys/kernel/debug/tracing/trace
				...
				
	5. `trace_pipe`:
		1. Same as trace, but streamed and consumes buffer (used in scripting)

				cat /sys/kernel/debug/tracing/trace_pipe
				...
				
			1. ring buffer is cyclic - overwrites values once it wraps around
	6. `tracing_on`:
		1. File is used to enable/ disable writing to trace buffer - used to limit the amount of tracing done, limit scope of tracing timewise

				echo 1 > /sys/kernel/debug/tracing/tracing_on ; sleep 1 ; \
				echo 0 > /sys/kernel/debug/tracing/tracing_on
		
	7. `tracing_enabled`: deprecated way of enabling/ disabling ftrace
	8. `cd /sys/kernel/debug/tracing`

			# stop trace, reset tracer, clear buffer
			echo 0 > tracing_on
			echo nop > current_tracer
			echo -1 > trace
			
			# setup tracer to function"
			echo function > current_tracer
			
			# execute trace for 1 second (sleep 1 can be application or code under test)
			echo 1 > tracing_on && sleep 1 && echo 0 > tracing_on
			
	9. `cat trace`

			# tracer: function
			#
			#	TASK-PID	CPU#	TIMESTAMP	FUNCTION
			#		| |		 |			|	
				bash-4251	[01]	10152.583854: path_put <-path_walk
				bash-4251 [01]	10152.583855: dput <-path_put
				bash-4251	[01]	10152.583855: _atomic_dec_and_lock <-dput
			
			TASK		= name of application (or kernel thread name)
			PID			= PID of application
			CPU#		= CPU running this task
			TIMESTAMP	= timestamp (since bootup)
			FUNCTION	= function being called an parent (caller)
			
7. Summary:
	1. Ftrace is a versatile function tracer
	2. Commandline interface is accessible in debugfs (using cat, echo ...)
	3. Available anywhere if enabled in kernel (on embedded hw as well)
	4. More tracers and events available
	5. Tools make operation easier (trace-cmd and kernelshark)
	6. To be covered in further webinars
	7. Documentation/trace/ftrace.txt (in linux kernel)
	8. `http://lwn.net/Articles/365835/`
			