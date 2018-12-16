# Calabash iOS #
## Xamarin Test Cloud: Calabash Environment Configuration ##
1. Prerequisites
	1. XCode
	2. Xamarin Studio
	3. Simulators/Emulators
2. Bash profile:

		vi ~/.bash_profile

3. Package manager:
	1. Install Homebrew
4. xcode commandline tools

		xcode-select -p

	1. If not exist

			xcode-select --install
			xcode-select -p

5. Install rvm (or rbenv)
6. Source bash profile

		source ~/.bash_profile

7. Install ruby

		rvm install 2.1.7
		rvm --default use 2.1.7
		ruby -v

8. Install `calabash-android`, `calabash-cucumber`, `xamarin-test-cloud`
9. Open bash profile

		vi ~/.bash_profile

		export GEM_HOME=~/.calabash
		export GEM_PATH=~/.calabash
		export PATH="$PATH:$HOME/.calabash/bin"

		source ~/.bash_profile

10. Check versions:

		calabash-ios version
		calabash-android version
		test-cloud version

11. Install bundler

		gem install bundler

		bundler -v


