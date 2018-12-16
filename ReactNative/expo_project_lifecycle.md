# Project Lifecycle #
## Introduction ##
1. Expo can take a project to production
2. Following is overview of tools and services that can be used on the way
3. [Technical Implementation](https://docs.expo.io/versions/latest/guides/how-expo-works.html)

	![Lifecycle of an Expo Project](project-lifecycle.png)

## Creation of an Expo Project ##
1. New expo project with desktop tool and text editor
	1. [Up and Running](https://docs.expo.io/versions/latest/guides/up-and-running.html):
		1. Project creation
		2. Running on device
		3. Make changes
2. [Convert an existing React Native app to expo app](https://docs.expo.io/versions/latest/introduction/faq.html#how-do-i-get-my-existing-react-native-project-running-with-expo)
3. [create-react-native-app](https://github.com/react-community/create-react-native-app): To generate expo app

## Developing Locally ##
1. An instance of project is served from local computer
2. [Expo Client](https://docs.expo.io/versions/latest/introduction/installation.html): Used to test project using pre-built iOS/Android app
	1. Asks for local copy of project (via localhost, LAN or tunnel)
	2. Downloads project
	3. Runs project
3. Other development tools that can be used:
	1. [debugging](https://docs.expo.io/versions/latest/guides/debugging.html)
	2. [streaming device logs](https://docs.expo.io/versions/latest/guides/logging.html)
	3. Inspecting elements
	4. Hot module reloading
	5. ...

## Publishing your Project ##
1. If **Publish** button is clicked in XDE, a minified copy of app is upoaded to CDN and a shareable url of the form `expo.io/@your-username/your-app-slug` is given
2. [Expo Client app Android](https://docs.expo.io/versions/latest/guides/publishing.html): Share link immediately with anybody with Expo Client app
3. Apple TestFlight: Used to share iOS app with others

## Updating your App ##
1. When we **Publish** changes to app, new version becomes available immediately to anybody with the link
2. [Expo SDK](https://docs.expo.io/versions/latest/sdk/index.html): Updates to Expo SDK are released frequently.
	1. Instructions for updgrading project
	2. Users will download newest copy that client supports

## Deploying to the Apple App Store and Google Play ##
1. When ready to list app officially on Apple App Store and Google Play Store:
	1. Expo can generate deployment-ready `.ipa` and `.apk` which are ready to be submitted to Apple and Google
		1. Generated on Expo servers (No Apple or Google software needed)
2. [Distributing Apps](https://docs.expo.io/versions/latest/distribution/index.html)

## Changing Native Code ##
1. If special advanced needs required not covered by Expo:
	1. [Detach to ExpoKit](https://docs.expo.io/versions/latest/expokit/index.html): Native Xcode and Android Studio representation of Expo project
2. If detached, some Expo services are not available
	1. Expo cannot generate standalone builds anymore
		1. Native builds have to be managed on our own
	2. ...