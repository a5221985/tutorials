# Android Studio Emulator #
1. Default emulator that comes with Android Studio is recommended

## Step 1: Set up Android Studio's tools ##
1. Install Android Studio 3.0+
2. Go to *Preferences* -> *Appearance & Behavior* -> *System Settings* -> *Android SDK*
	1. Click *SDK Tools*
		1. Atleast one version of *Android SDK Build-Tools* must be installed

### Steps ###
1. Copy or remember the path listed in box that says "Android SDK Location"
2. In macOS or Linux:
	1. Add Android SDK location to PATH using `~/.bash_profile` or `~/.bash_rc`
	
			export ANDROID_SDK=/Users/myuser/Library/Android/sdk
			
	2. On macOS add `platform-tools` to `~/.bash_profile` or `~/.bash_rc`
	
			export PATH=/Users/myuser/Library/Android/sdk/platform-tools:$PATH
			
	3. Make sure `adb` runs in terminal

### Optional: Set your path in XDE ###
1. Step 1:

		`npm install -g exp` (installs `exp` globally)
		
2. Step 2:
	1. Run `exp path`
		1. Saves `PATH` environment variable so that XDE knows where to find Android tools

## Step 2: Set up a virtual device ##
1. In Android Studio, go to *Tools* -> *Android* -> *AVD Manager*
2. Press *+ Create Virtual Device* button

### Steps ###
1. Choose the type of hardware you'd like to emulate.
	1. Testing against variety of devices is recommended
	2. Newest device to start with
2. Select OS version to load on emulator
	1. System image in *Recommmended* tab
	2. Download the image
3. Change any setting and press *Finish* to build virtual device
4. Run the device by pressing Play button in AVD Manager window
