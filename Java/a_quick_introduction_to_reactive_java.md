# A Quick Introduction to Reactive Java: from Reactive Programming to RxJava in Action #
## Introduction ##
1. [RxJava](https://github.com/ReactiveX/RxJava)
	1. Library
	2. To write asynchronous, concurrent, resilient applications
	3. Used to write programs in [reactive programming](https://en.wikipedia.org/wiki/Reactive_programming) paradigm

## A Real World Example ##
1. ATM:
	1. User wants to withdraw cash
		1. Debit card is inserted into the machine
		2. Pin is entered
		3. Amount is entered
		4. Done is hit
	2. Possible outcomes:
		1. ATM has requested amount: cash is dispensed, successful message is displayed
		2. ATM does not have requested amount: transaction failure message is displayed
2. Source: ATM
3. Consumer: User

## What is Reactive Programming ##
1. A style of programming where we define the following:
	1. Source of data
	2. Consumer of data
	3. Connection between consumer and source
2. RxJava: Implementation to support reactive programming paradigm

## RxJava in Action ##
1. Example:

		// defining the source
		Observable<Integer> source = Observable.range(1, 5);

		// defining the consumer
		Subscriber<Integer> consumer = new Subscriber<Integer>() {
			@Override
			public void onNext(Integer number) { System.out.println(number); }
			
			@Override
			public void onError(Throwable e) { System.out.println("error"); }
			
			@Override
			public void onCompleted() { System.out.println("completed"); }
		}

		// connecting the consumer to source
		source.subscribe(consumer);

## Source of Data ##
1. Source: ATM with transaction details
	1. `Observable<T>` represents source
		1. [factory methods](https://github.com/ReactiveX/RxJava/wiki/Creating-Observables) - used for defining source
			1. `Observable.range(int start, int count)` - one factory method
				1. it will emit numbers starting from `start` through `count` and finish

## Consumer of Data ##
1. `Subscriber<T>` represents consumer
	1. `onNext(T data)` - used by RxJava to push data emitted by source
	2. `onComplete()` - used by RxJava to signal the completion of emission of data
	3. `onError(Throwable e)` - used by RxJava to forward error during the emission of data

## Connecting Consumer to Source ##
1. `subscribe(Subscriber s)` - Establishes link between source and consumer
	1. Lazy computations: Computations defined as part of Subscriber and Observable are executed only after the connection is established
		1. Source will start emitting numbers only after establishing the connection
		2. ATM machine starts processing only when Done is pressed
2. Concise version:

		Observable.range(1, 5).subscribe(
			number -> System.out.println(number),
			error -> System.out.println(error),
			() -> System.out.println("completed")
		);