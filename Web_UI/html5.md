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
					<header>
						<h1>HTML 5 Blog</h1>
						<p>Best place to stay up to date on all things html 5</p>
					</header>
				</body>
			</html>
			
		