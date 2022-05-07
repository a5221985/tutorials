# Practical Java Concurrency with the Akka Actor Model #
## Introduction ##
### Introduction ###
### Course Files ###
[Course Files](https://www.udemy.com/course/practical-java-concurrency-with-the-akka-actor-model/learn/lecture/18214792#content)

### How to get support for this course ###
1. Memory Exercise

## Why do we need Akka? ##
### An introduction to our first multi-threading example ###
1. Why concurrent programming is hard
	1. Requirements:
		1. Construct a sorted set of 20 probable prime big integers
			1. `BigInteger.nextProbablePrime()`
	2. Java 11 is recommended (LTS)
2. Example:

		public class SingleThreadedBigPrimes {
			public static void main(String[] args) {
				BigInteger bigInteger = new BigInteger(2000, new Random()); // rangle [0, 2^(2000 - 1)], a random number
				// BigInteger bigInteger = new BigInteger(4000, new Random()); // rangle [0, 2^(2000 - 1)], a random number - adjust for 2 seconds
				System.out.println("The integer is " + bigInteger);
				System.out.println("The next probable prime is " + bigInteger.nextProbablePrime());
			}
		}

		public class SingleThreadedBigPrimes {
			public static void main(String[] args) {
				Long start = System.currentTimeMillis();
			
				SortedSet<BigInteger> primes = new TreeSet<>();
				
				while (primes.size() < 10) {
					BigInteger bigInteger = new BigInteger(2000, new Random()); // rangle [0, 2^(2000 - 1)], a random number
					primes.add(bigInteger.nextProbablePrime());
				}
				
				// BigInteger bigInteger = new BigInteger(4000, new Random()); // rangle [0, 2^(2000 - 1)], a random number - adjust for 2 seconds
				System.out.println("The integer is " + bigInteger);
				System.out.println("The next probable prime is " + bigInteger.nextProbablePrime());
				
				Long end = System.currentTimeMillis();
				System.out.println(primes);
				System.out.println("The time taken was " + (end - start) + " ms.");
			} // took about 30 seconds
		}
		
	1. Open and view CPU usage in Task Manager
		1. It never reaches the top (because only one thread is used)
			1. Processing power is not fully used

### Basic concurrent programming in core Java ###
1. Example: New class

		public class PrimeGenerator implements Runnable {
		
			private Results results;
			
			public PrimeGenerator(Results results) {
				this.results = results;
			}
		
			@Override
			public void run() {
				BigInteger bigInteger = new BigInteger(2000, new Random()); // rangle [0, 2^(2000 - 1)], a random number
				// System.out.println(bigInteger.nextProbablePrime());
				results.getPrimes().add(bigInteger.nextProbablePrime());
			}
		}
		
		public class MultiThreadedBigPrimes {
			public static void main(String[] args) throws InterruptedException {
				Long start = System.currentTimeMillis();
			
				Results results = new Results();
				Runnable task = new PrimeGenerator();
				
				List<Thread> threads = new ArrayList<>();
				
				for (int i = 0; i < 20; i++) {
					Thread t = new Thread(task);
					threads.add(t);
					t.start();
				}
				
				for (Thread t : threads) {
					t.join();
				}
				
				System.out.println(results.getPrimes());
				
				Long end = System.currentTimeMillis();
				System.out.println("Time taken: " + (end - start) + " ms.");
			}
		}
		
		public class Results {
			private SortedSet<BigInteger> primes;
			
			public Results() {
				primes = new TreeSet<>();
			}
			
			public SortedSet<BigInteger> getPrimes() {
				return primes;
			}
		}

### Why concurrent programming in Java is difficult ###
1. Dealing with InterruptedException
	1. Another example: `Thread.sleep(...)`
	2. In production system, we cannot ignore it
2. Passing results to different threads which is not thread safe
	1. Status task
	
			public class CurrentStatus implements Runnable {
				private Results results;
				
				public CurrentStatus(Results results) {
					this.results = results;
				}
				
				@Override
				public void run() {
					while (results.getPrimes().size() < 20) {
						System.out.println("Got " + results.getPrimes().size() + " so far...");
						results.getPrimes().forEach(System.out::println);
						try {
							Thread.sleep(1000);
						} catch (InterruptedException e) {
							
						}
					}
				}	
			}

## The Actor Model ##
### The concepts of the actor design pattern ###
### What is an actor? ###
### Why does this model work? ###

## Constructing our first actor ##
### Setting up an Akka project ###
### Constructing our first actor - constructors ###
### Constructing our first actor - defining behaviors ###
### Instantiating actors and sending messages ###

## Going further with actors ##
### Expanding the receiveBuilder ###
### Constructing child actors ###
### Actor paths ###
### Starting the big prime example ###
### Exercise 1 - constructing actors ###
### Exercise 1 - walkthrough ###

## Going further with messages ##
### Constructing a custom message type ###
### Applying the custom message type to a behavior ###
### Using interfaces to support multiple message types ###
### Understanding message delivery guarantees ###

## Case Study 1 - Simulation example ##
### Introducing the case study ###
### Architecting the solution ###
### Implementing the case study ###
### Scheduling and timers ###

## Going further with behaviors ##
### Behaviors can change over time ###
### Exercise 2 - Changing behaviors ###
### Exercise 2 - walkthrough ###

## Actor lifecycles ##
### Actors stopping themselves ###
### Stopping child actors ###
### Actor lifecycle methods ###

## Logging ##
### Logging messages from actors ###
### Configuring log level output ###

## Case Study 2 - Blockchain mining example ##
### A simple introduction to blockchains ###
### Introducing the case study ###

## Unit Testing ##
### Constructing a message handler that needs testing ###
### Unit testing with log messages ###
### Unit testing with response messages ###

## Akka interaction patterns ##
### The tell and forget and the request-response pattern ###
### The ask pattern ###
### Getting data out of akka ###

## Actor Supervision ##
### Introduction to multi-threaded blockchain mining ###
### Preparing our project to be ready for supervision ###
### Watching actors (supervision) ###
### Dealing with actors that crash ###
### Shutting down all the child actors ###

## Production standard techniques ##
### Ensuring immutable state ###
### Actors sending messages to themselves ###
### Stashing messages ###
### Using routers for simultaneous actor operations ###

## Next steps ##
### Other features of Akka that might be of interest ###
### Bonus lecture ###