# Java 8: Replace Traditional for Loops with IntStreams #
1. `IntStream` replaces `for (int i = 0; ...)`
2. Examples:
	1. `IntStream` is stream containing primitives of type `int`

			IntStream.of(1, 2, 3, 4).forEach(System.out::println);
			
			IntStream.range(1, 10).forEach(System.out::println); // excludes 10
			
			IntStream.rangeClosed(1, 10).forEach(System.out::println); // includes 10
			
			IntStream.iterate(0, i -> i + 2).forEach(System.out::println); // infinite series
			
			IntStream.iterate(0, i -> i + 2).limit(20).forEach(System.out::println);
			
			IntStream.generate(() -> ThreadLocalRandom.current().nextInt()).limit(5).forEach(System.out::println);