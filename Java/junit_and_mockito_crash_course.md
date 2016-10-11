## JUnit and Mockito Crash Course
1. Skill + Practice = Expert

#### Introduction
1. Unit Testing: Unit or class level testing
	1. Test public methods for positive and exceptional scenarios
	2. Example:
		1. `public int createOrder(Order order)`
			1. pass order
	3. Mocking:
		1. Ex: OrderProcessor -> OrderService -> OrderDAO -> Database
			1. To unit test OrderProcessor, we can mock `OrderServcie`
	4. Advantages:
		1. Assure Quality: a developer can catch defects which coding
		2. Run Fast: Tests run fast since dependencies are mocked
		3. Regression Suite: Unit tests become regression suite since we can run all unit tests

#### JUnit Testing
1. Framework:
	1. Easy to use API
	2. Way to compare or assert results
	3. Run and report results
2. JUnit 3: `junit.framework.TestCase` class must be extended
3. JUnit 4: We use `@Test` **(M)** annotation
	1. `@Before` **(M)**: to mark setup methods, creation of all objects required and data for testing
	2. `@After` **(M)**: run after every tests:
		1. for cleanup
	3. `@BeforeClass` **(M)**: Run only once for test class at the beginning
	4. `@Ignore` **(M)**: Test is ignored
4. `import static org.junit.Assert.*;` **(M)**
	1. `assertNotNull`
	2. `assertSame`
	3. `assertEquals`: compares values
5. `BlockJunit4ClassRunner.class`:
	1. To run tests and report
	2. run from command line and pass test class and run all tests and reports results
6. `@RunWith(SpringJUnit4ClassRunner.class)`: Extends `BlockJunit4ClassRunner.class`

#### HelloJUnit
1. Start a new project in eclipse
2. Right click on project and add new source folder called `test`
3. Right click on implementation class and select JUnit Test Case
4. Change source folder to `test`
5. Click Finish
6. Add the following test

		@Test
		public void greetShouldReturnAValidResult() {
			Greeting greeting = new GreetingImpl();
			String result = greeting.greet("JUnit");
			assertNotNull(result);
			assertEuals()
		}
		
#### Exceptional Cases
1. Consider the following class

		public GreetingImpl implements Greeting {
			public String greet(String name) {
				if(name == null || name.equals("")) {
					throw new IllegalArgumentException();
				}
				return "Hello " + name;
			}
		}

2. Excepitonal Unit tests for the class are as follows:

		@Test(Expected = IllegalArgumentException.class)
		public void greetShouldThrowAnExceptionForNameIsNull() {
			Greeting greeting = new GreetingImpl();
			greeting.greet(null);
		}
		
		@Test(Expected = IllegalArgumentException.class)
		public void greetShouldThrowAnExceptionForNameIsBlank() {
			Greeting greeting = new GreetingImpl();
			greeting.greet("");
		}

#### `@Before` and `@After` Methods
1. `@Before` annotated method runs once for each `@Test` method before executing the @Test method

		@Before
		public void setUp() {
			greeting = new GreetingImpl();
		}

2. `@After` annotated method runs once for each `@Test` method after executing the `@Test` method

		@After
		public void tearDown() {
			greeting = null;
		}
		
#### Mocking
1. To mimic
2. For isolated testing
3. Purpose:
	1. If A depends on B, then we mock out B so that only A is tested without testing B
4. Example:
	1. ReservationController -> ReservationBO -> ReservationDAO -> DB
5. Mocking steps:
	1. Stubbing
		1. `@Mock`
	2. Setting expectations
		1. `when`, `thenReturn`, `thenThrow`
	3. Verifying
		1. `verify`, `matchers`
6. Example:
	1. Order Processing:
		1. Client places and Order, or Cancel Order or delete an order
		2. OrderBO: Business Logic
			1. `placeOrder()`
			2. `cancelOrder()`
			3. `deleteOrder()`
		3. OrderDAO: Database access methods
			1. `create()`
			2. `read()`
			3. `update()`
			4. `delete()`
	2. Classes:
		1. `OrderDAO`: Interface
		2. `OrderDAOImpl`: Implementation class
		3. `OrderBO`: interface
		4. `OrderBOImpl`: Implementation class
6. Download Mockito:
	1. Search for mockito download
	2. click **mockito-<version>.zip**
	3. Unzip the contents
	4. select **mockito-all-\<version>.jar**
	5. In eclipse add a new folder
		1. name: lib
		2. Hit finish
	6. Paste the jar file under the lib folder
	7. Right click on project goto properties, libraries add jars, select `mockito-all-<version>.jar`
	
#### CodeCoverage
1. Install **EclEmma** (Eclipse Emma)
	1. Uses JaCoCo library
	2. Installation:
		1. Goto Eclipse MarketPlace
		2. Search EclEmma
		3. Click **Install**
		4. Hit **Confirm**
		5. Accept licence
		6. Hit **Finish**
		7. Restart Eclipse
	2. Checking:
		1. Right click on a project
		2. Check if **Coverage As** option exists
2. Code Coverage:
	1. The lines of code tested when tests are run against the source code
		1. Source Code lines:
			1. Conditionals, loops
3. Cobertura:
	1. Has Eclipse plugins
4. JTest
5. Running EclEmma:
	1. Right click on `test` directory
	2. Select **Coverage As**
	3. Select **JUnit Test**
	
#### Matchers, Verify, Spy ...
1. verify(mockobject, times(1)).method(argument);
2. verify(mockobject, atleast(2)).method(argument);
	1. verify(mockobject, verificationMethod).method(argument); **(M)**
3. Matchers API:
	1. `anyInt()` **(M)**
	2. `any(Class.class)` **(M)**
	
#### Mocking Void Methods
1. Requirements:
	1. Class A has `usesVoidMethod` uses Class B's `voidMethod`
2. Mocking a void method:
	1. `doNothing().when(b).voidMethod();` **(M)**
3. Mocking consecutive calls of void method:	
		
		doNothing().doThrow(Exception.class).when(b).voidMethod();
		a.usesVoidMethod();
		verify(b).voidMethod();
		a.usesVoidMethod();
		
#### F.I.R.S.T Principle
1. F: Fast unit tests (each test in milliseconds)
2. I: Independent tests
	1. none of the tests should depend on another test for its working
3. R: Repeatable tests
	1. Work across environments (QA, staging, Prod)
4. S: Self-Validating tests
	1. Either fail or succeed directly not write into log files etc... and use another method to validate results
5. T: Timely tests
	1. As soon as we write code (follow TDD)
	
#### Test Doubles
1. Common Design Patterns across unit testing frameworks
	1. Mock out like stunt doubles
2. Commonly used test doubles
	1. Dummy
		1. Objects passed as parameters but are not required for the tests
			1. `any(Order.class)`: we don't care for the object
	2. Stubs
		1. Provide fixed answers and return values
		2. `when().thenReturn()`
	3. Mocks
		1. Can throw exceptions and verify results
		2. `ThenThrow()`
		3. `verify()`
		4. Expectations form specification of calls mock objects are expected to receive.
	4. Fake
		1. Objects having working implementation but do not make it to the production (they use shortcuts)
			1. In memory databases used for unit testing instead of real databases
	5. Spies
		1. Spy or record any side effects of a test method
3. Differences between stub and mock
	1. Stub uses state verification but mock uses behavior verification
		1. Behavior verification:
			1. Check to see if correct calls were made.
			2. Implementation:
				1. Tell mock object what to expect during setup (setup of data and setup of expectations)
				2. Ask mock object to verify itself during verification phase.

#### Spy
1. For partial mocking
	1. Only those methods which are stubbed out behave as stubbed but rest of the methods behave as defined by the class.
2. Example:

		@Spy
		List<String> myList = new ArrayList();
		...
		doReturn(3).when(myList).size();

3. Syntax: **(M)**
	
		@Spy
		Type object = new Type();
		...
		doReturn(<value>).when(object).method();
	
	1. Mocked objects need stubbing out all those methods which will be called during unit testing.
4. Spy using `@Mock`
	1. `when(myList.size()).thenCallRealMethod();`
	
#### Writing Tests for Maven Project
1. Add dependency in pom.xml

		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<version>4.11</version>
			<scope>test</scope>
		</dependency>
2. Run tests as follows:
	1. `mvn clean install`
		1. `clean`: clears `target` directory
	2. `mvn clean test`
	
#### Parameterized JUnit (v4)
1. Write single method and pass multiple data sets as parameters and assert for multiple results
2. Steps
	1. Identify the Input Data and Results
		1. num1
		2. num2
		3. result
			
	2. Creation of Fields in the test class
	
			int num1;
			int num2;
			int expectedResult;
			
			public CalculatorImplTest(int num1, int num2, int result) {
				this.num1 = num1;
				this.num2 = num2;
				this.expectedResult = expectedResult;
			}
		
	3. Creation of constructor
		1. It accepts inputs and outputs
	4. Creation fo static method to feed data (`@Parameters` **(M)**)
		
			@Parameters
			public static Collection<Integer[]> data() {
				return Arrays.asList(new Integer[][]{{-1,2,1},{1,2,3},{6,7,13}});
			}
			
	5. Creation or Updation of Test Method
	
			c.add(num1, num2);
			assertEquals(expectedResult, result);
			
	6. Mark the Test class With `@RunWith(Parameterized.class)` **(M)**
		1. It is a Test runner
			
			
				@RunWith(Parameterized.class)
				public class CalculatorImplTest {
				...
			} 
			
#### PowerMock
1. Limitations of Mockito: It cannot mock the followin:
	1. Static methods
	2. Final methods
	3. Constructors
	4. Private methods
	5. Enums
	6. ...
2. PowerMock can be used to mock the above methods and data
3. Reasons for Mockito not able to mock the above methods
	1. Mockito uses proxy pattern:
		1. If A uses B, then we mock B which inherits B
		2. Since final classes cannot be inherited, we cannot mock B
		3. Since private methods cannot be inherited we cannot mock B
4. PowerMock uses Bytecode manipulation and Custom Class Loader to mock class B
5. Syntax:
	1. Similar to Mockito
6. Example:
	1. `UserAdminService`
		1. `UserDAO` -> `final IDGenerator`
		2. `create(User user)` -> `static final generateId`
7. Download and add powermock dependency:
	1. Search for powermock download
	2. `powermock-mockito-junit-<version>.zip`
	3. Unzip
	4. Copy
		1. `javaassist-<version>.jar`
		2. `mockito-all-<version>.jar`
		3. `powermock-mockito-<version>.jar`
	5. Right click on the project
		1. lib folder
	6. Paster the jars in lib
	7. Add jars to the classpath
	8. If using version 1.6.5, download and copy `powermock-api-mockito-common-1.6.5.jar` to the lib folder and add it to the classpath
8. Annotations: **(M)**
	1. `@RunWith(PowerMockRunner.class)`
	2. `@PrepareForTest(<class-with-static-methods>)`
	3. `mockStatic(<class-with-static-methods>)`
	4. `verifyStatic()`

#### Spring
1. It is a dependency injection engine
	1. If A depends on B, then Spring will inject and instance of B into the instance of A through
	1. Constructor
	2. Setter methods
1. It is an IOC (Inversion of Control) container
	1. Spring took up control onto itelf
3. Wiring:
	1. Spring wires UI, Service, DAO etc...
	2. Autowiring
4. Spring JDBC:
	1. A layer over JDBC
	2. Spring MVC (easier than struts)
	3. Spring ORM Support (Hybernate, JPA)
	4. Spring Integration (Messages onto ques)
	5. Spring Web Services (SOAP based services)
5. Example application:
	1. Ticketing Service:
		1. `TicketingDAO` <- `TicketingDAOImpl` (`createTicket(Ticket)`)
		2. `TicketingService` <- `TicketingServiceImpl` (`buyTicket(name, phone)`)
	2. Project:
		1. File > New > Other > Maven Project
		2. Select `maven-archetype-quickstart`
		3. Set groupId, artifactId
		
#### Differences Between Unit Testing and Integration Testing
		 