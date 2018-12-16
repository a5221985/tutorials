# Android Oreo #
## Set up for Android Development ##
### How the Course is Structured ###
1. 10 popular apps from app store
2. Beautiful animations
3. In Java using Android Studio

### How to Get All the Free Stuff ###
1. Bundle:
	1. Icons
	2. Gradients
	3. HD Photos
	4. Faces
	5. Buttons
	6. Icon builders
2. 12 Rules to Learn to Code book:

### Download Your Massive Bundle Here ###
1. [Bundle of Assets](http://www.appbrewery.co/p/bonus-assets-for-course)
	1. Key Code: UDEMY-ANDROID

### Developing for Android - Tools for this Course ###
1. Tools
	1. Mac or PC
	2. Magnetic disk is not preferred
	3. Android Studio
		1. For logic
		2. Design look and feel
	4. Physical android device/ Emulator

### Setup on Mac: Android Studio, the JDK & Connecting a Physical Device ###
1. Mac setup:
	1. JDK 8
		1. JRE
		2. `java -version`
	2. Android Studio
		1. Configure
		2. Check for updates
	3. Physical device:
		1. Settings
		2. About
		3. Build number - 7 times
		4. Developer Options
			1. USB debugging
			2. Enable (phone when plugged is recognized)
		5. Connect phone
			1. New Project
				1. Blank project
			2. Click Android Monitor
				1. Plug in Android device
					1. Log messages

### Setup on Windows: Android Studio, the JDK & Connecting a Physical Device ###
1. Check if it is 32 bit or 64 bit OS
2. JDK 8
	1. Control panel
	2. Java
	3. About - 8
3. Android Studio
	1. Open Android studio
	2. Configure
		1. Check for Updates
4. Physical device
	1. ...
5. Connect device
	1. Start a new project
	2. Click on Android Monitor
		1. ADB - enables communication between computer and android device
	3. Connect device
		1. Check cable or buy a good one
6. Check how it is connected:
	1. Connected as MTP (Media Transfer Protocol)
		1. Change it to the above otherwise
7. Windows needs driver
	1. Automatic is possible
	2. Manual:
		1. Android Studio > User Guide
		2. Install OEM USB Drivers
			1. Select relevant driver and install

### Troubleshooting: Android Device Not Recognised ###
1. Icon on top right corner
2. USB debugging is enabled
3. Change USB options when you connect
	1. Pull down notification drawer
	2. Tap on "Connected as media device" or "USB Options" or "USB Charging this device"
	3. Protocol choices: PTP, MTP
		1. Change to PTP (Camera) and check
		2. Change to MTP (Media Device) and check
	4. Trust the computer that it is connected to
4. Try different USB cable or port
5. Drivers:
	1. Check if driver is installed
		1. Android developer page
		2. [developer.android.com/studio/run/oem-usb/html](developer.android.com/studio/run/oem-usb/html)

### Configure Android Studio for Productivity: Themes, Auto-Import & SDKs ###
1. Directory: C:\Projects (file path length restriction is handled)
2. Android Studio
	1. File > Settings
		1. Appearance & Behavior
			1. Theme: Darcula
		2. Editor
			1. Colors & Fonts
				1. Font
					1. Save custom theme
						1. Duplicate: MyTheme
						2. Size: 13
3. Auto Import - automatically add import statements
	1. Settings:
		1. Editor
			1. General
				1. Auto Import
					1. Insert imports on paste: All
					2. Add unambiguous imports on the fly
3. Naming Conventions
	1. Settings
		1. Editor
			1. Code Style
				1. Java
					1. Code Generation
						1. Field: m
						2. Static field: s
4. SDK Platforms
	1. Settings
		1.System Settings
			1. Android SDK
				1. Pick latest version
				2. Pick the version running on physical device
	2. If partially installed:
		1. Show package details

### How to Set Up an Android Emulator with Hardware Acceleration ###
1. Virtual Device: 
	1. Don't have to use physical device
	2. Test on devices you don't own
	3. Run an app on two devices simultaneously (chat app)
2. Check Processor
	1. AMD
	2. Intel
		1. Mac
	3. System > Intel/AMD
3. Intel
	1. Hardware acceleration can be enabled
		1. HAXM: Hardware Accelerated Execution Manager
	2. Configure
		1. SDK Manager
			1. SDK Tools
				1. Check: Intel x86 Emulator Accelerator (HAXM...)
				2. Recommended option
4. System images:
	1. SDK Platforms
		1. Show Package Details
			1. Google APIs Intel x86 Atom System Image (Intel Processor)
			2. No Arm for Oreo so pick from Android 7.0
				1. Google APIs ARM EABI v7a System Image
	2. For Android wear:
		1. Download Android wear system image
5. AVD Manager
	1. Click Create Virtual Device
	2. Phone > Nexus 5X (Play store)
	3. Oreo - Recommended
		1. Download (x86 - intel system images)
		2. Other images (Arm - AMD system images)
		3. Name: New Nexus 5X API 26 Emulator
6. Click Play to start emulator
7. Click on Logcat:
	1. Listed as android device connected to the computer
8. Alternative to android emulators
	1. Genymotion. [genymotion.com](genymotion.com)
		1. Commercial product

### Slow PC? Make it Run Faster with these Performance Tricks [Windows] ###
1. Tips:
	1. Close all other programs
		1. Chrome
	2. Set priority high for android studio
	3. Disable or temporarily suspend anti virus
	4. Optimize Windows
		1. Control panel
		2. System
		3. Advanced System settings
		4. Performance

## Build the "I am Rich" App to learn about project structure and XML [Tutorial] ##
### What Will We Build? ###
1. Get familiar working with Android studio
2. How to arrange user interface elements on screen
3. How XML (Extensible Markup Language)

### Creation of a New Android Studio Project and Choosing the API Level ###
1. File > New > New Project
	1. Application name: Minted
	2. Company domain: londonappbrewery.com
	3. package name: identifying app
		1. Google play: package name is in URL
	4. Project location: C:/Projects/Minted
		1. Click ...
			1. Select Folder
2. Next
	1. Phone and Tablet
		1. API 16: Android 4.1 (Jelly Bean)
			1. Help me choose
3. Template
	1. Empty Activity (minimal code included in the project)
	2. Name: MainActivity
	3. Layout Name: activity_main
	4. Generate Layout File
	5. Backwards Compatibility
4. Gradle:
	1. Build tool

### Working with the Layout Editor, Strings, and App Themes ###
1. MainActivity.java
2. Layout: activity_main.xml
	1. App > res > layout > activity_main.xml
	2. Double click: Layout editor
		1. Design view
		2. Text view: xml
3. Replace xml code:
	1. XML-Starter-Code-Snippet.txt
		1. Copy and replace in activity_main.xml
			1. Replaces Constraint Layout with Relative Layout (easier to work with)
4. AppTheme: examples
	1. values > styles.xml
		1. Theme information: `Theme.AppCompat.Light.DarkActionBar`
			1. `Theme.AppCompat.Light.NoActionBar`
5. Component Tree:
	1. Elements in the layout as a tree
		1. Right hand pane: Attributes
			1. text: I am Rich!
			2. textSize: 30sp (unit for text size - scalable pixels)
	2. Show warnings or errors: right side top corner
		1. strings should be in a separate file `strings.xml`
			
				<string name="title">I am Rich!</string>

	3. Replace text:
		1. Pick a resource ...
		2. Select title string
			1. `@string/title`

### Adding Graphics to a Project and using ImageViews ###
1. Download [I am Rich Assets.zip](https://www.udemy.com/android-app-development-with-java/learn/v4/t/lecture/7079214?start=0)
2. Extract to Downloads
3. `res`
	1. `drawable`: contains graphics shown on screen
		1. Right click > Reveal in Finder
		2. Add Diamond image to drawable folder
4. Select ImageView and drag it to center
	1. Select the diamond_image
		1. `srcCompat`: `@drawable/diamond_image`
	2. Dont directly select blue of imageView
		1. ImageView sits on top of textView (re-arrange)
	3. Select `activity_main` in tree
		1. `background`: ...
			1. color: `@color/colorPrimaryDark`
		2. `TextView`:
			1. `textColor`: `#FFFFFF`
			2. `layout_centerHorizontal`: Check
			3. `textSize`: `50sp`

### What is XML and How Does it Work? ###
1. GML - Generalized Markup Language - History
2. SGML - Standard Generaized Markup Language
	1. US Department of Defence
	2. CALS - Continuous Acquisition and Life-cycle Support (App)
3. XML - Standardized
	1. Document can be represented as a tree
		1. Easy to locate elements
4. Layout - Component tree
	1. RelativeLayout
		1. ImageView
			1. diamond_image.png
		2. TextView
			1. I am Rich!
5. Example:

		<MEMO>
			<TO>Agent Sully</TO>
			<FROM>Agent Mulder</FROM>
			<BODY>
				<P>
				...
					<LOC>
						Britannia Mine Museum
					</LOC>
				</P>
			</BODY>
		</MEMO>

	1. XML - set of puncutation
		1. vocabulary
		2. Syntax
	2. Examples:
		1. HTML
		2. RSS - Rich Site Summary
		3. SVG - Scalable Vector Graphics (PDF as XML)

### XML Code Demystified ###
1. XML: Format for represented structured information as text
	1. Markup language
	2. Adds structure to text using tags
		1. tag: `<name>`
			1. Opening and closing tags
		2. Element: `<name>sdfdsf</name>`
		3. Attribute: name-value pairs inside opening tag `android:text`, `android:layout_width`
			1. Properties for the element
			2. Example:

					<TextView
						android:text="@string/hello_world"
						android:layout_width="wrap_content"
						android:layout_height="wrap_content" />

### Setting a Custom Launcher Icon ###
1. Launcher icons:
	1. mipmap > ic_launcher.png... -
		1. Each one is for a type of phone
2. right click on mipmap
	1. add `mipmap-hdpi` icons in `mipmap-hdpi`
	2. add `mipmap-mdpi` icons in `mipmap-mdpi`
	3. add `mipmap-xhdpi` icons in `mipmap-xhdpi`
	4. add `mipmap-xxhdpi` icons in `mipmap-xxhdpi`
3. Views:
	1. Android View
	2. Project View
		1. How files are structured on HardDrive
4. `AndroidManifest.xml` - boss file (app/manifests/AndroidManifest.xml)
	1. Metadata of the app

			android:icon="@mipmap/diamond_launcher"
			...
			android:roundIcon="@mipmap/diamond_launcher_round"

### Running the App to Test it Out! ###
1. Plugin phone
	1. Click on Android Monitor
	2. Run > Run 'app' (Play symbol)
		2. Select device
2. Gradle packages into apk and deploys it

### Design the App's Screen in the Layout XML ###
1. Click `Text`
	1. Click `Preview`
2. Components:
	1. RelativeView
		1. ImageView
		2. TextView
			1. `android:layout_height="match_parent"` - revert it
			2. `android:layout_centerHorizontal="false"` - revert it
			3. Hover over to get property

### Understand the Android Project Structure ###
1. Project - collection of files
	1. Functionality is split into less complex structure
2. Structure:
	1. app/manifests (information about app that needs to be communicated to the Android OS or Google Playstore)
		1. AndroidManifest.xml
			1. Name of app
			2. Icons
			3. Theme
			4. What it can do
	2. app/java: (like technician) - all programming logic is in Java files
	3. app/res:
		1. Elements related to design and content of the app
			1. drawable - graphics and image assets used in the app
			2. layout - designs for phone and tablet screens
			3. mipmap - app icons
			4. values - files
				1. strings.xml - easier to translate (spanish strings.xml)
				2. styles.xml - theme for the app
				3. colors.xml - hex code is mapped to a color name and we can use the color name instead of the hex code in the app
				4. dimens.xml
					1. hardcoded pixel values

							<resources>
								<!-- Default screen margins, per the Android Design guidelines ... -->
								<dimen name="activity_horizontal_margin">16dp</dimen>
								<dimen name="activity_vertical_margin">16dp</dimen>
							</resources>
		
	4. Gradle Scripts
		1. build.gradle
			1. Builds
			2. Runs tests
			3. Packages into apk file

### The Wonderful World of Version Control: Installing Git ###
1. Git - version control system
	1. Tracks changes to project
	2. We can restore older version
2. [git-for-windows.github.io](git-for-windows.github.io)
	1. `C:\Program Files\Git`
	2. Use Default console window
	3. Install
3. Android Studio:
	1. Settings
		1. Version Control
			1. Git
				1. Path to Git executable: `C:\Program Files\Git\bin\git.exe`
4. [git-osx-installer](https://sourceforge.net/projects/git-osx-installer/files/)
	1. Install

### Git Installation Links ###

## Coding Challenge #1 - Using the Layout Editor in Android Studio and Github ##
### What are the Coding Challenges? ###
1. Each app builds on concepts developed previously
2. Put skills into practice!!! to internalize

### What You Will Build ###
1. I am Poor app
2. GitHub:
3. Criteria for success:
	1. Successfully import our project from Github
	2. Arrange the TextView and ImageView user interface elements on screen
	3. Set the app icon
	4. Build and run the app on a device or emulator

### Step 1: Import the Project from GitHub and Open it in Android Studio ###
1. GitHub account [https://github.com/londonappbrewery/I-Am-Poor-Android](https://github.com/londonappbrewery/I-Am-Poor-Android), [https://education.github.com](https://education.github.com)
	1. Click on Assignment link
	2. Accept this assignment
	3. Navigate to assignment link
2. Settings> Version Control > GitHub
	1. Login and password
	2. Test
	3. Okay
3. Check out project from Github
	1. Git Repository URL: i-am-poor-android-<username>
	2. Clone
4. Click `Install missing platform(s) and sync project` (android-23 sdk)
5. Gradle:
	1. Plugin versions updated
	2. Build tool version updated
6. vcs file - Android studio uses it to keep track of versions of our project
7. Click `Update Build Tools version and sync project`

### Step 2: Add a TextView ###
1. Open Project Pane on the left if you don't see it
2. Click the arrows to explode the directories of project. Navigate to the `res/layout` directory and open `activity_main.xml`
3. Drag `TextView` onto phone Preview. Set `TextView` text as "I am Poor". Set `TextView` font size 40xp and set text colour to black
4. Position the `TextView` how you see fit

### Step 3: Add an ImageView ###
### Step 4: Run the App ###
### Step 5: How to Submit Your Assignment on Github [Optional] ###
1. Update repository
	1. Commit changes to project
	2. Push to repository
		1. VCS
		2. Commit Changes
		3. Enter commit message
		4. Commit and Push
		5. Push
		6. Refresh in Github

### I am Poor Challenge Solution ###

## Build a Dice App to Learn Java & XML Fundamentals [Tutorial] ##
### What Will We Make? ###
1. Roll dice
	1. Layout editor
	2. XML manipulation
	3. Coding

### Start a New Project and Style the App with the Theme Editor ###
1. Start new project
	1. App name: Dicee
	2. Company domain: londonappbrewery.com
	3. Projec Location: Projects folder
	4. Minimum SDK: API 16 (default)
	5. Empty Activity
	6. Backwards Compatibility (older device compatability)
		1. AppCompat (Components that are backwards compatible have this in their name)
2. app/res/layout/activity_main.xml (layout template may change with version)
	1. values/styles.xml
		1. Tools/Android/Theme Editor (styling of various android components in the app)
			1. Theme on right hand side
				1. Parent Theme can be changed
					1. NoActionBar -> AppCompat.... (for app compatibility)
						1. AppCompat.Light...
	2. styles.xml reflects the changes
3. [Download Dicee Assets](http://goo.gl/gGq4FD)
	1. Extract the contents
		1. C:\...\Downloads

### Generating App Icons and Adding Graphics to a Project ###
1. res/mipmap
	1. ic_launcher.png (xxxhdpi) (dpi = dots per inch)
		1. h - high
		2. x - extra
	2. Documentation: xxxhdpi - 192 x 192 px
		1. ldpi - 36 x 36 px
2. App might run on screens of any resolution
3. Right click on res
	1. New > Image Asset
	2. Launcher Icons
		1. Asset Type: Image
			1. Select Dicee-Launch-....png (large version is base)
		2. Next (where they are going to go)
			1. Replaces the icons
	3. Double click launcher icons
4. If we did not replace, click on AndroidManifest.xml and change `android:icon="@mipmap/ic_launcher"`
5. Open `Dicee Android Assets`
	1. Add drawable-... to App
		1. Right click on res
			1. Reveal in Finder
				1. Drag and drop all drawable folders

### Designing a Screen with Nested Layouts ###
1. Select Design and/or blueprint
2. Copy source code in the description of the video and place it in activity_main.xml
3. Pic Nexus 6
	1. gsmarena.com
4. Drag Button to center of screen
	1. strings.xml

			<string name="button_text">Roll</string>

5. activity_main.xml

		android:text="@string/button_text"

6. id

		android:id="@+id/rollButton"

7. Challenge: blue button text white
8. Drag RelativeLayout to ComponentTree
	1. Drag rollButton to into RelativeLayout
9. Change root element to LinearLayout (arranges vertically or horizontally)

		android:orientation="vertical"
		android:background="@drawable/newbackground"

10. Add RelativeLayout to LinearLayout

		RelativeLayout
			imageView (Dicee Image)

11. First RelativeLayout
	1. layout_height - wrap_content (as big as what it contains)
12. Drag LinearLayout to LinearLayout
	1. layout_height - wrap_content
13. Drag and drop two imageViews (dice1 and dice2) into LinearLayout
14. Put RelativeLayout at the top
	1. layout_height - 250dp
	2. layout_centerHorizontal - check
15. gravity > center_horizontal (another option)
16. activity_main.xml

		android:id="@+id/image_logo"

		android:id="@+id/image_leftDice"

		android:id="@+id/image_rightDice"

### Using Variables and Linking Layout Elements to Java Code ###
1. Java Code
	1. MainActivity.java
		1. Steps:
			1. A variable for layout element
			2. Store layout element in variable

					Button rollButton;
					rollButton = (Button) findViewById(R.id.rollButton);
					
					ImageView leftDice = (ImageView) findViewById(R.id.image_leftDice);
					ImageView rightDice = (ImageView) findViewById(R.id.image_rightDice);

### Use the Logcat and a Listener to Check if a Button is Pressed ###


### Creation of Random Numbers in Java ###
### Java Arrays and How to Use Them ###
### Why did the programmer quit his job? ###
### Debugging Practice: Compilation and Build Errors ###
### Debugging Practice: The App Has Stopped. What to do after a Crash ###
### Show Off Your Work ###
### The Code for the Complete Dicee Project ###

## Coding Challenge #2 - Data Types, Variables and Arrays ##
### What You Will Build ###
### Debugging: Cannot Resolve symbol 'AppCompatActivity' ###
### Step 1: Import the Skeleton Project from Github ###
### Step 2: Change the App's Theme ###
### Step 3: Download the Graphics for the App ###
### Step 4: Generate New App Icons ###
### Step 5: Add the Graphics to the Project ###
### Step 6: Design the App in the Layout XML ###
### Step 7: Link the Layout to Java Code ###
### Step 8: Check for Bugs and Predict the Future ###
### Step 9: Submit Your Coursework [Optional] ###
### Magic 8 Ball Challenge Solution ###

## Java Programming for Beginners ##
### Introduction to the Programming Modules ###
### Setting up a Pure Java Project in Android Studio ###
### Code Blocks, the main() Method, and Code Compilation Explained ###
### Comments, Variables and Types ###
### Why you'll want to comment your code ###
### Methods Part 1 - Defining and Calling a Method ###
### Methods Part 2 - Adding Parameters ###
### Methods Part 3 - Multiple Parameters and Returning a Value ###
### Control Flow: Conditional Statements (IF/ELSE) ###
### Make a BMI Calculator [Challenge] ###

## Build a Music App [Tutorial] ##
### What Will We Make? ###
### Setting Up the Project & Using Colours as Resources ###
### How to Use Android Documentation and Other Resources ###
### Calling the Constructor to Create a SoundPool ###
### Member Variables and the Importance of Scope ###
### Using the onClick Property instead of a Listener ###
### How to Play a Sound in Your App using the SoundPool ###
### The Code for the Complete Xylophone Project ###

## Build a Quiz App and Learn about the MVD Design Pattern [Tutorial] ##
### What Will We Make? ###
### Import & Familiarise Yourself with the Skeleton Project ###
### Understand Casting & Link the Layout to the Java Code ###
### Set an OnClickListener & Implement a Toast Message ###
### Creation of Model Class & Generate Code with Android Studio ###
### Boolean - A Data Type that Holds One of Two Values ###
### The Model View Controller (MVC) Design Pattern and Why We Use It ###
### Retrieve Quiz Questions from an Array and Display them on Screen ###
### Update Questions on Screen and Interpret Errors in the Logcat ###
### Check the User's Answer and Give Feedback ###
### Working with the Progress Bar and Tracking Score ###
### Fixing the Screen Orientation and Displaying an AlertDialog ###
### An Overview of How an Android App Works ###
### The Activity Lifecycle ###
### Saving State using the Bundle and Null Pointer Exceptions ###
### The Difference between Zero and Null ###
### The Code for the Complete Quizzler Project ###

## Coding Challenge #3 - Control Flow - Build a Story App Like Lifeline ##
### What You'll Create ###
### Step 1: Setup the Project ###
### Step 2: Examine the activity_main.xml and the strings.xml ###
### Step 3: Creation of Variables for the Views ###
### Step 4: Wire up the Views to the Java Code ###
### Step 5: Detect Clicks on the Buttons ###
### Step 6: Take the Adventure One Step Further ###
### Step 7: Creation of a Variable to Track the Player's Path ###
### Step 8: Complete the Game Using Conditionals to Check the State ###
### Step 9: Submit Your Project [Optional] ###
### Destini Challenge Solution ###

## Working with the Constraint Layout & Creation of Multiple Layouts ##
### Converting to a Constraint Layout & Designing for Multiple Screens ###
### Setting Constraints and Using Built-In Styles ###
### Linking Views to Each Other ###
### Using Guidelines to Position Layout Elements ###
### Automatically Inferring Constraints with Android Studio ###
### Resource Qualifiers and Layouts for Landscape Mode ###
### Internationalisation, Resource Qualifiers and the Translations Editor ###
### Creation of a Landscape Layout and Adding Content Descriptions for Accessibility ###
### Complete Layout Source Code ###

## Java Programming for Intermediates ##
### Set up a Standard Java Project in Android Studio ###
### Virtual Machines & Program Entry Points: main() vs the Android Intent Filter ###
### Classes and Objects Demystified ###
### Fields, the Dot Notation, and an Object's State ###
### Using Getters/Setters & Access Modifiers: Public v.s. Private ###
### No-Argument Constructors v.s. Parameterised Constructors ###
### Object Behaviour & Using Methods ###
### The static Keyword: Class Variables & Class Methods ###
### Inheritance, the protected Modifier & the @Override Annotation ###
### Bonus Question ###

## Build a Weather App - Use GPS and APIs to Get Data frm the Web [Tutorial] ##
### What Will We Build? ###
### Project Setup & Overview ###
### Get your Own free API Key (App ID) ###
### Gradle Project & Module Scripts and Android SDK Compatibility ###
### Adding External Libraries as Dependencies with Gradle ###
### Manage App Permissions in the Android Manifest ###
### Runtime Permissions & Using the LocationManager to Get Your Location ###
### Networking, HTTP Requests, Status Codes & APIs ###
### HTTP Response Cheat Sheet ###
### Making the HTTP Request for Weather Data ###
### The JSON Format Explained ###
### Do you know JSON? ###
### Parse the JSON and Handle Exceptions with a Try-Catch Block ###
### Update the UI and Show the Weather to the User ###
### Creation of a New Activity and Link Activity & Layout ###
### Using Intents to Navigate Between Activities ###
### Intent Extras and EditText onEditorAction() Callbacks ###
### API Call with a City Name, the Logical NOT and Freeing Up Resources ###
### The Complete Code for the Clima App ###

## Coding Challenge #4 - REST & APIs - Build a Bitcoin Price Tracker ##
### What You Will Build ###
### Step 1: Import the Project ###
### Step 2: Check out the Files in the Stub Project ###
### Step 3: Add App Permissions to Access the Internet ###
### Step 4: Add the Android Asynchronous Http Client Dependency ###
### Step 5: Set up the Spinner View ###
### Step 6: Interpret the API Docs and Request a JSON ###
### Step 7: Make a GET Request Using the Networking Code ###
### Step 8: Parse the JSON and update the User Interface ###
### Step 9: Submit Your Assignment on Github [Optional] ###
### Bitcoin Ticker Challenge Solution ###

## Build a WhatsApp Clone and learn to use Cloud Data Storage [Tutorial] ##
### What Will We Build? ###
### Project Tour and Overview of Existing Code ###
### What is Firebase? ###
### Creation of a New Project on Firebase and Configure the Android App ###
### Registering New Users, Validating Data & the Builder Design Pattern ###
### Storing Data Locally (on Device) using SharedPreferences ###
### Handling User Login with FirebaseAuth ###
### Retrieve the Locally Stored Data ###
### Creation of Model Class & Save Data to the Cloud ###
### ListViews, Adapters & ArrayLists ###
### Implementing the ViewHolder Pattern ###
### Retrieve Data from Firebase with a ChildEventListener ###
### Styling Views with 9 Patch Images ###
### Download the Complete Code for the FlashChat App ###

## App Design Course Introduction ##
### Introduction to the App Design Course ###
### Why is Design Important for an App Entrepreneur? ###
### Designer versus Non-Designer Thinking ###

## Colour Theory ##
### Understanding the Mood of Your Colour Palette ###
### How to Combine Colours and Formulate Colour Palettes ###
### Tools for Designing with Colour ###
### Further Reading on Designing with Colour ###

## Typography ##
### Introduction to Typography ###
### The Serif Font Family - Origins and Use ###
### The Sans Serif Font Family - Origins and Use ###
### How Typography Determines Readability ###
### How to Combine Fonts Like a Pro ###
### Further Reading about Typography ###

## The Fundamentals of User Interface (UI) Design for Mobile ##
### Introduction to User Interface Design ###
### The Tour Guide Approach to UI Design ###
### The Importance of Alignment ###
### What is Good Practice in Interaction Design? ###
### Colours in User Interface Design ###
### The Many Ways of Designing Text Overlays ###
### How to Be an Attention Architect ###
### Further Reading on User Interface Design ###

## The Fundamentals of User Experience (UX) Design for Mobile ##
### Introduction to User Experience Design ###
### Usability ###
### Asking for Permissions ###
### User Profiling ###
### Form vs. Function ###
### Consistency ###
### Simplicity ###
### Don't Make Me Think ###
### Onboarding ###
### Idio Boxes ###
### Further Reading on User Experience Design ###

## Designing for iOS vs. Android - What are the Important Differences? ##
### Android vs. iOS Design ###
### Navigation ###
### The Details ###
### Differences in Icon Design ###
### Flat vs. Material Design ###
### Differences in Establishing Visual Hierarchy ###
### iOS and Android Design Guidelines ###

## Putting it All Together - A Step-By-Step Guide to the Mobile Design Workflow ##
### Step 1: Design Patterns and Colour Palletes ###
### Step 2: How to Design User Flow Diagrams ###
### Step 3: How to Build Wireframes ###
### Step 4: How to Build Professional Mockups ###
### How to Use Sketch (4.1) to Build Mockups for Mobile ###
### How to Use Canva to Build Mockups ###
### Your Turn to Build Your Own Mockups ###
### Step 5: How to Build Animated App Prototypes ###
### How to Build Animated Prototypes with Keynote ###
### How to Build Prototypes with Mavel App ###
### Your Turn to Build a Prototype ###

## Resources ##
### Where to Find Free-For-Commercial Use Image Assets ###
### Where to Find Free-For-Commercial Use Icons ###
### Keep Learning and Improving! ###

## The Complete App Marketing Course ##
### The Importance of App Merketing ###
### The Fallacy of Build it and They Will Come ###

## Idea Validation - Save Yourself Time and Money ##
### The Importance of Idea Validation ###
### The Simplest Way to Validating Your Idea - The Starbucks Method ###
### Using Google Trends to Estimate the Size of Your Market ###
### The Landing Page Validation Method ###
### How to Build a Landing Page Website in Less Than an Hour ###
### Creation of a Minimum Viable Product ###
### Using Crowd-funding to Validate and Fund Your Idea ###

## App Monetisation Methods - How to Make Money From Your App ##
### How to Monetise Your App on iOS vs. Android ###
### When You Should Build a Paid App ###
### When to use In-App Advertisements ###
### How You Thought About These Alternative Monetisation Models? ###

## How to Optimize Your App Store Listing ##
### How to Get an App icon Designed without Breating the Bank ###
### Split Testing for Super Success ###
### What Makes a Good App Icon? ###
### The Dos and Don'ts of Making App Screenshots ###
### Tools for Building Screenshots ###

## Growth Hacking Techniques for App Downloads ##
### Your First 1000 Customers ###
### Building an Email List ###
### The All Important Landing Page ###
### Blogging Your Way to Success ###
### Content Marketing for App Downloads ###
### How to Successfully Launch on Product Hunt ###
### How to Launch on Beta List ###
### How to Launch on Hacker News ###
### If At First You Don't Succeed... ###
### Cross Promotion ###
### Social Referrals and Social Queuing ###
### How to Make Social Media Work for You ###

## How to Get Press Coverage for Your App ##
### Do I need a PR Agency ###
### Not All Press is Created Equal ###
### How to Craft Your Story ###
### How to Craft Your Pitch ###
### How to Figure Out Which Journalists to Pitch ###
### How to Find Anyone's Email Address ###
### How to Pitch a Journalist ###
### Just-Add-Water Journalist Pitch Email ###
### Establishing a Relationship with a Journalist ###
### What if You Still Can't Get Anyone to Write About You? ###
### Final Tips on Getting Press ###

## How to Get Your App Features on the App Store ##
### How to Get Featured on the App Store? ###
### "Only on the App Store" ###
### Work with the Corporate Mindset ###
### Native vs. Cross-Platform Apps ###
### Tips and Tricks for Gettings Featured ###

## App Store Optimization - How to Rank Higher on the App Store Search Algorithm ##
### What is App Store Optimisation (ASO)? ###
### Top Tips to Optimise Your App Store Listing ###
### My Complete ASO Workflow ###
### Using Apple Search Ads as a Research Tool ###
### Early vs. Late Game Strategies ###
### Differences Between Google Play and Apple App Store ###

## The Right Way of Using Paid Advertising to Drive App Downloads ##
### When to use Paid Advertising or App Marketing ###
### Always Test Before You Advertise ###
### Which Platform to Advertise On? ###
### How Much Does it Cost? ###
### How to Setup Your Facebook Ad ###
### Use Your Competitors' Ad Budget ###
### Where Can I Find More Customers? ###
### One Weird Trick to Get More Money from Apple ###

## App Store Reviews and Ratings ##
### How to Get More 5 Star Ratings and Reviews ###
### Use This Free Tools to Monitor Your App Reviews ###

## How to Use App Analytics to Increase User Retention ##
### How to use App Analytics to Increase User Retention ###

## White Hat vs. Black Hat Methods of Getting More App Downloads and Revenue ##
### White Hat Techniques ###
### Black Hat Techniques ###

## Bonus: How to Build Your App Showcase Website ##
### A 5 Second Way of Building a Web Page for Your iOS App ###
### How to Use Bootstrap to Build Your App Showcase Website ###

## Your Turn ##
### It's Time to Work Out Your Marketing Strategy ###
### Monthly Student Built App Showcase ###