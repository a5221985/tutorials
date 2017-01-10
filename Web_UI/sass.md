# SASS #

## Installation ##
1. [sassmeister.com](sassmeister.com)
2. sass is written in ruby
3. Local installation
	1. Mac OSX, Linux
		1. `gem -v`
		2. `sudo gem install sass`
		3. `sass -v`
	2. Windows:
		1. Download Ruby 1.9.3
		2. Double click to install
		3. Open cmd in admin mode
			1. `gem install sass`
			2. `sass -v`
4. Prerequisite:
	1. `sudo apt-get install ruby -y`


## SASS Commands ##
1. `sass -h` **(M)**

		cd desktop
		sass-convert Example.scss Example.sass
		sass-convert Example.sass Example.scss

2. Convert scss to css

		sass Example.scss:Example.css
	
	1. Exmaple.map: used for debugging

3. Convert dynamically

		sass --watch Example.scss:Example.css
