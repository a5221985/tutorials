# Generator Functions and Redux Saga #
## Generator functions ##
1. Generators are functions which can be exited and later re-entered. Their context (variable bindings) will be saved across re-entrances.
2. Generators are cooperative, which means that it chooses when it will allow an interruption so that it can cooperate with the rest of your program
	1. It doesn't stop other code from running
	2. It can be re-initiated when ready
3. Syntax:
	1. Declared using special * keyword right after the word function
	
			function* foo() {
				let x = yield 'Please give me a value for x'
				let y = yield 'Please give me a value for y'
				let z = yield 'Please give me a value for z'
				return (x + y + z);
			}
			
		1. `yield`: To pause the function and give out a value
			1. It can also take in a value when we restart the function
		2. `*yield`: To delegate to another outside generator function
			1. Completes and returns to original function
4. How to run function*
	1. First invoke function and store it in a variable (function returns an object which can be iterated)
	2. Invocation of function returns an iterable object back to us
	3. We can call `next` on this object to take us to the first yield point in the function
	4. This call (to yield) gives us back an object with the properties of value and done
	5. We can continue iterating through this until we are done or stop at any point
5. Example:

		function* foo() {
			let x = yield 'Please give me a value for x'
			console.log(x)
			
			let y = yield 'Please give me a value for y'
			console.log(y)
			
			let z = yield 'Please give me a value for z'
			console.log(z)
			
			return (x + y + z)
		}
		
		let generatingFoo = foo()
		// returns an iterable object stored in gererating Foo
		
		generatingFoo.next()
		// { value: 'Please give me a value for x', done: false }
		
		generatingFoo.next(8) // stores the result you pass in into x
		// { value: 'Please give me a value for y', done: false }
		
		generatingFoo.next(17) // stores the result you pass in into y
		// { value: 'Please give me a value for z', done: false }
		
		generatingFoo.next(25) // stores the result you pass in into z
		// { value: 50, done: true }
		
6. Better Use Cases:
	1. Async functions which call next when the async function is done
	
			function request(url) {
				makeAjaxCall(url, function (response) {
					it.next( response );
				});
			}
			
			function* main() {
				var result1 = yield request("http://some.url.1");
				var data = JSON.parse(result1);
				
				var result2 = yield request("http://some.url.2?id=" + data.id);
				var resp = JSON.parse(result2);
				
				console.log("The value you asked for: " + resp.value);
			}
			
			var it = main();
			it.next(); // get it all started
			
		1. Yields to the `request(...)` function
		2. Response is returned by calling `next`
	2. Redux Saga

## Redux Saga ##
1. An alternative to Redux Thunk (better arguably)
2. Redux Saga: It is a library that aims to make handling side effects (i.e. asynchronous things like data fetching) in React/Redux applications easier & better
	1. It is like separate thread for side effects
	2. It can handle redux actions and dispatch actions
3. Generators are used to make async code look more synchronous making it easier to read, write & test
4. Boilerplate Setup:

		import { createStore, applyMiddleware } from 'redux'
		import createSagaMiddleware from 'redux-saga'
		import reducer from './reducers'
		import rootSaga from './sagas'
		
		// create the saga middleware
		const sagaMiddleware = createSagaMiddleware()
		
		// mount it on the Store
		const store = createStore(
			reducer,
			applyMiddleware(sagaMiddleware)
		)
		
		// then run the saga
		sagaMiddleware.run(rootSaga)
		
5. Two categories of Saga (Convention):
	1. Watchers & Workers
		1. The main saga file is split into two different classes of sagas: workers & watchers
			1. Watcher saga's see every action dispatched to redux store, if it matches the action they are told to handle, they assign it to their worker saga
6. Example:

		//Watcher Saga
		export function* watchGetProducts() {
			yield takeEvery(actions.GET_ALL_PRODUCTS, getAllProducts)
		}
		
		//Worker Saga
		export function* getAllProducts() {
			const products = yield call(api.getProducts)
			yield put(actions.receiveProducts(products))
		}
		
7. Example:

		//Watcher Saga
		export function* watchCheckout() {
			while(true) {
				yield take(actions.CHECKOUT_REQUEST)
				yield call(checkout)
			}
		}
		
		//Worker Saga
		export function checkout() {
			try {
				const cart = yield select(getCart)
				yield call(api.buyProducts, cart)
				yield put(actions.checkoutSuccess(cart))
			} catch (error) {
				yield put(actions.checkoutFailure(error))
			}
		}
		
8. Saga Helpers:
	1. `takeEvery`: takes every matching action and runs the instructed saga, can run concurrent tasks
	
			function* watchAction() {
				yield takeEvery('ACTION', workerSagaToRun)
			}
			
	2. `takeLatest`: takes every matching action and runs the instructed saga but cancels any previous saga task if it is still running
	
			function* watchLastAction() {
				yield takeLatest('ACTION', workerSagaToRun)
			}
			
9. Effect Creation
	1. Each Effect creation returns a plain JavaScript object and does not perform any execution
	2. Execution is performed by middleware during iteration process
	3. Middleware examines each Effect description and performs appropriate action
	4. Functions:
		1. `call`: Runs a function, if it returns a promise, pauses the saga until the promise is resolved
		2. `put`: dispatches an action
		
				function* effects() {
					let result = yield call(fnToRun, optionalArgsToPassToFn)
					yield put(actionToDispatch(result))
				}
				
			1. Others: fork, select, race, spawn, join, cancel
			2. result: Actual result returned
10. Advantages:
	1. Synchronous looking code with an easy to follow step by step process (hides away the asynchronicity)
	2. Can allow for fairly complicated flows
		1. call and store in variable
		2. put to dispatch
	3. Easy to write tests with little to no mocking
	4. Sagas are composable
		1. `yield*`: delegation to another saga
	5. Action-Creation are pure
	6. Isolates side-effect code to single area of the application
	7. Many helper functions & solid documentation
11. Testing:
	1. Effect creation return JS objects
		1. In unit test, each value yielded can be tested with equality comparison
			1. Thunk requires complex mocking of fetch api or other functions
	2. Example:
	
			// Application
			import { call } from 'redux-saga/effects'
			
			function* fetchProducts() {
				const products = yield call(Api.fetch, '/products')
				// ...
			}
			
			// Test
			import { call } from 'redux-saga/effects'
			import Api from '...'
			
			const iterator = fetchProducts()
			
			// expects a call instruction
			assert.deepEqual(
				iterator.next().value,
				call(Api.fetch, '/products'), // matching value
				"fetchProducts should yield an Effect call(Api.fetch,
				'./products')"
			)
			
12. Resources:
	1. https://redux-saga.github.io/redux-saga/
	2. https://davidwalsh.name/async-generators
	3. https://medium.com/@sprocompany/why-you-should-use-redux-saga-b64f6fce5e4a#.dy2j4636k
	4. https://www.youtube.com/watch?v=9UZla3ulo3A