# The Linux Kernel #
## KUnit - Unit Testing for Linux Kernel ##
### What is KUnit? ###
1. Lightweight unit testing + mocking framework for kernel
2. Inspired by
	1. JUnit - Java
	2. unittest.mock - Python
	3. Googletest/Googlemock - C++
3. What does it have?
	1. Facilities for defining unit tests
	2. Grouping test cases into test suites
	3. Common infrastructure for running tests
	4. ...
4. Principle:
	1. Has kernel component
		1. it has set of macros for unit tests
	2. Tests run on kernel boot if built-in
	3. Tests run on load if build as module
	4. Results written to kernel log in TAP format
		1. [https://testanything.org/](https://testanything.org/)
	5. Running:
		1. [kunit_tool](https://kunit.dev/third_party/kernel/docs/kunit-tool.html)
			1. Builds user mode linux kernel [http://user-mode-linux.sourceforge.net/](http://user-mode-linux.sourceforge.net/)
			2. Runs the user mode linux kernel
			3. Parses results
			4. No VM or hardware required

### Why KUnit? ###
1. Unit test is supposed to test a single unit of code in isolation
	1. It is finest granularity of testing
		1. Should have all possible code paths to be tested in code under test
			1. Possible only if code under test is very small and has no external dependencies outside of test's control like hardware
2. Can be run on most architectures (most tests are architecture independent)
3. It is fast (excluding build time) - from invocation to completion
	1. Several dozen tests in 20-30 seconds
4. If tests are slow, unreliable and difficult to write, requires special setup or hardware - longer waiting to write and run tests
	1. If fast tests:
		1. Can be run all the time we make change

### How do I use it? ###
1. Getting started: for new users of KUnit
2. Using KUnit: for more detailed explanation of KUnit features
3. API Reference: for list of KUnit APIs used for testing
4. kunit_tool How-To: more info on kunit_tool helper script
5. FAQs: answers to common questions about KUnit

### Getting Started ###
#### Installing Dependencies ####
1. KUnit has same dependencies as Linux Kernel
	1. If we can build kernel, we can run KUnit

#### Running Tests with the KUnit Wrapper ####
1. Python wrapper
	1. Runs tests under user mode Linux and formats test results
2. Invocation:

		./tools/testing/kunit/kunit.py run --defconfig

	1. This is called kunit_tool

#### Constructing a .kunitconfig ####
1. To run specific tests using .kunitconfig file
	1. Contains regular kernel config with specific test targets
	2. Contains other config options
2. Starting point:
	1. defconfig:..code-block::bash

			cd $PATH_TO_LINUX_REPO cp arch/um/configs/kunit_defconfig .kunitconfig
			
		1. Other Kconfig options:

				..code-block::none
				
				CONFIG_LIST_KUNIT_TEST=y
				
3. kunit_tool ensures that all config options set in .kunitconfig are set in kernel .config before running tests

#### Running the Tests ####
1. Invoke python wrapper from kernel repo:

		./tools/testing/kunit/kunit.py run
		
	1. Run `make mrproper` first
	2. Following result is seen:

			Generating .config ...
			Building KUnit Kernel ...
			Starting KUnit Kernel ...
			
		1. Followed by list of tests passing
		2. If building for first time, it may take a while

#### Running Tests without the KUnit Wrapper ####
1. If not using KUnit Wrapper:
	1. To integrate with other systems (say)
	2. To use architecture other than UML
2. KUnit can be integrated into any kernel
	1. Results need to be read out and parsed manually
3. KUnit is not for production system
	1. May reduce stability
	2. May reduce security

##### Configuring the Kernel #####
1. Enable `CONFIG_KUNIT` Kconfig option (under Kernel Hacking or Kernel Testing and Coverage in menuconfig)
2. From there enable any KUnit tests you want
	1. Usually have config options ending in `_KUNIT_TEST`
3. KUnit and KUnit tests can be compiled as modules
	1. Tests are run when module is loaded

##### Running the Tests #####
1. Build and run kernel as usual
	1. Test output will be written to kernel in TAP format

#### Writing Your First Test ####
1. New file: `drivers/misc/example.h` with following:

		int misc_example_add(int left, int right);
		
2. New file: `drivers/misc/example.c` with following:

		#include <linux/errno.h>
		#include "example.h"
		
		int misc_example_add(int left, int right)
		{
			return left + right;
		}
		
3. Add following lines to `drivers/misc/Kconfig`:

		config MISC_EXAMPLE
					bool "My example"
					
4. Add following lines to `drivers/misc/Makefile`:

		obj-$(CONFIG_MISC_EXAMPLE) += example.o
		
5. Write test as follows: `drivers/misc/example-test.c`

		#include <kunit/test.h>
		#include "example.h"
		
		/* Define the test cases. */
		
		static void misc_example_add_test_basic(struct kunit *test)
		{
			KUNIT_EXPECT_EQ(test, 1, misc_example_add(1, 0));
			KUNIT_EXPECT_EQ(test, 2, misc_example_add(1, 1));
			KUNIT_EXPECT_EQ(test, 0, misc_example_add(-1, 1));
			KUNIT_EXPECT_EQ(test, INT_MAX, misc_example_add(0, INT_MAX));
			KUNIT_EXPECT_EQ(test, -1, misc_example_add(INT_MAX, INT_MIN));
		}
		
		static void misc_example_test_failure(struct kunit *test)
		{
			KUNIT_FAIL(test, "This test never passes.");
		}
		
		static struct kunit_case misc_example_test_cases[] = {
			KUNIT_CASE(misc_example_add_test_basic),
			KUNIT_CASE(misc_example_test_failure),
			{}
		};
		
		static struct kunit_suite misc_example_test_suite = {
			.name = "misc-example",
			.test_cases = misc_example_test_cases,
		};
		
		kunit_test_suite(misc_example_test_suite);
		
6. Add following in `drivers/misc/Kconfig`:

		config MISC_EXAMPLE_TEST
					bool "Test for my example"
					depends on MISC_EXAMPLE && KUNIT
					
7. Add following in `drivers/misc/Makefile`:

		obj-$(CONFIG_MISC_EXAMPLE_TEST) += example-test.o
		
8. Add following in `.kunitconfig`:

		CONFIG_MISC_EXAMPLE=y
		CONFIG_MISC_EXAMPLE_TEST=y
		
9. Run the test:

		./tools/testing/kunit/kunit.py run
		
10. You can see the following results:

		...
		[16:08:57] [PASSED] misc-example:misc_example_add_test_basic
		[16:08:57] [FAILED] misc-example:misc_example_test_failure
		[16:08:57] EXPECTATION FAILED at drivers/misc/example-test.c:17
		[16:08:57]		This test never passes.
		...

#### Next Steps ####
1. Check out [Using KUnit](https://kunit.dev/third_party/kernel/docs/usage.html)

### Using KUnit ###
1. What is KUnit
2. How it works
3. How to use it
4. Concepts, terminology needed to understand KUnit

#### Organization of this Document ####
1. Two main sections
	1. Testing
		1. What are unit tests?
		2. How to use KUnit to write unit tests?
	2. Isolating behavior
		1. How to use KUnit to isolate code
			1. Makes it possible to unit test code that otherwise is un-unit testable

#### Testing ####
##### What is KUnit? #####
1. "K" - Kernel
2. KUNit - (Linux) Kernel Unit Testing Framework
3. It is intended to write unit tests but
	1. It can be used to write integration tests as well (secondary goal)
	2. It is not intended to be end-to-end testing framework for kernel

##### What is Unit Testing? #####
1. [Unit Test](https://martinfowler.com/bliki/UnitTest.html) tests code at smallest possible scope
	1. Smallest possible scope: Unit of code
		1. In C: Function
2. Unit tests should be written for all publicly exposed functions in compilation unit
	1. All functions exported in a class (defined below)
	2. All functions not static

##### Writing Tests #####
###### Test Cases ######
1. Test case is function with signature:

		void (*)(struct kunit *test)
		
	1. It calls a function to be tested
	2. It sets expectations for what should happen
	3. Example:

			void example_test_success(struct kunit *test)
			{
			}
			
			void example_test_failure(struct kunit *test)
			{
				KUNIT_FAIL(test, "This test never passes.");
			}
			
		1. First test case passes (does nothing)
			1. No expectations ensures it passes
		2. Second test case always fails
			1. It calls `KUNIT_FAIL`
				1. Expectation that logs a message and causes failure

###### Expectations ######
1. It is a way to specify that you expect a piece of code to do something in test
2. It is called like a function
3. Test is made by setting expectations about behavior of piece of code under test
	1. When one or more expectations fail, test case fails and info about failure is logged
	2. Example:

			void add_test_basic(struct kunit *test)
			{
				KUNIT_EXPECT_EQ(test, 1, add(1, 0));
				KUNIT_EXPECT_EQ(test, 2, add(1, 1));
			}
			
		1. Above makes assertions about behavior of a function
		2. First param: `struct kunit *`
			1. contains info about current test context
		3. Second param: expected value
		4. Third param: actual value
	3. If any of the expectations fails, the test case fails
4. Test will continue running trying other expectations until test case ends or otherwise terminated
	1. Opposition to assertions discussed later
5. [Test API](https://kunit.dev/third_party/kernel/docs/api/test.html)

###### Assertions ######
1. Assertion: It is like expectation but terminates test case immediately if not satisfied.
2. Example:

		static void mock_test_do_expect_default_return(struct kunit *test)
		{
			struct mock_test_context *ctx = test->priv;
			struct mock *mock = ctx->mock;
			int param0 = 5, param1 = -5;
			const char *two_param_types[] = {"int", "int"};
			const void *two_params[] = {&param0, &param1};
			const void *ret;
			
			ret = mock->do_expect(mock,
										"test_printk", test_printk,
										two_param_types, two_params,
										ARRAY_SIZE(two_params));
			KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ret);
			KUNIT_EXPECT_EQ(test, -4, *((int *) ret));
		}
		
	1. Method under test should return pointer to value
	2. If pointer is null or errno, we want to stop the test
		1. `ASSERT_NOT_ERR_OR_NULL(...)`: should crash test case

###### Test Suites ######
1. Test suites: used to reduce duplication in a set of closely related tests
	1. It is a collection of test cases for a unit of code
	2. A setup function is invoked before every test case
	3. A teardown function is invoked after every test case
2. Example:

		static struct kunit_case example_test_cases[] = {
			KUNIT_CASE(example_test_foo),
			KUNIT_CASE(example_test_bar),
			KUNIT_CASE(example_test_baz),
			{}
		};
		
		static struct kunit_suite example_test_suite = {
			.name = "example",
			.init = example_test_init,
			.exit = example_test_exit,
			.test_cases = example_test_cases,
		};
		kunit_test_suite(example_test_suite);
		
	1. `example_test_suite`: test suite
		1. Runs test cases: `example_test_foo`, `example_test_bar`, `example_test_baz`
		2. `example_test_init`: called before each test case
		3. `example_test_exit`: called after each test case
	2. `kunit_test_suite(...)`: used to register test suite with KUnit framework
3. Test case will run only if it is associated with a test suite
4. [Test API](https://www.kernel.org/doc/html/latest/dev-tools/kunit/api/test.html): For more info

#### Isolating Behavior ####
1. Unit testing: has the ability to limit amount of code under test to single unit.
	1. Possible by controlling what code gets run when unit under test calls function
		1. Accomplished through indirection
			1. Function is exposed as part of an API
				1. Definition of function can be changed without affecting rest of the code base
					1. Kernel implementation:
						1. classes
						2. structs
					2. Those provide function pointers
						1. Those are provided by implementer
							1. The functions are architecture specific and are selected at compile time

##### Classes #####
1. Construct is not built into C language
	1. It is derived concept in C
		1. Used to do object oriented programming
	2. In Kernel:
		1. Class is struct that contains function pointers
			1. It is a contract between implementers and users
				1. Forces implementers to use same function signature without having to call function directly
			2. Function pointers specify pointer to the class (class handle) as one of the params - enables member functions (methods) to have access to member variables (fields)
				1. Allows same implementation to have multiple instances
2. Inheritance:
	1. Class can be overridden by child classes by embedding parent class in child class
	2. When method of child class is called, the pointer passed is that of parent contained within child
		1. Child can compute pointer to itself (because pointer to parent is always fixed offset from pointer to child
			1. Offset is offset to parent in the child struct
3. Example:

		struct shape {
			int (*area)(struct shape *this);
		};
		
		struct rectangle {
			struct shape parent;
			int length;
			int width;
		};
		
		int rectangle_area(struct shape *this)
		{
			struct rectangle *self = container_of(this, struct shape, parent);
			return self->length * self->width;
		};
		
		void rectangle_new(struct rectangle *self, int length, int width)
		{
			self->parent.area = rectangle_area;
			self->length = length;
			self->width = width;
		}
		
	1. `container_of`: computes pointer to child from pointer from parent

##### Faking Classes #####
1. To unit test a method in a class, behavior of method must be controllable (or else unit test might become integration test)

#### KUnit on non-UML Architectures ####
##### Running Existing KUnit Tests on Non-UML Architectures #####
##### Writing New Tests for Other Architectures #####

#### KUnit Debugfs Representation ####

### kunit_tool How-To ###
#### What is kunit_tool? ####
#### What is a kunitconfig? ####
#### How do I use kunit_tool? ####

### API Reference ###
#### Test API ####

### Frequently Asked Questions ###
#### How is this difference from Autotest, kselftest, etc? ####
#### Does KUnit support running on architectures other than UML? ####
#### What is the difference between a unit test and these other kinds of tests? ####