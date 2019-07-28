# iOS 11 & Swift 4 - The Complete iOS App Development Bootcamp #

## Getting Started with iOS 11 and Swift 4 ##
### What You'll Get in This Course ###
1. 20 mobile apps
	1. Swift
2. Cloud based db
3. Real time chat apps
4. Intelligent apps
5. Augmented reality (AR kit and Core ML)
6. Why are we doing something
7. Free graphics assets
	1. Photoshop files
	2. Illustrator apps

### How to Get All the Free Stuff ###
1. Bundle:
	1. Icons
	2. Gradients (background)
	3. HD Photos
	4. Faces
	5. Buttons
	6. Photoshop files
	7. Icon builders
2. 12 rules to learn to code

### Download Your Massive Asset Bundle Here ###
1. [https://www.udemy.com/ios11-app-development-bootcamp/learn/lecture/7555460#content](https://www.udemy.com/ios11-app-development-bootcamp/learn/lecture/7555460#content)

### Join the Student Community ###
1. [Join on Discord](https://discord.gg/ZMCRNA2)

### Get Monthly Tips and Tools to Level Up as a Developer ###
1. [https://www.appbrewery.co/p/newsletter/](https://www.appbrewery.co/p/newsletter/)

### Tools and Materials for iOS 11 App Development ###
1. Software and Hardware
	1. Mac - OS X
	2. Xcode (iPad, iPad Pro do not have)
2. [www.macincloud.com](www.macincloud.com)
	1. Remote connection to Mac (Xcode exists)
3. Hackintosh (Apple is strict - Physical iPhone running is not possible but simulator is supported)
	1. Dual Boot/iATKOS
	2. VMWare
	3. Delphi XE4
4. Xcode
	1. To write code
	2. Design app
	3. Run in simulator
5. MacOS Sierra (10.12.6 or above)
	1. High Siera is recommended (10.13 or above)
	2. Apple symbol > About > Software Update
		1. App Store - Mac Siera (Intermediate update)
			1. Changes: photo editing software (cool tools)
	3. XCode has iOS Simulator (notifications, apple health, apple home are tricky)
6. Universal Development (Problem - UX wont be very nice, native functionality is not so reachable, not so pretty in terms of design)
	1. Phone Gap (HTML/CSS/JS)
	2. Xamarin Tools (C#)
	3. Appcellerator Titanium (JS)
7. Ask: Do you actually need an app? Responsive website is not sufficient?
	1. Location
	2. Notification
	3. Phone related ...
8. iTunes account is enough to download to devide (Apple Developer program $99 is required when we put it in App store)
9. Uploading App to App Store

### Download Xcode 9 ###
1. Have enough hard drive (atleast 10 GB)
	1. About this Mac
		1. Storage tab
2. Make sure macOS is updated
	1. About this Mac (10.13 or above)
3. Search Xcode
	1. Click on icon
	2. Install

### A Walkthrough of the Xcode Development Environment ###
1. Open XCode - Welcome Screen
	1. Create a new Xcode project
		1. Template: iOS > Single View App (most devs)
			1. Most customizable
			2. Most flexible
			3. Other features can be added
		2. Next
			1. Product Name: Hello World
			2. Team: None
			3. Organization Name: Company name or own full name
			4. Organization Identifier: reverse domain name structure
			5. Language: Swift
			6. Unchecked
		3. Next
			1. Save: Desktop/
		4. Create
2. Structure
	1. Status Bar (similar to other apps)
		1. Play (builds and runs onto simulator or physical devide)
		2. Stop (stop running)
		3. Opens simulator
			1. Bezel app
				1. Window > Show Device Bezels (uncheck)
		4. Progress Bar
		5. Errors and Warnings
		6. Standard editor button (right)
		7. Assistant editor (2 screens) - for designing
			1. Canvas on left hand side
			2. Code on right hand side
		8. Version editor
			1. Compare and contrast with previous versions of code
		9. Popping out three main panes
			1. Left: Navigator pane (tabs)
				1. Project navigator - all files making up app
				2. Find navigator - search within project (folders, files, ...)
				3. Error pane - errors will show up here (debugging)
					1. Errors show up in different places
					2. Error and file is shown in navigator
					3. Warnings are also shown (yello triangles)
		10. Breakpoints
			1. Clicking on left margin
				1. Click once to disable
				2. Drag it away to remove it
		11. Bottom pane
			1. Debug area - error messages when app crashes
				1. Post in Q&A forum
			2. Printing to tell what is going on in the app
		12. Maximize code area
		13. RightSide pane - utility pane
			1. Useful for design
3. Go to Main.storyboard - to design the app
	1. Object Library (bottom right)
		1. Selected by default
			1. Search for label
				1. Drag and drop
				2. Double click/ use utilities pane to edit
					1. Shield symbol - text
		2. Drag to increase the text area
	2. Select View
		1. Attribute inspector - change a property
			1. Color - Crayon
			2. Change font
				1. Ruler symbol - position, width and height
4. We can change the canvas size
	1. Bottom - click for different phone or rotate
5. Document outline - (just beside diagram)
	1. We can rename
		1. Label 1
		2. Label 2
6. + or - increase or decrease size
	1. Pinch in our out in track pad
	2. Two fingers can move the canvas
7. Play

### Download the Swift Cheat Sheet and a Map of Xcode ###
### The Anatomy of an iOS App ###
1. Components of iPhone App
	1. View - what you see on screen (buttons, labels, ...)
	2. ViewController - what should happen when user taps a button or what should happen when a user has data to display
	3. Model - What controls data (manipulates data, prepares data to be served to ViewController)
2. Contact app
	1. ViewController asks Model for contacts (phone numbers, images, ...)
	2. Model passes the data to ViewController
	3. ViewController decides how to display on the View
	4. View displays on the screen (in a beautiful format)
	5. If delete contact is tapped, ViewController will contact Model and asks it to remove from it's database
3. MVC?
	1. More versetile
	2. Easier to manage
4. Each layer can be changed independently
5. It separates different components into individual packages of code
	1. Bug is easier to identify
6. Other design patterns will be covered later

## iOS Interface Builder - The $999 App ##
### The I Am Rich App ###
1. Flat design
	1. UI elements
	2. Assets
	3. Organizing image assets

### How to Properly Construct a New Xcode Project ###
1. Xcode: v 9.x
2. Three ways of starting project:
	1. File > New > Project
	2. Create New Xcode Project
3. Xcode Keyboard Shortcuts
4. New project
	1. Single View App
	2. Next
	3. Product Name: I Am Rich
	4. Organization Name: Org or full name
	5. Organization Identifier: Reverse Domain Name
		1. Bundle identifier - identifies app uniquely on app store
			1. Can be changed later as well
	6. Language: Swift
	7. Uncheck rest of the boxes
	8. Next
	9. Uncheck Source Control
	10. Click Create

### What is a Bundle Identifier? ###
1. com.company.I-Am-Rich

### Let's Design the User Interface Using Storyboards ###
1. Min.storyboard (yellow files are design files)
2. LaunchScreen.storyboard (loading screen - before app comes up)
3. Assets.xcassets (image assets)
4. Design - Main.storyboard
	1. There is one blank screen
	2. Left arrow shows the sequence of app screens (starts from here)
	3. View as: iPhone 6s
5. Toggle close panes to give more space
6. Utilities pane:
	1. Bottom part
		1. Object library (circle and square)
			1. Search: label - drag and drop (margins pop up)
				1. Change Test to: I Am Rich
				2. Change font to: Custom, Helvetica Neue, Style: Thin, Size: 40 points
				3. Select label: command + + = (resizes label to fit properly)
				4. Change color to white (Chick on View > I Am Rich to find it)
				5. Clicking on View moves away from the label
				6. Select #34495E (hex color) for background
				7. Click on Ruler (right)
					1. x: 108
					2. y: 100
					3. width: 160
					4. height: 50
				8. Center Align the label

### How to Position User Interface (UI) Elements ###
1. Positioning:
	1. Grid layout
		1. Graph that is reversed (top left is origin - 0,0)
			1. x extends to the right (iPhone 6 Plus - 375 max)
			2. y extends downwards (iPhone 6 Plus - 667 max)
2. [PintCodeApp](https://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions) - gives resolutions
	1. App is used to turn drawings into code
3. Position is determined by top left corner and others are determined by size
	1. x = 46, y = 90

### Download the Pre-Prepared Image Assets Here ###
### How to Incorporate Image Assets into Your Xcode Project ###
1. Image View:
	1. Object library
		1. Search: Image View - single image or an animation described by an array of images
	2. Attributes Pan
		1. Size
		2. Background color
		3. Tint color
		4. Image
2. Design:
	1. Size inspector pane
		1. x = 53
		2. y = 250
		3. Width = 270
		4. Height = 270
3. Assets.xcassets
	1. Slots - app icon images that xcode expects
		1. App icons should be available for the slots
	2. Unzip the assets [https://www.udemy.com/ios11-app-development-bootcamp/learn/lecture/7555528#content](https://www.udemy.com/ios11-app-development-bootcamp/learn/lecture/7555528#content)
	3. Drag and drop the images into slots
	4. Drag diamond image and put it under AppIcon
		1. `@2x.png` - xcode knows to put it in 2x
4. Attributes pane:
	1. Image - start typing diamond
	2. Content mode - Aspect fit

### What's the Difference Between Points and Pixels & How to Design iOS Image Assets ###
1. Points vs Pixels
	1. Pixel - Picture element (squares)
	2. Points - measure of length (1 point = 1/72 Inch)
		1. Another example: 72 ppi - 72 pixels per inch
2. 20pt - 
	1. Retina screens - sharper
		1. 1 pixel in one point - normal screen
		2. 4 pixels in one point - retina screen
	2. 1x - single pixel per point
	3. 2x - 2 x 2 = 4 pixels per point
	4. 3x - 3 x 3 = 9 pixels per point
3. Downscaling an image
	1. Larger images with single pixel lines (downscaling will remove the lines)
4. Hence we must provide icons and images for all of the size categories required
	1. []() - all of the required icon sizes for iPhone, iPads, universal apps
	2. 

### App Icon Dimensions and a Brief History of Graphics ###
### Asset Catalogue Compiler Warning ###
### Run and Test Your App! ###

## Sideloading in iOS ##
### What is Sideloading and How Can You Get App onto Your iPhone? ###
### A Note About Sideloading and Permissions ###
### How to Sideload Your App using Xcode ###
### [Optional] How to Get a Professional Apple Developer Account ###

## Coding Challenge #1 - Using Interface Builder in Xcode ##
### What are Coding Challenges? ###
### What You Will Construct by the End of this Challenge ###
### What is GitHub and How to Download the Stub Projects ###
### Download the Project Stub Here ###
### Step 1 - Add a UILabel ###
### Step 2 - Add and Arrange the ImageView ###
### Step 3 - Design your App to your Heart's Content ###
### Show Off Your Work! ###

## Build an iOS Dice App to Learn Swift Programming Basics ##
### What You'll Make by the End of This Module ###
### Download the Pre-Prepared Image Assets Here ###
### How to Design Your App ###
### Linking Design with Code ###
### [Common Errors] IBOutlets/IBActions Debugging ###
### How to Construct Randomisation in Swift ###
### A Note About Playgrounds ###
### Data Types, Constants and Variables ###
### How to Solve the Error: "The Maximum Number of Provisioning Profiles Reached"
### Learn About Arrays in Swift and Programmatically Update the Display ###
### [How to Become a Better Programmer] The DRY Principle ###
### How to Add Motion Detection in to Your App ###
### Download the Completed App Project ###

## Coding Challenge #2 - Swift Data Types, Variables and Arrays ##
### What You'll Build in this Coding Challenge ###
### Step 1 - Creation of New Xcode Project ###
### Step 2 - Download the Image Asset's We've Already Prepared for You ###
### Step 3 - Add App Icons to Your Project ###
### Step 4 - Add the 8 Ball Images ###
### Step 5 - Setup the Canvas ###
### Step 6 - Design the App in Interface Builder ###
### Step 7 - Link the Design with Code ###
### Step 8 - Make the Ball Image Change with Your Code ###
### Step 9 - Make a Method ###
### Step 10 - Add Shake Gesture Detection ###
### If You Get Stuck ... ###
### Optional: Magic 8 Ball Solution Walk Through ###

## Programming in Swift 4 for Beginners [Using Swift Playgrounds] ##
### Introduction to the Programming Modules ###
### Comments, Print Statements and Debug Console ###
### Optional Review: Data Types, Constants and Variables ###
### Swift Functions: Part 1 - The Simple Function ###
### Swift Functions: Part 2 - Functions with Inputs ###
### Swift Functions: Part 3 - Functions with Outputs ###
### Control Flow with Conditional Statements in Swift (IF/ELSE) ###
### Download the Completed Swift Playgrounds ###
### [Challenge] Make a BMI Calculator in Swift Playgrounds ###
### Optional: BMI Calculator Challenge Solution ###
### Introduction to Loops in Swift - The For In Loop ###
### Using Loops in Your Program ###
### Optional: A Brain Teaser with Loops and the Fibonacci Sequence ###

## Apple iOS APIs - Make a Music App ##
### What You'll Make by the End of This Module ###
### Download the Skeleton Project ###
### How to Use Tags in the storyboards ###
### How to Use the Apple Documentation to Tap into Any iPhone Capability You Want ###
### The Swift 4 Programming Language Guide from Apple ###
### Incorporate AVFoundation to Play Sound ###
### Error Catching in Swift 4 - Do, Catch and Try ###
### Creation of a Method to Contain the Sound Playing Functionality ###
### [Common Swift Errors] "Index Out of Range" and How to Debug it ###
### Make the App Play a Different Sound for Each Button ###
### The Importance of "Scope" in Programming ###
### Download the Completed App Project ###

## The model-View-Controller (MVC) Design Pattern - Make a Quiz App ##
### What You'll Make by the End of This Module ###
### Download the Skeleton Project Here ###
### Set up the Project ###
### What is a Property List (.plist)? ###
### Let's Construct a Data Model ###
### Further Reading ###
### Object-Oriented Programming - What are Objects and Classes? ###
### Object-Oriented Programming (OOP) a Quick Note from Steve Jobs ###
### Constructing the Question Back Class ###
### [ELI5] The Model View Controller (MVC) Design pattern - Explain Like I'm 5 ###
### Initialise the First Question ###
### How to Progress Through the Question Bank ###
### [Debugging Practice] Using the Xcode Debug Console ###
### How to Implement a UIAlertController and Show a Popup to the User ###
### A High Level Overview of How Our App Works ###
### How to Track Progress and Score ###
### How to Incorporate Objective-C Code in to Swift ###
### Background on the Questions ###
### Download the Completed App Project ###

## Coding Challenge #3 - Control FLow - Build a Story App Like Lifeline ##
### What You'll Build in This Coding Challenge ###
### A Choose Your Own Adventure Game ###
### Step 1 - Download the Skeleton Project ###
### Step 2 - Make a Note of the Tag Properties ###
### Step 3 - Set up the Introdutory Screen ###
### Step 4 - Take the Story One Step Further ###
### Step 5 - Keeping Track of State ###
### Step 6 - Use Comparators to Let the User Progress Through the Game ###
### Optional: Destini Solution Walk Through ###

## iOS Auto Layout and Setting Constraints ##
### Why Do We Need Auto Layout? ###
### Positioning UI Elements Programmatically ###
### The Theory Behind Auto Layout ###
### Download the Starting Project Here ###
### Auto Layout in Practice - Setting Constraints ###
### [Challenge] Use What You Just Learnt to Practice Auto Layout ###
### Download the Starter Project Here ###
### Optional: Auto Layout Challenge Solution ###
### New! Auto Layout Using Stack Views ###

## Programming in Swift 4 for Intermediates ##
### Classes and Objects ###
### Constructing a New Class from Scratch ###
### Constructing Enums in Swift ###
### How to Construct an Object from a Class ###
### Class Initialization ###
### Designated and Convenience Initializers ###
### Constructing a Method ###
### Class Inheritance - The Theory ###
### How to Override an Inherited Method ###
### Class Inheritance - Putting it into Practice ###
### What are Swift Optionals?!?! ###
### Optionals Explained ###

## Cocoapods, GPS, APIs, REST and Getting Web Content - Wether App ##
### What You'll Make by the End of This Module ###
### Download the Skeleton Project Here ###
### Setting up the Skeleton Project ###
### Sign Up for a Free API Key ###
### What are Cocoapods and Why Do We Need Them? ###
### Install and Setup Cocoapods on Your System ###
### Troubleshooting Cocoapods Installation ###
### Installing New Pods in Your Xcode Project ###
### Fix for Those with a Version of Cocoapods Below 1.0.1 ###
### Completing the Pod Installation Process ###
### No Such Module Error ###
### Setting up the Location Manager to Get GPS Data from the iPhone ###
### Asking the User for Location Permissions ###
### Tapping into the GPS ###
### What is Delegation? ###
### Swift Dictionaries ###
### What are APIs? ###
### Networking with Alamofire ###
### Networking & REST Explained ###
### What is JSON and How to Parse it ###
### Creation of Weather Data Model ###
### Update the User Interface ###
### Creation and Usage of Segues in Xcode ###
### Using Delegates and Protocols in iOS App Development ###
### How to Pass Data Between View Controllers ###
### Delegates and Protocols Explained ###
### Request Weather Data Based on City Name ###
### Download the Completed App Project ###

## The Command Line and Terminal ##
### Introduction to the Command Line ###
### Command Line Shortcuts ###
### Directory and File Manipulation Using the Command Line + Bonus ###

## Coding Challenge #4 - Cocoapods, REST, APIs - Build a Bitcoin Price Tracker ##
### What You'll Build by the End of This Coding Challenge ###
### Step 1 - Check out the Skeleton Project ###
### How to Set up and Use the UIPicker Class ###
### Step 2 - Construct the API URL ###
### Step 3 - Setup Your Cocoapods for this Project ###
### Step 4 - Make Networking Calls ###
### Step 5 - Parse the JSON Data ###
### Step 6 - Update the User Interface ###
### Step 7 - Are We Rich Yet? ###
### Optional - Bitcoin Challenge Solution ###

## Cloud Database, iOS Animations and Advanced Swift - Make a WhatsApp Clone ##
### A Note About Firebase Version 4 ###
### What You Will Make ###
### What is Firebase? ###
### Download the Skeleton Project ###
### Register for an Account on Firebase ###
### Set Up Firebase for Development ###
### A Note About ProgressHUD ###
### A Note About Potential Issues You Might Encounter ###
### Saving Data to Firebase ###
### Let's Register Some Users to our App ###
### Swift Closures [Advanced Swift] ###
### The Event-Driven Nature of Apps ###
### What are Completion Handlers and How Do They Work? ###
### How Do Navigation Controllers Work and How do You Construct Them? ###
### Let's Code Up the Login Screen ###
### What are TableViews and How to Set One Up? ###
### Making a Custom Message Class ###
### A Note About Lecture 190 ###
### Learn About UI Animations in iOS and Make Our Own ###
### Let's Send Some Messages! ###
### Observing for Database Changes ###
### Bug Fix - Where's the Historical Message Data? ###
### Update the Security Setting of Your Database ###
### Let's Improve the UX - Add a Progress Spinner ###
### Improving the UI - Differentiating Between Different Users ###
### Download the Completed App Project ###

## Firebase Version 3 ##
### A Note About Firebase Version 3 ###
### What You'll Construct by the End of This Module ###
### What is Firebase? ###
### Download the Skeleton Project ###
### Register for a Free Account on Google Firebase ###
### Set up Firebase for Development ###
### Xcode 9 Bug ###
### Saving Data to Our Own Database ###
### Let's Register Some Users to Our App ###
### An Overview of Our App ###
### Swift Closures ###
### The Event Driven Nature of Mobile Apps ###
### What are Completion Handlers and How Do They Work? ###
### The Navigation Controller in iOS ###
### How to Use the Swift Guard Statement ###
### Let's Code Up the Login Screen ###
### iOS Table Views and How to Properly Set One Up ###
### Making a Custom Message Class ###
### UI Animations in iOS and How to Construct Our Own ###
### Let's Send Some Messages ###
### Observing for Real-Time Database Changes ###
### [Bug Fix] Where are the Historical Messages? ###
### Update the Security Settings for Your Database Before Your Deploy ###
### Let's Improve the User Experience (UX) of Our App ###
### Let's Improve the User Interface (UI) ###
### Download the Completed App Project ###

## Git, GitHub and Version Control ##
### Introduction to Version Control and Git ###
### Version Control Using Git and the Command Line ###
### GitHub and Remote Repositories ###
### Gitignore ###
### Cloning ###
### Branching and Merging ###
### Using Git and GitHub in Xcode 9 ###
### Forking and Pull Requests ###

## Core Data, Realm, User Defaults - Learn Persistent Local Data Storage - Today ##
### The Clear app Clone that You'll Build by the End of This Module ###
### Subclassing a UITableViewController ###
### TableView Delegate Methods and Accessories ###
### Creation of Textfield Inside UIAlert to Add New Items ###
### Why do we Need Persistent Local Data Storage? ###
### Persistent Local Data Storage Using UserDefaults ###
### UserDefauts Explained ###
### [Advanced Swift] The Swift Singleton Object ###
### Creation of a Custom Data Model ###
### [Advanced Swift] The Swift Ternary Operator ###
### Restructuring Our App with MVC ###
### The Concept of iOS Sandboxing ###
### Encoding Data with NSCoder ###
### Decoding Data with NSCoder ###
### Introduction to Databases ###
### How to Setup and Configure Core Data ###
### How to Save Data with Core Data (Create in CRUD) ###
### How to View Your SQLite Database Backend for Core Data ###
### Core Data Fundamentals ###
### Reading Data from Core Data (Read in CRUD) ###
### Updating Data with Core Data (Update in CRUD) ###
### Removing Data from Core Data (Delete in CRUD) ###
### How to Implement a UISearchBar and Querying with Core Data ###
### How to Go Back to the Original List? ###
### How to Construct Relationship Graphs in Core Data ###
### [Solution to Challenge] Setting Up CategoryViewController ###
### Adding the Delegate Method ###
### Introduction to Realm ###
### How to Save Data Using Realm (Create in CRUD) ###
### Fetching Data from Realm (Read in CRUD) ###
### Updating Data with Realm (Update in CRUD) ###
### Removing Data from Realm (Delete in CRUD) ###
### Querying Data Using Realm ###
### Review of How Our App Uses Realm for Data Persistence ###
### Making our Cells Swipeable ###
### Inheriting from SwipeTableViewController ###
### [Solution to Challenge] Inheriting from SwipeTableViewController ###
### Adding Colour to our App ###
### [Solution to Challenge] Persisting the Colour Property ###
### Creation of Gradient Flow Cells ###
### Updating the UI of the Navigation Bar ###
### The Complete App Projet ###

## Introduction to Machine Learning ##
### Introduction to Machine Learning ###
### Supervised Learning ###
### Unsupervised Learning ###
### Reinforcement Learning ###

## CoreML - How to Incorporate Machine Learning into Your iOS Apps ##
### A Quick Note About Xcode and iOS Versions ###
### What is CoreML? ###
### What we'll be making ###
### How to Import the Image Recognition Model & Enable Camera Functionality ###
### Getting Image Recognition Results Back from Our V3 Model ###
### Hotdog or Not Hotdog? ###
### Download the Completed App Project ###

## [Optional Bonus Project] Machine Learning Using IBM Watson ##
### What You'll Make by the End of This Module ###
### A Note About the Next Lecture ###
### How to Install and Use Carthage as a Dependency Manager ###
### Carthage Installation Links ###
### How to Implement the Camera and Photo Library Functionality in iOS ###
### How to Use a Pre-Trained Neural Net from IBM to Classify any Image ###
### How to Process the Data You Get Back from IBM Bluemix ###
### Let's Beautify Our App and Make it Look Like the Real Deal ###
### Download the Completed App Project ###

## Advanced CoreML - How to Convert Pre-Trained Models Using CoreML Tools ##
### What we'll be constructing ###
### Installing CoremlTools using Python PIP ###
### Converting a Caffe Model into MLModel ###
### [Challenge] - Set up a UIImagePickerController ###
### [Solution] - Setting up a UIImagePickerController ###
### [Challenge] - Getting Classifications from Our Model ###
### [Solution] - Getting Classifications from Our Model ###
### [Challenge] Adding Cocoapods to Our Project ###
### [Solution] Adding Cocoapods to Our Project ###
### [Challenge] Making HTTP GET Requests to Wikipedia Using Alamofire and REST ###
### [Solution] Making HTTP GET Requests to Wikipedia using Alamofire and REST ###
### [Challenge] Parsing the JSON Result using SwiftyJSON ###
### [Solution] Parsing the JSON Result using SwiftyJSON ###
### Displaying Images from a URL using SDWebImage ###
### [Bonus Lesson] Creation of the App Icon from Scratch and Styling the App ###
### Download the Completed App Project ###

## iOS 11 - ARKit - How to Make Augmented Reality Apps in iOS ##
### ARKit Device Compatibility ###
### Introduction to Augmented Reality and ARKit ###
### How to Setup and Configure Your Project for AR ###
### How to Construct a 3D Object in Augmented Reality ###
### Bring the Moon into Your Living Room Using AR ###
### How to Find and Import 3D Models for AR ###
### Update to ARKit Syntax ###
### How to Detect Horizontal Planes in the Real World ###
### How to Place Our Dice in 3D Using Touch ###
### How to Animate 3D Objects in AR ###
### How to Animate and Roll all the 3D Dice at Once ###
### How to Remove Our 3D Objects from the AR Scene ###
### [Optional Lesson] Refactoring Our Code for Better Readability ###
### Download the Completed App Project ###

## [Bonus Project 2] - Make an Augmented Reality Pokemon Go App Using Vuforia ##
### Install Unity 5 ###
### Setting up Vuforia and Unity 5 ###
### Conjuring Your Pikachu in Augmented Reality ###

## iOS 11 - Advanced ARKit - How to Measure Real World Dimensions in an ARKit App ##
### What We'll Make by the End of This Module ###
### Adding the Start and End Measuring Point in 3D ###
### A Note About the Next Lecture ###
### Measuring the Distance in AR ###
### Creation of 3D Text to Display in AR ###
### Enabling New Measurements ###
### Download the Completed App Project ###

## How to Submit Your App to the App Store ##
### How to Publish Your App on to the App Store ###
### Resources to Check Our When You're Ready to Publish ###
### Useful Tools to Help You with App Submissions ###

## Next Steps ##
### Where to Go From Here? ###
### Resources ###

## The Complete App Design Course ##
### Introduction to App Design ###
### Why Design is Important for an App Entrepreneur ###
### Designer vs. Non-Designer Thinking ###

## Colour Theory ##
### Understanding the Mood of Your Colour Palette ###
### How to Combine Colours to Construct Colour Palette ###
### Tools for Designing with Colour ###
### Further Reading on Designing with Colour ###

## Typography ##
### Introduction to Typography ###
### The Serif Type Family - Origins and Use ###
### The Sans-Serif Type Family - Origins and Use ###
### How Typography Determines Readability ###
### How to Combine Fonts Like a Pro ###
### Further Reading on Typography ###

## The Fundamentals of User Interface (UI) Design for Mobile ##
### What is User Interface (UI) Design? ###
### The Tour Guide Approach to UI Design ###
### The Importance of Alignment ###
### What is Good Practice in Interaction Design ###
### Colour in User Interface Design ###
### The Many Ways of Designing Text Overlays ###
### How to Be an Attention Architect ###
### Further Reading on User Interface Design ###

## The Fundamentals of User Experience (UX) Design for Mobile ##
### What is User Experience (UX) Design? ###
### Usability ###
### Asking for Permissions ###
### User Profiling ###
### Form vs. Function ###
### Consistency ###
### Simplicity ###
### Don't Make me Think ###
### Onboarding ###
### Idiot Boxes ###
### Further Reading on User Experience Design ###

## Designing for iOS vs. Android - What are the Important Differences? ##
### Android vs. iOS Design ###
### Navigation ###
### The Devil is in the Details ###
### Differences in Icon Design ###
### Flat Design vs. Material Design ###
### Differences in Establishing Visual Hierarchy ###
### iOS and Android Design Guidelines ###

## A Step-By-Step Guide to a Professional Mobile Designer's Workflow ##
### Step 1 - Design Patterns and Colour Palettes ###
### Where to Find Design Patterns and Colour Palettes ###
### Step 2 - How to Construct a User Flow Diagram ###
### Step 3 - How to Construct Wireframes ###
### Wireframes Resources ###
### Step 4 - How to Construct Professional Mockups ###
### Tools for Creation of Mockups ###
### How to Use Sketch to Construct Mockups ###
### [Optional] Watch me Construct a Mock up Using Sketch ###
### How to Use Canva to Construct Mockups ###
### Your Turn to Construct Your Own Mockups ###
### Tools and Resources for Constructing Mockups ###
### Step 5 - How to Construct an Animated App Prototype ###
### Tools and Resources for Constructing Prototypes ###
### Prototyping with Keynote ###
### Prototyping with Marvel ###
### Your Turn Construct a Prototype ###

## Design Resources ##
### Where to Find Free-for-Commercial-Use Image Assets ###
### Where to Find Free-for-Commercial-Use Icons ###
### How to Keep Designing and Improving ###

## The Complete App Marketing Course - How to Make Money From Your Apps ##
### The Importance of App Marketing ###
### The Fallacy of Build it and They Will Come ###

## Idea Validation - Save Yourself Time and Money ##
### The Importance of Idea Validation ###
### The Simplest Way of Validating Your Idea - The Starbucks Method ###
### Using Google Trends to Estimate the Size of Your Market ###
### The Landing Page Validation Method ###
### How to Create a Landing Page Website in Less than an Hour ###
### Creation of a Minimum Viable Product ###
### Using Crowd-Funding to Validate and Fund Your Idea ###

## App Monetisation Methods - How to Make Money from Your App ##
### How to Monetise Your App on iOS vs. Android ###
### When You Should Construct a Paid App ###
### When to use In-App Advertisements ###
### How You Thought About These Alternative Monetisation Models? ###

## How to Optimize Your App Store Listing ##
### How to Get an App Icon Designed Without Breaking the Bank ###
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
### If at First You Don't Succeed... ###
### Cross Promotion ###
### Social Referrals and Social Queuing ###
### How to Make Social Media Work for You ###

## How to Get Press Coverage for Your App ##
### Do I Need a PR Agency? ###
### Not All Press is Constructed Equal ###
### How to Craft Your Story ###
### How to Craft Your Pitch ###
### How to Figure Out Whih Journalists to Pitch ###
### How to Find Anyone's Email Address ###
### How to Pitch a Journalist ###
### Just-Add-Water Journalist Pitch Email ###
### Establishing a Relationship with a Journalist ###
### What if You Still Can't Get Anyone to Write About You? ###
### Final Tips on Getting Press ###

## How to Get Your App Featured on the App Store ##
### How to Get Featured on the App Store? ###
### "Only on the App Store" ###
### Work with the Corporate Midset ###
### Native vs. Cross-Platform Apps ###
### Tips and Tricks for Getting Featured ###

## App Store Optimisation - How to Rank Higher on the App Store Search Algorithm ##
### What is App Store Optimisation (ASO)? ###
### Top Tips to Optimise Your App Store Listing ###
### My Complete ASO Workflow ###
### Using Apple Search Ads as a Research Tool ###
### Early vs. Late Game Strategies ###
### Differences Between Google Play and Apple App Store ###

## The Right Way of Using Paid Advertising to Drive App Downloads ##
### When to Use Paid Advertising or App Marketing ###
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

## Write Hat vs. Black Hat Methods of Getting More App Downloads and Revenue ##
### White Hat Techniques ###
### Black Hat Techniques ###

## Bonus: How to Build Your App Showcase Website ##
### A 5 Second Way of Building a Web Page for Your iOS App ###
### How to Use Bootstrap to Build Your App Showcase Website ###

## Your Turn ##
### It's Time to Work Our Your Marketing Strategy ###
### Monthly Student-Built App Showcase ###

## Ask Me Anything Series ##
### Ask Me Anything - Questions for Angela - Episode 1 ###
### Ask Me Anything - Questions for Angela - Episode 2 ###
### Ask Me Anything - Quesitons for Angela - Episode 3 ###
 
