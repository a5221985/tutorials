# Java 8: Replace Traditional for Loops with IntStreams #
1. `IntStream` replaces `for (int i = 0; ...)`
2. Examples:
	1. `IntStream` is stream containing primitives of type `int`

			IntStream.of(1, 2, 3, 4).forEach(System.out::println);
			
			IntStream.range(1, 10).forEach(System.out::println); // excludes 10
			
			IntStream.rangeClosed(1, 10).forEach(System.out::println); // includes 10
			
			IntStream.iterate(0, i -> i + 2).forEach(System.out::println); // infinite series
			
			IntStream.iterate(0, i -> i + 2).limit(20).forEach(System.out::println);
			
			IntStream.generate(() -> ThreadLocalRandom.current().nextInt()).limit(5).forEach(System.out::println); // does not calculate ints based on previous values but simply takes `IntSupplier` that independently calculates next int
			
			IntStream.rangeClosed(1, 5)
						.map(i -> i * i)
						.forEach(System.out::println);
						
			IntStream.rangeClosed(1, 5)
						.filter(i -> i % 2 == 0)
						.forEach(System.out::println);
						
	2. Normal stream:

			Stream<Integer> boxed = IntStream.rangeClosed(1, 10)
						.boxed(); // Stream of Integers and not IntStream
						
			Stream<Color> stream = IntStream.range(1, 5).mapToObj(i -> getColor(i));
						
	3. Map to Object

			Stream<String> stringStream = IntStream.rangeClosed(1, 10)
						.mapToObj(i -> "" + i); // Stream of Strings and not IntStream
						
	4. `DoubleStream`:

			DoubleStream stream = IntStream.range(1, 5).mapToDouble(i -> i);
			LongStream stream = IntStream.range(1, 5).mapToLong(i -> i);
			
	5. `anyMatch` - at least one that matches the criterion

			IntStream.range(1, 5).anyMatch(i -> i % 2 == 0);
			
	6. `noneMatch`, `allMatch`

			IntStream.range(1, 5).allMatch(i -> i % 2 == 0);
			
			IntStream.range(1, 5).noneMatch(i -> i % 2 == 0);
			
	7. Max and Min value

			IntStream.range(1, 5).max().getAsInt();
			
			IntStream.range(1, 5).min().getAsInt();
			
		1. The methods that return only one element return `OptionalInt`
			1. Gives higher order functions that abstract away null checks
				1. `Optional` - Container object that may or may not contain a non-null value
					1. It has higher order functions removing the concern to add repeating `if null/notNull` checks
					2. Example:

							Article article = getFirstJavaArticle();
							if (article == null) {
								article = fetchLatestArticle();
							}
							
							getFirstJavaArticle()
								.orElseGet(this.fetchLatestArticle); // says what we need to execute if no value is found
								
							playGround.getFirstJavaArticle()
								.map(Article::getTitle); // map is applied only if value exists