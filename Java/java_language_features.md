# Java Language Feature #
## CompletableFuture in Java 8 ##
1. What are the uses of it?
	1. Possible **asynchronous (non-blocking)** computation and trigger **dependent** computations which could also be asynchronous
2. Thread model:
	1. Spawn a thread
	2. Main method and thread run independently in parallel and the thread gets destroyed
3. Callable: Used when thread returns a value
	1. Done using `ExecutorService`

			public static void main(String[] args) {
				ExecutorService service = Executors.newFixedThreadPool(10);

				// Submit tasks and accept the placeholder object for return value
				Future<Integer> future = service.submit(new Task());

				try {
					// get the task return value
					Integer result = future.get(); // blocking - until Task() gets completed
					System.out.println("Result from the task is " + result);
				} catch (InterruptedException | ExecutionException e) {
					e.printStackTrace();
				}
			}

			static class Task implements Callable<Integer> {
				@Override
				public Integer call() {
					return new Random().nextInt();
				}
			}

		1. Main thread gets blocked if result is not ready
			1. If multiple tasks exist, the main has to wait for each of the tasks to complete and return a result
				1. Other tasks may have completed but first result is not obtained so waits (though other results are available)
		2. Multiple tasks example:

				ExecutorService service = Executors.newFixedThreadPool(10);
		
				try {
					Future<Order> future = service.submit(getOrderTask());
					Order order = future.get(); // blocking

					Future<Order> future1 = service.submit(enrickTask(order));
					order = future1.get(); // blocking

					Future<Order> future2 = service.submit(performPaymentTask(order));
					order = future2.get(); // blocking

					Future<Order> future3 = service.submit(dispatchTask(order));
					order = future3.get(); // blocking

					Future<Order> future4 = service.submit(sendEmailTask(order));
					order = future4.get(); // blocking
					
				} catch (InterruptedException | ExecutionException e) {
					e.printStackTrace();
				}

4. `CompletableFuture` is designed to just declare the order of execution and come out and not wait until dependent tasks are done

		for (int i = 0; i < 100; i++) {
			CompletableFuture.supplyAsync(() -> getOrder())
				.thenApply(order -> enrich(order))
				.thenApply(order -> performPayment(order))
				.thenApply(order -> dispatch(order))
				.thenAccept(order -> sendEmail(order));
		}

	1. `supplyAsync` - defines asynchronous task
	2. `thenApply` - if previous task is completed, then apply this (same thread does this as the previous operation)
		1. `thenApplyAsync` - a different thread takes up this (works good if we specify our own thread pool, the dependency is taken care of)
			1. Our own thread pool

					ExecutorService cpuBound = Executors.newFixedThreadPool(4);
					ExecutorService ioBound = Executors.newCachedThreadPool(); // number of threads need not be specified

					CompletableFuture.supplyAsync(() -> getOrder(), ioBound)
						.thenApplyAsync(order -> enrich(order), cpuBound)
						.thenApplyAsync(order -> performPayment(order), ioBount)
						.thenApplyAsync(order -> dispatch(order), cpuBound)
						.thenAccept(order -> sendEmail(order));
					
	3. `thenAccept` - if previous task is completed, then apply this
	4. If we don't use our own pool then it uses **ForkJoinPool.commonPool()** pool
	5. Exceptions:

			CompletableFuture.supplyAsync(() -> ...)
				...
				.exceptionally(e -> new FailedOrder())
				.thenApplyAsync(order -> dispatch(order)) // process either good order or failed order
				.thenAccept(order -> sendEmail(order)); // send email for valid order or for failed order

		1. `dispatch` should handle failed orders as well
	6. `combine` - to combine different completable futures
	7. Not good for large business logic
		1. Alternative is Reactive programming

## Java 8 Streams API ##
1. Example:

		int[] numbers  = {4, 1, 3, 13, 90, 16, 2, 0};

		int min = numbers[0];
		for (int i = 1; i < numbers.length; i++) {
			if (min < numbers[i]) {
				min = numbers[i];
			}
		}
		System.out.println("Minimum is " + min);

	1. With Streams:

			IntStream.of(numbers).min();

		1. To extract the minimum values and return it do the following:

				int min = IntStream.of(numbers)
								.min()
								.getAsInt();

			1. `getAsInt()` - Throws error if minimum value cannot be found (array is empty say)
				1. To handle this:

						IntStream.of(numbers)
							.min()
							.ifPresent(min -> System.out.println(min));