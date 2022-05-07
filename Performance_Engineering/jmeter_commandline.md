# How to Run JMeter in Non GUI Mode #
## Introduction ##
1. JMeter is used to analyze and measure the performance of web applications
2. JMeter also offers other services
3. Disadvantages of GUI mode:
	1. GUI mode does have limitation which slows down CPU utilization while running recorded script
	2. Multiple listeners affect JMeter performance
4. Solution: Run script in Non-GUI mode
	1. We can drive more requests per second out of JMeter with non-GUI mode

## Why to Use JMeter in Non GUI/Command line Mode ##
1. Increase in threads after certain limit crashes JMeter in GUI mode
2. For heavy tests scenarios, JMeter consumes memory and CPU which might affect test results
3. To increase JMeter capabilities
	1. More requests per second

## Running JMeter in Command Line Mode ##
### View Test Result ###
