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
2. Node is used (all of the above patterns are present)
	1. Async functionality
		1. setInterval(...) - executes a function once after every time interval
		2. setTimeout(...) - calls only once
		3. setImmediate(...) - node specific
		4. process.nextTick(...) - node specific
		5. readFile(...) - node specific

## Asynchronous Patterns - Callbacks ##
1. To code in JS engines
2. Methods:
	1. Callbacks
		1. Complex aspects of callbacks
	2. Promises
		1. Newer
	3. Async/Await
		1. Brand new
	4. Generators
		1. A little old
3. Node:
	1. `setInterval(...)` - executed frequently after specified interval
	2. `setTimeout(...)` - executed once
	3. `setImmediate(...)` - node
	4. `process.nextTick(...)` - node
	5. `readFile(...)` - node
4. `setImmediate()`

		setImmediate(() => {
			console.log("Async Task Calling Callback");
			cb();
		});
		
		setImmediate(cb);
		
		process.nextTick(() => {
			console.log("Async Task Calling Callback");
			cb();
		});

### Callbacks - Quiz #1 ###
1. Github repo
	1. node
		1. callbacks.quizz.md
			1. Try it before

### Callbacks - Handling Errors ###
1. Example:

		const fs = require('fs')

		readFile("./demofile.txt", { encoding: "utf8" }, (err, data) => {
		  if (err) {
			// next(err) // can pass up the chain
			// console.error(err); // can log and continue
			// return
			throw err; // can error and exit
		  } else {
			console.log(data);
		  }
		});
		
	1. `err` is first parameter - consensus on this for node
	2. `next(err)` - calls caller of this function (another callback at upper level)

### Callbacks - Callback Hell ###
1. Problems with callbacks
	1. If a callback needs to be called after the first one finishes, we need to nest it
	
			doAsyncTask( _ => {
				doAsyncTask( _ => { ... } )
			})
			
		1. Sequential tasks must be nested deep
			1. Different levels can be interpreted with a lot of difficulty
2. Promises fixes this issue
3. `try-catch` does not work with asynchronous code
	1. works only with synchronous blocking code
		1. Cannot use it with callbacks

## Asynchronous Patterns - Promises ##
### Promises - Basics ###
1. Alternative mechanism to resolve issues with callbacks
	1. Added as core part of the language in ES6
2. Syntax:

		const promise = new Promise((resolve, reject) => {
			// resolve? reject? main async processing
		});
		
	1. Example:
	
			const promise = new Promise((resolve, reject) => {
				setTimeout(() => {
					console.log('Async Work Complete');
					resolve();
				}, 1000);
			});
			
			function doAsyncTask() {
				let error = false;
				const promise = new Promise((resolve, reject) => {
					setTimeout(() => {
						console.log('Async Work Complete');
						if (error) {
							reject();
						} else {
							resolve();
						}
					}, 1000);
				});
				return promise;
			}
			
			doAsyncTask().then(() => console.log('Task Complete!')); // resolve is passed
			
			doAsyncTask().then(val => console.log(val), err => console.error(err));
			
3. Promisify:

		const util = require('util');
		
		util.promisify(fs.readFile); // turns it into promise

### Promises - Chaining ###
1. Immediately resolve promise

		let promise = Promise.resolve("done");
		
		promise.then(val => console.log(val => console.log(val)); // still gets executed even after resolution

2. Immediately reject promise

		let promise = Promise.reject("reject");

3. Promises are allways asynchronous

		function doAsyncTask() {
			return Promise.resolve();
		}
		
		doAsyncTask().then(_ => console.log(message));
		
		let message = "Promise Resolved";

4. Chaining:

		const prom = Promise.resolve('done');
		prom
			.then(val => {
				console.log(val);
				return "done2";
			})
			.then(val => console.log(val));

### Promises - Quiz #1 ###
### Promises - Chaining ###
1. Immediate resolution or rejection

		let promise = Promise.resolve("done"); // parameter is any resolve function

		let promise = Promise.reject("fail"); // parameter is any reject function

	1. Useful when a function returns a promise but we already know that the promise is going to be rejected
	2. If `then` is called after the fact that it is resolved, it works

			promise.then(val => console.log(val)); // 'done'

	3. Example:

			function doAsyncTask() {
				return Promise.resolve();
			}

			doAsyncTask().then(_ => console.log(message));

			let message = "Promise Resolved";

2. We can attach `then` handlers in a chain

		const prom = Promise.resolve("done");
		prom
			.then(val => {
				console.log(val);
				return "done2"; // We have to return something, or else it does not get passed to next then
			})
			.then(val => console.log(val));

		const prom = Promise.resolve("done");

		prom.then(val => {
			console.log();
			return "done2";
		});

		prom.then(val => console.log(val)); // doesn't get passed the result of previous then - forking and not chaining

2. Callbacks can be synchronous or asynchronous but promises are always synchronous

### Promises - Quiz #3 ###
1. Chain reading file and then zipping and then displaying it on screen

		const fs = require('fs');
		const zlib = require('zlib');

		function gzip(data) {
			return new Promise((resolve, reject) => {
				zlib.gzip(data, (err, result) => {
					if (err) reject(err);
					resolve(result);
				});
			});
		}

		function readFile(filename, encoding) {
			return new Promise((resolve, reject) => {
				fs.readFile(filename, encoding, (err, data) => {
					if (err) reject(err);
					resolve(data);
				});
			});
		}

		readFile("./files/demofile.txt", "utf-8")
			.then(data => gzip(data))
			.then(zippedData => console.log(zippedData));

### Promises - Returning Promises ###

		Promise.resolve("done")
			.then(val => {
				console.log(val);

				return new Promise(resolve => {
					setTimeout(() => resolve("done2"), 1000);
				});
			})
			.then(val => console.log(val));

### Promises - Quiz #4 ###

		readFile("./files/demofile.txt", "utf-8")
			.then(
				data => {
					return gzip(data);
				},
				err => console.error("Failed to Read", err);
			)
			.then(
				data => {
					return console.log(data);
				},
				err => console.error("Failed to Gzip", err);
			)

### Promises - Error Handling ###
1. Errors are propagated down the chain
2. Example:

		Promise.reject("fail")
			.then(val => console.log(val)) // no error handler
			.then(val => cossole.log(val), err => console.error(err));

	1. Second error handler catches it
3. If we throw inside a promise body, it gets caught in the catch

		new Promise((resolve, reject) => {
			throw "fail";
		})
			.then(val => {
				console.log(val);
			})
			.then(val => console.log(val), err => console.error(err)); // catch all error handler

4. Catching

		Promise.resolve("done")
			.then(val => {
				throw "fail";
			})
			.then(val => vonsole.log(val))
			.catch(err => console.error(err));

		Promise.reject("fail")
			.then(val => console.log(val))
			.catch(err => console.error(err));

### Promises - Quiz #5 ###

		readFile("./files/demofile.txt", "utf-8")
			.then(data => gzip(data))
			.then(zippedData => console.log(zippedData))
			.catch(err => console.error(err));

### Promises - Finally ###
1. `finally` gets called irrespective of whether promise is resolved or error occurs (useful for cleaning up resources)

		Promise.resolve("done")
			.then(val => {
				throw new Error("fail");
			})
			.then(val => console.log(val))
			.catch(err => console.error(err))
			.finally(_ => console.log("Cleaning Up")); // coming soon in official node

### Promises - All ###
1. `Promise.all` - performance wise useful
2. Finally is supported in certain other browsers
	1. Current version of node does not have

			const util = require('util');
			const fs = require('fs');
			const readFile = util.promisify(fs.readFile);

			const files = ['./files/demofile.txt', './files/demofile.other.txt'];

			let promises = files.map(name => readFile(name, 'utf-8'));
			Promise.all(promises).then(values => {
				console.log(values); // array
			});

		1. `.all` waits until all promises (series of promises) are resolved before calling it's own `then` handler
		2. If a few promises do not resolve, then `catch` handler will catch the first promise that was rejected

### Promises - Race ###
1. It is just an API
2. `Promise.race`: Resolves or rejects when the first promise in the array resolved or rejects
3. Example:

		let car1 = new Promise(resolve => setTimeout(resolve, 1000, "Car 1"));
		let car2 = new Promise(resolve => setTimeout(resolve, 2000, "Car 2"));
		let car3 = new Promise(resolve => setTimeout(resolve, 3000, "Car 3"));

		Promise.race([car1, car2, car3]).then(value => {
			console.log("Promise Resolved", value);
		});

4. Example: Reject

		let car1 = new Promise((_, reject) => setTimeout(reject, 1000, "Car 1 Crashed."));
		let car2 = new Promise(resolve => setTimeout(resolve, 2000, "Car 2."));
		let car3 = new Promise(resolve => setTimeout(resolve, 3000, "Car 3."));

		Promise.race([car1, car2, car3])
			.then(values => {
				console.log("Promise Resolved", values);
			})
			.catch(errs => {
				console.log("Promise Rejected", errs);
			});

### Promises - Quiz #6 ###

		function readFileFake(sleep) {
			return new Promise(resolve => setTimeout(resolve, sleep, "read"));
		}

		function timeout(sleep) {
			return new Promise((_, reject) => setTimeout(reject, 1000, "Timeout"));
		}

		let file = readFileFake(5000);
		let timeout = timeout(1000);

		Promise.race([timeout, file])
			.then(data => {
				console.log(data);
			})
			.catch(err => {
				console.err(err);
			}); 

### Promises - Quiz #7 ###

		function authenticate() {
			console.log("Authenticating");
			return new Promise(resolve => setTimeout(resolve, 2000, { status: 200 }));
		}

		function publish() {
			console.log("Publishing");
			return new Promise(resolve => setTimeout(resolve, 2000, { status: 403 }));
		}

		function timeout() {
			return new Promise((resolve, reject) => setTimeout(reject, sleep, "timeout"));
		}

		Promise.race([publish(), timeout(3000)])
			.then(...)
			.then(...)
			.catch(...);

## Asynchronous Patterns - Async/Await ##
### Async/Await - Basics ###
1. Came in 2017
2. What is it? When do we want to use it?
3. Async

		const doAsyncTask = () => Promise.resolve("done");
		async function asim() {
			// mark it as `async`
			let value = await doAsyncTask(); // Don't need to call .then
			console.log(value);
		}
		asim();

4. Immediately invoked function

		const doAsyncTask = () => Promise.resolve("done");
		(async function() {
			// IIFE, note the async
			let value = await doAsyncTask(); // this is blocking call
			console.log(value); // waits for previous line to complete
			console.log("2"); // this waits before it's printed
		})();

5. To make it behave as before

		const doAsyncTask = () => Promise.resolve("1");
		(async function() {
			doAsyncTask().then(console.log); // gets called after next statement
			console.log("2");
		})();

6. Within async function we can have blocking semantics 
	1. With promises, there is no blocking

			const doAsyncTask = () => Promise.resolve("1");
			(async function() {
				doAsyncTask().then(console.log);
				console.log("2");
			})();

7. `async` keyword returns a `Promise`

		const doAsyncTask() = () => Promise.resolve("1");
		let asyncFunction = async function() {
			let value = await doAsyncTask();
			console.log(value);
			console.log("2");
			return "3"; // whatever we return is like a resolve
		}
		asyncFunction().then(v => console.log(v)); // we can attach a then to it

8. Within `async` function we have synchronous code so we can use `try`, `catch` block

		const doAsyncTask = () => Promise.reject("error");
		const asyncFunction = async function() {
			try {
				const value = await doAsyncTask();
			} catch(e) {
				console.error(e);
				return;
			}	
		};
		asyncFunction();

### Async/Await - Quiz #1 ###


### Async/Await - No Await ###
1. `async` alone does not turn the body of the function asynchronous
	1. Need other async functions
2. It is useful only for `await`

### Async/Await - Async Iterators ###
1. This feature is still experimental phases, it hasn't been fully rolled out to all browsers and it's only available in node at least 9.1 behind a flag. It's a subtle difference, but now you can interate over iterators that return promises, like so.
	1. Node 10
	2. Node 9: `node --harmony-asyn-iteration working.js`
2. Example:

		(async () => {
			const util = require("util");
			const fs = require("fs");
			const readFile = util.promisify(fs.readFile);

			const files = ["./files/demofile.txt", "./files/demofile.other.txt"];
			const promises = files.map(name => readFile(name, "utf8"));
			for await (let file of promises) { // waits for each promise to resolve before moving on to the block of code
				// see the await is on the for
				console.log(file);
			}
		})();

	1. How custom iterator can be defined:
		1. We can loop over a pre-built array of promises with `for-await-of`
		2. Array is an iterator, which just means that it's an object that has a property with name `Symbol.iterator` that points to an object with a `next()` function that returns an object with `{ done: false, value: ?}` for each value. When you want the iterator to complete just return `done: true` instead

				const customIterator = () => ({
					[Symbol.iterator]: () => ({
						x: 0,
						next() {
							if (this.x > 100) {
								return {
									done: true,
									value: this.x
								};
							}
							return {
								done: false,
								value: this.x++
							};
						}
					})
				}); // what is wrapped within {...} is returned as an object

				for (let x of customIterator()) {
					console.log(x);
				}

	2. How custom async iterator can be defined:

			const customAsyncIterator = () => ({
				[Symbol.asyncIterator]: () => ({
					x: 0,
					next() {
						let y = this.x++; // should be done at this time and not later

						if (this.x > 100) {
							return Promise.resolve({ // can be any async task and need not be resolved
								done: true,
								value: this.x
							});
						}

						return Promise.resolve({
							done: false,
							value; y
						});
					}
				})
			});

			(async() => {
				for await (let x of customAsyncIterator()) {
					console.log(x);
				}
			})();

### Async/Await - Quiz #2 ###
1. Custom async iterator
		
		const util = require('util');
		const fs = require('fs');
		const readFile = util.promisify(fs.readFile);

		const fileIterator = files => ({
			[Symbol.asyncIterator]: () => ({
				x: 0,
				next() {
					if (this.x > (files.length - 1)) {
						return Promise.resolve({
							done: true
						});
					}

					let file = files[this.x++];
					return readFile(file, "utf-8").then(data => ({
						done: false,
						value: data
					}));
				}
			})
		});

		(async () => {
			for await (let x of fileIterator([
				"./files/demofile.txt",
				"./files/demofile.other.txt"
			])) {
				console.log(x);
			}
		})();

### Async/Await - Warning ###
1. Converts asynchronous code into synchronous code
	1. waiting or blocking for io
	2. Async function as a block is asynchronous but the contents of it are synchronous
		1. Write small blocks of synchronous code and use a lot of async functions
	3. Need to think deeply and use is carefully

## Asynchronous Patterns - Generators ##
### Generators - Understanding Generators ###
1. Run to completion vs run stop run
	1. We have assumed something fundamental, once a function starts running it will complete/error/return before any other JS code can run.
	2. A _generator_ is a function that can be paused in the middle of running, let you do something else, and then resumed later on from exactly the point it was paused.
	3. Nothing can pause a generator from the outside, only a generator can pause itself by using the `yield` keyword.
	4. Once it's yielded though only the code it yielded to can resume it's function.
2. Example:

		function* demo() {
			console.log("1");
			yield;
			console.log("2");
		}

		console.log("start");
		console.log("before iteration");
		it = demo(); // doesn't execute demo but just returns an iterator
		console.log(it.next());	// executes upto next yield and returns { value: undefined, done: false }
		console.log(it.next()); // executes upto end of function and returns { value: undefined, done: true }
		console.log(it.next()); // returns { value: undefined, done: true }
		console.log("after iteration");

### Generators - Using yield to communicate ###
1. How to pass data out of generator?
2. Example:

		function* range() {
			for (let i = 0; i < 4; i++) {
				yield i; // we can return data from yield
			}
			yield "moo";
			return "foo";
		}

		const it = range();
		console.log(it.next()); // { value: 0, done: false }
		console.log(it.next()); // { value: 1, done: false }
		console.log(it.next()); // { value: 2, done; false }
		console.log(it.next()); // { value: 3, done; false }
		console.log(it.next()); // { value: "moo", done: false }
		console.log(it.next()); // { value: "foo", done: true }
		console.log(it.next()); // { value: undefined, done: true }

3. Example:

		function* range() {
			for (let i = 0; i < 10; i++) {
				yield i;
			}
		}

		for (let x of range()) {
			console.log(x); // Just prints the value
		}

4. Yield can be used to communicate both ways

		function* sayWhat() {
			console.log(yield);
			console.log("World");
		}
		const it = sayWhat();
		it.next(); // First yield, pauses
		it.next("Hello"); // Can pass in data again

### Generators - Async Generators ###
1. Custom async generators
2. We can combine `generators` and `for-await-of` into new interesting constructs like so:

		function* range() {
			for (let i = 0; i < 10; i++) {
				yield Promise.resolve(i);
			}
		}

		(async () => {
			for await (let x of range()) {
				console.log(x); // This just prints out the promise
			}
		})();

### Generators - Quiz #1 ###

		const util = require("util");
		const fs = require("fs");
		const readFile = util.promisify(fs.readFile);

		function* fileLoader(files) {
			for (let file of files)
				yield readFile(file, "utf-8");
		}

		(async () => {
			for await (let contents of fileLoader([
				"./files/demofile.txt",
				"./files/demofile.other.txt"
			])) {
				console.log(contents);
			}
		})();

## Event Loops ##
### Introduction ###
1. Understand how different containers work?
	1. node
	2. chrome
2. They implement event loops (slightly differently)

### Node Event Loop ###
1. Talk of Bert Belder - Node co-author
	1. If there is nothing asynchronous, node would execute the sequence of instructions and exit
	2. If any asynchronous operation exists (snippet code)
		1. Event loop
			1. Takes little snippets which are queued
			2. I/O is different for different OSs (Node abstracts away this)
			3. `setImmediate`: gets added to queue
			4. `close`: code on close event
			5. If there are multiple snippets that need to run on timeout, then all are popped off (there is a maximum number)
				1. All items in the queue are popped off for a given type
			6. Order of loop:
				1. `setInterval`, `setTimeout`
				2. I/O
				3. `setImmediate`
				4. `close`
2. Macro and micro tasks
	1. Macro tasks: callbacks
	2. Micro tasks: `process.nextTick` (callback), `Promises` (then handlers)
3. Each queue has certain micro tasks and certain macro tasks
	1. We go through all macrotasks and then go through all micro tasks
	2. If new macro task comes along, the event loop moves on to the next type of task (I/O say)
4. Node exits if there are no pending events (no code snippets to execute)

### Node Event Loop Example ###
1. Example:

		console.log("script start");

		const internal = setInterval(() => console.log("setInterval"), 0);
		
		setTimeout(() => {
			console.log("setTimeout 1");
			Promise.resolve()
				.then(() => console.log("promise 3"))
				.then(() => console.log("promise 4"))
				.then(() => {
					setTimeout(() => {
						console.log("setTimeout 2");
						Promise.resolve()
							.then(() => console.log("promise 5"))
							.then(() => console.log("promise 6"))
							.then(() => clearInterval(interval));
					}, 0)
				});
		}, 0);

		Promise.resolve()
			.then(() => console.log("promise 1"))
			.then(() => console.log("promise 2"));

2. Output

		script start
		promise 1
		promise 2
		setInterval
		setTimeout 1
		promise 3
		promise 4
		setInterval
		setTimeout 2
		promise 5
		promise 6

### Node Event Loop Live Demo ###
1. `debugger` - statement where execution pauses

### Node Event Loop Quiz #1 ###
1. Write a program which prints out the below. If a log line mentions `setInterval` it must be printed inside a `setInterval` ...
	1. start
	2. end
	3. setInterval 1
	4. promise 1
	5. promise 2
2. Code

		console.log("start");
		const interval = setInterval(() => {
			setTimeout(() => {
				console.log("promise 1");
				console.log("promise 2");
			}, 0);
			console.log("setInterval 1");
			clearInterval(interval);
		}, 0);
		console.log("end");

		console.log("start");
		const interval = setInterval(() => {
			console.log("setInterval 1");
			Promise.resolve()
				.then(() => console.log("promise 1"))
				.then(() => console.log("promise 2"));
			clearInterval(interval);
		}, 0);
		console.log("end");

### Node Event Loop Quiz #2 ###
1. Print the following

		start
		end
		setInterval 1
		promise 1
		promise 2
		processNextTick 1
		setImmediate 1
		promise 3
		promise 4

2. Example:

		console.log("start");
		const interval = setInterval(() => {
			setTimeout(() => {
				console.log("promise 1");
				console.log("promise 2");
				setImmediate(() => {
					console.log("setImmediate 1");
					Promise.resolve()
					.then(() => console.log("promise 3"))
					.then(() => console.log("promise 4"));
				}); // This is a macrotask
				process.nextTick(() => console.log("processNextTick 1")); // but this is microtask which will get added to the existing list
			}, 0);
			console.log("setInterval 1");
			clearInterval(interval);
		}, 0);
		console.log("end");

### Chrome Event Loop ###
1. Similar to node event loop
	1. tasks Q
	2. Microtasks Q
	3. Render Q
		1. Rendering things on page

				while(true) {
					task = eventLoop.nextTask();
					if (task) {
						task.execute();
					}
					eventLoop.executeMicrotasks();
					if (eventLoop.needsRendering())
						eventLoop.render();
				}

			1. Executes only ony macrotask
			2. Executes all microtasks
			3. It may or may not render (this is slower than other tasks)
		2. raf: Request animation frame (like setTimeout or setImmediate)
			1. It is saying add a callback to the render step
				1. raf > style > layouts > pixel
					1. Computes style
					2. Computes layout
					3. Figures out pixel
2. setTimeout vs rAF

		var raf_counter = 0;
		var st_counter = 0;

		function render() {
			document.getElementById("raf_counter").textContent = raf_counter;
			document.getElementById("st_counter").textContent = st_counter;
		}

		function log() {
			console.log(`st ${st_counter} raf ${raf_counter}`);
		}

		function raf_loop() {
			raf_counter++;
			log();
			render();
			requestAnimationFrame(raf_loop); // browser based
		}

		function st_loop() {
			st_counter++;
			log();
			render();
			setTimeout(st_loop, 0);
		}

		function main() {
			st_loop();
			raf_loop();
		}

## Summary ##
### Closing Words ###
1. V8 is a JS engine
2. Node and Chrome are extension of JS engine
	1. Edge is using chakra engine
	2. Node chakra is available
3. Event based asynchronicity

### Feedback Form ###
1. [https://docs.google.com/forms/d/e/1FAIpQLSfuMlkLsyc2tjByEaXs1a87cVYBGEGd-d1XTVxxCRoVVEiNMw/viewform](https://docs.google.com/forms/d/e/1FAIpQLSfuMlkLsyc2tjByEaXs1a87cVYBGEGd-d1XTVxxCRoVVEiNMw/viewform)