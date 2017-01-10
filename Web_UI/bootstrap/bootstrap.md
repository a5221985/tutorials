# Bootstrap #
## What will be created ##
1. Single Page
	1. Logo
	2. Countdown
	3. Social networking links
	4. login

## Installation ##
1. Search for bootstrap
2. Download latest compiled version
3. Extract

## File structure ##
1. Open brackets
2. New Blank file
	1. Goto css folder
	2. save as style.css
3. New Blank file
	1. Goto bootstrap site/ Documentation and copy paste starter template
	2. Remove `<h1>Hello World</h1>`
	3. Under `<head>`

			<link rel="stylesheet" href="css/style.css" />

	4. Goto css folder
	5. Save as index.html

## Font Awesome ##
1. Search for `font awesome`
2. Click **Icons**
3. Click **Download**
4. Extract to root of project
5. Remove version number
6. Add link in index.html

		<link rel="stylesheet" href="font-awesome/css/font-awesome.css">

## Download Course Images ##
1. Download from the lecture
2. Extract to root of project

## Background Image ##
1. Open style.css

		html {
			background: url('../img/bg.jpg') center center no-repeat;
			height: 100%;
			background-size: cover;
		}

## Logo ##

		<body>
			<section id="logo">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-xs-center">
							<img src="img/my-logo.png" class="img-fluid"/>
						</div>
					</div>
				</div>
			</section>
		</body>

1. style.css

		html, body {
			...
		}

		#logo img {
			padding-top: 20px;
		}

## Adding the Intro ##

		<body>
			...
			<section id="intro">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<p>We're working hard, we'll should be ready to launch in...</p>
						</div>
					</div>
				</div>
			</section>
		</body>


1. style.css

		#intro p {
			color: white;
			text-align: center;
		}

2. Google fonts:
	1. Search
	2. Search for just another
	3. Click on bottom button
		1. `<link ...>`
		2. `font-family: ...`
3. Increase size:
	
		#intro p {
			...
			font-size: 1.8em;
		}

## Adding the Countdown ##

		<section id="counter">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="countdown"></div>
					</div>
				</div>
			</div>
		</section>

1. Search for rendro countdown (jquery plugin)
	1. Click **Clone or download**
2. Extract the file
	1. copy `dest/jquery-countdown.js` to `js` folder of project
3. Goto github page
	1. Copy two sections:
			
			<script ...
			<script ...
			<script>
				$(function)
					...
			</script>

	2. Change `src="..."` to `src="js/jquery.countdown.js"`
	3. Change `$('. ...')` to `$('.countdown')` 

4. Add div class

		<div class="countdown"></div>

## Styling Countdown ##

		#counter .countdown {
			text-aling: center;
			color: white;
		}

1. Add custom font
	1. Search for Google fonts
	2. Search for Amatic SC
		1. Click +
		2. Customize > Bold
		3. Copy `<link ...>`
		4. Copy `font-family: ...` to style.css
2. Size:
		
		font-size: 3em;

4. Margin

		margin: -15px 0 0;

5. Removing years
	1. Open js file
	2. comment out year in function

## Linking Social Accounts ##
1. Section

		<section id="icons">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						
					</div>
				</div>
			</div>
		</section>

2. Search for font-awesome (scalable vector icons)
	1. Click **Icons**
	2. Search for **twitter**
		1. Copy the line of code
		
				<section id="icons">
          			<div class="container">
              			<div class="row">
                 	 		<div class="col-md-12">
                 	     		<ul class="list-inline">
                 	         		<li><a href="http://www.twitter.com" target="blank"><i class="fa fa-twitter-square fa-3x" aria-hidden="true"></i></a></li>
                 	         		<li><a href="http://www.facebook.com" target="blank"><i class="fa fa-facebook-square fa-3x" aria-hidden="true"></i></a></li>
                  	 		       	<li><a href="http://www.google.com" target="blank"><i class="fa fa-google-plus-square fa-3x" aria-hidden="true"></i></a></li>
                   		     		<li><a href="http://www.instagram.com" target="blank"><i class="fa fa-instagram fa-3x" aria-hidden="true"></i></a></li></ul>
                  			</div>
              			</div>
          			</div>
      			</section>

	3. Goto font-awesome website
		1. Click on **Examples**
			1. Change size:
				1. add `fa-3x` attribute
	4. Facebook icon:
		1. Copy and paste the link
			1. change the class to facebook
	5. Google+ icon:
		1. Copy and paste the link
			1. change the class to google+
	6. Instagram icon:
		1. Copy and paste the link
			1. change the class to instagram

3. Styling:
	
		#icons {
			text-align: center;
		}

		#icons .fa {
			color: white;
			margin: 5px 15px; // top and bottom, sides
			position: relative;
			bottom: 0;
			transition: all 0.2s ease-in-out;
		}

4. Bouncy effect:
	1. New classes
		1. twitter, facebook, google, instagram

	2. Style:

			#icons .twitter:hover {
				color: #6cadde;
				bottom: 5px;
			}

			#icons .facebook:hover {
				color: #3b5998;
				bottom: 5px;
			}

			#icons .google:hover {
				color: #ea4335;
				bottom: 5px;
			}

			#icons .instagram:hover {
				color: #517fa6;
				bottom: 5px;
			}

## Adding Sign Up Box ##
1. New section

		<section id="signup">
			<div ...>
				...
				<form class="form-inline" role="form" method="post" action="#signup">
					<input type="email" class="form-control form-control-sm" name="email" placeholder="enter your email" />
					<button type="submit" class="btn-signup btn-sm" name="submit" value="send">find out more</button>
				</form>
			</div>
		</section>

2. Goto bootstrap website
3. Goto forms section
	1. Inline forms
4. Align content

		#signup {
			text-aling: center;
			color: white;
		}

		#signup .btn-signup {
			background-color: rgba(161, 286, 226, 0.5);
			transition: all 0.3s ease-in-out;
		}

		#signup .btn-signup:hover {
			background-color: rgba(37, 165, 82, 1);
		}

## Adding Media Queries ##
1. Firefox: Toggleresponsive addon
2. Style

		@media(max-width: 768px) {
			#logo img {
				width: 50%;
			}

			#counter .countdown {
				font-size: 1.4em !important; # since font-size already set
			}

			#icons .fa {
				margin: 10px 0 0 !important;
				font-size: 2em;
			}
		}

## Adding Additional Media Queries ##
1. Horizontal screen
	1. Style

			@media(min-width: 321px)
				and (max-width: 568px) {
				#logo img {
					width: 20%;
				}
			}

## PHP Markup ##
1. Save html file as php file
2. Upload files to filezilla where server is running

		<?php
			if (isset($_POST['submit'])) {
				$from = $_POST['email'];
				$to = 'php@coderandyc.com';
				$subject = 'Email signup';
				$body = 'Please sign me up to the mailing list';

				if (!$from) {
					$emailError = 'Please enter a valid email address';
				}

				if (!$emailError) {
					if (mail ($to, $subject, $body, $from)) {
						$result = 'thank you we should keep you updated';
					} else {
						$result = 'sorry there has been an error, please try again';
					}
				}
			}
		?>


			</form>

			<?php echo $emailError; ?>
			<?php echo $result; ?>

## Styling ##
1. Wrap message in `<div>` to `$emailError`

		<div class="text-danger">Please enter a valid email address</div>

2. Goto font-awesome
	1. Select `warning` sign
3. Success:

		<div class="text-success"><i class="..."></i> &nbsp;thank you ....</div>
4. Other error:

		<div class="text-success"><i class="..."></i> &nbsp; ....</div>

## Viewing our final page ##
1. Installed bootstrap, font-awesome
2. Added elements (logo, ...)
3. Intro text
4. Custom fonts google
5. Scripts on page
6. Remove year from js
7. social icons
8. positioning elements
9. email form
10. page rendered correctly on different devices
11. php markup
12. server
13. messages