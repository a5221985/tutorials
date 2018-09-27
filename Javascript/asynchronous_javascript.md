# Asynchronous JavaScript #

## Introduction ##
### Welcome ###
1. Confusing part: Asynchronous programming
2. Goal: Beginner to expert in Async code
	1. Reading
	2. Writing
	3. Teaching
3. Watch all lectures
4. Concepts important for rest of the course
5. Code exercises are very important

### Agenda ###
1. Topics
	1. Basic but caveats
	2. Intro: How to setup (with right version of node)
		1. Visual studio code
		2. V8 vs Chrome vs Node - very important and re-visit
	3. What is Asynchronous?
		1. Why it exists
		2. Hardware level
	4. Asynchronous Patterns - different ways to write asynchronous code
		1. callbacks to generators
	5. Event loops - containers implementation of async functionality (node)
		1. Advanced topic

### How to get the course code? ###
1. [https://github.com/jawache/async-javascript-workshop](https://github.com/jawache/async-javascript-workshop)
	1. browser
	2. node
2. git clone https://github.com/jawache/async-javascript-workshop

### How to install node and which node to install? ###
1. [node.green](node.green):
	1. async iterators (10+)
		1. Select Current version
2. Use nvm to install multiple versions
	
		nvm install 10
		nvm use 10

### How to get setup with Visual Studio Code? ###
1. [code.visiualstudio.com](code.visiualstudio.com)
	1. Stable
2. Open folder
	1. Mini map on the right
3. Extension:
	1. Install extensions
		1. Node Exec - to execute little snippets of code
			1. Select code and press f8
	2. Live Server - starts local web server and points browser to it
	3. Prettier - Code formatter
		1. command + Shift + P
		2. \>Format Document
			1. formats atomatically
		3. Settings:
			1. User Settings:
				
					"editor.formatOnSave": true
					
	4. Terminal: control+back tick
4. Debugging JS code
	1. Open js file
	2. Drop a breakpoint
	3. Press play button (debugs automatically with node)
	4. Step into, step through

### Whats V8 vs Chrome vs Node? ###
1. V8: JS Engine
	1. Takes JS code and executes
	2. Interpreter
	3. Built into chrome
	4. Implemented by Node as well
	5. Written in C++
	6. Can be embedded into a C++ app
2. Clone V8 source code
	1. shell.cc
		1. App that embeds V8 engine
		2. Extends V8 engine with print command
		3. Calls print c++ code
	2. Shell
		1. V8
		2. Extension with custom commands
3. Clone Node source code
	1. C++ code
		1. node.cc
			1. Uses V8 engine
			2. Extends V8
				1. Read and write files
				2. Networking
				3. HTTP requests
	2. Node
		1. V8
		2. Extentions
4. Chrome
	1. Container with V8 and extended for browser (draw on screen)
5. Electron
	1. Container that runs V8 engine
	2. Used for desktop applications
	3. Extensions for desktop apps
	4. VS Code is based on Electron
	5. Atom is based on Electron
	6. Slack is based on Electron
6. V8 is synchronous
	1. Node, chrome, electron add the asynchronity
		1. They behave slightly differently with async code

## Understanding Asynchronous vs Synchronous ##
### Introduction ###
1. Blocking and non-blocking
2. Concepts relating to Hardware
	1. Implementation
3. Advantages and disadvantages of async and sync code

### What is Asynchronous? ###
1. Difference and asyn and sync
	1. Synchronous pseudocode

			contents = readFile("./thefile.txt");
			connection = openConnection("host", 8080);
			write(contents, connection);
			close(connection);
			
		1. Easy to understand (advantage) and develop
			1. Order of execution
	2. Asynchronous node code

			http.get({path: "..."}, response => {
				let body = "";
				response.on("data", part => {
					body += part;
				});
				response.on("end", () => {
					let parsed = JSON.parse(body);
				});
			});
			console.log("this gets printed first");
			
		1. Order of execution is hard to understand
		2. Advantages: performance
2. When to use sync and async code

### Blocking vs Non-Blocking ###
1. Blocking is Sync and Non-Blocking is Async
	1. Opposite is not true
2. Example for blocking code:

		contents = readFile("./thefile.txt");
		connection = openConnection("host", 8080); // blocked until readFile finishes
		write(contents, connection); // blocked until connection is established
		close(connection); // blocked until write finishes
		
3. Blocking is an idea we invented, to make writing software easier
	1. This is not how computer works
		1. CPU sends read instruction to Hard disk
		2. CPU then starts other thing
		3. Hard disk then loads data directly to the main memory
		4. Hard disk then sends hardware interrupt to CPU
		5. CPU then reads finishes it's task and reads data from memory
	2. Hardware is non-blocking and hardware is asynchronous
	3. Language is the one adding the synchronicity to code
4. Analogy
	1. 1 CPU cycle - 1s
	2. Level 1 cache access - 3s
	3. Level 2 cache access - 9s
	4. Level 3 cache access - 43s
	5. Main memory access - 6 min
	6. Solid-state disk I/O - 2-6 days
	7. Rotational disk I/O - 1-12 months
	8. Internet: SF to NYC - 4 years
	9. Internet: SF to UK - 8 years (blocks CPU for this time which could be used to do other things if the program is blocking)
	10. Internet: SF to Australia - 19 years
	11. OS virtualization reboot - 423 years
	12. SCSI command time-out - 3000 years
	13. Hardware virtualization reboot - 4000 years
	14. Physical system reboot - 32 millenia
5. Hardware is built to run at maximum capacity possible without getting blocked
	1. Don't have to wait for file to be read while the time can be used to do other things
6. What happens when we block?
	1. CPU does context switch and saves to disk and when required loads from disk
	2. CPU loads other program and CPU starts running other app

### Mult-Threaded Programming ###
1. What are threads?
	1. Multi-process programming
		1. Different processes are started on a computer
		2. Each process has an area in memory dedicated to read and write
			1. Security
	2. Thread
		1. Share the same memory
2. Problems with threads
	1. Hard to get right
		1. Race conditions
			1. Two threads sharing memory
				1. first thread wants to multipy by 2
				2. second thread wants to subtract 1
			2. If first thread runs first, the result is 5
			3. If second thread runs first, the result is 4
			4. Threads are competing with each other
			5. Solution: Locks (blocking)
				1. Thread 1 locks the memory
				2. Thread 1 finishes and releases the lock
				3. Thread 2 gets the lock and does the work
			6. Consequences of locks:
				1. Deadlocks
				2. Livelocks
				3. ...
	2. Threading helps in writing blocking/synchronous code
		1. Assume there are multiple treads in a program
		2. Assume each thread has synchronous code
		3. Thread context switch occurs (keeps the previous thread in memory)
		4. If all threads are blocked, process context switch occurs
		5. Advantages: Only thread context switching occurs and which is much faster than process context switching
	3. Disadvantages: Writing performant multi-threaded code is hard

### Event Driven Programming ###
1. Asynchronicity implemented using events
2. Node abstracts all I/O operations into events that are handled on an implicit eventloop
	1. Reading/writing file
	2. Communicating to procs across network
3. Node is single threaded (kind-of)
	1. Your JS code is single threaded (It gets only one thread to run)
	2. Node does use threads
		1. Used for lower level OS features which are themselves blocking
4. Example: `setTimeout(otherFunc, 3000)`
	1. It is not part of V8 engine
	2. Needs multiple threads
	3. Node sends a request to another thread to remind to call `otherFunc` in `3000` ms
	4. Other thread after `3000` ms calls the main thread saying now execute `otherFunc()` which reads and writes to local variables
		1. This is based on events
5. Node uses threads but there is only one main thread (this executes the code)
	1. It uses events to sync state (onto main thread)
6. Example:

		const fs = require("fs");
		
		fs.readFile("somefile.txt", (err, data) => {
			// Do stuff once file loaded
		}); // this doesn't get blocked but the arrow function gets executed after the file is read
		
		console.log("this gets called before file loaded");

7. Working principle:
	1. Event loop executes a tiny piece of js and then another piece...
	2. Queue holds the JS code that is waiting on something
	3. Node continues with other pieces of code
	4. When waiting JS is ready, an event is sent to the event loop and the JS is pulled for execution
8. Code doesn't block actually means there is always something that is running
9. Event based

```js
http.get({path: "..."}, response => {
	let body = "";
	response.on("data", part => {
		body += part;
	});
	response.on("end", () => {
		let parsed = JSON.parse(body);
	});
});
console.log("this gets printed first");
```
	1. first arrow function is put into the queue
	2. console.log is executed
	3. when response comes back (event), the body is executed
	4. Then two functions are registered: one on data arrival and another when data arrival ends
	5. When a part of data comes, the inner arrow function is executed
	6. When the end of data occurs, the second inner arrow function is executed
10. Node, chrome and other JS containers make it easy to write performant code
	1. No need to worry about threads
	2. No need to worry about thread synchronization
	3. Just need to tune ourselves to this style of coding
		1. Just mirror the patterns (implemented in node, chrome, ...)
10. Summary:
	1. Node/Chrome do use threads (internally)
	2. Our JS code runs in a single thread
	3. Asynchronicity is provided by events
	4. Managed by Event loop (node, chrome, firefox, ...)

## Asynchronous Patterns ##
### Introduction ###
1. Patterns:
	1. Callbacks
		1. Complex aspects as well
	2. Promises
	3. Async/Await (modern)
	4. Generators (gone out of fassion)
2. 

## Asynchronous Patterns - Callbacks ##
### Callbacks - Quiz #1 ###
### Callbacks - Handling Errors ###
### Callbacks - Quiz #2 ###
### Callbacks - Callback Hell ###
### Callbacks - Quiz #3 ###

## Asynchronous Patterns - Promises ##
### Promises - Basics ###
### Promises - Quiz #1 ###
### Promises - Chaining ###
### Promises - Quiz #3 ###
### Promises - Returning Promises ###
### Promises - Quiz #4 ###
### Promises - Error Handling ###
### Promises - Quiz #5 ###
### Promises - Finally ###
### Promises - All ###
### Promises - Race ###
### Promises - Quiz #6 ###
### Promises - Quiz #7 ###

## Asynchronous Patterns - Async/Await ##
### Async/Await - Basics ###
### Async/Await - Quiz #1 ###
### Async/Await - No Await ###
### Async/Await - Async Iterators ###
### Async/Await - Quiz #2 ###
### Async/Await - Warning ###

## Asynchronous Patterns - Generators ##
### Generators - Understanding Generators ###
### Generators - Using yield to communicate ###
### Generators - Async Generators ###
### Generators - Quiz #1 ###

## Event Loops ##
### Introduction ###
### Node Event Loop ###
### Node Event Loop Example ###
### Node Event Loop Live Demo ###
### Node Event Loop Quiz #1 ###
### Node Event Loop Quiz #2 ###
### Chrome Event Loop ###

## Summary ##
### Closing Words ###
### Feedback Form ###