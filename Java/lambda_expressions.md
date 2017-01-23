# Lambda Expressions #
1. New Project in Eclipse
2. Passing block of code to methods
	1. Pass code to button
	2. Pass code to thread
3. Code

		interface Executable {
			void execute();
		}

		class Runner {
			public void run(Executable e) {
				System.out.println("Executing code block ...");
				e.execute();
			}
		}

		public class App {
			Runner runner = new Runner();
			runner.run(new Executable () {
				public void execute() {
					System.out.println("Hello there.");
				}
			});
		}

4. Lambda Expressions

		runner.run(() -> System.out.println("Hello there."));

5. Multiple lines of code

		runner.run(() -> {
			System.out.println("This is a code passed in a lambda expression");
			System.out.println("Hello there.");
		});

6. Interfaces:
	1. Comparable
	2. Runnable

7. Return value

		interface Executable {
			int execute();
		}

		class Runner {
			public void run(Executable e) {
				System.out.println("Executing code block ...");
				int value = e.execute();
				System.out.println("Return value is: " + value);
			}
		}

		public class App {
			public static void main(String[] args) {
				Runner runner = new Runner();
				runner.run(new Executable () {
					public void execute() {
						System.out.println("Hello there.");
						return 7;
					}
				});

				System.out.println("=============================");
	
				runner.run(() -> {
					System.out.println("This is code passed in a lambda expression.");
					System.out.println("Hello there.");
					return 8;
				});
			}
		}

8. Valid single statement

		runner.run(() -> 8);

9. Parameters

		interface Executable {
			int execute(int a);
		}

		class Runner {
			public void run(Executable e) {
				System.out.println("Executing code block ...");
				int value = e.execute(12);
				System.out.println("Return value is: " + value);
			}
		}

		public class App {
			public static void main(String[] args) {
				Runner runner = new Runner();
				runner.run(new Executable () {
					public void execute(int a) {
						System.out.println("Hello there.");
						return 7 + a;
					}
				});

				System.out.println("=============================");

				runner.run((int a ) -> {
					System.out.println("Hello there.");
					return 7 + a;
				});
			}
		}

10. Type of parameter can be ignored

		runner.run(a -> 7 + a);

11. Ambiguous methods

		interface StringExecutable {
			int execute(String a);
		}

		class Runner {
			public void run(Executable e) {
				System.out.println("Executing code block ...");
				int value = e.execute(12);
				System.out.println("Return value is: " + value);
			}

			public void run(StringExecutable e) {
				System.out.println("Executing code block ...");
				int value = e.execute(12);
				System.out.println("Return value is: " + value);
			}
		}

		...

		runner.run((int a) -> {
			System.out.println("Hello there.");
			return 7 + a;
		});	// Need to specify type of parameter

12. Multiple parameters

		interface StringExecutable {
			int execute(String a, String b);
		}

		...

		runner.run((a, b) -> {
			return 7 + a;
		});

13. Local variable in anonymous class definition

		int c = 100;

		Runner runner = new Runner();
		runner.run(new Executable() {
			public int execute(int a, int b) {
				return a + b + c; // c effectively final
			}
		});

		runner.run((a, b) -> {
			return a + b + c;
		});

14. An anonymous class have its own scope but lambda expression does not have its own scope

		int d = 77;

		Runner runner = new Runner();
		runner.run(new Executable () {
			public int execute(int a, int b) {
				int d = 8; // new variable
				...
			}
		});

		runner.run((a, b) -> {
			int d = 15; // Compilation error
		});

15. Assigning code to variable

		Executable ex = (a, b) -> {
			return a + b + c;
		};

		runner.run(ex);

16. Casting

		Object codeblock = (Executable)(a, b) -> {
			return a + b + c;
		};

17. Sorting Array using comparable interface
		