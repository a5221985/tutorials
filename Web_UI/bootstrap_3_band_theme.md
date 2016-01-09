### BS Theme "Band" ###
#### Creation of a Theme: "The Band" ####
1. Building bootstrap theme from scratch
2. Steps:
	1. Start with simple HTML page
	2. Add components one by one until we get fully functional, personal response website

#### HTML Start Page ####
1. Bare bones:

		<!DOCTYPE html>
		<html>
			<head>
				<title>Bootstrap Them The Band</title>
				<meta charset="utf-8">
			</head>
			<body>
				<div>
					<h3>THE BAND</h3>
					<p>We love music!</p>
					<p>We have built a functional band website. Lorem ipsum..</p>
				</div>
			</body>
		</html>

#### Add Bootstrap CDN and Add a Container ####
1. Add bootstrap CDN and a link to jQuery and put HTML elements inside container (`.container`)

		<!DOCTYPE html>
		<html lang="en">
			<head>
				<title></title>
				<meta charset="utf-8">
				<meta name="viewport" content="width=device-width, initial-scale=1">
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
				<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			</head>
			<body>
				<h3>THE BAND</h3>
				<p>We love voice!</p>
				<p>We have built a fictional band website. Lorem ipsum..</p>
			</body>
		</html>

#### Center Text ####
1. Add `.text-center` to center text inside container
	1. Use `<em>` to make the "We love voice" text italic
2. Example:

		<div class="container text-center">
			<h3>THE BAND</h3>
			<p><em>We love voice!</em></p>
			<p>We have built a fictional band website. Lorem ipsum..</p>
		</div>

#### Add Padding ####
1. Use CSS to make container look good

		.container {
			padding: 80px 120px;
		}

#### Add a Grid ####
1. Build three columns of equal width `.col-sm-4`
2. Add text and images and put them inside the container

		<div class="container text-center">
			<h3>THE BAND</h3>
			<p><em>We love voice!</em></p>
			<p>We have built a fictional band website. Lorem ipsum..</p>
			<br/>
			<div class="row">
				<div class="col-sm-4">
					<p><strong>Name</strong></p><br/>
					<img src="bandmember.jpg" alt="Random Name">
				</div>
				<div class="col-sm-4">
					<p><strong>Name</strong></p><br/>
					<img src="bandmember.jpg" alt="Random Name">
				</div>
				<div class="col-sm-4">
					<p><strong>Name</strong></p>
					<img src="bandmember.jpg" alt="Random Name">
				</div>
			</div>
		</div>

#### Circle Image ####
1. Shape image to a circle with `.img-circle`
2. Add some CSS to make it look good

		.person {
			border: 10px solid transparent;
			margin-bottom: 25px;
			width: 80%;
			height: 80%;
			opacity: 0.7;
		}

		.person:hover {
			border-color: #f1f1f1;
		}

		<img src="https://www.w3schools.com/bootstrap/bandmember.jpg" class="img-circle person" alt="Random Name">
		<img src="https://www.w3schools.com/bootstrap/bandmember.jpg" class="img-circle person" alt="Random Name">
		<img src="https://www.w3schools.com/bootstrap/bandmember.jpg" class="img-circle person" alt="Random Name">

#### Collapsibles ####
1. Make images collabpsible (show extra content when you click on each image)
2. Example:

		<div class="row">
			<div class="col-sm-4">
				<p class="text-center"><strong>Name</strong></p><br/>
				<a href="#demo" data-toggle="collapse">
					<img src="bandmember.jpg" class="img-circle person" alt="Random Name">
				</a>
				<div id="demo" class="collapse">
					<p>Lead Vocalist</p>
					<p>Loves long walks on the beach</p>
					<p>Member since 1988</p>
				</div>
			</div>
			<div class="col-sm-4">
				<p class="text-center"><strong>Name</strong></p><br/>
				<a href="#demo2" data-toggle="collapse">
					<img src="bandmember.jpg" class="img-circle person" alt="Random Name">
				</a>
				<div id="demo2" class="collapse">
					<p>Dougher</p>
					<p>Loves doughin'</p>
					<p>Member since 1988</p>
				</div>
			</div>
			<div class="col-sm-4">
				<p class="text-center"><strong>Name</strong></p><br/>
				<a href="#demo3" data-toggle="collapse">
					<img src="bandmember.jpg" class="img-circle person" alt="Random Name">
				</a>
				<div id="demo3" class="collapse">
					<p>Mimicry artist</p>
					<p>Loves math</p>
					<p>Member since 2005</p>
				</div>
			</div>
		</div>

#### Add a Carousel ####
1. Add a carousel before the container
2. Example:

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="ny.jpg" alt="New York">
					<div class="carousel-caption">
						<h3>New York</h3>
						<p>The atmosphere in New York is lorem ipsum.</p>
					</div>
				</div>

				<div class="item">
					<img src="chicago.jpg" alt="Chicago">
					<div class="carousel-caption">
						<h3>Chicago</h3>
						<p>Thank you, Chicago - A night we won't forget.</p>
					</div>
				</div>

				<div class="item">
					<img src="la.jpg" alt="Los Angeles">
					<div class="carousel-caption">
						<h3>LA</h3>
						<p>Even though the traffic was a mess, we had the best time.</p>
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
		</div>

#### Style The Carousel ####
1. Use CSS:

		.carousel-inner img {
			-webkit-filter: grayscale(90%);
			filter: grayscale(90%); /* make all photos black and white */
			width: 100%; /* Set width to 100% */
			margin: auto;
		}

		.carousel-caption h3 {
			color: #fff !important;
		}

		@media (max-width: 600px) {
			.carousel-caption {
				display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
			}
		}

#### Add Tour Container ####
1. Add new container
2. Add list `.list-group` and `.list-group-item`
3. Add custom class (`.bg-1`) to container (black background color)
4. Add styles to children
5. Example:

		<style>
			.bg-1 {
				background: #2d2d30;
				color: #bdbdbd;
			}

			.bg-1 h3 { color: #fff; }
			.bg-1 p { font-style: italic; }
		</style>

		<div class="bg-1">
			<div class="container">
				<h3 class="text-center">TOUR DATES</h3>
				<p class="text-center">Lorem ipsum we'll play you some voice.<br> Remember to book your tickets!</p>

				<ul class="list-group">
					<li class="list-group-item">September Sold Out!</li>
					<li class="list-group-item">October Sold Out!</li>
					<li class="list-group-item">November 3</li>
				</ul>
			</div>
		</div>

#### Add Labels & Badges ####
1. Code:

		<ul class="list-group">
			<li class="list-group-item">September <span class="label label-danger">Sold Out!</span></li>
			<li class="list-group-item">October <span class="label label-danger">Sold Out!</span></li>
			<li class="list-group-item">November <span class="badge">3</span></li>
		</ul>

#### Add Thumbnail Images ####
1. Inside container, add columns of equal width (`.col-sm-4`)
2. Add image in each column
3. Shape image to thumbnail using `.img-thumbnail`
4. Code:

		<div class="row text-center">
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="paris.jpg" alt="Paris">
					<p><strong>Paris</strong></p>
					<p>Fri. 27 November 2015</p>
					<button class="btn">Buy Tickets</button>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="newyork.jpg" alt="New York">
					<p><strong>New York</strong></p>
					<p>Sat. 28 November 2015</p>
					<button class="btn">Buy Tickets</button>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="sanfran.jpg" alt="San Francisco">
					<p><strong>San Francisco</strong></p>
					<p>Sun. 29 November 2015</p>
					<button class="btn">Buy Tickets</button>
				</div>
			</div>
		</div>

#### Style Lists, Thumbnails & Buttons ####
1. Use CSS to style lists and thumbnail images
	1. Remove rounded borders from list
	2. Converting thumbnail images like cards (removing border)
	3. Set width as 100% on each image
	4. Modify default styles of Bootstrap's `.btn` to black button

			/* Remove rounded borders from list */
			.list-group-item:first-child {
				border-top-right-radius: 0;
				border-top-left-radius: 0;
			}

			.list-group-item:last-child {
				border-bottom-right-radius: 0;
				border-bottom-left-radius: 0;
			}

			/* Remove border and add padding to thumbnails */
			.thumbnail {
				padding: 0 0 15px 0;
				border: none;
				border-radius: 0;
			}

			.thumbnail p {
				margin-top: 15px;
				color: #555;
			}

			/* Black buttons with extra padding and without rounded borders */
			.btn {
				padding: 10px 20px;
				background-color: #333;
				color: #f1f1f1;
				border-radius: 0;
				transition: .2s;
			}

			/* On hover, the color of .btn will transition to white with black text */
			.btn:hover, .btn:focus {
				border: 1px solid #333;
				background-color: #fff;
				color: #000;
			}

#### Add a Modal ####
1. Change buttons inside thumbnail from `<button class="btn">Buy Tickets</button>` to `<button class="btn" data-toggle="modal" data-target="#myModal">Buy Tickets</button>`
	1. Used to open modal
2. Code:

		<style>
			/* Add a dark gray background color to the modal header and center text */
			.modal-header, h4, .close {
				background-color: #333;
				color: #fff !important;
				text-align: center;
				font-size: 30px;
			}

			.modal-header, .modal-body {
				padding: 40px 50px;
			}
		</style>

		<!-- Used to open the Modal -->
		<button class="btn" data-toggle="modal" data-target="#myModal">Buy Tickets</button>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				
				<!-- Modal content -->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-lock"></span> Tickets</h4>
					</div>
					<div class="modal-body">
						<form role="form">
							<div class="form-group">
								<label for="psw"><span class="glyphicon glyphicon-shopping-cart"></span> Tickets, $23 per person</label>
								<input type="number" class="form-control" id="psw" placeholder="How manu?">
							</div>
							<div class="form-group">
								<label for="usrname"><span class="glyphicon glyphicon-user"></span> Send To</label>
								<input type="text" class="form-control" id="usrname" placeholder="Enter email">
							</div>
							<button type="submit" class="btn btn-block">Pay <span class="glyphicon glyphicon-ok"></span></button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
						<p>Need <a href="#">help?</a></p>
					</div>
				</div>
			</div>
		</div>

#### Add Contact Container ####
1. Container with two columns of unequal width: `.col-md-4` and `.col-md-8`
2. Add informational icons with text in first column and form controls in second column

		<div class="container">
			<h3 class="text-center">Contact</h3>
			<p class="text-center"><em>We love our fans!</em></p>
			<div class="row test">
				<div class="col-md-4">
					<p>Fan? Drop a note.</p>
					<p><span class="glyphicon glyphicon-map-marker"></span>Chicago, US</p>
					<p><span class="glyphicon glyphicon-phone"></span>Phone: +00 1515151515</p>
					<p><span class="glyphicon glyphicon-envelope"></span>Email: mail@mail.com</p>
				</div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-sm-6 form-group">
							<input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
						</div>
						<div class="col-sm-6 form-group">
							<input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
						</div>
					</div>
					<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
					<div class="row">
						<div class="col-md-12 form-group">
							<button class="btn pull-right" type="submit">Send</button>
						</div>
					</div>
				</div>
			</div>
		</div>

#### Add Togglable Tabs ####
1. Add tabs `.nav nav-tabs` inside contact container with "quotes" from the band members

		<style>
			.nav-tabs li a {
				color: #777;
			}
		</style>

		<h3 class="text-center">From The Blog</h3>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">Mike</a></li>
			<li><a data-toggle="tab" href="#menu1">Chandler</a></li>
			<li><a data-toggle="tab" href="#menu2">Peter</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<h2>Mike Ross, Manager</h2>
				<p>Man, we've been on the road for some time now. Looking forward to lorem ipsum.</p>
			</div>
			<div id="manu1" class="tab-pane fade">
				<h2>Chandler Bing, Guitarist</h2>
				<p>Always a pleasure people! Hope you enjoyed it as much as I did. Could I BE.. any more pleased?</p>
			</div>
			<div id="menu2" class="tab-pane fade">
				<h2>Peter Griffin, Bass player</h2>
				<p>I mean, sometimes I enjoy the show, but other times I enjoy other things.</p>
			</div>
		</div>

#### Google Maps ####
#### Add a Navbar ####
#### Style The Navbar ####
#### Add Scrollspy ####
#### Add a Footer ####
#### Adding Smooth Scrolling ####
#### Final Touch ####
#### Complete "The Band" Theme ####