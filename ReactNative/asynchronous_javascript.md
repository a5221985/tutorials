## Asynchronous Patterns ##
### Introduction ###
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

## Asynchronous Patterns - Callbacks ##
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
		
### Promises - Returning Promises ###
### Promises - Error Handling ###
### Promises - Finally ###
### Promises - All ###
### Promises - Race ###

## Asynchronous Patterns - Async/Await ##
### Async/Await - Basics ###
### Async/Await - No Await ###
### Async/Await - Async Iterators ###
### Async/Await - Warning ###

## Asynchronous Patterns - Generators ##
### Generators - Understanding Generators ###
### Generators - Using yield to communicate ###
### Generators - Async Generators ###

## Event Loops ##
### Introduction ###
### Node Event Loop ###
### Node Event Loop Example ###
### Node Event Loop Live Demo ###
### Chrome Event Loop ###

## Summary ##
### Closing Words ###
### Feedback Form ###