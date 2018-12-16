# Mobile Automation: Cucumber Calabash #

## Setting Up `cucumber.yml` ##
1. Add `config/cucumber.yml`: Stores common cucumber commands that we want to run multiple times
	1. Profiles:
	
			android: --tags @android -r /features/android_step_definitions -s /features/android_support
			active: --tags @active --format pretty --format html --out report.html

		1. When `android` profile is used, it looks up for all `@android` tags

				@android
				Scenario: ...
					...

				@active
				Scenario: ...

			1. Marks a test that is being actively worked on
		2. Android specific step defitions and support
2. Running:

		bundle exec clabash-android run <file>.apk -P active

3. Generating report:
	
		--format pretty --format html --out report.html