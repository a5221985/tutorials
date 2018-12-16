# Redux Saga #
## Introduction ##
### Beginner Turorial ###
#### Objectives of this tutorial ####
1. Introuction to redux-saga
2. Example: trivial counter demo

#### The initial setup ####
1. Clone [tutorial repository](https://github.com/redux-saga/redux-saga-beginner-tutorial)
2. Run the following:

		cd redux-saga-beginner-tutorial
		npm install
		
3. To start app run

		npm start
		
4. Setup:
	1. Two buttons
		1. One to increment
		2. One to decrement
	2. Output: Message
	
			Counter: 0
			
#### Hello Sagas! ####
1. Hello world version of Sagas
	1. sagas.js
	
			export function* helloSaga() {
				console.log('Hello Sagas!')
			}
			
		1. prints greeting on console
		
2. How to run it?
	1. Construct saga middleware with list of Sagas to run
	2. Connect Saga middleware to Redux store
3. main.js

		// ...
		import { createStore, applyMiddleware } from 'redux'
		import createSagaMiddleware from 'redux-saga'
		
		// ...
		import { helloSaga } from './sagas'
		
		const sagaMiddleware = createSagaMiddleware()
		
		const store = createStore(
			reducer,
			applyMiddleware(sagaMiddleware)
		)
		
		sagaMiddleware.run(helloSaga)
		
		const action = type => store.dispatch({type})
		
		// rest unchanged

#### Making Asynchronous calls ####
#### Making our code testable ####


### Saga Background ###