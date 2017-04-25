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
		
### SASS Commands ###
1. `sass -h`: options, inputs and outputs
2. `cd Desktop/SASS_Resources`
3. Converting SCSS to SASS file:
	1. `sass-convert Example.scss Example.sass` **(M)**
4. Reversing:
	1. `sass-convert Example.sass Example.scss`
5. Converting SCSS to CSS file:
	1. `sass Example.scss:Example.css` **(M)**
		1. Generates a map file as well (used for debugging)
6. Automatically convert to CSS
	1. `sass --watch Example.scss:Example.css` **(M)**
		1. When we change SCSS file, CSS file automatically changes
7. Automatically convert CSS in a directory:
	1. `sass --watch Directory:CSS`
		1. Generates `CSS` directory
8. Remove `CSS`
9. `sass Example.scss:Example.css`
10. Choosing format:
	1. `sass Examle.scss:Example.css --style compact`
	1. `sass Example.scss:Example.css --style compressed`
	3. `sass Example.scss:Example.css --style expanded`
11. Map:
	1. `sass Example.scss:Example.css --style expanded --sourcemap=none`
		1. Map file is not generated
12. Watching:
	1. `sass --watch Example:scss:Example.css --style expanded --sourcemap=none`
	2. `sass --watch Directory:CSS --style compact --sourcemap=none`

### Environment Setup ###
1. Editor: Atom
2. Splitting pane:
	1. View > Panes > Split Right
3. Splitting further:
	1. Select Left side pane
	2. View > Panes > Split Down
4. New file:
	1. Select left side top pane
	2. New file > SCSS.scss
	3. Disable Tree view
	4. Select bottom left pane
	5. New file > SASS.sass
	6. Select right side pane
	7. New file > CSS.css
5. `cd Desktop`
	1. Watch and automatically convert
		1. `sass --watch SCSS.scss:CSS.css --style expanded --sourcemap=none`
	2. convert to SASS
		1. `sass --convert SCSS.scss SASS.sass`
6. There is only syntactical difference between SCSS and SASS
	1. SASS ommits `;`
	2. SASS omits `{` and `}`
		1. Indents instead

## Basic API ##
### Variables ###
1. Example: Using variables instead of color value
2. Syntax: SCSS

		$<variable-name>: <value>;

3. Syntax: SASS
	
		$<variable-name>: <value>
		
4. Data types:
	1. numerical: 600px, 600em
	2. Floating point value: 1.5
	3. Integer: 20
5. Example:

		$width: 600px;
		$int: 20;
		
		div {
			width: $width;
			line-height: $int;
		}
		
6. Strings:
	1. "<double-quote>"
	2. '<single-quote>'
	3. <no-quotes>
	4. Example:
	
			$string: "../images/hello.jpg"
	
			background: url($string) no-repeat red;

7. CSS Selector:
	
		div .#{ $stringSelector } {
			background: ...
		}
		
8. SASS converts rgb(...) to hex
9. List data type:
	1. List is a sequence separated by spaces or commas
	2. Example: `$list: 1px 1px 3px black, 3px 3px 4px #ccc;`
10. Maps:
11. bool
12. null: `$null`: null - no value

### Inheritance ###
1. Types:
	1. Selector inheritance
	
			$el: button;
			
			#parent {
				background-color: green;
			
				#child-One, .another, .evenmore {
					background: yellow;
					font-size: 1em;
				}
				
				#child-Two {
					font-weight: 200;
					
					#inner-child .content {
						background: blue;
					}
				}
			}
			
			&.HasClass {
				background-color: blue;
				font-weight: bold;
				font-style: italic
			}
	
	2. Property inheritance
		
			%shared {
				background: green;
				font-size: 2em;
			}
			
			.content { @extend %shared; }

		1. %: marks a place holder and no CSS is produced (This can be shared across CSS elements)
		2. 
		
				#parent %shared .child {
					background: green;
					font-size: 2em;
				}
			
				.content { @extend %shared; }
				
		3. Other properties:
			
				.content { 
					@extend %shared; 
					line-height: 2em;	
				}
				
				.sign, video, img {
					@extend %shared;
				}
				
			1. Repeats for all the above elements
		4. For list
		
				$list: elementOne, elementTwo, elementThree;
		
				.sign, video, img, #{ $list } {
					@extend %shared;
				}
		
### Mixins ###
1. Mixins are passed to SASS before the file is compiled to CSS
	1. Can be SASS or CSS or both
	2. Can take arguments to convert the output
2. Example:

		@mixin cssProperties {
			color: blue;
			background: green;
			line-height: 1.8;
		}
		
		body {
			@include cssProperties();
		}
		
3. Example:

		@mixin cssProperties {
			#main {
				color: blue;
				background: green;
				line-height: 1.8;
			}
		}
		
		body {
			color: green;
			width: 200px;
			
			@include cssProperties();
		}
		
4. Arguments:

		@mixin cssProperties($argOne) {
			#main {
				color: $argOne;
				background: green;
				line-height: 1.8;
			}
		}
		
	1. Must call it will value
	
			body {
				@include cssProperties(green);
			}
			
	2. We can pass another variable
	3. Multiple arguments:
	
			@include cssProperties($color, 2.6);
	
	4. Example:
	
			@mixin boxShadow($shadow) {
				-webkit-box-shadow: $shadow;
				-moz-box-shadow: $shadow;
				-o-box-shadow: $shadow;
				box-shadow: $shadow;
			}
			
			body {
				@include boxShadow(1px 2px 3px rgba(0, 0, 0, .3));
			}
			
	5. List of data
	
			@mixin boxShadow($shadow...) {
				box-shadow: $shadow;
			}
			
			body {
				@include boxShadow(1px 2px 3px rgba(0, 0, 0, .3), 2px 4px 3px rgba(0, 0, 0, .24));
			}
			
5. `@content` directive
	1. Example:
	
			@mixin keyframes($name) {
				@-webkit-keyframes #{ $name } {
					@content;
				}
				
				@-moz-keyframes #{ $name } {
					@content;
				}
				
				@-o-keyframes #{ $name } {
					@content;
				}
				
				@keyframes #{ $name } {
					@content;
				}
			}
			
			@include keyframes(myAnim) {
				0% { opacity: 0 }
				100% { opacity: 1 }
			};
			
		1. content is inserted in place of `@content`
		2. SASS:
			1. No `@mixin` but prefixed with `=`

### Import ###
1. We can build our own library and share
2. Syntax:

		@import 'import.css';
		
3. Syntax: SCSS file

		@import '_MainMixins'; /* file extension is not required for SCSS and SASS */
		
		html {
			background: $SCSSVariable;
			@include boxShadow(1px 2px 3px rgba(0, 0, 0, .4), 1px 2px 3px red);
			@include transition(bancground .2s, height .4s);
		}
		
		@include keyframes(myAnim) {
			0% { opacity: 0 }
			100% { opacity: 1 }
		}
		
4. Import SASS file:

		@import '_import.sass';
		
		html {
			@include properties(green);
		}
		
	1. We can import SASS inside SCSS and vice versa
	2. `_`: tells they are partials which are used in other files
		1. Don't get exported as css files
5. Convertion:
	1. `sass --watch SASS_Import:CSS --style expanded --sourcemap=none`
	2. Does not copy .css files

## Advanced API ##
### List Functions ###
### Maps ###
### Math Operators & Functions ###
### If Directives ###
### Loops ###
### Function Directives ###

## SASS extended ##
### SASS Extended Introduction & Koala Compiler ###
### SASS compiler auto prefix css properties ###
### SASS Source Maps ###
### SASS Grid ###
### SASS Grid Media Queries ###
### SASS Buttons ###
### Bonus Lecture: Discount courses ###
