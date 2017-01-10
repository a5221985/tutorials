# HTML5 & CSS3 #
## Topics ##
1. Hands-on web development with HTML5, CSS3 and some jQuery.
2. Proven 7 real-world steps from complete scratch to a fully functional and optimized website
3. Simple-to-use webdesign guidelines and tips
4. How to get and use amazing images, fonts and icons
5. Responsive web design
6. How to use jQuery for super cool effects like animations
7. How to work with Brackets
8. How to optimize your website

## Course Structure ##
1. Section 2: Webdesign basics
2. Section 3: Dive into HTML
3. Section 4: Formatting with CSS
4. Section 5: The killer website project
5. Section 6: Let's and some cool effects
6. Section 7: Optimizing and launching our website

## Important Websites ##
1. [Codepen](http://codepen.io/pen/)
2. [JSFiddle](https://jsfiddle.net/)
3. [CSS Validator](https://jigsaw.w3.org/css-validator/)
4. [HTML Validator](https://validator.w3.org/)
5. [Forum](https://discordapp.com)
6. [Resources](http://codingheroes.io/resources/)
7. [Facebook](https://www.facebook.com/codingheroes)
8. [YouTube](https://www.youtube.com/channel/UCNsU-y15AwmU2Q8QTQJG1jw)
9. [Twitter](https://twitter.com/jonasschmedtman)

## Dive into HTML ##
1. Text editor: Brackets
2. What is HTML?
	1. Hyper Text Markup Language
3. HTML tags:
	1. mark content
	2. `<tagname>content</tagname>`

## Structure of HTML document ##
1. New folder on desktop `blog post`
2. Open Brackets
	1. Open `blog post` (will be used as project folder)
3. File > New > Save > index.html

		<!DOCTYPE html> <!-- Instruction to browser the version of html (5) -->
		<html>
			<head>
				<title></title>
			</head>
			<body>
			</body>
		</html>
4. Install extension
	1. **autosave**
		1. `Autosave files on window blur`

## Starting to fill structure ##
1. Title

		<title>My first blog post</title>
		...
		<body>
			<h1>My first blog post</h1>
			<h2>This is my first blog post</h2>
			<p>	<!-- search for blind text in google -->
				This is a very <strong>strong</strong> text, becaue it is <strong>bold</strong>.<br/>
				I would like to <em>emphasize</em> how important it is to follow this course until the end!<br/>
				This is some <u>underlined</u> text.<br/>
				Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,
			</p>
			<h2>HTML is amazing</h2>
			<p>
			Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,
			</p>
		</body>

## Images and Attributes ##
1. Search for html5
	1. Save an image as `logo`
2. randomuser.me
	1. Save the picture as `author`
		1. Jackson Gonzales
3. Edit the html

		<img src="logo.jpg" alt="The HTML5 logo">
			...

		<img src="author.jpg" alt="Author photo">
		<p>Jackson Gonzales</p>

## Links ##

		<img ...>
		<a href="http://www.udemy.com" target="_blank">Link to udemy</a> <!-- Opens link in new tab (_blank, _parent, _self, _top)-->

1. Linking to another web-page on the site
	
		<a href="logo.jpg" target="_blank">HTML logo</a>

## CSS ##
1. CSS: Cascading Style Sheets
	1. Defines how html elements should look (separation between content and style)
2. Three ways to use CSS:
	1. CSS code inside an HTML tag
		1. `<p style="font-size: 120%">` **(M)**
	2. CSS code inside an HTML document (head section)
		
			<style> **(M)**
				p {
					font-size: 120%;
				}
			</style>

	3. CSS code in external file

			p {
				font-size: 120%;
			}

3. Styling
	1. New style.css
	2. index.html

			<head>
				...
				<link rel="stylesheet" type="text/css" href="style.css" />
	3. CSS:
		1. Rules:
			1. Selector, declaration block
			
					body {
						font-family: Helvetical Neue, Airal;
						font-size: 18px;
					}
					h1, h2 {
						color: green;
						font-family: Helvetical Neue, Arial;
					}

					h1 {
						font-size: 40px;
					}

					h2 {
						font-size: 25px;
					}

	4. index.html
		1. Remove the lines manually entered
		2. Inline Rules
			1. Click on `<p>` and cmd + E (Quick Edit)

					p {
						text-align: justify;
					}

	5. CSS inheritence:
		1. Child elements inherit the css rules of the parent unless we explicitly override them with separate rules

## Colors ##
1. Green: #1da717
2. Grey: #8b8b8b
3. Transparancy: rgba(29, 167, 23, 0.75)
4. Changing color:
	1. Click on color (green) and cmd + E
		1. Choose color and transparency by dragging

## Classes and IDs ##
1. Define a class or id in html and select them in css
	1. id is unique in html document
	2. class can be used multiple times
2. index.html

		<p class="main-text"> <!-- for both paragraphs -->
		<p id="author-text">...</p> <!-- there is one author -->

3. style.css

		.main-text {
			text-align: justify;
		}

		#author {
			font-size: 22px;
		}

	1. Remove `p { ... }`

4. Ids is not a good practice (even if there is only one element using the specific style)
	1. Change `<p id="...">` to `<p class="..."` and `#...` to `. ...`

## Box Model ##

![css-box-model-2-638](css-box-model-2-638.jpg)

	1. Content: text, images ...
	2. Padding: transparent area around the content, inside of the box.
	3. Border: Goes around padding and content
	4. Margin: Space between boxes
	5. Height: height of content (default)
	6. Width: width of content (default)

1. Block elements:
	1. Use full width of the browser and force line breaks
		1. headings, paras
	2. Inline elements:
		1. string, emphasize
		2. We cannot set their height or width

2. Rules for box model 
	1. Select all elements (*) **(M)**
			
			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
			}
			...
			h1 {
				...
				margin-bottom: 20px; **(M)**
			}
			h2 {
				...
				margin-bottom: 10px; 
			}
			...
			.main-text {
				...
				margin-bottom: 20px;
			}

## Building a Simple Layout ##
1. Box for Blog post content
2. Box for Author and other info
3. Box for Other blog posts
4. `<div>`: divide (into sections/boxes)
	
		<body>
			<div class="container">
				<!-- copy and paste all body content -->
			</div>

	1. `container` + cmd + E
		
			.container {
				width: 1140px;
				margin-left: auto; **(M)**
				margin-right: auto; **(M)**
			}

5. Another container:

			<div class="container">
				<div class="blog-post">
					<!-- copy the blog post content leaving author -->
				</div>
				<div class="other-posts">
					Dymmy text
				</div>
				<div class="author-box">
					<!-- author information -->
				</div>
			</div>

6. Background color:

		.clearfix:after {
			content: "";
			display: table;
			clear: both;
		}
		
		.blog-post {
			background-color: #0000ff;
			width: 75%;
			float: left;
		}

		.other-posts {
			background-color: #00ff00;
			width: 25%;
			float: left;
		}

		.author-box {
			background-color: #ffff00;
		}
	
7. Add a clearfix div

		<div class="other-posts">
			...
		</div>

		<div class="clearfix"></div>

		...

8. Add paddings:

		.container {
			margin-top: 20px;
		}

		.blog-post {
			...
			padding-right: 30px;
		}

	1. Remove ugly background colors
	2. Change margins to the following: (margin: top right bottom left)

			.container {
				...
				margin: 20px auto 0 auto;
			}

9. Add border to author box:

		.author-box {
			padding: 20px;
			border-top: 1px solid #808080;
		}

## Polishing Blog Post ##
1. More blog posts
	
		<div class="other-posts">
			<div class="other">
				The first other blog post
			</div>
			<div class="other">
				The second other blog post
			</div>
			<div class="other">
				The best post ever: read this!
			</div>
		</div>

2. Author box:
	1. Select author image without class

			.author-box img {
				height: 100px;
				width: 100px;
				border-radius: 50%;
			}
	2. Move Authorname to left

			.author-box img {
				...
				float: left;
			}

			.author-text {
				...
				float: left
				margin-top: 30px;
				margin-left: 10px;
			}

3. Move logo to bottom

		<img src="logo.jpg" alt="The HTML5 logo"/>

		.blog-post img {
			height: 150px;
			width: auto;
		}

## Relative vs. Absolute ##
1. Date with absolute positioning

		<h1>My first blog post</h1>
		<p class="date">March 11th, 2015</p>

2. style.css

		.blog-post {
			...
			position: relative
		}
		...
		.date {
			position: absolute
			top: 10px;	# 10px from top of parent container
			right: 30px;	# 30px from right side of parent container
		} 

	1. Relative: position is determined by other elements
	2. Absolute: positioned anywhere we want inside parent element

## Getting Started with the Chrome Developer Tools ##
1. Open index.html in chrome
2. Select a text, right click on an element and select Inspect Element
	1. Editing is possible in chrome developer tools
	2. Blue is content, orange is margin
	3. Box model is available

## Introduction to webdesign ##
1. Designer:
	1. Look and Feel
2. Developer:
	1. builds the web site

## Beautiful typography ##
1. "Typography is the art and technique of arranging type to make written language readable and beautiful"
2. Use a font-size between 15 and 25 pixels for body text (depends on text we have)
3. Headlines: really big (60 px, 90 px, ...)
	1. Decrease font weight (looks more modern and elegant)
4. Line spacing: 120 to 150% of font-size
5. 45 to 90 characters per line (optimal)
	1. If columns are used we can have fewer
6. Good fonts:
	1. Sans-Serif: more neutral, clean, simple, modern sites
		1. Google fonts:
			1. Open Sans
			2. Lato
			3. Raleway
			4. Monsterrat
			5. PT Sans
	2. Serif: Traditional purposes, storytelling, long reading (blog post ...)
		1. Google fonts
			1. Cardo
			2. Merriweather
			3. PT Serif
7. How to choose a font?
	1. Choose font that reflects look and feel you want for website
	2. Decide: sans-serif or serif
	3. Use good font
	4. Use only that one typeface (for beginners)

## Using colors like a pro (Refer to E Book)##
1. Use only one base color (other than black, white and grey)
	1. Stick to one main color
	2. [Flat UI colors](https://flatuicolors.com) (to choose base color)
	3. Make a color palette
		1. zero to 255 tool ([http://www.0to255.com/](http://www.0to255.com/))
	4. Mixing multiple colors:
		1. Adobe color cc
		2. Paletin
2. Use a main color to draw attention to important elements on web page
	1. Second and third colors can complement
3. Never choose black in design (not natural)
4. Picking a color for a website means more then picking your favorite color and turning it into a design. It means picking the right color in order to get the desired response from your audience. Color really makes a difference. This happens because there are psychological effects behind each color.
	* Red is a great color to use when power, passion, strength and excitement want to be transmitted. Brighter tones are more energetic and darker shades are more powerful and elegant.
	* Orange draws attention without being as overpowering as red. It means cheerfulness and creativity. Orange can be associated with friendliness, confidence, and courage.
	* Yellow is energetic and gives the feeling of happiness and liveliness. Also, it associates with curiosity, intelligence, brightness, etc.
	* Green is the color of harmony, nature, life and health. Also, it is often associated with money. In design, green can have a balancing and harmonizing effect.
	* Blue means patience, peace, trustworthiness, and stability. It is one of the most beloved colors, especially by men. It is associated with professionalism, trust and honor. That's actually why the biggest social networks use blue.
	* Purple is traditionally associated with power, nobility and wealth. In your design, purple can give a sense of wisdom, royalty, nobility, luxury, and mystery.
	* Pink expresses romance, passivity, care, peace, affection, etc.
	* Brown is the color of relaxation and confidence. Brown means earthiness, nature, durability, comfort, and reliability.

## Working with images ##
1. Text over images:
	1. Image is dark
		1. Overlay with dark color
		2. Use color gradiants
		3. Blur image or put text in blurred image part
		4. Floor fade (floor fades to black)
	2. Text is bright
		1. Or put text in box and make is slightly transparent
		2. Put text in faded floor
2. Where do we get images?
	1. Go through e-book

## Working with Icons ##
1. Guidelines:
	1. Icons to show features website is offering
	2. Icons can show steps the user can follow to achieve some goal
	3. Icons for actions and links
		1. Icons should be recognizable (remove open interpretation)
		2. Label your icons if there is space
	4. Not take center stage in design and not too many
2. Types of images
	1. Static images
	2. Vector icons (strongly recommended)
		1. scale endlessly for any resolution
3. Resources of images: e-book

## Spacing and Layout ##
1. Guidelines
	1. Put shitespace between your elements
	2. Put whitespace between your groups of elements
	3. Put whitespace between your website's sections
	4. But don't exaggerate
2. Whitespace describes invisible relationshipts between the elements of the website
	1. invisible hierarchy
3. Define Hierarchy
	1. Define where you want your audience to look first
	2. Establish a flow that corresponds to your content's message
	3. Use whitespace to build that flow

## Introduction to User Experience ##
1. **User Experience**: Overall experience the user has with a product
	1. "It's not just what it looks like and feels like. Design is how it works" - Steve Jobs
2. **User Experience** = **User's goals** U **Business' goals**
	1. If user reaches the goal then that must satisfy the business goal
		1. User gets an e-book (user's goal) for an email exchange (business goal)
3. User Experience crash course - e-book

## Getting Inspired: Your secret ingredient for stunning web design ##
1. Use other websites as inspiration to see what other leading designers are doing right.
2. Steps:
	1. Collect a few designs that you like
	2. Try to understand everything about them
	3. Why do they look good?
	4. What do these sites have in common?
	5. How were they build in HTML and CSS?
		1. Use google chrome developer tools
3. Steal like an artist
	1. Make designs similar to what you like
4. Inspiration sources: e-book
	1. Great designers

## Summary ##
1. Most content is text, so beautiful typography is the key element to good looking websites.
2. Images are becoming important in webdesign, choose great images and putting text on them must be learnt.
3. Icons set a friendly tone for the website, but must be carefully used
4. Adequate use of whitespace for professionally designed websites. Must be used but in correct way.
5. Build layout by defining visual hierarchy of the content. Whitespace plays an important role in this.
6. Website should be designed in such a way that both user and owner should achieve their goals. (User experience)
7. Get inspired by studying well designed websites from other designers

## The 7 real-world steps to a fully functional website ##
1. Steps:
	1. Define your project
		1. Define the goal of the project
			1. Showing your portfolio to the world
			2. Selling an e-book
			3. Building a blog
		2. Define the audience
			1. Typical user who may visit my website
		3. Design with the goal and audience in mind always
	2. Plan our everything
		1. Plan the content: text, images, videos, icons, etc.
		2. Start thinking about visual hierarchy
			1. Design website for the content instead of designing the website first and then filling in content
			2. Content first thought
		3. Define the navigation
		4. Define the site structure if it's a bigger project
			1. Site map
	3. Sketch your ideas before you design
		1. Get inspired and think about the design
		2. Get the ideas out of your head: sketch the ideas before you start desiging
			1. Using pencils and paper
		3. Make as many sketches as your want, but don't make it perfect
		4. Never start designing without having an ideas or what you want to build (get inspired)
	4. Design and develop your website
		1. Design your website using guidelines and tips you've learned in the webdesign section
		2. Do that using HTML and CSS: designing in the browser (design and develop at the same time)
		3. Use sketches, content and planning decisions you've made in steps 1, 2 and 3
		4. This step is the biggest part of building a website, but: all steps are imporant!
	5. It's not done yet: Opitmize
		1. Optimize performance: site speed
		2. Search engine optimization (SEO)
	6. Launch the masterpiece
		1. All you need for launching is a webserver that will host your website and deliver it to the world
	7. Site maintenance
		1. Launching is not hte end of the story
		2. Monitor your users behavior and change your website if necessary
		3. Update content regularly: blog
2. Steps source: e-book
	1. Periodic table of web-design process

## 7 Steps into Action ##
1. Company:
	1. Omnifood: healthy and affordable food to people
2. Steps:
	1. Define your project
		1. Goal of the project: Show what Omnifood does, how it works and in which cities it operates in. Then, make people sign up on a subscription plan
		2. Audience: Busy people who don't have time to cook or don't like it
	2. Plan out everything
		1. One-pge webpage containing information provided by Omnifood, with simple navigation
		2. Content: provided by Omnifood in form the of a text document and a couple of images
		3. Navigation: Also provided by Omnifood in a text document.
	3. Sketch ideas
		1. Header:
		
		![](sketch.png =600x)
		![](sketch_2.png =600x)
		![](sketch_3.png =600x)
		![](sketch_4.png =600x)
		![](sketch_5.png =600x)
	4. Design and Development
		1. Color:
			1. Base color: Orange
		2. Font:
			1. LATO typeface google font
				1. Male and female serious and friendly with feeling of summer

## First development steps ##
1. Folder structure:
	1. omnifood
		1. resources
			1. css
				1. img (used by css like background)
			2. js
			3. img
			4. data
		2. vendors
			1. css
			2. js
			3. fonts

2. Brackets
	1. Open Folder > omnifood
	2. New > index.html
		
			<!DOCTYPE html>
			<html lang="en">
				<head>
					<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
					<title>Omnifood</title>
				</head>
				<body>
				</body>
			</html>

	3. New > style.css
	4. [normalize.css](https://necolas.github.io/normalize.css/)
		1. Makes browsers render all elements more consistently and in line with modern standards. It precisely targets only styles that need normalizing
		2. Save the css in `vendors/css`
		3. Include it

				<head>
					<link rel="styelsheet" type="text/css" href="vendors/css/normalize.css"/>
					...
				</head>

	5. Font Lato
		1. Search for google fonts
		2. Select the styles:
			1. Light 300
			2. Normal 400
			3. Thin 100
			4. Light 300 Italic
		3. Copy the `<link ...>` and paste it in index.html
			1. file is not downloaded but is in the internet
	6. style.css

			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
			}

			html {
				background-color: #fff;
				color: #555; # cmd + E;
				font-family: 'Lato', 'Arial', sans-serif;
				font-weight: 300;
				font-size: 20px;
				text-rendering: optimizeLegibility; # rendering will be perfect
			}

		1. `sans-serif`: fallback standard font which will be chosen based on type of computer (mac, pc, linux ...)
		2. `text-rendering`: information to rendering engine about what to optimize for when rendering text. Browser makes trade offs between speed, legibility, geometric prcision.
			1. `optimizeLegibility`: browser emphasizes legibility over rendering speed and geometric precision.
			2. `geometricPrecision`: emphasis is on geometric precision over rendering speed and legibility.
			3. `optimizeSpeed`: emphasis is on speed over legibility and geometric precision.
			4. `auto` (default): browser makes educated guess about when to optimize for speed, legibility and geometric precision.
			

		1. Testing: `<h1>Omnifood</h1>`
		2. `box-sizing`: what the sizing properties (width and height) should include
			1. `border-box`: width and height include content, padding, border
			2. `initial`: sets property to default value
			3. `inherit`: inherits the property from its parent
			4. `content-box`: default. width and height include only the content (border, padding, margin are excluded)

## Setting up the fluid grid for responsive webdesign ##
1. Responsive webdesign:
	1. Website works well on any device and any screen resolution
2. Mobile friendly sites will be ranked higher in google
3. Ingredients:
	1. **Fluid grid**: all layout elements are sized in relative units, %s, instead of absolute units like pixels
	2. **Flexible images**: are also sized in relative units
	3. **Media queries**: allow us to specify different CSS style rules for different broser widths
		1. Mobile phones, tablets
4. Responive Grid system
	1. [Responsive Grid System](www.responsivegridsystem.com)
		1. We can build grid
	2. Copy `grid.css` to `vendors/css`
5. Include the file

		<link ... normalize.css>
		<link rel="stylesheet" type="text/css" href="vendors/css/grid.css" />

6. Define a row in style.css

		.row {
			max-width: 1140px;
			# margin: 0 auto 0 auto; # center
			margin: 0 auto; # shortcut
		}

	1. Test:

			<div class="row">
				<h1>Omnifood</h1>
			</div>

## Building the header - Part 1 ##
1. What we will learn:
	1. New HTML elements: header **(M)**, nav **(M)**, ul, li
	2. Put text on an image: make image darker
	3. How to make that image as high as the browser viewport
	4. How to make a vertically a horizontally centered box
	5. How to design buttons
	6. The 4 link states in CSS: link, visited, hover, active
	7. CSS3 transitions for small animations
	8. How to create a simple navigation
2. index.html

		<body>
			<header>
				
			</header>
		</body>

3. Unzip `omnifood-content.zip` and open the content

		<header>
			<div class="hero-text-box">
				<h1>Goodbye junk food. Hello super healthy meals.</h1>
				<a href="#">I'm hungry</a>
				<a href="#">Show me more</a>
			</div>
		</header>
4. Styling:

		header {
			background-image: url(img/hero.jpg);
			background-size: cover;
			background-position: center;
			height: 100vh;
		}

		h1 {
			margin: 0;
		}

		.hero-text-box {
			position: absolute;
			width: 1140px;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
		}

	1. Copy `hero.jpg` to `resources/css/img`
	2. `transform`: applies 2D or 3D transformation to the element
		1. rotate
		2. scale
		3. move
			1. `translate(x, y)`
		4. skew
		5. ...
5. Make image darker

		background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url(img/hero.jpg)

	1. `linear-gradient`: smooth transition between two or more colors
		1. Advantages: 
			1. Images need not be downloaded
			2. Zooming does not blur the gradient
		2. Goes from down/up/left/right/diagonally
		3. Syntax: `linear-gradient(direction, color-stop1, color-stop2, ...);`
			1. `linear-gradient(red, yellow)`
			2. `linear-gradient(to right, red, yellow)`
			3. `linear-gradient(to bottom right, red, yellow)`

## Building the Header - Part 2 ##
1. styling

		h1 {
			...
			color: #fff;
			font-size: 240%;
			font-weight: 300;
			text-transform: uppercase;
			letter-spacing: 1px;
			word-spacing: 4px;
		}

2. index.html

		<h1>Goodebye junk food.<br/>...</h1>
3. Buttons:
	
		<a class="btn btn-full" ...>
		<a class="btn btn-ghost" ...>

	1. Style

			.btn:link,
			.btn:visited {
				display: inline-block;
				padding: 10px 30px;
				font-weight: 300;
				text-decoration: none;
				border-radius: 200px;
			}

		1. inline-block: padding and margin, no line break
	2. style full button: Goto flatuicolors and choose carrot

			.btn-full:link,
			.btn-full:visited {
				background-color: #e67e22;
				border: 1px solid #e67e22;
				color: #fff;
			}

			.btn-ghost:link,
			.btn-ghost:visited {
				border: 1px solid #e67e22;
				color: #e67e22;
			}

			...

			h1 {
				margin-top: 0;
				margin-bottom: 20px;
				...
			}

			...
			
			.btn:hover,
			.btn:active {
				background-color: #cf6d17;
			}

			.btn-full:hover,
			.btn-full:active {
				border: 1px solid #cf6d17;
			}

			.btn-ghost:hover,
			.btn-ghost:active {
				border: 1px solid #cf6d17;
				color: #fff;
			}

		1. Goto 0to255.com and paste `e67e22` choose second darker shade
	3. Slow transition:

			.btn:link,
			.btn:visited {
				...
				transition: background-color 0.2s, border 0.2s, color 0.2s;
			}

			.btn-full:link,
			.btn-full:visited {
				...
				margin-right: 15px;
			}

## Building the header - Part 3 ##
1. Reorganize css
	1. Use css comments
		
			/* ---------------------- */
			/* BASIC SETUP */
			/* ---------------------- */

			...
		
			/* ---------------------- */
			/* REUSABLE COMPONENTS */
			/* ---------------------- */

			...

			/* ----- HEADINGS ------ */
	
			...
			/* ----- BUTTONS ------ */
		
			...

			/* ---------------------- */
			/* HEADER */
			/* ---------------------- */

			...

2. Navigation:

		<header>
			<nav>
				<div class="row">
					<img src="resources/img/logo-white.jpg" alt="Omnifood logo" class="logo"/>
					<ul class="main-nav">
						<li><a href="#">Food delivery</a></li>								<li><a href="#">How it works</a></li>
						<li><a href="#">Our cities</a></li>
						<li><a href="#">Sign up</a></li>
					</ul>
				</div>
			</nav>

	1. Copy all the images in `resources/img` folder
	2. styling:
			
			/*
				Orange color: #e67e22
			*/

			.logo {
				height: 100px;
				width: auto;
				float: left;
				margin-top: 20px;
			}

			.main-nav {
				float: right;
				list-style: none;
				margin-top: 55px;
			}

			.main-nav li {
				display: inline-block;
				margin-left: 40px;	
			}

			.main-nav li a:link,
			.main-nav li a:visited {
				color: #fff;
				text-decoration: none;
				text-transform: uppercase;
				font-size: 90%;
				border-bottom: 2px solid transparent;
				transition: border-bottom 0.2s;
				padding: 8px 0;
			}

			.main-nav li a:hover,
			.main-nav li a:active {
				border-bottom: 2px solid #e67e22;
			}

	3. `inline-block`: like inline elements but they can have a width and height
		1. Other elements can sit to their left and right.
		2. top and bottom margins and padding
		3. Can have height and width
	4. `inline`: 
		1. Left and right margins and padding but not top and bottom.
		2. Cannot have width and height set
		3. Other elements can sit on their left or right
	5. `block`:
		1. Left, right, top, bottom margins and padding
		2. forces line break after block element 

		![block_vs_inline_vs_inline_block](block_vs_inline_vs_inline_block.png =400x)

## Building the features seciton - Part 1 ##
1. What we'll learn:
	1. How to put content on a website directly from css with the :after pseudo-class
	2. We'll use the fluid grid for hte first time
	3. We'll learn how to use icons
2. index.html

		</header>
		<section class="section-features">
			<div class="row">
				<h2>Get food fast &mdash; not fast food.</h2>
				<p class="long-copy">
					Hello, we're Omnifood, your new premium food delivery service. We know you're always busy. No time for cooking. SO let us take care of that, we're really good at it, we promise!
				</p>
			</div>
			<div class="row">
				<div class="col span-1-of-4">
					<h3>Up to 365 days/year</h3>
					<p>
						Never cook again! We really mean that. Our subscription plans include up to 365 days/year coverage. You can also choose to order more flexibility if that's your style.
					</p>
				</div>
				<div class="col span-1-of-4">
					<h3>Ready in 20 minutes</h3>
					<p>
						You're only tewenty minutes away from your delicious and super healthy meals delivered right to your home. We work with the best chefs in each town to ensure that you're 100% happy.
					</p>
				</div>
				<div class="col span-1-of-4">
					<h3>100% organic</h3>
					<p>
						All our vegetables are fresh, organic and local. Animals are raised without added hormones or antibiotics. Good for your health, the environment, and it also tastes better!
					</p>
				</div>
				<div class="col span-1-of-4">
					<h3>Order anything</h3>
					<p>
						We don't limit your creativity, which means you can order whatever you feel like. You can also choose from our menu containing over 100 delicious meals. It's up to you!
					</p>
				</div>
			</div>
		</section>

3. Icons: `ionicons.com`
	1. Steps to install
		1. Download
		2. Extract to `omnifood`
		3. copy `css/icons.min.css` to `vendors/css`
		4. copy `fonts` to `vendors` (replace)
	2. How to use the icons?
		
			<link rel="stylesheet" type="text/css" href="vendors/css/icons.min.css"/>
				...
			<div class="col span-1-to-4">
				<i class="ion-ios-infinite-outline"></i>
				...
			<div class="col span-1-to-4">
				<i class="ion-ios-stopwatch-outline"></i>

			<div class="col span-1-to-4">
				<i class="ion-ios-nutrition-outline"></i>

			<div class="col span-1-to-4">
				<i class="ion-ios-cart-outline"></i>

	3. styling

			section {
				padding: 80px 0px;
			}

			h1, h2 {
				font-weight: 300;
				text-transform: uppercase;
				letter-spacing: 1px;
			}

			h1 {
				margin-top: 0;
				margin-bottom: 20px;
				color: #fff;
				font-size: 240%;
				word-spacing: 4px;
			}

			h2 {
				font-size: 180%;
				word-spacing: 2px;
				text-align: center;
				margin-bottom: 30px;
			}

			h2:after {
				display: block;
				height: 2px;
				background-color: #e67e22;
				content: " ";
				width: 100px;
				margin: 0 auto;
				margin-top: 30px;
			}

			/* ------- PARAGRAPHS ------- */
			.long-copy {
				line-height: 145%;
				width: 70%;
				margin-left: 15%;
			}

	4. index.html

			<div class="col span-1-of-4 box">
				...
			<div class="col span-1-of-4 box">
				...
			<div class="col span-1-of-4 box">
				...
			<div class="col span-1-of-4 box">
				...

	5. styling:
		
			.box {
				padding: 1%;
			}

	6. h3 styling

			h1, h2, h3 {
				...
			}

			h3 {
				font-size: 110%;
				margin-bottom: 15px;
			}

		1. Remove letter-spacing from h1, h2, h3 and place it in h1 and h2

	7. Styling paragraphs in box

			.box p {
				font-size: 90%;
				font-size: 145%;
			}

	8. Icons:

			<i class="... icon-big"></i>

		1. Styling:

				/* -------- ICONS -------- */
				.icon-big {
					font-size: 350%;
					display: block;
					color: #e67e22;
					margin-bottom: 10px; 
				}
			
## Building the favorite meals section - Part 1 ##
### What we'll learn ###
1. How to make a grid of beautiful images
2. How to make a nice "zoom-in" transition, only using CSS
3. A way to make <img> elements darker

### Building Gruid ###
1. index.html

		<section class="section-meals">
			<ul class="meals-showcase">
				<li>
					<figure class="meal-photo">
						<img src="resources/img/1.jpg" alt="Korean bibimbap with egg and vegetables"/>
					</figure>
				</li>
				<li>
					<figure class="meal-photo">
						<img src="resources/img/2.jpg" alt="Simple italian pizza with cherry tomatoes"/>
					</figure>
				</li>
				<li>
					<figure class="meal-photo">
						<img src="resources/img/3.jpg" alt="Chicken breast steak with vegetables"/>
					</figure>
				</li>
				<li>
					<figure class="meal-photo">
						<img src="resources/img/4.jpg" alt="Autumn pumpkin soup"/>
					</figure>
				</li>
			</ul>
			<ul class="meals-showcase">
				<li>
					<figure class="meal-photo">
						<img src="resources/img/5.jpg" alt="Paleo beef steak with vegetables"/>
					</figure>
				</li>
				<li>
					<figure class="meal-photo">
						<img src="resources/img/6.jpg" alt="Healthy baguette with egg and vegetables"/>
					</figure>
				</li>
				<li>
					<figure class="meal-photo">
						<img src="resources/img/7.jpg" alt="Burger with cheddar and bacon"/>
					</figure>
				</li>
				<li>
					<figure class="meal-photo">
						<img src="resources/img/8.jpg" alt="Granola with cherries and strawberries"/>
					</figure>
				</li>
			</ul>
		</section>

2. style.css
		
		/* ---------------------------------------- */
		/* FEATURES */
		/* ---------------------------------------- */
		.section-features .long-copy {
			margin-bottom: 30px;
		}

		/* ---------------------------------------- */
		/* MEALS */
		/* ---------------------------------------- */

		.meals-showcase {
			list-style: none;
			width: 100%;
		} 
		.meals-showcase li {
			display: block;
			float: left;
			width: 25%;
		}

		.meal-photo {
			width: 100%;
			margin: 0;
		}

		.meal-photo img {
			width: 100%;
			height: auto;
		}

## Building the favorite meals section - Part 2 ##
1. Remove padding

		.section-meals {
			padding: 0;
		}

2. Image zooming:

		.meal-photo {
			overflow: hidden;
		}

		.meal-photo img {
			...
			transform: scale(1.15);
			transition: transform 0.5s;
		}

		.meal-photo img:hover {
			transform: scale(1.03);
		}

4. Make image darker

		.meal-photo {
			...
			background-color: #000;
		}

		.meal-photo img {
			opacity: 0.7;
			...
			transition: transform 0.5s, opacity 0.5s;
		}

		.meal-photo img:hover {
			opacity: 1;
			...
		}

## Building the how-it-works section - Part 1 ##
### What we'll learn in this lecture ###
1. How to draw cirles with CSS
2. A cool technique to make separation between sections
3. How to incorporate App Store and Play store buttons

### Implementation ###
1. New section
	
		<section class="section-steps">
			<div class="row">
				<h2>How it works &mdash; Simple as 1, 2, 3</h2>
			</div>
			<div class="row">
				<div class="col span-1-of-2 steps-box">
					<img src="resources/img/app-iPhone.png" alt="Omnifood app on iPhone" class="app-screen" />
				</div>
				<div class="col span-1-of-2 steps-box">
					<div class="works-step">
						<div>1</div>
						<p>Choose the subscription plan that best fits your needs and sign up today.</p>
					</div>
					<div class="works-step">
						<div>2</div>
						<p>Order your delicious meal using our mobile app or website. Or you can even call us!</p>
					</div>
					<div class="works-step">
						<div>3</div>
						<p>Enjoy your meal after less than 20 minutes. See you the next time!</p>
					</div>

					<a href="#" class="btn-app"><img src="resources/img/download-app.svg" alt="App Store Button" /></a>
					<a href="#" class="btn-app"><img src="resources/img/download-app-android.svg" alt="Play Store Button" /></a>
				</div>	
			</div>
		</section>

### Building the how-it-works section - Part 2 ###
1. style.css

		/* HOW IT WORKS */

		.steps-box {
			margin-top: 30px;
		}

		.steps-box:first-child {
			text-align: right;	/* works for inline-block elements */
			padding-right: 3%;
		}

		.steps-box:last-child {
			padding-left: 3%;
		}

		.app-screen {
			width: 40%;
		}

2. Format numbers:

		.steps-box:last-child {
			...
			margin-top:70px;
		}

		.works-step {
			margin-bottom: 50px;
		}

		.works-step:last-of-type {
			margin-bottom: 80px;
		}

		.works-step div {
			color: #e67e22;
			border: 2px solid #e67e22;
			display: inline-block;
			border-radius: 50%;
			height: 55px;
			width: 55px;
			text-align: center;
			padding: 5px;
			float: left;
			font-size: 150%;
			margin-right: 25px;
		}

3. Format buttons:

		.btn-app img {
			height: 50px;
			width: auto;
			margin-right: 10px;
		}

4. Clear floats:

		.clearfix {zoom: 1}
		.clearfix {
			content: ".";
			clear: both;
			display: block;
			height: 0;
			visibility: hidden;
		}

	Add `clearfix` to `ul`

5. Separate different sections

		.section-steps {
			background-color: #f4f4f4;
		}

