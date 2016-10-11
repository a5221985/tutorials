### Robotium
1. Test automation framework for Android native/hybrid apps
2. Types of tests:
	1. Functional Tests
	2. System tests
	3. Acceptance tests
3. Robotium remote control
	1. It can run on PC
	2. Modules:
		1. Messenger: SAFS TCP communication service.
		2. TestRunner: InstrumentationTestRunner. TestRunner receives remote command and control data and reports success, failure, results using messenger service
4. Robotium Recorder:
	1. Plugin
	2. Professional android test cases
5. Benefits:
	1. Android Studio and Eclipse Plugins are available
	2. With Robotium recorder, we can record user actions for app under test
	3. Support for native and hybrid apps
	4. Can be used with source code or apk
	5. Can be triggered from commandline
	6. Supports all Android versions
6. Limitations
	1. No support from flash and web apps
	2. Only one device at a time
	3. Many apps cannot be tested in one test
	4. No cross platform testing

#### Ecplise IDE Plugin
1. Pre-requisites
	1. \>= Java 1.5
	2. Android SDK
	3. Set Environment variables for JDK and Android SDK
2. Process:
	1. Recorder Installation
	2. Recording mobile test sequence
	3. Eiditing Test flow
	4. Executing Test for target stages
3. Procedure
	1. Install homebrew:
		1. `$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
	2. Install adb
		1. `brew install android-platform-tools`
	3. Start using adb
		1. `adb devices`