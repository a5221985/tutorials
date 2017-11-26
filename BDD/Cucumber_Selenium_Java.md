# Cucumber with Selenium Java (Basic) #

## Cucumber focused ##
### Introduction ###
1. Cucumber, Cucumber + Selenium
2. BDD - Behavior Driven Development is based on Test Driven Development (TDD) and it aims to bridge gap between Business analyst and developers
	1. And bridges gap between
		1. Manual QA with Automation testers (who write BDD implementations)
		2. Manual QA with Developers
	2. BDD is plain text but has syntax based on certain tools
3. Supported tools for BDD
	1. Cucumber
		1. Ruby
		2. Java
		3. Perl
		4. Python
	2. JBehave
	3. Nbehave
	4. SpecFlow - C#
4. Gherkin - language spec for the above tools
	1. Business readable, domain specific language which lets us understand software behavior easily since they are plain text
	2. Formatting
	3. Parser of Gherkin behaves according to the structure
5. Syntax: (few)
	1. Feature
	2. Background
	3. Scenario
	4. Given
	5. When
	6. Then
	7. And
	8. But
	9. Scenario outline
	10. Examples
	11. Scenario Templates
6. Example:

		Feature: UserFormFeature
			In this feature we will test user form of the application

			Scenario: Test User Form page
				And I enter UserName and Password
					| UserName | Password |
					| admin	   | password |
				And I click login button
				And I enter User Details
					| Initial | Name	| Email	                 |
					| KK	  | Karthik | karthik@techgeek.co.in |
				And I click save button
				Then I see if the user details saved.

7. Differences between BDD vs taditional
	1. BDD - plain test and easy to understand, Traditional automation - Full of code and hard to understand
	2. BDD - easy to understand by BS/QA/DEV/Automation Test Engineer and all will be on the same page, Traditional - Code is understood only by Automation test engineer and/or Dev.
	3. BDD - can be shared with stakeholders, Traditional - Cannot be shared with stakeholders
	4. BDD - Easy to learn and implement, Traditional - More knowledge is required

### Part 2 - Getting started with Cucumber (Part A) ###
1. Cucumber - tool which helps in BDD
	1. Supports different language implementations
		1. Java
		2. JS
		3. PHP
		4. Ruby
		5. C# - SpecFlow (Cucumber implementation)
		6. ...
2. Cucumber with Java
3. Pre-requisites:
	1. IntelliJ IDEA
		1. Windows 10
	2. Jar files
		1. Cucumber-core
		2. Cucumber-java
		3. Cucumber-java-deps
		4. Cucumber-jvm
		5. Gherkin
		6. Selenium (and its related jars)
4. Inclusion
	1. Maven public repository
5. Installation:
	1. JDK
		1. Env variables
	2. IntelliJ IDEA Community Edition
		1. 64 bit
		2. Association with Java
6. Simple Hello World Java project
	1. package: com.ea
	2. Type: Java project
	3. `System.out.println("Hello World!");`

### Part 3 - Getting started with Cucumber (Part B) ###
1. Maven dependencies:
	1. Right click on project
	2. Add framework support
		1. Maven
	3. Enable autoimport
2. Search for maven public repository
	1. maven repository cucumber java
		1. Latest version
3. Feature file:
	1. Folder `src/features`
	2. `src/features/Login.feature`
4. Install plugin
	1. ctl + alt + s
		1. Plugins
			1. cucumber - search in repository
				1. Cucumber for Java
	2. Restart IDE
5. Feature file:
	1. Plain text file with `.feature` extension
	2. Feature file is mapped to Code behind file mapped to step definition file
		1. Step definition:
			1. Implementation of features
			2. Code behind - not required for IDE
				1. Test runner is required with RunWith attribute if running from commandline

### Part 4 - Creation of our first feature file using Cucumber for Java ###
1. Login.feature

		Feature: LoginFeature
			This feature deals with the login functionality of the application
	
			Scenario: Login with correct username and password
				Given I navigate to the login page
				And I enter the username as admin and password as admin
				And I click login button
				Then I should see the userform page

	1. alt + enter
		1. File name: LoginStep

2. Dummy website:
	1. [executeautomation.com](executeautomation.com/demosite/Login.html)

### Part 5 - Working with Scenarios in detail using Cucumber ###
1. Scenario:
	1. Execute feature file
		1. Edit Configuration
			1. Cucumber.java
		2. Right click > Run "Scenario ..." - errors
			1. Gluing feature file to step definition file
				1. Drop down
				3. package `Steps` > LoginStep
				4. Move Fetures to test/java
				5. Edit configuration
					1. Glue: Steps
			2. Run the scenario
		3. Programmatically gluing: `RunWith`
2. ctrl + alt + b -> Implementation

		@Then...
		
			System.out.println("I should see userform page.");

		@Given...

			System.out.println("Navigate to Login page");

		@And...
	
			System.out.println("Enter user name and password");

		@And...

			System.out.println("Click Login button");

3. Parameters:

		And I enter the username as "admin" and password as "admin"
		...
			System.out.println("UserName is " + username + " and password is: " + password);

	1. Recreation of step definition
		1. Change parameters to username and password


### Part 6 - Working with Multiple Data using DataTables ###
1. DataTable: used to pass multiple data
	1. FirstName, LastName, email, phone, ...
2. Retrieve values using indices
3. Example:

		Scenario: Login to site
			Given I navigate to ExecuteAutomation WebSite
			And I enter username and password
				| username | password |
				| admin	   | password |
			And I click login button
			Then I should see the UserDetails page

	1. ctrl + Alt + L (formatting)
	2. Step definition:

			...(DataTable table) {
				List<List<String>> data = table.raw();
				System.out.println(data.get(0).get(0));
				System.out.println(data.get(0).get(1));
			}

### Part 6a - Working with Multiple Data using DataTable with Custom class type ###
1. POJO

		public class User {
			public String UserName;
			public String Password;

			public User(String userName, String password) {
				UserName = userName;
				Password = password;
			}
		}

2. LoginStep.java

		class LoginStep {
			...
			@And("^I enter the following for Login$")
			public void iEnterTheFollowingForLogin(...) {
				List<User> users = new ArrayList<User>();
				users = table.asList(User.class);

				for (User user: users) {
					System.out.println("The UserName is " + user.username);
					System.out.println("The Password is " + user.password);
				}
			}

			public class User {
				public String username;	// small letters
				public String password;

				public User(String username, String password) {
					this.userName = username;
					this.password = password;
				}
			}
		}

### Part 7 - Working with Scenario Outline of Cucumber ###
1. Scenario outline:
	1. We can run same scenario with different data with the help of Examples
2. Example:

		Scenario Outline: Login to site with correct UserName and Password using Scenario outline
			Given I navigate to ExecuteAutomation WebSite
			And I enter <UserName> and <Password>
			And I click login button
			Then I should see the UserDetails page

			Examples:
				| UserName | Password  |
				| admin	   | admin	   |
				| admin    | adminpass |
				| testing  | qa		   |

3. LoginStep.java

			@And("^I enter ([^\"]*) and ([^\"]*)"$)
			...
				System.out.println("UserName is: " + userName);
				System.out.println("Password is: " + password);

### Part 8 - Working with Cucumber Hooks to initialize and teardown test ###
1. Two hooks:
	1. `@Before`
	2. `@After`
2. Tagged hooks
	1. Tag hooks for `@Before` and `@After`
3. Class: `test/Steps/Hook`

		public class Hook {
			@Before
			public void InitializeTest() {
				System.out.println("Opening the browser: MOCK");
			}

			@After
			public void TearDownTest(Scenario scenario) {

				if(scenario.isFailed()) {
					// Take screenshot
					System.out.println(scenario.getName());
				}

				System.out.println("Tear down browser: MOCK");
			}
		}

### Part 9 - Dependency Injection with Picocontainer for cucumber ###
1. Dependency Injections
	1. Not built out-of-box in cucumber-core or cucumber-jvm
		1. cucumber-picocontainer
2. Example:

		private Base page;

		public LoginStep(Base base) {
			page = base;
		}

	1. Dependency: copy and add it to pom.xml
3. test/java/Base/BaseUtil.java

		public class BaseUtil {
			public String stepInfo;
		}

4. Extend Hook

		public class Hook extends BaseUtil { // extends is not required

			private BaseUtil base;

			public Hook(BaseUtil base) {
				this.base = base;
			}

			@Before
			...
				base.stepInfo = "FirefoxDriver";

		}

5. LoginStep

		public class LoginStep extends BaseUtil { // extends is not required

			private BaseUtil base;
	
			public LoginStep(BaseUtil base) {
				this.base = base;
			}

			@Then(...)
	
				System.out.println("The driver is: " + base.stepInfo);

		}

### Part 10 - Step Argument Transformation using Cucumber with Selenium ###
1. Argument transformation: a way to get typed object for a certain pattern in a Given/When/Then scenario
	1. We can convert a step definition argument to a custom type (full control over how the type is instantiated)
		1. String -> Number
		2. String -> DateTime
2. `Transformer<Type>` - out-of-the-box
	1. Rules:
		1. Extend Tranformer<> class for the type to be transformed
		2. Override tranform method in Tranformer<>
		3. Call argument with `@Tranform` annotation as parameter
3. Login.feature

		Feature: ...

			Scenario: Login with correct username and password
				Given ...
				And I enter the user's email address as Email:admin
				...

4. LoginStep.java

		@And(...)
		public void iEnterTheUserEmailAddressAsEmailAdmin(@Tranform(EmailTransformer.class) String email) throws Throwable {
			System.out.println("The Email Address is:" + email);
		}

5. test/java/transformation/EmailTransform.java

		public class EmailTransform extends Transformer<String> {

			@Override
			public String transform(String userName) {
				return userName.concat("@ea.com");
			}
		}

6. Login.feature

		And I verify the count of my salary digits for Rs 1000

7. transformation/SalaryCountTransformer.java

		public class SalaryCountTransformer extends Tranformer<Integer> {

			@Override
			public Integer transform(String salary) {
				return salary.length();
			}

		}

8. LoginStep.java

		@And("... (\\d+)$")
		public void iVerify...(@Tranform(SalaryCountTranformer.class) int salary) throws Throwable {
			System.out.println("My Salary digits counts is: " + salary);
		}

### Part 11 - New feature of Cucumber-Java 8 ###
1. Cucumber-Java8
	1. step defition representation using lambda expression

			And("^...$", (Integer arg0) -> {
				...
			});

2. Use JDK 8
	1. CucumberBasics.iml

			LANGUAGE_LEVEL="JDK_1_8"

	2. Change bytecode version to 1.8 in IntelliJ
3. Login.feature

		And I just need to see how step looks for cucumber-java8

	1. Add `cucumber-java8` to pom.xml

4. New file for step defitions Java8VersionStep

		public class Java8VersionSteps implements En {

			And("...", (Integer arg0) -> {
				System.out.println("The value from new step class is:" + arg0);
			});
		}

	1. main.iml, CucumberBasics.iml

			LANGUAGE_LEVEL="java_1_8"

## Selenium focused ##
### Part 1 - Introduction to Cucumber with Selenium (Selenium focused) ###
1. Selenium dependency
	1. selenium-java
2. More details:
	1. Execute automation - Selenium Framework Design and Development
	2. Execute automation - Selenium TIDBITS
3. Add dependency to pom.xml
4. BaseUtil

		// Remove stepInfo everywhere
		public WebDriver driver;

5. Firefox driver: 
	1. Set system property for webdriver.fireforx.marionette and geckodriver.exe
		1. [http://seleniumsimplified.com/2016/04/how-to-use-the-firefox-marionette-driver/](http://seleniumsimplified.com/2016/04/how-to-use-the-firefox-marionette-driver/)
			1. [Download the marionetter driver](https://developer.mozilla.org/en-US/docs/Mozilla/QA/Marionette/WebDriver)
			2. Unarchive it to a folder
			3. In code set `webdriver.gecko.driver` property to location of `.exe`
			4. Use `MarionetteDriver`
	2. Hook.java

			@Before
			...
			System.setProperty("webdriver.firefox.marionette", "D:\\libs\\gechodriver.exe");
6. Hook.java

		@Before
			...
			base.driver = new FirefoxDriver();

7. LoginStep.java

		@Given(...)
		...
			base.driver.navigate().to("http://www.executeautomation.com/demosite/Login.html");

### Part 2 - Writing a simple code for Selenium with cucumber ###
1. Login.feature
	1. Remove Scenario Outline
2. LoginStep.java:
	1. Remove unnecessary code
	
			public void iEnterTheFollowingForLogin(...) {
				...
				for (User user: users) {
					base.driver.findElement(By.name("UserName")).sendKeys(user.username);
					base.driver.findElement(By.name("Password")).sendKeys(user.password);
				}
			}

			@And(...)
			public void iClickLoginButton() ... {
				base.driver.findElement(By.name("Login")).submit();
			}

			@Then(...)
			public void iShouldSeeThUserFormPage() ... {
				WebDriverWait wait = new WebDriverWait(base.driver, 40);
        		WebElement element = wait.until(ExpectedConditions.elementToBeClickable(By.id("Initial")));
				Assert.assertEquals(element.isDisplayed(), true);
			}

		1. pom.xml

				<!-- https://mvnrepository.com/artifact/info.cukes/cucumber-junit -->
        		<dependency>
            		<groupId>info.cukes</groupId>
            		<artifactId>cucumber-junit</artifactId>
            		<version>1.2.5</version>
            		<scope>test</scope>
        		</dependency>

### Part 3 - Page Object Model for Selenium for cucumber ###
1. Package: pages
	1. LoginPage.java

			public class LoginPage {

				public LoginPage(WebDriver driver) {
					PageFactory.initElements(driver, this); // initializes this page
				}

				@FindBy(how = How.NAME, using = "UserName")
				public WebElement txtUserName:

				@FindBy(how = How.NAME, using = "Password")
				public WebElement txtPassword;

				@FindBy(how = How.NAME, using = "Login")
				public WebElement btnLogin;

				public void Login(String userName, String password) {
					txtUserName.sendKeys(userName);
					txtPassword.sendKeys(password);
				}

				public void clickLogin() {
					btnLogin.submit();
				}
			}

	2. LoginStep.java

			@And(...)
			...
				LoginPage page = new LoginPage(base.driver);

				for (User user: users) {
					page.Login(user.username, user.password);
				}

			@And(...)
			...
				LoginPage page = new LoginPage(base.driver);
				page.clickLogin();

### Part 4 - Running Selenium with cucumber via Maven ###
1. Steps:
	1. Download Maven
	2. Set home path
	3. Run Maven from project
2. Project changes:
	1. pom.xml
		1. Add maven compiler plugin
		2. Add maven surefire plugin
			1. Used during test phase to execute unit tests (${basedir}/target/surefire-reports)
				1. Plain text files (*.txt)
				2. XML files
		3. Goals: `surefire:test`
3. pom.xml

		<build>
			<plugins>
				<plugin>
					<!-- https://mvnrepository.com/artifact/org.apache.maven.plugins/maven-compiler-plugin -->
					<groupId>org.apache.maven.plugins</groupId>
					<artifactId>maven-compiler-plugin</artifactId>
					<version>3.7.0</version>
				</plugin>
				<plugin>
					<!-- https://mvnrepository.com/artifact/org.apache.maven.plugins/maven-surefire-plugin -->
					<groupId>org.apache.maven.plugins</groupId>
					<artifactId>maven-surefire-plugin</artifactId>
					<version>2.20.1</version>
				</plugin>
			</plugins>
		</build>

4. `mvn clean compile test` - error! (We need a runner file)
	1. `test/java/runner/TestRunner.java` - Used to run cucumber tests

			@RunWith(Cucumber.class)
			@CucumberOptions(features = {"src/test/java/features"}, glue = "steps")
			public class TestRunner {
			}

### Part 5 - Running cucumber test with TestNG ###
1. TestNG: testing framework
	1. simplifies a range of testing needs
		1. Unit testing (class in isolation of others)
		2. Integration testing (entire system made of several classes, packages and external frameworks (app servers))
	2. Features:
		1. Annotations
		2. Run tests in arbitrary big thread pools with various policies available
		3. Test that your code is multithread safe
		4. Flexible test configuration
		5. Support for data-driven testing (with @DataProvider)
		6. Support for parameters
		7. Powerful execution model (no more TestSuite)
		8. Supported by a variety of tools and plug-ins (Eclipse, IDEA, Maven, etc...)
		9. Embeds BeanShell for further flexibility
		10. Default JDK functions for runtime and logging (no dependencies)
		11. Dependent methods for application server testing
2. Example:

		// @RunWith(Cucumber.class)
		@CucumberOptions(features = {...}, glue="Steps")
		public class TestRunner extends AbstractTestNGCucumberTests {
		}

	1. pom.xml

			<dependency>
				...
				cucumber-testng
			</dependency>
			<dependency>
				...
				testng
			</dependency>

### Part 6 - Reporting in Cucumber for Selenium (Part A) ###
1. Different reporting options
	1. HTML
	2. Json
	3. Text
2. `format = {"json:target/cucumber.json", "html:target/site/cucumber-pretty"}`
3. TestRunner.java

		@CucumberOptions(features = {"..."), format = {"json:target/cucumber.json", "html:target/site/cucumber-pretty"}, glue = "Steps")
		...

	1. html - only feature file and no results

### Part 7 - Reporting in Cucumber for Selenium (Part B) ###
1. Cucumber-Reporiting:
	1. Java report publisher used to publish cucumber reports on Jenkins build server.
	2. Publishes pretty html reports showing results of cucumber runs
	3. It can be a standalone package (for Jenkins, Maven commandline or other package)
	4. [https://github.com/domainszczepanik/cucumber-reporting/](https://github.com/domainszczepanik/cucumber-reporting/)
2. pom.xml

		<plugin>
			<!-- https://mvnrepository.com/artifact/net.masterthought/cucumber-reporting -->
			<groupId>net.masterthought</groupId>
			<artifactId>maven-cucumber-reporting</artifactId>
			<version>3.12.0</version>
			<executions>
				<execution>
					<id>execution</id>
					<phase>verify</phase>
					<goals>
						<goal>generate</goal>
					</goals>
					<configuration>
						<projectName>ExecuteAutomation</projectName>
						<outputDirectory>${project.build.directory}/cucumber-report-html</outputDirectory>
						<cucumberOutput>${project.build.directory}/cucumber.json</cucumberOutput>
					</configuration>
				</execution>
			</executions>
		</plugin>

3. `mvn clean compile verify`
4. Test failure does not generate reports!
	1. Error while running the goal - not handled by surefire plugin
		1. Fix: pom.xml

				<plugin>
					...
					<artifactId>maven-surefire-plugin</artifactId>
					...
					<configuration>
						<testFailureIgnore>true</testFailureIgnore>
					</configuration>
				</plugin>

## What next? ##
### Introduction to Advanced framework development with Selenium (Java) ###
1. Audience: QA, Developers
2. Selenium with C# and Java Titbits - free course on Udemy
3. Topics:
	1. Automation framework design & development
		1. Framework design
		2. Development (Before code)
			1. Industry standard
		3. Code and best practices to develop a framework
		4. Integration of framework with Application test layer
		5. Understanding Selenium internal workflow
		6. Writing own Selenium custom controls
4. Learning path:
	1. Understand framework
	2. Design our framework
	3. Develop base components
	4. Develop utilities and config components
	5. Developing test layer
	6. Creation and writing custom controls for Selenium
5. Using Cucumber for behavioral driven development
6. Exeuteautomation reporting system
7. Test application:
	1. ExecuteAutomationWebApplicaion - Github