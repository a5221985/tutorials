# React Native: Advanced Concepts #
## Expo Setup ##
### Introduction - Start Here! ###
### Github Links ###
### Creation of Native Apps ###
1. Different ways of using Expo:
	1. React Native CLI - install generate and run projects
	2. Expo XDE, Create React Native App - 
	3. Sketch -

### Why Expo? ###
1. Download Expo XDE -
	1. [http://expo.io](http://expo.io)
2. Why:
	1. React Native CLI -> React Native App -installed onto-> RN App
	2. Our JS Code -> JS Packager (hosted by React Native CLI) -fed into-> Phone
3. Expo ensures we can run on actual device
	1. Expo XDE -> JS Packager -> Expo App -log Output-> Expo XDE
	2. Our App Code ->
4. Vanilla React Native:
	1. Basic Components
	2. Basic Device APIs - Reading photos, getting location
	3. Nasty Setup on Simulators
5. Expo: (gives APIs that we do with hand in Vanilla React Native)
	1. Everything React Native Does
	2. Extra Device APIs - direct access to Camera
	3. Easy Push Notifications
	4. Easy On Device Testing
	5. Common Extra Components - Map a user can interact with

### Creation of Our First App ###
1. Open Expo XDE
2. Generate a project
3. New Project
	1. Blank
	2. swipe
	3. Save it
4. Install Expo app on device:
	1. App Store -> Expo Client -> Get
5. Click Send Link
6. Opening an emulator/simulator
	1. Click on Device
	2. Open an iOS Simulator

## Animations with React Native ##
### Animation Systems ###
1. Single component that demos animation
	1. A card that rotates
2. Animation systems in React Native
	1. LayoutAnimation
		1. Easy to setup!
		2. Not much control
		3. Some things might get animated that we don't want to be
	2. Animated - more control
		1. Far more complicated to set up
		2. Allows for more complicated animations
		3. You probably need this if you want to handle gesture animations

### The Animation Module ###
1. Values: value valueXY (current position of element being animated)
2. Types: Spring, Decay, Timing (how is animation changing)
3. Components: View, Text, Image (Apply animation's current position to actual component)
4. Simple example: Circle move from top left to bottom right
	1. Open the project in atom
	2. 

### Animation from Square One ###
### Moving a Ball ###
### How Animations Work ###
### Animation from Another Angle ###
### Swipe Deck Props ###
### Component Boilerplate ###
### Deck Data ###
### Interplay Between Components ###
### Customizing Individual Cards ###

## Handling Gestures ##
### The Pan Responder System ###
### Pan Responder's Event Handlers ###
### The Gesture Object ###
### Dragging a Card ###

## Applying Animation Styling ##
### Animating Single Cards ###
### How to Rotate Elements ###
### Interpolating Rotation Values ###
### Linear Relations with Interpolation ###
### Limiting Rotation with Interpolation ###
### Springing Back to Default ###
### Detecting Minimum Swipe Distance ###
### Programmatic Animation ###
### Forcing Swipes ###
### Callbacks on Swipe Completion ###

## Component Reusability ##
### Writing Reusable Components ###
### The DefaultProps System ###
### Resetting Card Position ###
### Advancing the Deck ###
### Handling Empty Lists ###
### Getting the Cards to Stack ###
### Troubleshooting Flashing Images ###
### Cascading Card List ###
### Animating Advancing Cards ###
### Resetting the Index ###
### Deck Wrapup ###

## One Time Password Authentication ##
### Review of Common Auth Flows ###
### The Details of One Time Passwords ###
### Tech Stack with Google Cloud Functions ###
### Traditional Servers vs Google Cloud Functions ###
### Layout of Google Cloud Functions ###
### Firebase Project Setup ###
### Deploying a Firebase Project ###
### Testing Deployed Functions ###
### Project File Structure ###
### The Request and Response Objects ###
### Generating a Service Account ###
### Sanitizing User Inputs ###
### Creation of New Users ###
### Testing New User Creation ###

## Twilio Integration ##
### Texting from Twilio ###
### Twilio Credentials ###
### Accessing Saved Users ###
### Quick Note ###
### Sending Texts to Users ###
### Generating Access Codes ###
### Verifying One Time Passwords ###
### Invalidating Used Codes ###
### Generating JWT's ###

## Client Side One Time Passwords ##
### Transitioning to React Native ###
### App Bolierplate ###
### Defining Instance Properties ###
### Invoking Cloud Functions ###
### Refactoring with Async/Await ###
### Debugging with Async/Await ###
### Async/Await on User Signin ###
### Capturing Tokens ###
### Firebase Auth with a JWT ###
### Breather and Review ###

## Bringing it All Together ##
### App Overview ###
### Screen Walkthrough ###
### More Screen Walkthroughs ###
### App Challenges and Solutions ###
### Screens vs Components ###
### React Native Navigation Options ###
### React Native in Practice ###
### Screen Bolierplate ###
### Implementing the First Navigator ###
### Nesting Navigators ###
### Wiring Up Stack Navigators ###
### Class vs Instance Properties ###
### Customization with Header Options ###
### Programmatic Navigation ###
### Styling the NavBar ###
### The Welcome Screen ###
### Styling the Welcome Screen ###
### Even More Welcome Screen Styling! ###
### Navigation from the Welcome Screen ###
### More on Welcome Screen Navigation ###

## Facebook Authentication ##
### Facebook Auth Flow ###
### The Facebook Dev Console ###
### Redux Setup ###
### Using Async Storage ###
### Crazy Async/Await Syntax ###
### Logging in With Facebook ###
### Testing Facebook's Login Flow ###
### Quick Note ###
### World's Biggest Gotcha ###
### The Auth Reducer ###
### Skipping the Auth Screen ###
### Testing Auth Flow ###
### Advancing the Welcome Screen ###
### Resolving the Loading Screen ###

## MapViews on React Native ##
### Showing a Map ###
### Interacting with the MapView ###
### Working around MapView Issues ###
### The Indeed Jobs API ###
### Location API Mismatch ###
### Converting LatLong to Zip Code ###
### Fetching a List of Jobs ###
### Issuing Action Creators from MapScreen ###
### The Jobs Reducer ###
### Navigating from Action Creators ###
### The Deck Screen ###
### Importing the Deck Component ###
### Applying the Swipe Component ###
### Styling Job Cards ###
### Customizing MapViews ###
### Dynamic Key Props ###
### One More Swipe Deck Fix ###
### Liking a Job ###
### Considering Only Unique Jobs ###
### The Review Screen ###
### Rendering a List of Liked Jobs ###
### Applying to Jobs ###
### Mapping a Jobs Location ###
### Styling the Job Card ###
### Clearing Liked Jobs ###
### Redirecting Back to the Map ###
### Callback Gotcha ###
### Tab Bar Icons ###
### Tab Bar Config ###
### Android Specific Fixes ###

## Offline Data Persistence ##
### Push Notifications and Data Persistence ###
### Persiting Application State ###
### Wiring Up Redux Persist ###
### How Redux Persist Works ###
### Redux Persist - Huge Gotcha! ###

## Push Notifications ##
### Push Notification Overview ###
### Registering For Push Notifications ###
### Generating Push Tokens ###
### Testing Notifications ###
### More on Notifications and Wrapup ###