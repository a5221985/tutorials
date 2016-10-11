### Robotium Introduction
##### Introduction
1. BDD ensures that all stakeholders are on same page
2. App under test (AUT) - Motile
3. Robotium: test automation framework for android native and hybrid apps.
4. Works for source code and apk files
5. We can write
	1. Functional tests
	2. System tests
	3. Acceptance tests
6. Robotium Remote Control:
	1. to run test cases on pc
	2. Components:
		1. Messenger: SAFS TCP communication service on Android.
		2. TestRunner: InstrumentationTestRunner for robotium remote control. It receives remote command and control data from remote controller and reports success, failure and results through messenger
7. JBehave: BDD framework for implementing stories based on test scenarios and which business owners, business analysts, testers and software developers can understand.

##### Building up Understanding
1. Robotium API: used for writing test cases.
	1. It instruments app to simulate user actions to verify assertions and comes up with report
	2. Android apps run on DVM (Davlik Virtual Machine)
	3. Robotium instruments AUT and runs on DVM
	4. JBehave works on JVM and converts user stories into JUnit based test cases.
	5. Robotium remote control: runs on JVM.

##### How to implement
1. Step 1: write text stories covering test case scenarios
2. Step 2: Pass test cases to Robotium Remote controller (which will launch AUT, execute test cases, generate test result report)
3. Story

		If AUT loaded successfully
		verify activity name is MainActivity
		
		@author <author name>
		
		Given screen loaded
		When activity name is MainActivity
		Then success
		When activity name is not MainActivity
		Then fail

##### Map Teststeps
		
		public class TestMotile {
			private Solo solo;
			
			@Given("screen loaded")
			public void LoadScreen(String vActivityName) {
				solo = getActivity();
			}
			
			/*
			* verify that specific screen is
			* loaded successfully
			*/
			@When("activity name is MainActivity $vActivityName")
			public void verifyActivity(String vActivityName) {
				solo.assertCurrentActivity("Activity not loaded")
			}
			
			@Then("success")
			public void success(Boolean status) {
				Assert.assertTrue("Error loading activity", status);
			}
		}

##### Configuration
1. Class required to link textual stories with Java class

		public class config extends JUnitStory {
			@Override
			public Configuration configuration() {
				//To find stories
				return new MostUsefulConfiguration().useStoryLeader(new LoadFromClasspath(this.getClass())).useStoryReporterBuilder(new StoryReporterBuilder().withDefaultFormats().withFormats(Format.CONSOLE, Formet.TXT));
			}
			// Link the test case
			@Override
			public InjectableStepsFactory stepsFactory() {
				return new InstanceStepsFactory(configuration(), new testMotile());
			}
		}


##### Finalizing
1. Instruction for installation
	1. 

#### Conclusion