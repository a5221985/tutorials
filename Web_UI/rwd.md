# Responsive Web Design #

## Responsive Web Design - Introduction ##
1. RWD makes a webpage look good on all devices.
2. RWD uses only HTML and CSS
3. RWD is not a program or JavaScript

### What is Responsive Web Design? ###
1. Web page should look good and be easy to useregardless of the device.
2. Web page should adapt its content to fit any device.

### Desinging For The Best Experience For All Users ###
1. Using CSS and HTML to resize, hide, shrink, enlarge, or move content to make it look good on any screen.

## Responsive Web Design - The Viewport ##
### What is The Viewport? ###
1. Viewport: It is user's visible area of a web page.
	1. Varies with device
2. Fixed size web pages were too large to fit the viewport of a mobile phone or tablet.

### Setting The Viewport ###
1. Include the following tag in all web pages:

		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	1. It instructs browser on how to control page's dimensions and scaling.
	2. `width=device-width`: sets width of the page to follow the screen width of the device.
	3. `initial-scale=1.0`: sets initial zoom level when page is first loaded by browser.

### Size Content to The Viewport ###
1. A user should not be made to scroll horizontally or zoom out to access the page.
2. Rules:
	1. Do not use large fixed width elements: If image is wider than viewport, user has to scroll horizontally.
		1. Solution: Adjust the width to fit in the viewport
	2. Do not let the content rely of a particular viewport width to render well: Since screen dimensioins ad width in CSS pixels vary widely between devices.
	3. Use CSS media queries to apply different styling for small and large screens: Setting large CSS widths for page elements will cause element to be too wide for viewporty on smaller devices. Avoid large abolute positioning values (element may fall outside the viewport).
		1. Solution: Consider using relative width values (width: 100%).
		
## Responsive Web Design - Grid-View ##
### What is a Grid-View? ###
1. Grid view: Page is divided into columns
	1. It makes it easier to place elements on a page.
2. Responsive Grid view has 12 columns and has a total width of 100% and will shrink and expand as we resize the browser window.

### Building a Responsive Grid-View ###
1. Set `box-sizing: border-box` for all elements:

		* {
			box-sizing: border-box;
		}
		
2. Example: Responsive website with 2 columns:

		.menu {
			width: 25%;
			float: left;
		}
		
		.main {
			width: 75%;
			float: left;
		}
		
3. Responsive grid view with 12 columns:
	1. % of each column: 100/12 = 8.33%
	2. Make a class for each of 12 columns and number defining number of columns the section should span:
	
			.col-1 { width: 8.33%; }
			.col-2 { width: 16.66%; }
			.col-3 { width: 25%; }
			.col-4 { width: 33.33%; }
			.col-5 { width: 41.66%; }
			.col-6 { width: 50%; }
			.col-7 { width: 58.33%; }
			.col-8 { width: 66.66%; }
			.col-9 { width: 75%; }
			.col-10 { width: 83.33%; }
			.col-11 { width: 91.66%; }
			.col-12 { width: 100%; }
			
4. All the columns should be floating to the left and should have a padding of 15px:

		[class*="col-"] {
			float: left;
			padding: 15px;
			border: 1px solid red;
		}
		
5. Each row should be wrapped in a `<div>` and all columns in the row should add up to 12.

		<div class="row">
			<div class="col-3">...</div>
			<div class="col-9">...</div>
		</div>
		
6. The columns are out of the flow of the page and other elements are placed as if the columns do not exist. To prevent this, add style that clears the flow:

		.row::after {
			content: "";
			display: table;
			clear: both;
		}
		
7. Adding styles and colors to make it look better:

		html {
			font-family: "Lucida Sans", sans-serif;
		}
		
		.header {
			background-color: #9933cc;
			color: #ffffff;
			padding: 15px;
		}
		
		.menu ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
		}
		
		.menu li {
			padding: 8px;
			margin-bottom: 7px;
			background-color: #33b5e5;
			color: #ffffff;
			box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
		}
		
		.menu li:hover {
			background-color: #0099cc;
		}

## Responsive Web Design - Media Queries ##
### What is a Media Query? ###
1. It uses `@media` rule to include a block of CSS properties only if a certain condition is true.
2. Example:

		@media only screen and (max-width: 500px) {
			body {
				background-color: lightblue;
			}
		}

### Add a Breakpoint ###
1. Breakpoints can be used to make certain parts of design behave differently on each side of the breakpoint.
2. Example: For mobile phones:

		/* For desktop */
		.col-1 { width: 8.33%; }
		...
		@media only screen and (max-width: 768px} {
			/* For mobile phones; */
			[class*="col-"] {
				width: 100%;
			}
		} 

### Always Design for Mobile First ###
1. Mobile first: Desing for mobile before designing for desktop or any other device (makes page display faster on smaller devices)
2. Change the design such that when width gets larger than 768px, change the view:

		/* For mobile phones: */
		[class*="col-"] {
			width: 100%;
		}
		
		@media only screen and (min-width: 768px) {
			/* For desktop */
			.col-1 { width: 8.33%; }
			...
		}
		}

### Another Breakpoint ###
1. For tablets, add new classes

		@media only screen and (min-width: 600px) {
			/* For tablets: */
			.col-m-1 { width: 8.33%; }
			.col-m-2 { width: 16.66%; }
			...
			.col-m-12 { width: 100%; }
		}
			
			
		<div class="row">
			<div class="col-3 col-m-3">...</div>
			<div class="col-6 col-m-9">...</div>
			<div class="col-3 col-m-3">...</div>
		</div>

### Orientation: Portrait/ Landscape ###
1. Changing layout of a page based on orientation of browser.
	1. If browser window is winder than its height
2. Example:

		@media only screen and (orientation: landscape) {
			body {
				background-color: lightblue;
			}
		}

## Responsive Web Design - Images ##
### Using The `width` Property ###
1. If width is set to 100%, image will be responsive and scale up and down:

		img {
			width: 100%;
			height: auto;
		}
		
	1. Problem: image might scale to a size larger than its original size:
	2. Solution: use `max-width` instead

### Using The `max-width` Property ###

		img {
			max-width: 100%;
			height: auto;
		}

### Add an Image to The Example Web Page ###

		img {
			width: 100%;
			height: auto;
		}

### Background Images ###
1. Methods:
	1. `background-size: contain`: background image will scale and try to fit the content area. However, image will keep its aspect ratio.
		1. Example:
		
				div {
					width: 100%;
					height: 400px;
					background-image: url('img_flowers.jpg');
					background-repeat: no-repeat;
					background-size: contain;
					border: 1px solid red;
				}
	
	2. `background-size: 100%- 100%;`: background image will stretch to cover the entire content area.
		1. Example:
		
				div {
					width: 100%;
					height: 400px;
					background-image: url('img_flowers.jpg');
					background-size: 100% 100%;
					border: 1px solid red;
				}
				
	3. `background-color: cover;`: background image will scale to cover the entire content area. It keeps the aspect radio and some part of the background image may be clipped.
		1. Example:
		
				div {
					width: 100%;
					height: 400px;
					background-image: url('img_flowers.jpg');
					background-size: cover;
					border: 1px solid red;
				}

### Different Images for Different Devices ###
1. Load different images for different devices using media queries (why load a large image on small devices?)

		/* For width smaller than 400px */
		body {
			background-image: url('img_smallflower.jpg');
		}
		
		/* For width 400px and larger */
		@media only screen and (min-width: 400px) {
			body {
				background-image: url('img_flowers.jpg');
			}
		}
		
2. Use `min-device-width` instead of `min-width` to check for device width instead of browser width.

### HTML5 `<picture>` Element ###
1. `<picture>`: It is used to set up different sources, and the first source that fits the preferences is the one being used.

		<picture>
			<source srcset="img_smallflower.jpg" media="(max-width: 400px)">
			<source srcset="img_flowers.jpg">
			<img src="img_flowers.jpg" alt="Flowers">
		</picture>
		
	1. `srcset`: defines source of the image
	2. `media`: accepts media queries
	3. `img`: for browsers that do not support `<picture>` element

## Responsive Web Design - Videos ##
### Using The `width` Property ###
1. Set `width: 100%` for video player to be responsive.

		video {
			width: 100%;
			height: auto;
		}
	
		<video width="400" controls>
			<source src="mov_bbb.mp4" type="video/mp4" />
			<source src="mov_bbb.ogg" type="video/ogg" />
		</video>

### Using The `max-width` Property ###
1. `max-width: 100%`: video player may scale down but never scale up.

		video {
			max-width: 100%;
			height: auto;
		}

## Responsive Web Design - Frameworks ##
1. There are frameworks that offer Responsive Design and are free to use.

### Using W3.CSS ###
1. Use Responsive style sheet [W3.CSS](https://www.w3schools.com/w3css/default.asp)
2. Example:

		<!DOCTYPE html>
		<html>
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
			<link rel="stlesheet" href="https://www.w3schools.com/w3css/3/w3.css" />
			<body>
				<div class="w3-container w3-green">
					<h1>W3Schools Demo</h1>
					<p>Resize this responsive page!</p>
				</div>
				
				<div class="w3-row-padding">
					<div class="w3-third">
						<h2>London</h2>
						<p>London is the capital city of England.<p>
						<p>It is the most populous city in the United Kingdom, with a metropolitan area of over 13 million inhabitants.</p>
					</div>
					
					<div class="w3-third">
						<h2>Paris</h2>
						<p>Paris is the capital of France.</p>
						<p>The Paris area is one of the largest population centers in Europe, with more than 12 million inhabitants.</p>
					</div>
					
					<div class="w3-third">
						<h2>Tokyo</h2>
						<p>Tokyo is the capital of Japan.</p>
						<p>It is the center of the Greater Tokyo Area, and the most populous metropolitan area in the world.</p>
					</div>
				</div>
			</body>
		</html>
		
3. [W3.CSS Tutorial](https://www.w3schools.com/w3css/default.asp)

### Bootstrap ###
1. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<title>Bootstrap Example</title>
				<meta charset="utf-8">
				<meta name="viewport" content="width=device-width, initial-scale=1">
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
				<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			</head>
			<body>
				<div class="container">
					<div class="jumbotron">
						<h1>My First Bootstrap Page</h1>
					</div>
					<div class="row">
						<div class="col-sm-4">
							...
						</div>
						<div class="col-sm-4">
							...
						</div>
						<div class="col-sm-4">
							...
						</div>
					</div>
				</div>
			</body>
		</html>

2. [Bootstrap Tutorial](https://www.w3schools.com/bootstrap/default.asp)

## Responsive Web Design - Templates ##
### W3.CSS Web Site Templates ###
1. [Web Site Templates](https://www.w3schools.com/css/css_rwd_templates.asp)
	1. Band Template
	2. Art Template
	3. Architect Template
	4. Coming Soon Template
	5. Blog Template
	6. Food Blog Template
	7. Fashion Blog Template
	8. Gourmet Catering Template
	9. CV Template
	10. Wedding Invitation Template
	11. Photo Template
	12. Black and White Photo Template
	13. Photo III Template
	14. Nature Portfolio Template
	15. People Portfolio Template
	16. People Portforlio II Template
	17. Dark Portfolio Template
	18. Black & White Portforlio Template
	19. Parallax Template
	20. Clothing Store Template
	21. Interior Design Template
	22. Cafe Template
	23. Pizza Restaurant Template
	24. Modal Restaurant Template
	25. Start Page Template
	26. Startup Template
	27. App Launch Template
	28. Marketing Template
	29. Marketing / Website Template
	30. Web Page Template
	31. Social Media Template
	32. Analytics Template
	33. Apartment Rental Template
	34. Hotel Template
	35. Travel Template
	36. Travel Agency Template
	37. House Design Template
	38. Screen 50/50 Template
	39. Mail Template
	40. Kitchen Sink/Demo Template
