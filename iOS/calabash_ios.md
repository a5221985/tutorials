# Calabash-IOS #
## How to run .ipa files on devices ##
1. Links:
	1. [https://www.youtube.com/redirect?event=video_description&v=ud7CO-vLqfE&redir_token=9IKuPBjrhWS2gg_b5qIlIx8PiYp8MTUzNDc2ODIyOEAxNTM0NjgxODI4&q=http%3A%2F%2Fgamua.com%2Fblog%2F2012%2F03%2Fhow-to-deploy-ios-apps-to-the-iphone-via-the-command-line%2F](https://www.youtube.com/redirect?event=video_description&v=ud7CO-vLqfE&redir_token=9IKuPBjrhWS2gg_b5qIlIx8PiYp8MTUzNDc2ODIyOEAxNTM0NjgxODI4&q=http%3A%2F%2Fgamua.com%2Fblog%2F2012%2F03%2Fhow-to-deploy-ios-apps-to-the-iphone-via-the-command-line%2F)
	2. [https://www.youtube.com/redirect?event=video_description&v=ud7CO-vLqfE&redir_token=9IKuPBjrhWS2gg_b5qIlIx8PiYp8MTUzNDc2ODIyOEAxNTM0NjgxODI4&q=http%3A%2F%2Fstackoverflow.com%2Fquestions%2F5265292%2Fxcode-4-create-ipa-file-instead-of-xcarchive](https://www.youtube.com/redirect?event=video_description&v=ud7CO-vLqfE&redir_token=9IKuPBjrhWS2gg_b5qIlIx8PiYp8MTUzNDc2ODIyOEAxNTM0NjgxODI4&q=http%3A%2F%2Fstackoverflow.com%2Fquestions%2F5265292%2Fxcode-4-create-ipa-file-instead-of-xcarchive)
	2. Commands:

			ruby transporter_chief.rb ~/Desktop/WorkPress.ipa --verbose
			DEVICE_ENDPOINT=http://192.168.1.4:37265 calabash-ios console
	
		1. IP address is of the device

	3. Device and mac on same wifi
		1. ipa file compiled with calabash framework
2. XCode:
	1. Product > Build For > Acrhiving
	2. Product > Archive
	3. Window > Organizer
		1. Select most recent one
		2. Distribute
			1. Save for Enterprise or Ad-Hoc Deployment
3. Installing *.ipa on device
	1. Download transporter chief
	2. Execute command:

			ruby transporter_chief.rb ~/Desktop/WorkPress.ipa

		1. Pushes to device
	3. Launch app in device manually
		1. Goto Settings, wifi, select same network as the Mac
			1. Check IP address
4. Run the following:

		NO_LAUNCH=1 DEVICE_ENDPOINT=http://192.168.1.4:37265 calabash-ios console

	1. Opens console
5. Run to check if calabash is installed and device is responding

		query("*")

6. Running tests:
	1. Goto folder that has xcode project
	2. Run cucumber command
		
			bundle exec cucumber

## Verify elements on screen and write tests using predefined steps ##
1. Test cases using predefined steps
2. Example:

		Feature: Running a test
			As an iOS developer
			I want to have a sample feature file
			So I can begin testing quickly

			Scenario: Example steps
				Given I am on the Welcome Screen
				Then I wait
				Then I see the "Welcome to WordPress"

## Grouping step definitions ##
## Configure ruby mine with calabash ##
## Setup for projects with workspace ##
## Understanding calabash architecture (Mobile Automation) ##
## Setup verification ##
## Writing custom steps using console irb ##
## Calabash iOS - Setup from Scratch ##
## iOS Setup Queries Tableview ##
## Calabash-iOS Setup/ Verification/ Execute Console Query ##
## Running Calabash Tests on Remote Test Server Using Testmunk Android ##