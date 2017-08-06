# Promises #
## Motivation ##
1. Consider a synchronous JS function: Reads file and parses it as JSON.
	1. It is simple and easy to read
	2. It is blocking (not usable in most apps) - nothing else can happen while reading from disk
	3. Function:

			function readJSONSync(filename) {
				return JSON.parse(fs.readFileSync(filename, 'utf8'));
			}

2. Solution: Make app performant and responsive by making the I/O operations, asynchronous
	1. Implemntation: use callback

			function readJSON(filename, callback) {
				fs.readFile(filename, 'utf-8', function (err, res) {
					if (err) return callback(err);
					callback(null, JSON.parse(res));
				});
			}

		1. Problems with the solution:
			1. Extra `callback` parameter confuses between input and return value
			2. Doesn't work with control flow primitives (?)
			3. Doesn't handle errors thrown by `JSON.parse`
				1. We must not handle the errors thrown by `callback` (calling function should handle?)
			1. Solution: Code becomes a mess of error handling

					function readJSON(filename, callback) {
						fs.readFile(filename, 'utf8', function (err, res) {
							if (err) return callback(err);
							try {
								res = JSON.parse(res);
							} catch (ex) {
								return callback(ex);
							}

							callback(null, res);
						});
					}

					readJSON('/tmp/abc.json', function (err, res) {
						if (err !== null) {
							// handle the error
						}
						// extract data from res
					});

				1. Problem: Extra callback parameter
					1. Solution: Promise
						1. Naturally handles errors
						2. Helps write cleaner code by not handling `callback` parameters
						3. Does not modify underlying architecture

## What is a promise? ##
1. Promise represents result of an asynchronous operation
2. Promise is in one of three different states:
	1. pending - Initial state of promise
	2. fulfilled - represents successful operation
	3. rejected - represents failed operation
3. Promise is immutable once it is fulfilled or rejected (can never change the state again)

## Constructing a promise ##
1. Polyfilling existing APIs

		function readFile(filename, enc) {
			return new Promise(function (fulfill, reject) {
				fs.readFile(filename, enc, function (err, res) {
					if (err) reject(err);
					else fulfill(res);
				});
			});
		}

	1. Constructor is given a factory function which does the actual work.
		1. Factory function is called immediately with two arguments
			1. First argument fulfills the promise
			2. Second argument rejects the promise
		2. After operation completes, appropriate function is called

## Awaiting a promise ##
1. To use a promise, we have to wait for it to be fulfilled or rejected.
2. `promise.done` - waits until promise is fulfilled or rejected
3. Implementation of `readJSON`:

		function readJSON(filename) {
			return new Promise(function (fulfill, reject) {
				readFile(filename, 'utf8').done(function (res) {
					try {
						fulfill(JSON.parse(res));
					} catch (ex) {
						reject(ex);
					}
				}, reject);
			});
		}

	1. Still lot of error handling code but less error prone to write

## Transformation / Chaining ##
1. Promise needs to be transformed via another operation
2. Second operation is synchronous (could be aynchronous as well)
3. Promises (except in jQuery) have standardised method for tranforming promises and chaining operations.
4. `.then` is to `.done` as `.map` is to `.forEach`
	1. `.then` is used when we want to do something with the result (even waiting for it to finish)
	2. `.done` is used when not going to do anything with the result
5. Re-writing the original example:

		function readJSON(filename) {
			return readFile(filename, 'utf8').then(function (res) {
				return JSON.parse(res);
			})
		}

	1. Which can be re-written as

			function readJSON(filename) {
				return readFile(filename, 'utf8').then(JSON.parse);
			}

		1. Similar to synchronous example

## Implementations / Polyfills ##
### jQuery ###
1. Promise in jQuery is different.
2. Converting jQuery promise to standardised promise:

		var jQueryPromise = $.ajax('/data.json');
		var realPromise = Promise.resolve(jQueryPromise);
		// use realPromise from here

### Browser ###
1. Browsers that support promise [Kangax compatibility tables](http://kangax.github.io/es5-compat-table/es6/#Promise)
2. We can polyfill for other browsers:

		<script src="https://www.promisejs.org/polyfills/promise-7.0.4.min.js"></script>

	1. No browser at this time supports `Promise.prototype.done`
		1. We need to include atleast the following polyfill if not the above:

				<script src="https://www.promisejs.org/polyfills/promise-done-7.0.4.min.js"></script>

### Node.js ###
1. Not a good practice to polyfill things in node.js.
2. Include the library where required:

		npm install --save promise

	1. Load it into local variable using `reauire`

			var promise = require('promise');

3. The library has extensions for node.js

		var readFile = Promise.denodeify(require('fs').readFile);
		// now `readFile` will return a promise rather than
		// expecting a callback

		function readJSON(filename, callback) {
			// If a callback is provided, call it with error as the
			// first argument and result as the second argument,
			// then return `undefined`. If no callback is provided,
			// just return the promise
			return readFile(filename, 'utf8')
				.then(JSON.parse)
				.nodeify(callback);
		}


# JavaScript Promise API #
1. Async code is better for performance and flexibility
2. We can trigger multiple requests at once and handle them when each is ready
3. New APIs are being implemented using promise philosophy

## Promises in the Wild ##
1. XMLHttpRequest is async but does not use Promises API.
2. Few Native APIs that use promises
	1. Battery API
	2. fetch API (XHR's replacement)
	3. ServiceWorker API (post coming soon!)
3. Promise is core langauge feature
4. Testing promises using async task like `setTimeout`

## Basic Promise Usage ##
1. `new Promise()` constructor
	1. Must be used only for legacy async tasks
		1. `setTimeout`
		2. `XMLHttpRequest`
2. `new` is used for creation of promise
3. `resolve`, `reject`: functions provided by promise for provided callback

		var p = new Promise(function(resolve, reject) {
			// Do an async task and then ...
			if (/* good condition */) {
				resolve('Success!');
			} else {
				reject('Failure!');
			}
		});

		p.then(function () {
			/* do something with the result */
		}).catch(function () {
			/* error */
		});

4. Developer must manually call `resolve` or `reject` within body of the callback based on the result of given task.
5. Example: Converting `XMLHttpRequest` to a promise based task

		// From Jake Archibald's Promises and Back:
		// http://www.html5rocks.com/en/tutorials/es6/promises/#toc-promisifying-xmlhttprequest
		
		function get(url) {
			// Return a new promise.
			return new Promise(function (resolve, reject) {
				// Do the usual XHR stuff
				var req = new XMLHttpRequest();
				req.open('GET', url);

				req.onload = function () {
					// This is called even on 404 etc
					// so check the status
					if (req.status == 200) {
						// Resolve the promise with the response text
						resolve(req.response);
					} else {
						// Otherwise reject with the status text
						// which will hopefully be a meaningful error
						reject(Error(req.statusText));
					}
				};

				// Handle network errors
				req.onerror = function () {
					reject(Error("Network Error"));
				};

				// Make the request
				req.send();
			});
		}

		// Use it!
		get('story.json').then(function (response) {
			console.log("Success!", response);
		}, function (error) {
			console.error("Failed!", error);
		});

## then ##
## catch ##
## `Promise.all` ##
## `Promise.race` ##
## Get Used to Promises ##

# JavaScript Promises ... In Wicked Detail #
## Link ##
1. [http://www.mattgreer.org/articles/promises-in-wicked-detail/](http://www.mattgreer.org/articles/promises-in-wicked-detail/)

## Why? ##
1. Why understand promises to the level of detail?
	1. To take advantage of it
	2. Debug it more successfully when things go wrong

## The Simplext Use Case ##
1. Simple example:

		function doSomething(callback) {
			var value = 42;
			callback(value);
		}

		doSomething(function (value) {
			console.log('Got a value: ' + value);
		});

2. Transforming the simple example:

		doSomething().then(function (value) {
			console.log('Got a value: ' + value);
		});

		function doSomething() {
			return {
				then: function (callback) {
					var value = 42;
					callback(value);
				}
			}
		}

### Defining the Promise type ###
1. Actual `Promise` type

		function Promise(fn) {
			var callback = null;

			this.then = function (cb) {
				callback = cb;
			};

			function resolve(value) {
				callback(value);
			}

			fn(resolve);
		}

	1. Re-implementation of `doSomething()`

			function doSomething() {
				return new Promise(function (resolve) {
					var value = 42;
					resolve(value);
				});
			}

		1. Problem: `resolve()` gets called before `then()`
			1. `callback` is `null` at this point
2. Hack using `setTimeout`

		function Promise(fn) {
			var callback = null;

			this.then = function (fn) {
				callback = fn;
			}

			function resolve(value) {
				// force callback to be called in the next
				// iteration of the event toop, giving
				// callback a chance to be set by then()
				setTimeout(function () {
					callback(value);
				});
			}

			fn(resolve);
		}

### This Code is Brittle and Bad ###

## Promises have State ##

## Chaining Promises ##
### The Callback is Optional ###
### Returning Promises Inside the Chain ###

## Rejecting Promises ##
### Unexpected Errors Should Also Lead to Rejection ###
### Promises Can Swallow Errors! ###
### `done()` to the Rescue ###
### Recovering from Rejection ###

## Promise Resolution Needs to be Async ##
### Why is this Async Requirement in the Spec? ###

## Before We Wrap Up ... `then/promise` ##

## Conclusion ##

## Further Reading ##

# Promises/A+ Specification #
## An open standard for sound, interoperable JavaScript promises - by implementers, for implementers ##
1. Promise: Represents eventual result of an asynchronous operation.
2. `then`: primary way to interact with promise
	1. It registers callbacks to receive either a promise's eventual value or reason why promise cannot be fulfilled
3. The spec details behavior of `then`

## Terminology ##
1. "promise" - It is an object or function with a `then` method whose behavior confirms to this spec
2. "thenable" - is object or function that defines `then` method
3. "value" - legal JS value (including `undefined`, thenable, promise)
4. "exception" - value that is thrown using `throw` statement
5. "reason" - value that indicates why a promise was rejected

## Requirements ##
### Promise States ###
1. A promise must be in one of three states
	1. pending
	2. fulfilled
	3. rejected
2. When pending,
	1. promise may transition to either fulfilled or rejected state
3. When fulfilled
	1. promise must not transition to any other state
	2. must have a value, which must not change (immutable identity (===) but not deep immutability)
4. When rejected
	1. promise must not transition to any other state
	2. must have a reason, which must not change (immutable identity (===) but not deep immutability)

### The `then` Method ###
1. `then` - method to access current or eventual value or reason
2. Accepts two arguments:

		promise.then(onFulfilled, onRejected)

	1. Both `onFulfilled` and `onRejected` are optional
	2. If `onFulfilled` is not a function, it must be ignored
	3. If `onRejected` is not a function, it must be ignored
	4. If `onFulfilled` is a function
		1. It must be called after `promise` is fulfilled, with `promise`'s value as its first argument
		2. It must not be called before `promise` is fulfilled
		3. It must not be called more than once
	5. If `onRejected` is a function
		1. It must be called after `promise` is rejected, with `promise`'s reason as its first argument
		2. It must not be called before `promise` is rejected
		3. It must not be called more than once
	6. `onFulfilled` or `onRejected` must not be called until execution context stack contains only platform code
	7. `onFulfilled` and `onRejected` must be called as functions (with no `this` value)
	8. `then` may be called multiple times on same promise
		1. If/when `promise` is fulfilled, all respective `onFulfilled` callbacks must execute in the order of their originating calls to `then`
		2. If/when `promise` is rejected, all respective `onRejected` callbacks must execute in the order of their originating calls to `then`
	9. `then` must returns a promise
			1. `promise2 = promise1.then(onFulfilled, onRejected);`
				1. If either `onFulfilled` or `onRejected` returns a value `x`, run the Promise Resolution Procedure `[[Resolve]](promise2, x)`
				2. If either `onFulfilled` or `onRejected` throws an exception `e`, `promise2` must be rejected with `e` as the reason
				3. If `onFulfilled` is not a function and `promise1` is fulfilled, `promise2` must be fulfilled with the same value as `promise1`
				4. If `onRejected` is not a function and `promise1` is rejected, `promise2` must be rejected with the same reason as `promise1`

### The Promise Resolution Procedure ###
1. It is an abstract operation taking as input a promise and a value (denoted as `[[Resolve]](promise, x)`)
	1. If `x` is thenable, it attempts to make `promise` adopt the state of `x` under the assumption that `x` behaves at least somewhat like a promise. Otherwise, it fulfills `promise` with the value `x`
2. The above treatment of thenables allows promise implementations to interoperate as long as they expose Promise/A+-compliant `then` method.
	1. Allows Promise/A+ implementations to "assimilate" nonconfirmant implementations with reasonable `then` methods
3. Steps to perform to run `[[Resolve]](promise, x)`
	1. If `promise` and `x` refer to the same object, reject `promise` with `TypeError` as the reason
	2. If `x` is a promise, adopt its state
		1. If `x` is pending, `promise` must remain pending until `x` is fulfilled or rejected
		2. If/when `x` is fulfilled, fulfill `promise` with the same value
		3. If/when `x` is rejected, reject `promise` with the same value
	3. Otherwise, if `x` is an object or function
		1. Let `then` be `x.then`
		2. If retrieving the property `x.then` results in a thrown exception `e`, reject `promise` with `e` as the reason

## Notes ##
