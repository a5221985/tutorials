# HTML 5 #
## Tags ##
1. Helps display and organize content
	1. `<p>Content</p>`
2. Open text editor
	1. HTML

			<!DOCTYPE html>
			<html>
				<head>
					<meta charset="UTF-8">
					<title>Easily Learn HTML5</title>
				</head>
				<body>
					<p>Once I complete this course, I'll be able to create webpages using HTML5</p>
					<p>Once I learn HTML5, I can learn CSS3 to make my website beautiful</p>
				</body>
			</html>

3. `<h1></h1>`
4. `<img>`: no closing tag

## Elements ##
1. `<p>Content</p>`: element
2. Get the list of HTML5 elements in Google.

## Attributes ##
1. Additional info we add to elements

		<h1 id="sample">Learning HTML 5</h1>

2. Google list of attributes (W3C, MDN)

## Handcoding our first HTML5 ##
1. HTML stub code

		<!DOCTYPE html>
		<html>
			<head>
				<meta charset="UTF-8">
				<title>Easily Learn HTML5</title>
			</head>
			<body>

			</body>
		</html>

2. New folder `html`
3. New file `html/index.html`
4. Elements:
	1. `html`: root of document
	2. `head`: info about document
	3. `meta`: attribute requires to specify information
	4. `title`:
	5. `body`: content that is displayed on browser
5. Code:
	
		<!DOCTYPE html>
		<html>
			<head>
				<meta charset="UTF-8">
				<title>Easily Learn HTML5</title>
			</head>
			<body>
				<h1>Learning html 5</h1>

				<p>Learning html5 is fun</p>
			</body>
		</html>

6. Headings:

		<!DOCTYPE html>
		<html>
			<head>
				<meta charset="UTF-8">
				<title>Easily Learn HTML5</title>
			</head>
			<body>
				<h1>Example</h1>

				<h2>First paragraph</h2>
				<p>This is some smaple text for our first paragraph</p>

				<h2>Second paragraph</h2>						<p>This is some sample text for our second paragraph</p>

			</body>
		</html>

7. Images
	1. Add a folder for images
		1. `html/img/logo.png`

				<!DOCTYPE html>
				<html>
					<head>
						<meta charset="UTF-8">
						<title>Easily Learn HTML5</title>
					</head>
					<body>						
						<h1>Example</h1>

						<h2>First paragraph</h2>
						<p>This is some smaple text for our first paragraph</p>

						<h2>Second paragraph</h2>						<p>This is some sample text for our second paragraph</p>

						<img src="img/logo.png">
					</body>
				</html>

8. css
	1. New folder `html/css`
	2. New file `html/css/style.css`

			<head>
				<title>Easily Learn HTML5</title>
				<link rel="stylesheet" href="css/style.css">
			</head>

	3. Test

			body {
				background-color: green;
			}
	
	4. Resize image

			img {
				width: 300px;
				height: 300px;
			}	

9. Adding comments & links
	1. html

			<!-- This h1 heading is supposed to be a link to example.com -->
			<a href="http://www.example.com"><h1>Example</h1></a>

			<a href="http://www.google.com"><img src="img/logo.png"></a>

10. New HTML 5 elements
	1. New folder `html 5 blog`
	2. New file `html 5 blog/index.html`
	3. New folder `html 5 blog/css`
	4. New file `html 5 blog/css/main.css`
	5. New folder `html 5 blog/images`
	6. Markup
			
			<!DOCTYPE html>
			<html>
				<head>
					<meta charset="UTF-8">
					<title>HTML 5 blog</title>
					<link rel="stylesheet" href="css/main.css">
				</head>
				<body>						
					<header class="head">
						<h1>HTML 5 Blog</h1>
						<p>Best place to stay up to date on all things html 5</p>
					</header>
				</body>
			</html>

11. nav element
	1. Helps google and yahoo understand the content

			<nav>
				<ul>
					<li><a href="#">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</nav>

			<main>
				<section>
					<h2>Html 5</h2>
					<article>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
					</article>
				</section>
			</main>

			<main>
				<section>
					<h2>Css 3</h2>
					<article>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
					</article>
				</section>
			</main>

			<aside>
				<h2>Place your ad here</h2>
				<p>We now have more than one million hits a da</p>
			</aside>

			<footer>
				<p>Html 5 blog all copy rights reserer to html 5 blog</p>
			</footer>

12. CSS
			
		body {
			margin: 0 auto;
			padding: 0 auto;
			background-color: #98DDDD;
			width: 960px;
			font-family: Verdana, helvetica, san-serif;
			font-size: 14px; 
		}

		.head {
			background-color: #abb3e3;
			padding: 10px 20px;
		}

		nav {
			background-color: #987dd4;
			padding: 1px;
		}

		li {
			display: inline;
			font-size: 15px;
			font-family: helvetica, san-serif;
			margin-left: 7px;
			margin-right: 7px;
		}

		a {
			text-decoration: none;
			color: black;
		}

		section {
			background-color: #90dabf;
		}

		main {
			width: 640px;
			float: left;
		}

		footer {
			background-color: #987dd4;
			clear: both;
			padding: 3px 40px;
			position: relative;
			text-align: center;
		}

		aside {
			background-color: #ede4f6;
			font-size: 12px;
			width: 270px;
			float: right;
			padding: 20px;
			margin: 10px;
		}
		