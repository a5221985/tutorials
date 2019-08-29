# Running On Device #
1. Must test app on actual device before releasing it to users
2. Topic
	1. Steps to run RN app on a device and prepare it for production
3. If Expo CLI or Create React Native App is used, preview app by scanning QR code with Expo app
	1. To build and run app on device
		1. Eject and install the native code dependencies from [Getting Started Guide](https://facebook.github.io/react-native/docs/getting-started) 

## Running Your App on iOS Devices ##
### Plug in Your Device via USB ###
1. Connect iOS device to Mac using USB to Lightning cable
2. Navigate to `ios` folder in project in Xcode
	1. Open `.xcodeproj` file
	2. Open `.xcworkspace` if using CocoaPods
3. If first time - register device for development
	1. Open **Product** menu in Xcode menubar
	2. Go to **Destination**
	3. Select device from list
		1. Xcode will register device for development

### Configure Code Signing ###
1. Register for [Apple developer account](https://developer.apple.com/)
2. Select project in Xcode Project Navigator
3. Select main target (it should share same name as project)
4. Look for "General" tab
5. Go to "Signing"
6. Make sure Apple developer account or team is selected under Team dropdown
7. Do the same for tests target (ends with Tests)

### Build and Run Your App ###
1. Device should be listed as build target in Xcode toolbar
	1. It will also appear in Devices pane
2. Press **Build and run** (command + R)
3. Or select **Run** from **Product** menu
	1. App should launch on device shortly
	2. If issues: [Launching Your App on a Device](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/LaunchingYourApponDevices/LaunchingYourApponDevices.html#//apple_ref/doc/uid/TP40012582-CH27-SW4)

## Connecting to the Development Server ##
1. Need to be on same Wi-Fi network as the computer
2. Shake device to open [Developer menu](https://facebook.github.io/react-native/docs/debugging#accessing-the-in-app-developer-menu)
	1. Enable Live Reload
		1. App will reload whenever JS code has changed

## Troubleshooting ##
1. If issues:
	1. Ensure Mac and device are on same network and can reach each other
		1. We may have to use device's personal hotspot
2. When trying to connect to dev server, we may get [red screen with an error](https://facebook.github.io/react-native/docs/debugging#in-app-errors-and-warnings)
	1. Connection to [http://localhost:8081/debugger-proxy?role=client](https://facebook.github.io/react-native/docs/running-on-device) timed out
		1. Are you running node proxy?
		2. Check if you have right IP address in `RCTWebSocketExecutor.m`
	2. Solution:
		1. Wi-Fi network:
			1. Ensure laptop and phone are on same Wi-Fi network
		2. IP address
			1. Ensure build script has detected the IP of machine correctly
			2. Open **Report navigator** tab
				1. Select **Build** and search for `xip.io`
					1. IP address embedded in app should match machine's IP address plus domain `.xip.io` (`10.0.1.123.xip.io`)
		3. Network/ Router Configuration
			1. RN uses wildcard DNS service **xip.io** to address your device
				1. Apple ATS prohibits URLs with IP address instead of domain names
				2. Developer's networks are usually not set up to resolve local hostnames
			2. Some routers have security features to prevent DNS Servers from resolving to anything in local IP range
				1. Run the following to check if we can resolve `xip.io` address

						nslookup 10.0.1.123.xip.io

					1. If not **xip.io** service is down?
					2. Router is preventing it?
		4. To use **xip.io** behind router:
			1. Configure phone to use Google DNS (8.8.8.8)
			2. Disable appropriate security feature in router

## Building Your App for Production ##
1. Process is same as any iOS app but with some additional considerations to take into account
	1. [If Expo Read Building Standalone Apps](https://docs.expo.io/versions/latest/distribution/building-standalone-apps/)

### Enable App Transport Security ###
1. App transport security - security feature introduced in iOS 9 that rejects all HTTP requests not sent over HTTPS
	1. HTTP traffic may be blocked including dev RN server
	2. ATS is disabled for `localhost` by default in RN projects to make development easier
		1. Re-enable ATS prior to building app for prod by removing `localhost` from `NSExceptionDomains` dictionary in `Info.plist` file in `ios/` folder
			1. Can be done in Xcode
				1. Open target properties under Info pane
				2. Edit App Transport Security Settings entry
	3. [this post](http://ste.vn/2015/06/10/configuring-app-transport-security-ios-9-osx-10-11/) - To use HTTP resources in prod

### Configure Release Scheme ###
1. `Release` scheme in Xcode - To build app for distribution in App Store
	1. Automatically disables in-app Developer menu
		1. Prevents users from accessing menu in prod
	2. Binds JS locally
		1. We can put app on a device and test whilst not connected to computer
2. Configuration:
	1. Go to **Product** > **Scheme** > **Edit Scheme**
	2. Select **Run** tab in sidebar
	3. Set Build Configuration dropdown to `Release`

#### Pro Tips ####
1. As app bundle grows in size, you may start to see a white screen flash between your splash screen and display root app view
	1. In this case, add the following code to `AppDelegate.m` to keep splash screen displayed during transition

			// Place this code after "[self.window makeKeyAndVisible]" and before "return YES;"
			UIView* launchScreenView = [[[NSBundle mainBundle] loadNibNamed:@"LaunchScreen" ownere:self options:nil] objectAtIndex:0];
			launchScreenView.frame = self.window.bounds;
			rootView.laodingView = launchScreenView;

		1. If a physical device is targeted, static bundle is built (even in debug)
			1. To save time, turn off bundle generation in Debug by adding following to shell script in Xcode Build Phase `Bundle React Native code and image`:

					if [ "${CONFIGURATION}" == "DEBUG" ]; then
						export SKIP_BUNDLING=true
					fi

### Build App for Release ###
1. Tap **Command** + **B** to select **Product** > **Build** from menu
	1. Once app is built for release, distribute the app to beta testers and submit the app to App Store
2. Using RN CLI:
	1. `--configuration` with value `Release`

			react-native run-ios --configuration Release

## Running Your App on Android Devices ##
### Enable Debugging Over USB2 ###
### Plug in Your Device via USB ###
### Run Your App ###

## Connecting to the Development Server ##
### Method 1: Using adb reverse (recommended) ###
### Method 2: Connect via Wi-Fi ###
### Build Your App for Production ###
