# Xamarin Test Cloud: Writing Your First Calabash Test #
1. `calabash-ios gen`
2. `calabash-android gen`

## Using Bundler ##
1. `bundler init`

		source "https://rubygems.org"
		
		gem 'calabash-cucumber', '0.16.3'
		gem 'calabash-android', '0.5.14'
		gem 'xamarin-test-cloud', '1.1.2'
		
2. `bundle install`
	1. `Gemfile.lock`: all dependencies installed
3. `bundle exec calabash-ios version`
4. Writing features
	1. `support`: shared source code between step definitions
5. Example: credit_card_validation.feature

		Feature: Credit Card Validation
			Credit card numbers must be exactly 16 digits
		
		Scenario: Credit card number is too short
			Given I use the native keyboard to enter "123456" into the input text box
			And then touch the "Validate" button
			Then I see the text "Credit card number is too short"
			
6. `cucumber`
7. `credit_card_validation.rb`

		Given(/^I use the native keyboard to enter "(.*?)" into the input text box$/) do |arg1|
			pending
		end
		
		Given(/^then touch the "(.*?)" button$/) do |arg1|
			pending
		end
		
8. Xamarin Test Cloud (components.xamarin.com)
	1. `Xamarin.Calabash.Start();`

			#if DEBUG
			Xamarin.Calabash.Start();
			#endif
			
9. Calabash Console:

		calabash-ios console
		start_test_server_in_background
		query("*")
		query("UITextField marked:'CreditCardTextField'")
		touch("UITextField marked:'CreditCardTextField'")
		keyboard_enter_text("123456")
		query("UIButton")
		query("UIButton marked:'ValidateButton'")
		touch("UIButton marked:'ValidateButton'")
		query("UILabel marked:'ErrorMessagesTextField' {text CONTAINS '#{arg1}'}")
		
10. Calabash step definition:

		Given(/^I use the native keyboard to enter "(.*?)" into the input text box$/) do |arg1|
			touch("UITextField marked:'CreditCardTextField'")
			wait_for_keyboard
			keyboard_enter_text(arg1)
		end
		
		Given(/^then touch the "(.*?)" button$/) do |arg1|
			touch("UIButton marked:'ValidateButton'")
		end
		
		Then(/^I see the text"(.*?)"$/) do |arg1|
			text_view = query("UILabel marked:'ErrorMessagesTextField' {text CONTAINS '#{arg1}'}")
			false "The error message '#{arg1}' is not visible in the View." unless text_view.any?
		end
			