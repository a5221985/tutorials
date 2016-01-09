### BS Theme "Company" ###
#### Creation of a Theme: "Company" ####
1. Building a bootstrap theme from scratch
	1. Start with simple HTML page
	2. Add more and more components
	3. Repeat step 3 until we have fully functional, personal and responsive website

#### HTML Start Page ####

		<!DOCTYPE html>
		<html>
			<head>
				<title>Bootstrap Theme Company</title>
				<meta charset="utf-8">
				<meta name="viewpoint" content="width=device-width,initial-scale=1">
			</head>
			<body>
				<h1>Company</h1>
				<p>We specialize in blablabla</p>
			</body>
		</html>

#### Add Bootstrap CDN and Add a Jumbotron ####
1. Add Bootstrap CDN
2. Link to jQuery
3. Put HTML elements inside `.jumbotron`

		<!DOCTYPE html>
		<html lang="en">
			<head>
				<title>Bootstrap Theme Company</title>
				<meta charset="utf-8">
				<meta name="viewport" value="width=device-width,initial-scale=1">
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
				<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			</head>
			<body>
				<div class="jumbotron">
					<h1>Company</h1>
					<p>We specialize in blablabla</p>
				</div>
			</body>
		</html>

#### Add Background Color and Center Text ####
1. Add orange background color to the jumbotron.
2. Add the `.text-center` class to center the text inside jumbotron

		<style>
			.jumbotron {
				background-color: #f4511e; /* Orange */
				color: #ffffff;
			}
		</style>

		<body>
			<div class="jumbotron text-center">
				<h1>Company</h1>
				<p>We specialize in blablabla</p>
			</div>
		</body>

#### Add Form ####
1. Add a form with input field and button

		<div class="jumbotron text-center">
			<h1>Company</h1>
			<p>We specialize in blablabla</p>
			<form class="form-inline">
				<div class="input-group">
					<input type="email" class="form-control" size="50" placeholder="Email Address" required>
					<div class="input-group-btn">
						<button type="button" class="btn btn-danger">Subscribe</button>
					</div>
				</div>
			</form>
		</div>

#### Add Containers ####
1. Add two containers `.container-fluid`
	1. Add custom class to second container `.bg-grey` (gray background color)

			<style>
				.bg-grey {
					background-color: #f6f6f6;
				}
			</style>

			<div class="container-fluid">
				<h2>About Company Page</h2>
				<h4>Lorem ipsum..</h4>
				<button class="btn btn-default btn-lg">Get in Touch</button>
			</div>

			<div class="container-fluid bg-grey">
				<h2>Our Values</h2>
				<h4><strong>MISSION:</strong> Our mission lorem ipsum..</h4>
				<p><strong>VISION:</strong> Our vision Lorem ipsum..</p>
			</div>

#### Add Padding ####
1. Add padding to make jumbotron and containers look good:

		<style>
			.jumbotron {
				background-color: #f4511e;
				color: #fff;
				padding: 100px 25px;
			}
			
			.container-fluid {
				padding: 60px 50px;
			}
		</style>

#### Add a Grid ####
1. Add icon (company's logo) to each container
2. Separate icon and "about text" by building two columns (`.col-sm-8` and `.col-sm-4`)
3. Add media queries to center "logo column" on screens smaller than 768 pixels wide

		<style>
			.logo {
				font-size: 200px;
			}
			@media screen and (max-width: 768px) {
				.col-sm-4 {
					text-align: center;
					margin: 25px 0;
				}
			}
		</style>

		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-8">
					<h2>About Company Page</h2>
					<h4>Lorem ipsum..</h4>
					<p>Lorem ipsum..</p>
					<button class="btn btn-default btn-lg">Get in Touch</button>
				</div>
				<div class="col-sm-4">
					<span class="glyphicon glyphicon-signal logo"></span>
				</div>
			</div>
		</div>

		<div class="container-fluid bg-grey">
			<div class="row">
				<div class="col-sm-4">
					<span class="glyphicon glyphicon-globe logo"></span>
				</div>
				<div class="col-sm-8">
					<h2>Our Values</h2>
					<h4><strong>MISSION:</strong> Our mission lorem ipsum..</h4>
					<p><strong>VISION:</strong> Our vision Lorem ipsum..</p>
				</div>
			</div>
		</div>

#### Add Services Container ####
1. Add new container with 2 x 3 columns of equal width (`.col-sm-4`):

		<div class="container-fluid text-center">
			<h2>SERVICES</h2>
			<h4>What we offer</h4>
			<br>
			<div class="row">
				<div class="col-sm-4">
					<span class="glyphicon glyphicon-off"></span>
					<h4>POWER</h4>
					<p>Lorem ipsum dolor sit amet..</p>
				</div>
				<div class="col-sm-4">
					<span class="glyphicon glyphicon-heart"></span>
					<h4>LOVE</h4>
					<p>Lorem ipsum dolor sit amet..</p>
				</div>
				<div class="col-sm-4">
					<span class="glyphicon glyphicon-lock"></span>
					<h4>JOB DONE</h4>
					<p>Lorem ipsum dolor sit amet..</p>
				</div>
			</div>
			<br><br>
			<div class="row">
				<div class="col-sm-4">
					<span class="glyphicon glyphicon-leaf"></span>
					<h4>GREEN</h4>
					<p>Lorem ipsum dolor sit amet..</p>
				</div>
				<div class="col-sm-4">
					<span class="glyphicon glyphicon-certificate"></span>
					<h4>CERTIFIED</h4>
					<p>Lorem ipsum dolor sit amet..</p>
				</div>
				<div class="col-sm-4">
					<span class="glyphicon glyphicon-wrench"></span>
					<h4>HARD WORK</h4>
					<p>Lorem ipsum dolor sit amet..</p>
				</div>
			</div>
		</div>

#### Styling Icons ####
1. Add custom class `.logo-small` to each glyphicon in "Services" container. Use CSS to style them:

		/* Add an orange color to all icons and set the font-size */
		.logo-small {
			color: #f4511e;
			font-size: 50px;
		}

		.logo {
			color: #f4511e;
			font-size: 200px;
		}

#### Add Portfolio Container ####
1. Build new full-width container, with three columns of equal width (`.col-sm-4`)
	1. In each column, add an image
		1. Use `.img-thumbnail` to shape the image to thumbnail (in `<img>` usually)
2. Code:

		<div class="container-fluid text-center bg-grey">
			<h2>Portfolio</h2>
			<h4>What we have built</h4>
			<div class="row text-center">
				<div class="col-sm-4">
					<div class="thumbnail">
						<img src="paris.jpg" alt="Paris">
						<p><strong>Paris</strong></p>
						<p>Yes, we built Paris</p>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="thumbnail">
						<img src="newyork.jpg" alt="New York">
						<p><strong>New York</strong></p>
						<p>We built New York</p>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="thumbnail">
						<img src="sanfran.jpg" alt="San Francisco">
						<p><strong>San Francisco</strong></p>
						<p>Yes, San Fran is ours</p>
					</div>
				</div>
			</div>
		</div>

#### Styling Thumbnail Images ####
1. Use CSS
	1. Making them look like cards: remove border and set 100% width on each image
2. Code:

		.thumbnail {
			padding: 0 0 15px 0;
			border: none;
			border-radius: 0;
		}

		.thumbnail img {
			width: 100%;
			height: 100%;
			margin-bottom: 10px;
		}

#### Add a Carousel ####
1. Code:

		<h2>What our customers say</h2>
		<div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<h4>"This company is the best. I am so happy with the result!"<br><span style="font-style:normal;">Michael Roe, Vice President, Comment Box</span></h4>
				</div>
				<div class="item">
					<h4>"One word... WOW!!"<br><span style="font-style:normal;">John Doe, Salesman, Rep Inc</span></h4>
				</div>
				<div class="item">
					<h4>"Could I... BE any more happy with this company?"<br><span style="font-style:normal;">Chandler Bing, Actor, FriendsAlot</span></h4>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

#### Style The Carousel ####
1. Use CSS:

		.carousel-control.right, .carousel-control.left {
			background-image: none;
			color: #f4511e;
		}
		.carousel-indicators li {
			border-color: #f4511e;
		}
		.carousel-indicators li.active {
			background-color: #f4511e;
		}
		.item h4 {
			font-size: 19px;
			line-height: 1.375em;
			font-weight: 400;
			font-style: italic;
			margin: 70px 0;
		}
		.item span {
			font-size: normal;
		}

#### Add Pricing Container ####
1. Build a full container with three columns of equal widht `.col-sm-4`: Inside each column, add a panel:

		<div class="container-fluid">
			<div class="text-center">
				<h2>Pricing</h2>
				<h4>Choose a payment plan that works for you</h4>
			</div>
			<div class="row">
				<div class="col-sm-4">
					<div class="panel panel-default text-center">
						<div class="panel-heading">
							<h1>Basic</h1>
						</div>
						<div class="panel-body">
							<p><strong>20</strong> Lorem</p>
							<p><strong>15</strong> Ipsum</p>
							<p><strong>5</strong> Dolor</p>
							<p><strong>2</strong> Sit</p>
							<p><strong>Endless</strong> Amet</p>
						</div>
						<div class="panel-footer">
							<h3>$19</h3>
							<h4>per month</h4>
							<button class="btn btn-lg">Sign Up</button>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="panel panel-default text-center">
						<div class="panel-heading">
							<h1>Pro</h1>
						</div>
						<div class="panel-body">
							<p><strong>50</strong> Lorem</p>
							<p><strong>25</strong> Ipsum</p>
							<p><strong>10</strong> Dolor</p>
							<p><strong>5</strong> Sit</p>
							<p><strong>Endless</strong> Amet</p>
						</div>
						<div class="panel-footer">
							<h3>$29</h3>
							<h4>per month</h4>
							<button class="btn btn-lg">Sign Up</button>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="panel panel-default text-center">
						<div class="panel-heading">
							<h1>Premium</h1>
						</div>
						<div class="panel-body">
							<p><strong>100</strong> Lorem</p>
							<p><strong>50</strong> Ipsum</p>
							<p><strong>25</strong> Dolor</p>
							<p><strong>10</strong> Sit</p>
							<p><strong>Endless</strong> Amet</p>
						</div>
						<div class="panel-footer">
							<h3>$49</h3>
							<h4>per month</h4>
							<button class="btn btn-lg">Sign Up</button>
						</div>
					</div>
				</div>
			</div>
		</div>

#### Styling Panels ####
1. Code:

		.panel {
			border: 1px solid #f4511e;
			border-radius: 0;
			transition: box-shadow 0.5s;
		}

		.panel:hover {
			box-shadow: 5px 0px 40px rgba(0, 0, 0, .2);
		}

		.panel-footer .btn:hover {
			border: 1px solid #f4511e;
			background-color: #fff !important;
			color: #f4511e;
		}

		.panel-heading {
			color: #fff !important;
			background-color: #f4511e !important;
			padding: 25px;
			border-bottom: 1px solid transparent;
			border-top-left-radius: 0px;
			border-top-right-radius: 0px;
			border-bottom-left-radius: 0px;
			border-bottom-right-radius: 0px;
		}

		.panel-footer {
			background-color: #fff !important;
		}

		.panel-footer h3 {
			font-size: 32px;
		}

		.panel-footer h4 {
			color: #aaa;
			font-size: 14px;
		}

		.panel-footer .btn {
			margin: 15px 0;
			background-color: #f4511e;
			color: #fff;
		}

#### Add Contact Container ####
1. Add new container with contact info:

		<div class="container-fluid bg-grey">
			<h2 class="text-center">CONTACT</h2>
			<div class="row">
				<div class="col-sm-5">
					<p>Contact us and we'll get back to you within 24 hours.</p>
					<p><span class="glyphicon glyphicon-map-marker"></span> Chicago, US</p>
					<p><span class="glyphicon glyphicon-phone"></span> +00 1515151515</p>
					<p><span class="glyphicon glyphicon-envelope"></span> myemail@something.com</p>
				</div>
				<div class="col-sm-7">
					<div class="row">
						<div class="col-sm-6 form-group">
							<input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
						</div>
						<div class="col-sm-6 form-group">
							<input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
						</div>
					</div>
					<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
					<div class="row">
						<div class="col-sm-12 form-group">
							<button class="btn btn-default pull-right" type="submit">Send</button>
						</div>
					</div>
				</div>
			</div>
		</div>

#### Add Google Maps ####
1. [Google Maps Tutorial](https://www.w3schools.com/graphics/google_maps_intro.asp)
2. Code:

		<!-- Add Google Maps -->
		<div id="googleMap" style="height:400px;width:100%">
		</div>
		<script>
			function myMap() {
				var myCenter = new google.maps.LatLng(41.878114, -87.629798);
				var mapProp = {
					center: myCenter,
					zoom: 12,
					scrollwheel: false,
					draggable: false,
					mapTypeId: google.maps.MapTypeId.ROADMAP
				};
				var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
				var marker = new google.maps.Marker({ position: myCenter });
				marker.setMap(map);
			}
		</script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfRIIYhNwTaaPMYZ5jyJiBRtVeXlPu620&callback=myMap"></script>

#### Add a Navbar ####
1. Navbar at the top of screen that collapses on smaller screens:

		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Logo</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#about">ABOUT</a></li>
						<li><a href="#services">SERVICES</a></li>
						<li><a href="#portfolio">PORTFOLIO</a></li>
						<li><a href="#pricing">PRICING</a></li>
						<li><a href="#contact">CONTACT</a></li>
					</ul>
				</div>
			</div>
		</nav>

	1. `navbar-right` right aligns navigation buttons

#### Style The Navbar ####
1. Use CSS for customization:

		.navbar {
			margin-bottom: 0;
			background-color: #f4511e;
			z-index: 9999;
			border: 0;
			font-size: 12px !important;
			line-height: 1.42857143 !important;
			letter-spacing: 4px;
			border-radius: 0;
		}
		
		.navbar li a, .navbar .navbar-brand {
			color: #fff !important;
		}

		.navbar-nav li a:hover, .navbar-nav li.active a {
			color: #f4511e !important;
			background-color: #fff !important;
		}

		.navbar-default .navbar-toggle {
			border-color: transparent;
			color: #fff !important;
		}

#### Add Scrollspy ####
1. Add scrollspy to automatically update navbar links when scolling:

		<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

		<div id="about" class="container-fluid">
		<div id="services" class="container-fluid">
		<div id="portfolio" class="container-fluid">
		<div id="pricing" class="container-fluid">
		<div id="contact" class="container-fluid">

#### Add a Footer ####
1. Add "Up Arrow" to footer that will take use to top of the page when clicked on:

		<style>
			footer .glyphicon {
				font-size: 20px;
				margin-bottom: 20px;
				color: #f4511e;
			}
		</style>

		<footer class="container-fluid text-center">
			<a href="#myPage" title="To Top">
				<span class="glyphicon glyphicon-chevron-up"></span>
			</a>
			<p>Bootstrap Theme Made By <a href="https://www.w3schools.com" title="Visit w3schools">www.w3schools.com</a></p>
		</footer>

#### Adding Smooth Scrolling ####
1. Use jQuery to add smooth scrolling (when clicking on links in navbar)

		<script>
			$(document).ready(function () {
				// Add smooth scrolling to all links in navbar + footer link
				$(".navbar a, footer a[href='#myPage']").on('click', function (event) {
					// Make sure this.hash has a value before overriding default behavior
					if (this.hash !== "") {
						// Prevent default anchor click behavior
						event.preventDefault();

						// Store hash
						var hash = this.hash;

						// Using jQuery's animate() method to add smooth page scroll
						// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
						$('html, body').animate({
							scrollTop: $(hash).offset().top
						}, 900, function () {
							// Add hash (#) to URL when done scrolling (default click behavior)
							window.location.hash = hash;
						});
					}
				})
			});
		</script>

#### Final Touch ####
1. Personalize theme by adding font that we like.
	1. "Montserrat" and "Lato" from Google's Font library
2. Link to font in `<head>`

		<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
		<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">

3. Use theme in the page

		body {
			font: 400 15px Lato, sans-serif;
			line-height: 1.8;
			color: #818181;
		}

		.jumbotron {
			font-family: Montserrat, sans-serif;
		}

		.navbar {
			font-family: Montserrat, sans-serif;
		}

4. Extra style to some elements:

		h2 {
			font-size: 24px;
			text-transform: uppercase;
			color: #303030;
			font-weigth: 600,
			margin-bottom: 30px;
		}

		h4 {
			font-size: 19px;
			line-height: 1.375em;
			color: #303030;
			font-weight: 400;
			margin-bottom: 30px;
		}

##### Slide In Elements #####
1. Animation effect that slides in elements when we scroll
	1. Just add `.slideanim` class to element you want to slide in
		1. Add the following to CSS and jQuery
			1. We can modify
				1. duration
				2. opacity
				3. where to start
				4. when to slide in
				5. ...
2. Code:

		.slideanim { visibility: hidden; }
		.slide {
			/* The name of the animation */
			animation-name: slide;
			-webkit-animation-name: slide;
			/* The duration of the animation */
			animation-duration: 1s;
			-webkit-animation-duration: 1s;
			/* Make the element visible */
			visibility: visible;
		}
		/* Go from 0% to 100% opacity (see-through) and specify the percentage from when to slide in the element along the Y-axis */
		@keyframes slide {
			0% {
				opacity: 0;
				transform: translateY(70%);
			}
			100% {
				opacity: 1;
				transform: translateY(0%);
			}
		}
		@-webkit-keyframes slide {
			0% {
				opacity: 0;
				transform: translateY(70%);
			}
			100% {
				opacity: 1;
				transform: translateY(0%);
			}
		}

		$(window).scroll(function () {
			$(".slideanim").each(function () {
				var pos = $(this).offset().top;

				var winTop = $(window).scrollTop();
				if (pos < winTop + 600) {
					$(this).addClass("slide");
				}
			});
		});


#### Complete "Company" Theme ####
