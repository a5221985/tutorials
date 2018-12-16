# HTML5 Tutorial #
## HTML HOME ##
### HTML Exercises and Quiz Test ###
1. [Start HTML Quiz](https://www.w3schools.com/html/html_quiz.asp)
2. [Start HTML Exercises](https://www.w3schools.com/html/exercise.asp?filename=exercise_attributes1)
### HTML Exam - Get Your Diploma! ###
1. [Get Your Certificate](https://www.w3schools.com/cert/default.asp)

## HTML Introduction ##
### What is HTML? ###
1. It is a standard markup language for building web pages.
2. HTML:
	1. Hyper Text Markup Language
	2. It describes **structure** of webpage using markup
	3. HTML elements: building blocks of html pages
	4. HTML tags: they label pieces of content (Heading, paragraph, table, ...)
	5. Browsers render content of page

### A simple HTML Document ###
1. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<title>Page Title</title>
			</head>
			<body>
				<h1>My Heading</h1>
				<p>My paragraph</p>
			</body>
		</html>

	1. `<!DOCTYPE html>`: declaration defines document to be HTML5
	2. `<html>`: root element of HTML page
	3. `<head>`: contains meta information about document
	4. `<title>`: title for document
	5. `<body>`: contains visible page content
	6. `<h1>`: large headings
	7. `<p>`: paragraph

### HTML Tags ###
1. Syntax: `<tagname>content goes here...</tagname>`
	1. tags usually come in pairs `<p>` and `</p>`
	2. First tag is start tag (opening tag) and second tag is end tag (closing tag)
	3. `/` is inserted for end tag before the tag name

### Web Browsers ###
1. Browser reads HTML documents and display them
2. Browser uses HTML tags to determine how to diplay the document

### HTML Page structure ###

		<html>
			<head>
				<title>Page title</title>
			</head>
			<body>
				<h1>This is a heading</h1>
				<p>This is a paragraph.</p>
				<p>This is another paragraph.</p>
			</body>
		</html>

### The <!DOCTYPE> Declaration ###
1. It represents document type (helps browser to diplay content correctly)
2. It appears only once and it is not case sensitive
3. `<!DOCTYPE html>`

### HTML Versions ###
1. HTML - 1991
2. HTML 2.0 - 1995
3. HTML 3.2 - 1997
4. HTML 4.01 - 1999
5. XHTML - 2000
6. HTML5 - 2014

## HTML Editors ##
### Write HTML Using Notepad or TextEdit ###
1. For learning purpose use Notepad (PC) or TextEdit (Mac)

### Step 1: Open TextEdit (Mac) ###
1. **Finder** > **Applications** > **TextEdit**
2. **Preferences** > **Format** > **Plain Text**
3. **Open and Save**: Check **Ignore rich text commnands in HTML files**
4. New document

### Step 2: Write Some HTML ###

		<!DOCTYPE html>
		<html>
			<body>
				<h1>My Heading</h1>
				<p>My paragraph.</p>
			</body>
		</html>

### Step 3: Save the HTML Page ###
1. **File** > **Save as**
	1. **index.html**
	2. encoding: **UTF-8**

### Step 4: View the HTML Page in Your Browser ###

## HTML Basic ##
### HTML Documents ###
1. Must start with document type declaration
2. Document begins with root element <html> and ends with </html>
3. Visible part of document is between <body> and </body>

### HTML Headings ###
1. `<h1>` to `<h6>` tags
	1. `<h1>`: Most important headings
	2. `<h6>`: Least important headings

### HTML Paragraphs ###
1. `<p>`

### HTML Links ###
1. `<a href="https://www.w3schools.com">This is a link</a>`

### HTML Images ###
1. `<img src="w3schools.jpg" alt="W3Schools.com" width="104" height="142" />`
	1. `width`: width of image
	2. `height`: height of image

## HTML Elements ##
1. `<tagname>Content goes here...</tagname>`: html element
2. HTML elements with no content are called empty elements. They do not have an end tag

### Nexted HTML Elements ###
1. Elements can contain elements
2. Example: html element contains head element and body element

### Do Not Forget the End Tag ###
1. </p> is optional but recommended (do not rely on optional end tags)

### Empty HTML Elements ###
1. Elements with no content
2. Empty elements can be closed in the opening tag `<br />` (HTML5 does not require this)
	1. It is required when:
		1. Stricter validation
		2. To make document readable by xml parsers

### Use Lowercase Tags ###
1. `<P>` is same as `<p>`
2. But W3C recommends lowercase tags for XHTML

## HTML Attributes ##
1. Attributes: provide additional information about HTML elements.

### HTML Attributes ###
1. All HTML elements can have attributes
2. Attributes are always specified in start tag
3. Attributes are usually specified as name/value pairs `name="value"`

### The lang Attribute ###
1. Language can be declared in <html> tag with `lang` attribute
	1. Uses:
		1. For accessibility apps (screen readers)
		2. Search engines
2. `<html lang="en-US">` **(M)**
	1. first two letters is language
	2. next two letters are required if there are different dialects

### The title attribute ###
1. title: used with `<p>` element
2. Value of title will be diplayed as a tooltip on mouse over

		<p title="I am a tooltip">
			This is a paragraph.
		</p>

### The href Attribute ###
1. href: attribute used with <a> to specify link address
	1. `<a href="https://www.w3schools.com">This is a link</a>`

### Size Attributes ###
1. `width`, `height`: size attributes used with `<img>`
	1. `<img src="w3schools.jpg" width="104" height="142">`
2. Size is in pixels

### The alt Attribute ###
1. Specifies an alternative text displayed when an image cannot be displayed
2. If someone listening to webpage can hear the element

### We Suggest: Use Lowercase Attributes ###
1. HTML5 does not require lowercase attribute names
2. `title` is same as `TITLE`
3. Use lowercase attribute names for stricter document types like XHTML

### We Suggest: Quote Attribute Values ###
1. HTML5 does not require quotes around attribute values
	1. `<a href=https://www.w3schools.com>`
2. Use quotes for stricter document types like XHTML
3. When is it necessary to use quotes?
	1. When there are spaces in between attribute values

### Single or Double Quotes? ###
1. Double quotes are most common
2. Single quotes can be used
	1. If attribute value contains double quotes, use single quotes
		1. `<p title='John "ShotGun" Nelson'>`
		2. `<p title="John 'ShotGun' Nelson">`

### Chapter Summary ###
1. All HTML elements can have attributes
2. `title` provides tooltip
3. `href` provides address for links
4. `widht`, `height` provide size info for images
5. `alt` provides text for screen readers
6. lowercase attribute names are recommended
7. quote attribute values with double quotes

### HTML Attributes ###
1. List:
	1. alt: alternative text for image, when image cannot be displayed
	2. disabled **(M)**: specifies that an input element should be disabled
	3. href: specifies URL for link
	4. id: specifies unique id for an element
	5. src: specifies URL for an image
	6. style: specifies inline CSS style for an element
	7. title: specifies extra info about an element (tooltip)
2. [HTML Attribute Reference](https://www.w3schools.com/tags/ref_attributes.asp)

## HTML Headings ##
### HTML Headings ###
1. `<h1>`: most important heading
2. `<h6>`: least important heading
3. Example:

		<h1>This is heading 1</h1>
		<h2>This is heading 2</h2>
		<h3>This is heading 3</h3>
		<h4>This is heading 4</h4>
		<h5>This is heading 5</h5>
		<h6>This is heading 6</h6>

### Headings Are Important ###
1. Search engines use headings to index the structure and content of web pages.
2. Users skim pages by headings.
3. Headings show the document structure.
4. `<h1>` for main headings, followed by `<h2>` for sub-headings, ...

### HTML Horizontal Rules ###
1. `<hr />`: Thematic break in HTML page (mostly diplayed as horizontal rule)
2. Used to separate content
3. Example:

		<h1>This is heading 1</h1>
		<p>This is some text.</p>
		<hr />
		<h2> This is heading 2</h2>
		<p>This is some other text.</p>
		<hr />

### The HTML <head> Element ###
1. <head>: container for meta-data
	1. meta-data: data about html document.
		1. It is not diplayed
2. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<title>My First HTML</title>
				<meta charset="UTF-8">
			</head>
			<body>
				...
		</html>

3. Metadata types:
	1. title
	2. character set
	3. styles
	4. links
	5. scripts
	6. ...

### HTML Tip - How to View HTML Source ###
1. Right click in page and select "View Page Source" (in Chrome) or "View Source" (in IE), ...

### HTML Tag Reference ###
1. `<html>`: root of HTML document
2. `<body>`: document's body
3. `<head>`: container for all head elements
4. `<h1>` to `<h6>`: HTML headings
5. `<hr />`: thematic change in content

## HTML Paragraphs ##
### HTML Paragraphs ###
1. `<p>` defines paragraph

### HTML Display ###
1. Large, small screens and resized windows generate different views
2. Extra spaces and extra lines will not change output (browser will remove extra spaces and lines)
3. Example:

		<p>
		This paragraph
		contains a lot of lines
		in the souce code,
		but the browser ignores it.
		</p>

		<p>
		This paragraph
		contains       a lot of spaces
		in the source         code,
		but the        browser
		ignores it.
		</p>

### Don't Forget the End Tag ###
1. End tags for `<p>` is optional but recommended

### HTML Line Breaks ###
1. `<br />` defines line break
	1. Used if new paragraph is not required
2. Example:
	1. `<p>This is<br>a paragraph<br>with line breaks.</p>`

### The Poem Problem ###
1. Example: The poem will display on a single line

		<p>
			My Bonnie does no lie over the ocean.
	
			My Bonnie does not lie over the sea.

			My Bonnie does not lie over the ocean.

			Oh, don't bring back my Bonnie to me.
		</p>

### The HTML <pre> element ###
1. For pre-formatted text
2. Displayed with fixed width font (preserves both spaces and line breaks)

		<pre>
			My Bonnie does no lie over the ocean.
	
			My Bonnie does not lie over the sea.

			My Bonnie does not lie over the ocean.

			Oh, don't bring back my Bonnie to me.
		</pre>

## HTML Styles ##
### The HTML Style Attribute ###
1. `style`: used to set style of an element
2. Syntax: `<tagname style="property:value;">`
	1. `property`: CSS property
	2. `value`: CSS value

### HTML Background Color ###
1. `background-color`: defines background color
2. Example:

		<body style="background-color:powderblue;">
			<h1>This is a heading</h1>
			<p>This is a paragraph</p>
		</body>

### HTML Text Color ###
1. `color`: text color

		<h1 style="color:blue;">This is a heading</h1>
		<p style="color:red;">This is a paragraph.</p>

### HTML Fonts ###
1. `font-family` **(M)**: font to be used
2. Example:

		<h1 style="font-family:verdana;">This is a heading</h1>
		<p style="font-family:courier;">This is a paragraph</p>

### HTML Text Size ###
1. `font-size`: text size
2. Example:

		<h1 style="font-size:300%;">This is a heading</h1>
		<p style="font-size:160%;">This is a paragraph</p>
		

### HTML Text Alignment ###
1. `text-align` **(M)**: horizontal text alignment for HTML element
2. Example:
	
		<h1 style="text-align:center;">Centered Heading</h1>
		<p style="text-align:center;">Centered paragraph.</p>

### Chapter Summary ###
1. `style`: used for styling an element
2. `background-color`: background color
3. `color`: text color
4. `font-family`: text fonts
5. `font-size`: text sizes
6. `text-align`: text alignment

### Note: ###
1. attribute values apply to sub-elements unless overridden explicitly
2. Example:

		<body style="text-align:center;">
			<h1>This is a heading</h1>
			<h2>This is also a heading</h2>
			<p>This is a paragraph</p>
			<p>This is also a paragraph</p>
		</body>

## HTML Formatting ##
### HTML Formatting Elements ###
1. Special elements with special meaning
2. Formatting elements for special types of text:
	* <b> - bold text
	* <strong> - Important text
	* <i> - Italic text
	* <em> - Emphasized text
	* <mark> - Marked text
	* <small> - Small text
	* <del> - Deleted text
	* <ins> - Inserted text
	* <sub> - Subscript text
	* <sup> - Superscript text

### HTML <b> and <strong> Elements ###
1. `<b>` bold text without extra importance
	1. `<b>This text is bold</b>`
2. `<strong>` **(M)** strong text with sematic "strong" importance
	1. `<strong>This text is strong</strong>`

### HTML <i> and <em> Elements ###
1. `<i>` **(M)**: Italic text without extra importance
	1. `<i>This text is italic</i>`
2. `<em>` **(M)**: Emphasized text with sematic importance
	1. `<em>This text is emphasized</em>`

### HTML <small> Element ###
1. `<small>` **(M)**: smaller text
	1. `<h2>HTML <small>Small</small> Formatting</h2>`

### HTML <mark> Element ###
1. `<mark>`: marked or highlighted text
	1. `<h2>HTML <mark>Marked</mark> Formatting</h2>`

### HTML <del> Element ###
1. `<del>`: deleted (removed) text
	1. `<p>My favorite color is <del>blue</del> red.</p>`

### HTML <ins> Element ###
1. `<ins>`: defines inserted (added) text
	1. `<p>My favorite <ins>color</ins> is red.</p>`

### HTML <sub> Element ###
1. `<sub>`: subscripted text
	1. `<p>This is <sub>subscripted</sub> text.</p>`

### HTML <sup> Element ###
1. `<sup>`: superscripted text
	1. `<p>This is <sup>superscripted</sup> text.</p>`

## HTML Quotations ##
### HTML Quotation and Citation ###

		Here is a quote from WWF's website:

			For 50 years, WWF has been protecting the future of nature.
			The world's leading conservation organization, WWF works
			in 100 countries and is supported by 1.2 million members in
			the United States and close to 5 million globally.

### HTML <q> for Short Quotations ###
1. `<q>` **(M)**: Short quotation
	1. `<p>WWF's goal is to: <q>Build a future where people live in harmony with nature.</q></p>`

### HTML <blockquote> fro Quotations ###
1. `<blockquote>` **(M)**: section that is quoted from another source
2. Example:

		<p>Here is a quote from WWF's website:</p>
		<blockquote cite="http://www.worldwildlife.org/who/index.html">
		For 50 years, WWF has been protecting the future of nature.
		The world's leading conservation organization,
		WWF works in 100 countries and is supported by
		1.2 million members in the United States and 
		close to 5 million globally.
		</blockquote>

### HTML <abbr> for Abbreiations ###
1. `<abbr>`: abbreviation or accronym.
	1. Give useful info to browsers, translation systems and search-engines
2. Example:
	
		<p>The <abbr title="World Health Organization">WHO</abbr> was founded in 1948.</p>

### HTML <address> for Contact Information ###
1. `<address>` **(M)**: defines contact information (author/owner) of a document or an article
2. Displayed in italic and many browsers add line break before and after the element.
3. Example:

		<address>
		Something is Written by John Doe.<br>
		Visit:<br>
		Example.com<br>
		Box 564, Disneyland<br>
		USA
		</address>
		

### HTML <cite> for Work Title ###
1. `<cite>` **(M)**: Defines title of a work.
	1. Displayed usually in italic
2. Example:

		<p><cite>The Scream</cite> by Edvard Munch. Painted in 1893.</p>

### HTML <bdo> for Bi-Directional Override ###
1. `<bdo>` **(M)**: Bi-Directional Override
2. Used to override current text direction
3. Example:

		<bdo dir="rtl">This text will be written from right to left</bdo>

## HTML Computercode ##
### HTML Compute Code Formatting ###
1. `<kbd>`, `<samp>` and `<code>`: displayed in fixed letter size and spacing.

### HTML <kbd> For Keyboard Inpu ###
1. `<kbd>` **(M)**: defines keyboard input
2. Example:

		<kbd>File | Open...</kbd>

### HTML <samp> For Computer Output ###
1. `<samp>` **(M)**: Sample Computer output
2. Example:

		<samp>
		demo.example.com login: XXX xx xx:xx:xx
		Linux 2.6.10-grsec+gg3+e+fhs6b+nfs+gr0501+++p3+c4a+gr2b-reslog-v6.189
		</samp>

### HTML <code> For Computer Code ###
1. `<code>`: piece of programming code

		<code>
		var x = 5;
		var y = 6;
		document.getElementById("demo").innerHTML = x + y;
		</code>

2. `<pre>`: used for maintaining indentation

		<pre>
		<code>
		var x = 5;
		var y = 6;
		document.getElementById("demo").innerHTML = x + y;
		</code>
		</pre>

### HTML <var> For Variables ###
1. `<var>` **(M)**: defines variable
	1. Variable in mathematical expression or in a programming language
2. Example:

		Einstein wrote: <var>E</var> = <var>m</var><var>c</var><sup>2</sup>

## HTML Comments ##
### HTML Comment Tags ###
1. `<!-- Write your comments here -->`
	1. Used for notifications and reminders in HTML
2. Example:

		<!-- This is a comment -->
		
		<p> This is a paragraph </p>

		<!-- To add more information here -->
3. Can be used to comment out HTML code to search for errors

		<!-- Do not display this at the moment 
		<img border="0" src="pic_mountain.jpg" alt="Mountain">
		-->

### Conditional Comments ###
1. Define HTML tags to be executed by IE only

		<!--[if IE 9]>
			... some HTML here ...
		<![endif]-->

## HTML Colors ##
### Color Names ###
1. Red, Orange, Yellow, Cyan, Blue

### RGB Value ###
1. `rgb(red, green, blue)`
	1. red, green, blue: define intensity of color between 0 and 255
	2. Example: `rgb(255, 0, 0)`: red
	3. Example: `rgb(0, 0, 0)`: black
	4. Example: `rgb(255, 255, 255)`: white
	5. Example: `rgb(145, 145, 145)`: gray

### HEX Value ###
1. `#RRGGBB`
	1. `RR`: Red (00 - FF)
	2. `GG`: Green (00 - FF)
	3. `BB`: Blue (00 - FF)
2. Example:
	1. `FF0000`: Red

## HTML CSS ##
### Styling HTML with CSS ###
1. CSS: Cascading Style Sheets
	1. Define how HTML has to be displayed on screen, paper, or other media
2. It is efficient way of styling because it can control multiple pages at once
3. 3 ways of adding CSS:
	1. **Inline**: using `style` attribute
	2. **Internal**: using `<style>` **(M)** element in `<head>`
	3. **External**: using external css file (most common)

### Inline CSS ###
1. To style a single element uniquely using `style` attribute
2. Example: `<h1 style="color:blue;">This is a Blue Heading</h1>`

### Internal CSS ###
1. To style a single HTML page
2. It is defined in `<head>` section of HTML page within `<style>` element
3. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					body { 
						background-color: powderblue; 
					}
					h1 {
						color: blue;
					}
					p {
						color: red;
					}
				</style>
			</head>
			<body>
				<h1>This is heading</h1>
				<p>This is a paragraph.</p>
			</body>
		</html>

### External CSS ###
1. Usually used to style many HTML pages.
	1. By changing one file, we can change the look of an entire website
2. Add `link` to `<head>` section
3. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<link rel="stylesheet" href="styles.css">
			</head>
			<body>
				<h1>This is a heading</h1>
				<p>This is a paragraph.</p>
			</body>
		</html>

		body {
			background-color: powderblue;
		}
		h1 {
			color: blue;
		}
		p {
			color: red;
		}

### CSS Fonts ###
1. `font-family`: font to be used
2. `font-size`: text size to be used
3. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					h1 {
						color: blue;
						font-family: verdana;
						font-size: 300%;
					}
					p {
						color: red;
						font-family: courier;
						font-size: 160%;
					}
				</style>
			</head>
			<body>
				<h1>This is a heading</h1>
				<p>This is a paragraph</p>
			</body>
		</html>

### CSS Border ###
1. `border`: border around html element

		p {
			border: 1px solid powderblue;
		}

### CSS Padding ###
1. `padding`: defines space between text and border

		p {
			border: 1px solid powderblue;
			padding: 30px;
		}

### CSS Margin ###
1. `margin`: space outside the border

		p {
			border: 1px solid powderblue;
			margin: 50px;
		}

### The id Attribute ###
1. To style one element

		<p id="p01">I am different</p>

		#p01 {
			color: blue;
		}

### The class Attribute ###
1. `class`: to style special elements with the class name

		<p class="error">I am an error text</p>

		p.error {
			color: red;
		}

### External References ###
1. reference: full url or relative path to current web page
2. Example:

		<link rel="stylesheet" href="https://www.w3schools.com/html/styles.css">

3. Example: To link to steyls.css in html folder on current website

		<link rel="stylesheet" href="/html/styles.css">

4. Example: To link to file in same folder as current page

		<link rel="stylesheet" href="styles.css">

5. [HTML File Paths](https://www.w3schools.com/html/html_filepaths.asp)

### Chapter Summary ###
1. `style` attribute for inline styling
2. `<style>` to define internal CSS
3. `<link>` to refer to external CSS
4. `<head>` to store <style> and <link> elements
5. `color`: CSS property for text colors
6. `font-family`: CSS property for text fonts
7. `font-size`: CSS property for text sizes
8. `border`: CSS property for borders
9. `padding`: CSS property for space inside border
10. `margin`: CSS property for space outside border

## HTML Links ##
1. Links allow users to click their way from page to page

### HTML Links - Hyperlinks ###
1. Links are Hyperlinks
2. When we move mouse over a link, the mouse arrow will turn into a little hand
3. Link can be text or any other HTML element

### HTML Links - Syntax ###
1. `<a href="url">link text</a>`
2. Example: `<a href="https://www.w3schools.com/html/">Visit our HTML tutorial</a>`
	1. `href`: destination address
	2. `link text`: visible part
3. If there is no `/` on subfolder address, two requests may be generated to server,
	1. Server adds `/` to address and then build another new request

### Local Links ###
1. Local link: link to same website is specified using relative URL (without http://www...)
2. Example:

		<a href="html_images.asp">HTML Images</a>

### HTML Link Colors ###
1. Default Link styling:
	1. Unvisited link is underlined and blue
	2. Visited link is underlined and purple
	3. Active link is underlined and red
2. Changing default colors:

		<style>
			a:link { 
				color: green; 
				background-color: transparent; 
				text-decoration: none;
			}
			a:visited {
				color: pink;
				background-color: transparent;
				text-decoration: none;
			}
			a:hover {
				color: red;
				background-color: transparent;
				text-decoration: underline;
			}
			a:active {
				color: yellow;
				background-color: transparent;
				text-decoration: underline;
			}

### HTML Links - The target Attribute ###
1. `target`: specifies where to open the linked document
2. Values:
	1. `_blank`: opens linked document in new window or tab
	2. `_self` **(M)**: opens linked document in same window/tab
	3. `_parent` **(M)**: opens linked document in parent frame
	4. `_top` **(M)**: Opens linked document in full body of window
		1. If webpage is locked in a frame, then use it to break out of the frame
	5. `<framename>` **(M)**: Opens linked document in named frame
3. Example:
	1. `<a href="https://www.w3schools.com/" target="_blank">Visit W3Schools</a>`
4. Example:
	1. `<a href="https://www.w3schools.com/" target="_top">Visit W3Schools</a>`

### HTML Links - Image as Link ###
1. `<a href="default.asp"><img src="smiley.gif" alt="HTML tutorial" style="width:42px;height:42px;border:0;"></a>`

### HTML Links - Creation of Bookmark ###
1. Used to jump to specific parts of a webpage
2. Useful if webpage is very long
3. Steps:
	1. Construct a bookmark

			<h2 id="C4">Chapter 4</h2>

	2. Add link to bookmark
		1. Add link to bookmark from same page
	
				<a href="#C4">Jump to Chapter 4</a>
	
		2. Add link to bookmark from another page

				<a href="html_demo.html#C4">Jump to Chapter 4</a>

### External Paths ###
1. Reference: Full url or path relative to current web page

		<a href="https://www.w3schools.com/html/default.asp">HTML tutorial</a>

		<a href="/html/default.asp">HTML tutorial</a>

		<a href="default.asp">HTML tutorial</a>

### Chapter Summary ###
1. `<a>`: used to define link
2. `href`: define link address
3. `target`: define where to open linked document
4. `<img>`: use image as link
5. `id`: defines bookmark in a page
6. `href="#value"`: link to bookmark 

## HTML Images ##
### Example ###

		<!DOCTYPE html>
		<html>
			<body>
				<h2>Spectacular Mountain</h2>
				<img src="pic_mountain.jpg" alt="Mountain View" style="width:304px;height:228px;">
			</body>
		</html>

### HTML Images Syntax ###
1. `<img>`: empty tag
2. `<img src="url" alte="somet_text" style="width:width;height:height;">`

### The alt Attribute ###
1. alternative text for an image
	1. if user cannot view the image
	2. if user uses screen reader
2. `<img src="wrongname.gif" alt="HTML5 Icon" style="width:128px;height:128px;">`

### HTML Screen Readers ###
1. It reads HTML code
	1. For people who are blind, visually impaired, learning disabled.

### Image Size - Width and Height ###
1. `style`: attribute to specify width and height
2. `width`, `height`: attributes
	1. `<img src="html5.gif" alt="HTML5 Icon" width="128" height="128">`

### Width and Height, or Style? ###
1. Style attribute is recommended
	1. Prevents internal or external style sheets from changing the original size
2. Example: 

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					img {
						width: 100%;
					}
				</style>
			</head>
			<body>
				<img src="html5.gif" alt="HTML5 Icon" style="width:128px;height=128px;">
				<img src="html5.gif" alt="HTML5 Icon" width="128" height="128">
			</body>
		</html>

### Images in Another Folder ###
1. If images are stored in a sub-folder, include it in the `src` attribute

### Images on Another Server ###
1. Give URL of image on remote server
2. Example:

		<img src="https://www.w3schools.com/images/w3schools_green.jpg" alt="W3Schools.com">

### Animated Images ###
1. `<img src="programming.gif" alt="Computer Man" style="width:48px;height:48px;">`

### Using an Image as a Link ###
1. `<a href="default.asp"><img src="smiley.gif" alt="HTML tutorial" style="width:42px;height:42px;border:0;"></a>`
	1. `border:0`: prevents IE 9 from displaying a border around image

### Image Floating ###
1. `float`: make image float to right or left
2. Example:

		<p><img src="smiley.gif" alt="Smiley face" style="float:right;width:42px;height:42px;">The image will float to the right of the text.</p>

		<p><img src="smiley.gif" alt="Simely face" style="float:left;width:42px;height:42px;">The image will float to the left of the text.</p>

### Image Maps ###
1. `<map>`: Defines image-map
	1. image-map: it is an image with clickable areas
2. `usemap` attribute of `<img>` is associated with `name` attribute of `<map>`
3. `<area>`: defines clickable areas in image-map
4. Example:

		<img src="planets.gif" alt="Planets" usemap="#planetmap" style="width:145px;height:126px;">

		<map name="planetmap">
			<area shape="rect" coords="0,0,82,126" alt="Sun" href="sun.htm">
			<area shape="circle" coords="90,58,3" alt="Mercury" href="mercur.htm">
			<area shape="circle" coords="124,58,8" alt="Venus" href="venus.htm">
		</map>

### Chapter Summary ###
1. `<img>` element defines an image
2. `src` defines URL of the image
3. `alt` defines an alternative text for an image (if it cannot be displayed)
4. `width`, `height`: define the size of the image
5. CSS `width`, `height`: define size of the image (alternatively)
6. CSS `float`: lets image float
7. `<map>` defines an image map
8. `<area>` defines clickable areas in image-map
9. `usemap` attribute is used to point to an image-map

## HTML Tables ##
### Defining an HTML Table ###
1. `<table>` tag defines html table
2. `<tr>`: table row
3. `<th>`: table heading
4. `<td>`: table data/cell
5. Example:

		<table style="width:100%">
			<tr>
				<th>Firstname</th>
				<th>Lastname</th>
				<th>Age</th>
			</tr>
			<tr>
				<td>Jill</td>
				<td>Smith</td>
				<td>50</td>
			</tr>
			<tr>
				<td>Eve</td>
				<td>Jackson</td>
				<td>94</td>
			</tr>
		</table>

### HTML Table - Adding a Border ###
1. Example:

		table, th, td {
			border: 1px solid black;
		}

	1. table: for the entire table
	2. th: for header cells
	3. td: for data cells

### HTML Table - Collapsed Borders ###
1. `border-collapse: collapse` **(M)**: For collapsing into one border

### HTML Table - Adding Cell Padding ###
1. `padding`: space between cell content and its border
2. Example:

		th, td {
			padding: 15px;
		}

### HTML Table - Left-align Headings ###
1. `text-align: left;` **(M)**: left aligns content
2. Example:

		th {
			text-align: left;
		}

### HTML Table - Adding Border Spacing ###
1. `border-spacing` **(M)**: space between the cells
	1. If `border-collapse: collapse;` is specified, the above has no effect
2. Example:

		table {
			border-spacing: 5px;
		}

### HTML Table - Cells that Span Many Columns ###
1. `colspan` **(M)**: makes cell span multiple columns
2. Example:

		<table style="width:100%">
			<tr>
				<th>Name</th>
				<th colspan="2">Telephone</th>
			</tr>
			<tr>
				<td>Bill Gates</td>
				<td>55577854</td>
				<td>55577854</td>
			</tr>
		</table>

### HTML Table - Cells that Span Many Rows ###
1. `rowspan` **(M)**
2. Example:

		<table style="width:100%">
			<tr>
				<th>Name:</th>
				<td>Bill Gates</td>
			</tr>
			<tr>
				<th rowspan="2">Telephone:</th>
				<td>55577854</td>
			</tr>
			<tr>
				<td>55577854</td>
			</tr>
		</table>

### HTML Table - Adding a Caption ###
1. `<caption>` **(M)**: Adds caption to a table
2. Example:

		<table style="width:100%">
			<caption>Monthly savings</caption>
			<tr>
				<th>Month</th>
				<th>Savings</th>
			</tr>
			<tr>
				<td>January</td>
				<td>$x</td>
			</tr>
			<tr>
				<td>February</td>
				<td>$y</td>
			</tr>
		</table>

### A Special Style for One Table ###
1. add `id` attribute to the table
2. Example:

		<table id="t01">
			<tr>
				<th>Firstname</th>
				<th>Lastname</th>
				<th>Age</th>
			</tr>
			<tr>
				<td>Eve</td>
				<td>Jackson</td>
				<td>x</td>
			</tr>
		</table>

		table#t01 {
			width: 100%;
			background-color: #f1f1c1;
		}

3. More styling:

		table#t01 tr:nth-child(even) {
			background-color: #eee;
		}

		table#t01 tr:nth-child(odd) {
			background-color: #fff;
		}

		table#t01 th {
			color: white;
			background-color: black;
		}

### Chapter Summary ###
1. `<table>`: defines table
2. `<tr>`: table row
3. `<td>`: table data
4. `<th>`: table header
5. `<caption>`: define table caption
6. `border`: defines border
7. `border-collapse`: collapse cell border
8. `padding`: spacing between cell content and its border
9. `text-align`: to align cell text
10. `border-spacing`: spacing between cells
11. `colspan`: make cell span multiple columns
12. `rowspan`: make cell span multiple rows
13. `id`: to uniquely define the table

## HTML Lists ##
### Unordered HTML List ###
1. `<ul>`: unordered list
2. `<li>`: list item (marked with bullets)
3. Example:

		<ul>
			<li>Coffee</li>
			<li>Tea</li>
			<li>Milk</li>
		</ul>

### Unordered HTML List - Choose List Item Marker ###
1. `list-style-type` **(M)**: style property for list item marker
2. Example: Disc

		<ul style="list-style-type:disc">
			<li>Coffee</li>
			<li>Tea</li>
			<li>Milk</li>
		</ul>

3. Example: Circle

		<ul style="list-style-type:circle">
			<li>Coffee</li>
			<li>Tea</li>
			<li>Milk</li>
		</ul>

4. Example: Square

		<ul style="list-style-type:square">
			<li>Coffee</li>
			<li>Tea</li>
			<li>Milk</li>
		</ul>

5. Example: None

		<ul style="list-style-type:none">
			<li>Coffee</li>
			<li>Tea</li>
			<li>Milk</li>
		</ul>

### Ordered HTML List ###
1. `<ol>` **(M)**: ordered list starts with it
2. `<li>`: list item of ordered list
3. By default: list items will be marked by numbers
4. Example:

		<ol>
			<li>Coffee</li>
			<li>Tea</li>
			<li>Milk</li>
		</ol>

### Ordered HTML List - THe Type Attribute ###
1. `type` **(M)**: attribute of `<ol>` defines type of list item marker
	1. `type="1"`: numbered with numbers (default)
	2. `type="A"`: numbered with uppercase letters
	3. `type="a"`: numbered with lowercase letters
	4. `type="I"`: numbered with uppercase roman numbers
	5. `type="i"`: numbered with lowercase roman numbers

2. Example: numbering with numbers

		<ol type="1">
			<li>Coffee</li>
			<li>Tea</li>
			<li>Milk</li>
		</ol>

3. Example: numbering with uppercase letters

		<ol type="A">
			<li>Coffee</li>
			<li>Tea</li>
			<li>Milk</li>
		</ol>

4. Example: numbering with lowercase letters

		<ol type="a">
			<li>Coffee</li>
			<li>Tea</li>
			<li>Milk</li>
		</ol>

5. Example: numbering with uppercase Roman numerals

		<ol type="I">
			<li>Coffee</li>
			<li>Tea</li>
			<li>Milk</li>
		</ol>

6. Example: numbering with lowercase Roman numerals

		<ol type="i">
			<li>Coffee</li>
			<li>Tea</li>
			<li>Milk</li>
		</ol>

### HTML Description Lists ###
1. `<dl>` **(M)**: Description List - it is a list of terms with a description of each term
2. `<dt>` **(M)**: Defines term
3. `<dd>` **(M)**: defines description of each term
4. Example:

		<dl>
			<dt>Coffee</dt>
			<dd>- black hot drink</dd>
			<dt>Milk</dt>
			<dd>- white cold drink</dd>
		</dl>

### Nested HTML Lists ###
1. Example:

		<ul>
			<li>Coffee</li>
			<li>Tea
				<ul>
					<li>Black tea</li>
					<li>Green tea</li>
				</ul>
			</li>
			<li>Milk</li>
		</ul>

2. List items can contain new list, other HTML elements, like images and links, ...

### Horizontal Lists ###
1. Styling a list horizontally
2. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					ul {
						list-style-type: none;
						margin: 0;
						padding: 0;
						overflow: hidden;
						background-color: #333333;
					}

					li {
						float: left;
					}

					li a {
						display: block;
						color: white;
						text-align: center;
						padding: 16px;
						text-decoration: none;
					}

					li a:hover {
						background-color: #111111;
					}
				</style>
			</head>
			<body>
				<ul>
					<li><a href="#home">Home</a></li>
					<li><a href="#news">News</a></li>
					<li><a href="#contact">Contact</a></li>
					<li><a href="#about">About</a></li>
				</ul>
			</body>
		</html>

### Chapter Summary ###
1. `<ul>`: onordered list root element
2. `list-style-type`: to define list item marker
3. `<ol>`: defines ordered list
4. `type`: to define numbering type
5. `<li>`: list item
6. `<dl>`: description list
7. `<dt>`: description term
8. `<dd>`: description
9. List can be nexted inside lists
10. List item can contain other HTML elements
11. `float:left` or `display:inline` to display a list horizontally

## HTML Blocks ##
1. Every element has a default display value (depends on the type)
	1. block
	2. inline

### Block-level Elements ###
1. Block-level element: always starts on a new line and takes up the entire width available (left and right)
2. Example: `<div>`
3. Examples:
	1. `<h1>` to `<h6>`
	2. `<p>`
	3. `<form>`

### Inline Elements ###
1. Inline element: does not start on a new line and takes up as much width as necessary
2. `This is <span style="border: 1px solid red;">an inline span element inside</span> a paragraph`
3. Examples:
	1. `<span>`
	2. `<a>`
	3. `<img>`

### The <div> Element ###
1. It is often used as a container for other HTML elements
2. It has no required attributes (`style` and `class` are common)
3. It is often used to style a block of elements
4. Example:

		<div style="background-color:black;color:white;padding:20px;">
			<h2>London</h2>
			<p>London is the capital city of England, It is the most populous city in the United Kingdom, with a metropolitan area of over 13 million inhabitants.</p>
		</div>

### The <span> Element ###
1. It is often used as a container for some text.
2. It has no required attributes (`style` and `class` are common)
3. It is often used to style parts of the text
4. Example:

		<h1>My <span style="color:red">Important</span> Heading</h1>

## HTML Classes ##
### Using The class Attribute ###
1. Used to define styles for elements with the same classname
2. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					div.cities {
						background-color: black;
						color: white;
						margin: 20px 0 20px 0; // top right bottom left
						padding: 20px;
					}
				</style>
			</head>
			<body>
				<div class="cities">
					<h2>London</h2>
					<p>London is the capital of England. It is the most populous city in the United Kingdom, with a metropolitan area of over 13 million inhabitants.</p>
				</div>

				<div class="cities">
					<h2>Paris</h2>
					<p>Paris is the capital and most populous city of France.</p>
				</div>

				<div class="cities">
					<h2>Tokyo</h2>
					<p>Tokyo is the capital of Japan, the center of the Greater Tokyo Area, and the most populous metropolitan area in the world.</p>
				</div>
			</body>
		</html>

### Using The class Attribute on Inline Elements ###
1. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					span.note {
						font-size: 120%;
						color: red;
					}
				</style>
			</head>
			<body>
				<h1>My <span class="note">Important</span> Heading</h1>
				<p>This is some <span class="note">important</span> text.</p>
			</body>
		</html>

## HTML Iframes ##
### Iframe Syntax ###
1. `<iframe src="URL"></iframe>` **(M)**
2. `src`: specifies URL of inline frame page

### Iframe - Set Height and Width ###
1. `height`, `width`: attributes
2. Example:

		<iframe src="demo_iframe.htm" height="200" width="300"></iframe>

### Iframe - Remove the Border ###
1. By default iframe has border around it
2. To remove border, use style

		<iframe src="demo_iframe.htm" style="border:none:">
		</iframe>

3. With CSS, style the iframe border

		<iframe src="demo_iframe.htm" style="border:2px solid grey;"</iframe>

### Iframe - Target for a Link ###
1. Iframe can be used as a target for a link
2. `target` must refer to iframe `name`
3. Example:

		<iframe src="demo_iframe.htm" name="iframe_a"></iframe>

		<p><a href="https://www.w3schools.com" target="iframe_a">W3Schools.com</a></p>		

## HTML JavaScript ##
### The HTML <script> Tag ###
1. `<script>`: it is used to define a client side script (JavaScript).
2. It contains scripting statements or points to an external script file through `src` attribute
3. Common uses of JavaScript:
	1. Image manipulation
	2. Form validation
	3. Dynamic changes of content
4. To select an HTML element, we can use `document.getElementById(id)` method
5. Example:

		<script>
			document.getElementById("demo").innerHTML = "Hello Javascript!";
		</script>

### A Taste of JavaScript ###
1. JavaScript can change HTML Content:
	1. `document.getElementById('demo').innerHTML = 'Hello JavaScript!';`
2. JavaScript can change HTML styles:
	1. `document.getElementById('demo').style.fontSize = '25px';`
	2. `document.getElementById('demo').style.color = 'red';`
3. JavaScript can change HTML attributes:
	1. `document.getElementById('demo').src = 'picture.gif';`

### The HTML <noscript> Tag ###
1. `<noscript>` **(M)**: used to provide an alternative content for users that have disabled scripts in their browser or if browser does not support client side scripting.
2. Example:

		<script>
			document.getElementById('demo').innerHTML = 'Hello JavaScript!';
		</script>

		<noscript>Sorry, your browser does not support JavaScript!</noscript>

## HTML File Paths ##
1. `<img src="picture.jpg">`: file located in same folder as the current page
2. `<img src="images/picture.jpg">`: file located in the sub folder `images` of the current folder
3. `<img src="/images/picture.jpg">`: file located in the images folder under the root of the web site
4. `<img src="../picture.jpg">`: file located in the folder one level up from the current folder

### HTML File Paths ###
1. Used to link to external files like:
	1. Web pages
	2. Images
	3. Style sheets
	4. JavaScripts

### Absolute File Paths ###
1. It is full URL to an internet file
	1. `<img src="https://www.w3schools.com/images/picture.jpg" alt="Mountain">`

### Relative File Paths ###
1. Relative file paths point to file relative to the current page.
2. `<img src="/images/picture.jpg" alt="Mountain">`: points to images folder relative to the root of the web site
3. `<img src="images/picture.jpg" alt="Mountain">`: points to file in the images folder in the current directory

### Best Practice ###
1. Use relative file paths
	1. Web pages will not be bound to current base URL (website will work on localhost as well as other public domain)

## HTML Head ##
### The HTML <head> Element ###
1. `<head>` is container for meta data (data about data).
2. meta data: data about the HTML document (it is not displayed)
	1. title, character set, styles, links, scripts, ...
	2. Tags: `<title>`, `<style>`, `<meta>`, `<link>`, `<script>`, `<base>`

### The HTML <title> Element ###
1. Required in al HTML/XHTML documents
2. It defines title in browser tab
3. It provides title for page when it is added to favorites
4. Displays title for page in search engine results
5. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<title>Page Title</title>
			</head>
			<body>
				The content of the document ......
			</body>
		</html>

### The HTML <style> Element ###
1. It is used to define style info for the page
2. Example:

		<style>
			body { background-color: powderblue; }
			h1 { color: red; }
			p { color: blue; }
		</style>

### The HTML <link> Element ###
1. `link` is used to link to external stylesheets
	1. `<link rel="stylesheet" href="mystyle.css">`

### The HTML <meta> Element ###
1. Used to specify character set, page description, keywords, author, ...
	1. Keywords are used by search engines
	2. character set is used by browser
2. Example: Defining character set
	
		<meta charset="UTF-8">

3. Example: Description of web page

		<meta name="description" content="Free Web tutorials">

4. Example: Keywords for search engines

		<meta name="keywords" content="HTML, CSS, XML, JavaScript">

5. Example: Author

		<meta name="author" content="John Doe">

6. Example: Refresh every 30 seconds

		<meta http-equiv="refresh" content="30">

### Setting The Viewport ###
1. viewport: user's visible area of a webpage which varies with device (smaller on mobile phone than on computer screen)
2. Example:

		<meta name="viewport" content="width=device-width, initial-scale=1.0">

	1. tells browser how to control page's dimensions and scaling
	2. `width=device-width`: sets width of the page to follow the screen-width of the device
	3. `initial-scale=1.0`: sets initial zoom level when page is loaded by browser

### The HTML <script> Element ###
1. Usec to define client-side JavaScript

### The HTML <base> Element ###
1. `<base>` **(M)** defines base URL and base target for all relative URLs in the page

		<base href="https://www.w3schools.com/images/" target="_blank">

### Omitting <html>, <head> and <body>? ###
1. According to HTML5, `<html>`, `<head>` and `<body>` can be omitted
2. Example:

		<!DOCTYPE html>
		<title>Page Title</title>

		<h1>This is a heading</h1>
		<p>This is a paragraph.</p>

### HTML head Elements ###
1. `<head>` defines info about document
2. `<title>` defines title of document
3. `<base>` defines default address or default target for all links on the page
4. `<link>` defines relationship between the document and external resource
5. `<meta>` defines metadata about HTML document
6. `<script>` defines client-side script
7. `<style>` defines style information for a document

## HTML Layout ##
### HTML Layout Elements ###
1. Need to display content in multiple columns
2. New semantic elements of HTML5

	![img_sem_elements](img_sem_elements.gif)

	1. `<header>`: Header for a document or section
	2. `<nav>`: container for navigation links
	3. `<section>`: section in a document
	4. `<article>`: independent self contained article
	5. `<aside>`: content aside from content (like sidebar)
	6. `<footer>`: footer for document or section
	7. `<details>`: Additional details
	8. `<summary>`: heading for `<details>` element

### HTML Layout Techniques ###
1. 4 ways for building multicolumn layouts
	1. HTML tables
	2. CSS float property
	3. CSS framework
	4. CSS flexbox

### Which One to Choose? ###
#### HTML Tables ####
1. `<table>` is not designed to be a layout tool but to display tabular data
2. Do not use it for layout (may require re-design after some time)

#### CSS Frameworks ####
1. For fast layout building:
	1. [W3.CSS](https://www.w3schools.com/w3css/default.asp)
	2. [Bootstrap](https://www.w3schools.com/bootstrap/default.asp)

#### CSS Floats ####
1. It is possible to build web layouts using `float` property.
2. `float` and `clear` properties:
3. Disadvantages:
	1. Floating elements are tied to the document flow (less flexibility)
4. [CSS Float and Clear](https://www.w3schools.com/css/css_float.asp)

#### CSS Flexbox ####
1. New layout mode in CSS3
2. Advantages:
	1. Elements behave predictably when page layout must accommodate different screen sizes and display devices
3. Disadvantages: Does not work in IE10 and earler.
4. [CSS Flexbox](https://www.w3schools.com/css/css3_flexbox.asp)

## HTML Responsive ##
### What is Responsive Web Design? ###
1. Responsive web design makes the web page look good on all devices (desktops, tablets, and phones)
2. Use CSS and HTML to resize, hide, shrink, enlarge, or move content to make it look good on any screen

### Creation of Your Own Responsive Design ###
1. Example: Building one on our own

		<!DOCTYPE html>
		<html lang="en-us">
			<head>
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<style>
					.city {
						float: left;
						margin: 5px;
						padding: 15px;
						max-width: 300px;
						height: 300px;
						border: 1px solid black;
					}
				</style>
			</head>
			<body>
				<h1>Responsive Web design Demo</h1>

				<div class="city">
					<h2>London</h2>
					<p>London is the capital city of England.</p>
					<p>It is the most populours city in the United Kingdom, with a metropolitan area of over 13 million inhabitants.</p>
				</div>

				<div class="city">
					<h2>Paris</h2>
					<p>Paris is the capital of France.</p>
					<p>The Paris area is one of the largest population centers in Europe, with more than 12 million inhabitants.</p>
				</div>

				<div class="city">
					<h2>Tokyo</h2>
					<p>Tokyo is the capital of Japan.</p>
					<p>It is the center of the Greater Tokyo Area, and the most populous metropolitan area in the world.</p>
				</div>

				<div class="city">
					<h2>New York</h2>
					<p>The City of New York is the most populous city in the United States.</p>
					<p>New York is an important center for international diplomacy and has been described as the cultural and financial capital of the world.</p>
				</div>
			</body>
		</html>

2. [RWD Tutorial](https://www.w3schools.com/css/css_rwd_intro.asp)

### Using W3.CSS ###
1. `W3.CSS`: a responsive stylesheet
2. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
			</head>
			<body>
				<div class="w3-container w3-orange">
					<h1>W3.CSS Demo</h1>
					<p>Resize this responsive page!</p>
				</div>

				<div class="w3-row-padding">
					<div class="w3-third">
						<h2>London</h2>
						<p>London is the capital of England.</p>
						<p>It is the most populous city in the United Kingdom, with a metropolitan area of over 13 million inhabitants.</p>
					</div>

					<div class="w3-third">
						<h2>Paris</h2>
						<p>Paris is the capital of France.</p>
						<p>The Paris area is one of the largest population centers in Europe, with more than 12 million inhabitants.</p>
					</div>
				
					<div class="w3-third">
						<h2>Tokyo</h2>
						<p>Tokyo is the capital of Japan</p>
						<p>It is the center of the Greater Tokyo Area, and the most populous metropolitan area in the world.</p>
					</div>
				</div>
			</body>
		</html>

3. [W3.CSS Tutorial]()

## HTML Entities ##
1. Reserved characters of HTML must be replaced with character entities.
2. Characters not present in keyboard can be replaced by entities.

### HTML Entities ###
1. If `<` or `>` signs are used in text, browser might mix them with tags.
2. Character entities are used to display reserved characters in HTML.
3. Syntax:
		
		&entity_name;

		OR

		&#entity_number;

4. Advantage of entity name: easier to remember
5. Disadvantage of entity name: all browsers may not support the entity name but there is good support for entity numbers 

### Non-breaking Space ###
1. `&nbsp;`: A space that will not break into a new line.
	1. Words separated by `&nbsp;` will stick togeter.
2. Uses: 
	1. Example:
		1. `<symbol> 10`
		2. `10 km/h`
		3. `10 PM`
	2. Prevent browser from truncating spaces
		1. If there are 10 spaces in the text, browser will remove 9 of them
		2. If you have 10 `&nbsp;`, browser will retain all of them
3. Non-breaking hiphen (`$#8209;`): - won't break

### Some Other Useful HTML Character Entities ###
1. Non-breaking space: `&nbsp;`, `&#160;`
2. less than: `&lt;`, `&#60;`
3. greater than: `&gt`, `&#62`
4. ampersand: `&amp;`, `&#38`
5. double quotation mark: `&quot;`, `&#34;`
6. single quotation mark: `&apos;`, `&#39;`
7. cent: `&cent;`, `&#162;`
8. pound: `&pound;`, `&#163;`
9. yen: `&yen;`, `&#165;`
10. euro: `&euro;`, `&#8364;`
11. copyright: `&copy;`, `&#169;`
12. registered trademark: `&reg;`, `&#174;`

### Combining Diacritical Marks ###
1. Diacritical mark: A "glyph" added to a letter
	1. grave (`) and acute are called accents
	2. Can appear above or below a letter, inside a letter, between two letters
	3. Can be used in combination with alphanumeric characters to produce another character.
2. Examples:
	1. `a&#768;`
	2. `a&#769;`
	3. `a&#770;`
	4. `a&#771;`
	5. `O&#768;`
	6. `O&#769;`
	7. `O&#770;`
	8. `O&#771;`

## HTML Symbols ##
### HTML Symbol Entities ###
1. Use HTML entity name to add mathematical, technical, currency symbols
2. If entity name does not exist, use number, decimal, or hexadecimal reference
3. Example:

		<p>&euro;</p>
		<p>&#8364;</p>
		<p>&#x20AC;</p>

### Some Mathematical Symbols Supported by HTML ###
1. FOR ALL: `&#8704;`, `&forall;`
2. PARTIAL DIFFERENCE: `&#8706;`, `&part;`
3. THERE EXISTS: `&#8707;`, `&exist;`
4. EMPTY SETS: `&#8709;`, `&empty;`
5. NABLA: `&#8711;`, `&nabla;`
6. ELEMENT OF: `&#8712;`, `&isin;`
7. NOT AN ELEMENT OF: `&#8713;`, `&notin;`
8. CONTAINS AS MEMBER: `&#8715;`, `&ni;`
9. N-ARY PRODUCT: `&#8719;`, `&prod;`
10. N-ARY SUMMATION: `&#8721;`, `&sum;`

### Some Greek Letters Supported by HTML ###
1. CAPITAL ALPHA: `&#913;`, `&Alpha;`
2. CAPITAL BETA: `&#914;`, `&Beta;`
3. CAPITAL GAMMA: `&#915;`, `&Gamma;`
4. CAPITAL DELTA: `&#916;`, `&Delta;`
5. CAPITAL EPSILON: `&#917;`, `&Epsilon;`
6. CAPITAL ZETA: `&#918;`, `&Zeta;`

### Some Other Entities Supported by HTML ###
1. TRADEMARK: `&#8482`, `&trade;`
2. LEFTWARDS ARROW: `&#8592;`, `&larr;`
3. UPWARDS ARROW: `&#8593;`, `&uarr;`
4. RIGHTWARDS ARROW: `&#8594;`, `&rarr;`
5. DOWNWARDS ARROW: `&#8595;`, `&darr;`
6. BLACK SPADE SUIT: `&#9824;`, `&spades;`
7. BLACK CLUB SUIT: `&#9827;`, `&clubs;`
8. BLACK HEART SUIT: `&#9829;`, `&hearts;`
9. BLACK DIAMOND SUIT: `&#9830;`, `&diams;`
10. [Full Currency Reference](https://www.w3schools.com/charsets/ref_utf_currency.asp)
11. [Full Arrows Reference](https://www.w3schools.com/charsets/ref_utf_arrows.asp)
12. [Full Symbols Reference](https://www.w3schools.com/charsets/ref_utf_symbols.asp)

## HTML Charset ##
1. Character set enables a web browser to display a web page correctly

### What is Character Encoding? ###
1. ASCII: first character encoding standard
	1. 127 different alphanumeric characters (numbers, alphabet, special characters)
2. ANSI (Windows-1252) supports 256 character codes.
3. ISO-8859-1: Default character set of HTML 4. Supports 256 character codes
4. UTF-8: Default character set of HTML5. Covers almost all characters and symbols in the world

### The HTML charset Attribute ###
1. HTML4: `<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">`
2. HTML5: `<meta charset="UTF-8">`

### Differences Between Character Sets ###
1. [Difference Between Character Sets](https://www.w3schools.com/html/html_charset.asp)

### The ASCII Character Set ###
1. 0 - 31: control characters
2. 32 - 126: letters, digits, symbols
3. 128 - 255: does not use

### The ANSI Character Set (Windows-1252) ###
1. 0 - 127: identical to ASCII
2. 128 - 159: proprietary set of characters
3. 160 - 255: Identical to UTF-8

### The ISO-8859-1 Character Set ###
1. 0 - 127: Identical to ASCII
2. 128 - 159: does not use
3. 160 - 255: Identical to UTF-8

### The UTF-8 Character Set ###
1. 1 - 127: Identical to ASCII
2. 128 - 159: does not use
3. 160 - 255: Identical to ANSI and 8859-1
4. 256 - 255 + 10000: different characters
5. [Complete HTML Character Set Reference](https://www.w3schools.com/charsets/default.asp)

## HTML URL Encode ##
1. URL: web address
	1. Is can be composed of words or IP address

### URL - Uniform Resource Locator ###
1. Web browsers request pages from web servers using a URL
2. URL is used to address a document or data on the web
3. Syntax rules: `scheme://prefix.domain:port/path/filename`
	1. `scheme`: type of internet service (http or https)
	2. `prefix`: domain prefix (default for http www)
	3. `domain`: Internet domain name (w3schools.com)
	4. `port`: port number at the host (default for http is 80)
	5. `path`: path at server (if path is ommitted, then root directory of the site)
	6. `filename`: name of a document or resource

### Common URL Schemes ###
1. http: HyperText Transfer Protocol - Common web pages. Not encrypted
2. https: Secure HTTP - Secure web pages. Encrypted
3. ftp: File Transfer Protocol - Downloading or uploading files
4. file: A file on your computer

### URL Encoding ###
1. URLs to send over the internet, can have only ASCII character-set.
	1. If URL contains characters outside ASCII set, the URL has to be converted
2. URL encoding converts non-ASCII characters into a format that can be transmitted over the Internet
	1. URL encoding replaces non-ASCII characters with %<hex-digits>
	2. URL cannot contain spaces
		1. Replaced with + or %20

### ASCII Encoding Examples ###
1. Browser encodes according to the character set used in the page (default character set for HTML5 is UTF-8)
2. Examples:
	1. `%E2%82%AC`: Euro
	2. `%C2%A3`: Pound
	3. `%C2%A9`: Copyright
	4. `%C2%AE`: Registered Trademark
	5. `%C3%80`
	6. `%C3%81`
	7. `%C3%82`
	8. `%C3%83`
	9. `%C3%84`
	10. `%C3%85`
3. [URL Encoding Reference](https://www.w3schools.com/tags/ref_urlencode.asp)

## HTML XHTML ##
1. XHTML is HTML written as XML

### What Is XHTML ###
1. XHTML: E**X**tensible **H**iper**T**ext **M**arkup **L**anguage
2. XHTML is almost identical to HTML
3. XHTML is stricter than HTML
4. XHTML is HTML defines as an XML application
5. XHTML is supported by all major browsers

### Why XHTML? ###
1. Market consists of different browser technologies.
2. Some browsers run on computers and some one mobile phones or small devices.
3. Small devices often lack the power to interpret "bad" markup
4. XML is a markup language where documents must be marked up correctly (well-formed)
	1. [XML Tutorial](https://www.w3schools.com/xml/default.asp)
5. Strengths of HTML and XML were combined to develop XHTML
6. XHTML is HTML redesigned as XML

### The Most Important Differences from HTML: ###
#### Document Structure ####
1. XHTML DOCTYPE is mandatory
2. xmlns attribute in <html> is mandatory
3. <html>, <head>, <title>, <body> are mandatory

#### XHTML Elements ####
1. XHTML elements must be nested
2. XHTML elements must be closed
3. XHTML elements must be lowercase
4. XHMTL documents must have one root element

#### XHTML Attributes ####
1. Attributes must be in lowercase
2. Attribute values must be quoted
3. Attribute minimization is forbidden

### <!DOCTYPE ...> Is Mandatory ###
1. [XHTML Doctypes](https://www.w3schools.com/tags/tag_doctype.asp)
2. xmlns: xml namespace
3. XHTML document example:

		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<title>Title of document</title>
			</head>
			<body>
				some content
			</body>
		</html>

### XHTML Elements Must Be Properly Nested ###
1. `<b><i>This text is bold and italic</i></b>`

### XHTML ELements Must Always Be Closed ###
1. Example:

		<p>This is a paragraph</p>
		<p>This is another paragraph</p>

### Empty Elements Must Also Be Closed ###
1. Example:

		A break: <br />
		A horizontal rule: <hr />
		An image: <img src="happy.gif" alt="Happy face" />

### XHTML Elements Must Be In Lower Case ###
1. Example:

		<body>
			<p>This is a paragraph</p>
		</body>

### XHTML Attribute Names Must Be In Lower Case ###
1. `<table width="100%">`

### Attribute Values Must Be Quoted ###
1. `<table width="100%">`

### Attribute Minimization Is Forbidden ###
1. Wrong:
	
		<input type="checkbox" name="vehicle" value="car" checked />

2. Right:

		<input type="checkbox" name="vehicle" value="car" checked="checked" />

### How to Convert from HTML to XHTML ###
1. Add XHMTL <!DOCTYPE> to first line of every page
2. Add xmlns attribute to html element
3. Change all element names to lowercase
4. Close all empty elements
5. Change all attribute names to lowercase
6. Quote all attribute values

### Validate HTML With The W3C Validator ###
[Validate HTML](https://www.w3schools.com/html/html_xhtml.asp)

## HTML Graphics ##
### HTML Canvas ###
1. `<canvas>` **(M)**: used to draw graphics in HTML page

#### What is HTML Canvas? ####
1. `<canvas>` is used to draw graphics on the fly via JavaScript
2. It is only a container. Use JavaScript to draw graphics
3. It has methods to draw:
	1. paths
	2. boxes
	3. circles
	4. text
	5. images

#### Browser Support ####
1. Chrome: >= 4.0
2. IE: >= 9.0
3. Firefox: >= 2.0
4. Safari: >= 3.1
5. Opera: >= 9.0

#### Canvas Examples ####
1. Canvas is a rectangle are in an HTML page (default: no border, no content)
2. Example: `<canvas id="myCanvas" width="200" height="100"></canvas>`
	1. `id` is used in the script
3. To add border, use `style` attribute
	1. Example: `<canvas id="myCanvas" width="200" height="100" style="border:1px solid #000000;"></canvas>`

##### Draw a Line #####
1. Example:

		var c = document.getElementById("myCanvas");
		var ctx = c.getContext("2d");
		ctx.moveTo(0,0);
		ctx.lineTo(200, 100);
		ctx.stroke();

##### Draw a Circle #####
1. Example:
	
		var c = document.getElementById("myCanvas");
		var ctx = c.getContext("2d");
		ctx.beginPath();
		ctx.arc(95, 50, 40, 0, 2 * Math.PI);
		ctx.stroke();

##### Draw a Text #####
1. Example:

		var c = document.getElementById("myCanvas");
		var ctx = c.getContext("2d");
		ctx.font = "30px Arial";
		ctx.fillText("Hello World", 10, 50);

##### Stroke Text #####
1. Example:

		var c = document.getElementById("myCanvas");
		var ctx = c.getContext("2d");
		ctx.font = "30px Arial";
		ctx.strokeText("Hello World", 10, 50);

##### Draw Linear Gradient #####
1. Example:

		var c = document.getElementById("myCanvas");
		var ctx = c.getContext("2d");

		// Creation of gradient
		var grd = ctx.createLinearGradient(0, 0, 200, 0);
		grd.addColorStop(0, "red");
		grd.addColorStop(1, "white");
		
		// Fill with gradient
		ctx.fillStyle = grd;
		ctx.fillRect(10, 10, 150, 80);

##### Draw Circular Gradient #####
1. Example:

		var c = document.getElementById("myCanvas");
		var ctx = c.getContext('2d');

		// Creation of gradient
		var grd = ctx.createRadialGradient(75, 50, 5, 90, 60, 100);
		grd.addColorStop(0, "red");
		grd.addColorStop(1, "white");

		// Fill with gradient
		ctx.fillStyle = grd;
		ctx.fillRect(10, 10, 150, 80);

##### Draw Image #####
1. Example:

		var c = document.getElementById("myCanvas");
		var ctx = c.getContext("2d");
		var img = document.getElementById("scream");
		ctx.drawImage(img, 10, 10);

#### HTML Canvas Tutorial ####
1. [HTML Canvas Tutorial](https://www.w3schools.com/graphics/canvas_intro.asp)

### HTML SVG ###
#### What is SVG ####
1. SVG: Scalable Vector Graphics
2. SVG is used to define graphics for the web
3. SVG is a W3C recommendation

#### The HTML <svg> Element ####
1. `<svg>` **(M)**: container for SVG graphics
2. It has several methods for drawing:
	1. Paths
	2. Boxes
	3. Circles
	4. Text
	5. Graphic images

#### Browser Support ####
1. Chrome >= 4.0
2. IE >= 9.0
3. Firefox >= 3.0
4. Safari >= 3.2
5. Opera >= 10.1

#### SVG Circle ####
1. Example:

		<!DOCTYPE html>
		<html>
			<body>
				<svg width="100" height="100">
					<circle cx="50" cy="50" r="40" stroke="green" stroke-width="4" fill="yellow" />
				</svg>
			</body>
		</html>

#### SVG Rectangle ####
1. Example:

		<!DOCTYPE html>
		<html>
			<body>
				<svg width="400" height="100">
					<rect width="400" height="100" style="fill:rgb(0, 0, 255); stroke-width: 10; stroke: rgb(0, 0, 0))" />
				</svg>
			</body>
		</html>

#### SVG Rounded Rectangle ####
1. Example:

		<svg width="400" height="180">
			<rect x="50" y="20" rx="20" ry="20" width="150" height="150" style="fill:red; stroke: black; stroke-width: 5; opacity: 0.5" />
		</svg>

#### SVG Star ####
1. Example:

		<svg width="300" height="200">
			<polygon points="100, 10 40, 198 190, 78 10, 78 160, 198" style="fill: lime; stroke: purple; stroke-width: 5; fill-rule: evenodd;" />
		</svg>

#### SVG Logo ####
1. Example:
	
		<svg height="130" width="500">
			<defs>
				<linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%">
					<stop offset="0%" style="stop-color: rgb(255, 255, 0); stop-opacity: 1" />
					<stop offset="100%;" style="stop-color: rgb(255, 0, 0); stop-opacity: 1" />
				</linearGradient>
			</defs>
			<ellipse cx="100" cy="70" rx="85" ry="55" fill="url(#grad1)" />
			<text fill="#ffffff" font-size="45" font-family="Verdana" x="50" y="86">SVG</text>
			Sorry, your browser does not support inline SVG.
		</svg>

#### Difference Between SVG and Canvas ####
1. SVG is a language for describing 2D graphics in XML
2. Canvas draws 2D graphics on the fly using JavaScript
3. It is XML based (every element is available within the SVG DOM)
	1. JavaScript event handlers can be attached
4. Each drawn shape is remembered as an object. If attributes of an SVG object are changed, browser can automatically re-render the shape.
5. Canvas is rendered pixel by pixel. Once graphic is drawn, it is forgotten by the browser. (if position needs to be changed, it must be re-drawn including all objects)

#### Comparison of Canvas and SVG ####
1. Canvas, SVG:
2. Resolution dependent, Resolution independent
3. No support for event handlers, Support for event handlers
4. Poor text rendering capabilities, Best suited for applications with large rendering areas (Google Maps)
5. Resulting image can be saved as .png or .jpg, Slow rendering if complex (anything that uses the DOM a lot will be slow)
6. Well suited for graphic-intensive games, Not suited for game applications

#### SVG Tutorial ####
1. [SVG Tutorial](https://www.w3schools.com/graphics/svg_intro.asp)

### HTML Google Maps ###
#### A Basic Web Page ####
1. Example:

		<!DOCTYPE html>
		<html>
			<body>
				<h1>My Google Map</h1>

				<div id="map">My map should go here</div>
			</body>
		</html>

#### Set the Map Size ####
1. Example:

		<div id="map" style="width:400px;height:400px">

#### A Function to Set The Map Properties ####
1. Example:

		function myMap() {
			var mapOptions = {
				center: new google.maps.LatLng(51.5, -0.12),
				zoom: 10,
				mapTypeId: google.maps.MapTypeId.HYBRID
			}
			var map = new google.maps.Map(document.getElementById("map"), mapOptions);
		}

##### Example Explained #####
1. `mapOptions`: defines properties for the map
2. `center`: specifies where to center the map (latitude and longitude)
3. `zoom`: specifies zoom level for map
4. `mapTypeId`: map type to display
	1. `ROADMAP`
	2. `SATELLITE`
	3. `HYBRID`
	4. `TERRAIN`
5. `var map = google.maps.Map(document.getElementById("map"), mapOptions);` builds a new map inside `<div>` with `id="map"` using the parameters passed in.

#### Add the Google Maps API ####
1. Functionality is provided by JavaScript library located at Google.
2. Script refers to Google Maps API with a callback to myMap function

		<script src="https://maps.googleapis.com/maps/api/js?callback=myMap"></script>

#### Google Maps Tutorial ####
1. [Google Maps Tutorial](https://www.w3schools.com/graphics/google_maps_intro.asp)

## HTML Media ##
1. Multimedia: sound, music, videos, movies, and animations.
#### What is Multimedia? ####
1. Anything that we can hear or see.
2. Examples:
	1. Images, music, sound, videos, records, films, animations, and ...
3. Learn about different multimedia formats:

#### Browser Support ####
1. History: Animations, audio and video have been handled differently by different browsers.
	1. Some formats require extra helper programs (plug-ins) to work.
2. HTML5 multimedia promises an easier future.

#### Multimedia Formats ####
1. Multimedia elements are stored in media files.
2. Different formats usually have different extensions.
	1. .swf, .wav, .mp4, .mp4, .mpg, .wmv, .avi

#### Common Video Formats ####
1. MP4: new and upcoming format for internet video
	1. Recommended by YouTube
	2. Supported by Flash Players
	3. Supported by HTML5
2. Formats:
	1. MPEG: .mpg or .mpeg - Moving Pictures Expert Group. Not supported by HTML5
	2. AVI: .avi - Audio Video Interlative. Common in Video cameras and TV hardware. Plays well on Window's computers but not in web browsers.
	3. WMV: .wmv - Windows Media Video. Common in Video cameras and TV hardware. Plays well on Window's computers but not in web browsers.
	4. QuickTime: .mov - Common in Video cameras and TV hardware. Plays well on Apple computers, but not in web browsers.
	5. RealVideo: .rm, .ram - To allow video streaming with low bandwidths. Still used for online video and internet TV but does not play in web browser
	6. Flash: .swf, .flv - Often requires an extra component (plug-in) to play in web browsers.
	7. **Ogg**: .ogg - Theora Ogg. Supported by HTML5
	8. **WebM**: .webm - Supported by HTML5
	9. **MPEG-4**: .mp4 - Based on QuickTime. Common in new video cameras and TV hardware. Supported by all HTML5 browsers. Recommended by YouTube.

#### Audio Formats ####
1. MP3: Newest format for compressed recorded music.
2. Formats:
	1. MIDI: .mid, .midi - Musical Instrument Digital Interface. Main format for electronic music devices like synthesizers and PC sound cards. Midi files do not contain sound, but digital notes that can be played by electronics. Plays on all computers and music hardware but not in web browsers.
	2. RealAudio: .rm, .ram - To allow streaming of audio with low bandwidths. Does not play in web browsers.
	3. WMA: .wma - Windows Media Audio. Commonly used in music players. Plays well on Windows computers, but not in web browsers.
	4. AAC: .aac - Advanced Audio Coding. Default format for iTunes. Plays well on Apple computers, but not in web browsers.
	5. **WAV**: .wav - Plays well on Windows, Macintosh, and Linux OSs. Supported by HTML5
	6. **Ogg**: .ogg - Supported by HTML5
	7. **MP3**: .mp3 - They are sound part of MPEG files. Most popular format for music players. Combines good compressions (small files) with high quality. Supported by all browsers.
	8. **MP4**: .mp4 - Video format, but can also be used for audio. Upcoming video format on internet. Automatic support for MP4 audio by all browsers.

#### HTML5 Support ####
1. MP3, WAV, Ogg - audio
2. MP4, WebM, Ogg - video

### HTML Video ###
#### Playing Videos in HTML ####
1. Before HTML5, video could be played only with plugin (Flash)
2. `<video>` **(M)**: embeds a video in web page

#### Browser Support ####
1. Chrome: 4.0
2. IE: 9.0
3. Firefox: 3.5
4. Safari: 4.0
5. Opera: 10.5

#### The HTML <video> Element ####
1. Example:

		<video width="320" height="240" controls>
			<source src="movie.mp4" type="video/mp4">
			<source src="movie.ogg" type="video/ogg">
			Your browser does not support the video tag.
		</video>

#### How it Works ####
1. `controls` **(M)**: adds video controls, like play, pause and volume
2. `width`, `height`: if not set, page might flicker wile video loads.
3. `<source>`: to specify alternative video files which browser may choose from. First recognized format will be used
4. Text between `<video>` and `</video>` will be displayed  in browsers that do not support `<video>` element.

#### HTML <video> Autoplay ####
1. `autoplay` **(M)**: attribute used with `<video>` to automatically start a video (does not work on mobile like iPad and iPhone)

		<video width="320" height="240" autoplay>
			<source src="movie.mp4" type="video/mp4">
			<source src="movie.ogg" type="video/ogg">
			Your browser does not support the video tag
		</video>

#### HTML Video - Browser Support ####
1. IE: MP4
2. Chrome: MP4, WebM, Ogg
3. Firefox: MP4, WebM, Ogg
4. Safari: MP4
5. Opera: MP4 (v25), WebM, Ogg

#### HTML Video - Media Types ####
1. `video/mp4`: MP4
2. `video/webm`: WebM
3. `video/ogg`: Ogg

#### HTML Video - Methods, Properties, and Events ####
1. HTML5 has DOM methods, properties, and events for `<video>` (to load, play, pause, set duration, volume)
	1. DOM events: notify when video begins to play, is paused, ...
2. Example:

		<!DOCTYPE html>
		<html>
			<body>
				<div style="text-align: center">
					<button onclick="playPause()">Play/Pause</button>
					<button onclick="makeBig()">Big</button>
					<button onclick="makeSmall()">Small</button>
					<button onclick="makeNormal()">Normal</button>
					<br /><br />
					<video id="video1" width="420">
						<source src="mov_bbb.mp4" type="video/mp4">
						<source src="mov_bbb.ogg" type="video/ogg">
						Your browser does not support HTML5 video.
					</video>
				</div>

				<script>
					var myVideo = document.getElementById('video1');

					function playPause() {
						if (myVideo.paused)
							myVideo.play();
						else
							myVideo.pause();
					}

					function makeBig() {
						myVideo.width = 560;
					}

					function makeSmall() {
						myVideo.width = 320;
					}

					function makeNormal() {
						myVideo.width = 420;
					}
				</script>

				<p>Video courtesy of <a href="https://www.bigbuckbunny.org/" target="_blank">Big Buck Bunney</a>.</p>
			</body>
		</html>

#### HTML5 Video Tags ####
1. `<video>`: video or movie
2. `<source>`: multiple media resources
3. `<track>`: text tracks in media players
	1. Example:

			<video ...>
				<track src="subtitles_en.vtt" kind="subtitles" srclang="en" label="English">
				<track src="subtitles_no.vtt" kind="subtitles" srclang="no" label="Norwegian">
			</video>

### HTML Audio ###
#### Audio on the Web ####
1. Before HTML5, audio files could be played with plug-in (like flash)
2. `<audo>` embeds audio in a web page

#### Browser Support ####
1. Chrome: 4.0
2. IE: 9.0
3. Firefox: 3.5
4. Safari: 4.0
5. Opera: 10.5

#### The HTML <audio> Element ####
1. Example:

		<audio controls>
			<source src="horse.ogg" type="audio/ogg">
			<source src="horse.mp3" type="audio/mpeg">
			Your browser does not support the audio element.
		</audio>

#### HTML Audio - How it Works ####
1. `controls`: adds audio controls, like play, pause, and volume
2. `<source>`: specify alternative audio files which the browser may choose from. Browser will use the first recognized format.
3. Text between `<audio>` and `</audio>` will be displayed in browsers that do not support the `<audio>` element.  

#### HTML Audio - Browser Support ####
1. IE: MP3
2. Chrome: MP3, Wav, Ogg
3. Firefox: MP3, Wav, Ogg
4. Safari: MP3, Wav
5. Opera: MP3, Wav, Ogg

#### HTML Audio - Media Types ####
1. `audio/mpeg`: MP3
2. `audio/ogg`: Ogg
3. `audio/wav`: Wav

#### HTML Audio - Methods, Properties, and Events ####
1. DOM methods, properties, and events are defined by HTML5 for `<audio>`
	1. To load, play, pause, set duration and volume
2. DOM events can notify when an audio begins to play, is paused, ...
3. [HTML5 Audio/Video DOM Reference](https://www.w3schools.com/tags/ref_av_dom.asp)

#### HTML5 Audio Tags ####
1. `<audio>`: To define sound content
2. `<source>`: To define multiple media sources for media elements, (for `<video>`, `<audio>`)

### HTML Plug-ins ###
1. Plug-in extends the functionality of web browser

#### HTML Helpers (Plug-ins) ####
1. Helper apps (plug-ins) are computer programs that extend the functionality of a web browser
2. Example: Java applets
3. Adding plugins:
	1. `<object>` **(M)** or `<embed>` **(M)**
4. Purposes:
	1. Display maps
	2. scan for viruses
	3. Verify bank id
	4. ...

#### The <object> Element ####
1. `<object>` is supported by all browsers
	1. Defines an embedded object within an HTML document
	2. Used to embed plugins (Java applets, PDF readers, Flash players) in web pages
2. Example:

		<object width="400" height="50" data="https://www.w3schools.com/html/bookmark.swf"></object>

3. Example: Include HTML in HTML

		<object width="100%" height="500px" data="https://www.w3schools.com/html/snippet.html"></object>

4. Example: Include images
	
		<object data="https://www.w3schools.com/html/audi.jpeg"></object>

#### The <embed> Element ####
1. `<embed>` supported in all major browsers
	1. It defines an embedded object in HTML document
	2. It is part of HTML5 specification but not before
2. Example:

		<embed width="400" height="50" src="https://www.w3schools.com/html/bookmark.swf">

3. Example: Include HTML in HTML

		<embed width="100%" height="500px" src="https://www.w3schools.com/html/snippet.html">

### HTML YouTube ###
1. it is the easiest way to play video in HTML

#### Struggling with Video Formats? ####
1. Conventionally, we need to convert videos into different formats to make them compatible with browser.
2. Solution: Let youtube play videos

#### YouTube Video Id ####
1. YouTube will display id when you save (or play) a video
2. Refer to the id in the HTML code

#### Playing a YouTube Video in HTML ####
1. Steps:
	1. Upload video to YouTube
	2. Take a note of the video id
	3. Define an iframe in webpage
	4. let src point to video URL
	5. Use width and height to specify the dimensions of the player
	6. Add other parameters
2. Using iframe

		<iframe width="420" height="315" src="https://www.youtube.com/embed/XGSy3_Czz8k">
		<iframe>

#### YouTube Autoplay ####
1. `https://www.youtube.com/embed/XGSy3_Czz8k?autoplay=1`
	1. 0 (default): video will not play automatically
	2. 1 : video will play automatically

#### YouTube Playlist ####
1. A comma separated list of videos to play (in addition to the original URL)
	1. `playlist=<track1>,<track2>...`

#### YouTube Loop ####
1. `https://www.youtube.com/embed/XGSy3_Czz8k?playlist=XGSy3_Czz8k&loop=1`
	1. 0 (default): video will play only once
	2. 1 : video will loop (forever unless stopped)

#### YouTube Controls ####
1. `https://www.youtube.com/embed/XGSy3_Czz8k?controls=0`>
	1. 0 (default): controls do not display
	2. 1 : controls display

#### YouTube - Using <object> or <embed> ####
1. Using `<object>` and `<embed>` are deprecated from January 2015 for YouTube. Use `<iframe>` instead.

		<object width="420" height="315" data="https://www.youtube.com/embed/XGSy3_Czz8k"></object>

		<embed width="420" height="315" src="https://www.youtube.com/embed/XGSy3_Czz8k">

## HTML APIs ##
### HTML Geolocation ###
1. Geolocation API is used to locate a user's position

#### Locate the User's Position ####
1. Position is not available unless the user approves it (privacy)

#### Browser Support ####
1. Chrome: 5.0 - 49.0 (http) 50.0 (https)
	1. On Chrome 50.0 Geolocation API will work only if the web site is hosted on a secure origin (HTTPS)
2. IE: 9.0
3. Firefox: 3.5
4. Safari: 5.0
5. Opera: 16.0

#### Using HTML Geolocation ####
1. `getCurrentPosition()` **(M)**: returns current position.
2. Example:

		<script>
			var x = document.getElementById('demo');
			function getLocation() {
				if (navigator.geolocation) {
					navigator.geolocation.getCurrentPosition(showPosition);
				} else {
					x.innerHTML = 'Geolocation is not supported by this browser.';
				}
			}

			function showPosition(position) {
				x.innerHTML = 'Latitude: ' + position.coords.latitude + '<br>Longitude: ' + position.coords.longitude;
			}
		</script>

	1. Check if geolocation is supported (`navigator.geolocation`)
	2. If supported, run `getCurrentPosition()`. If not, display a message to the user
	3. If `getCurrentPosition()` is successful, it returns a coordinates object to the function specified in the parameter (`showPosition`)
	4. `showPosition()` outputs the Latitude and Longitude

#### Handling Errors and Rejections ####
1. Second parameter of `getCurrentPosition()` is an error handler (it is run if it fails to get user location)
	
		function showError(error) {
			switch(error.code) {
				case error.PERMISSION_DENIED:
					x.innerHTML = "User denied the request for Geolocation.";
					break;
				case error.POSITION_UNAVAILABLE:
					x.innerHTML = "Location information is unavailable.";
					break;
				case error.TIMEOUT:
					x.innerHTML = "The request to get user location timed out.";
					break;
				case error.UNKNOWN_ERROR:
					x.innerHTML = "An unknown error occurred."
					break;
			}
		}

2. Example:

		<!DOCTYPE html>
		<html>
			<body>
				<p>Click the button to get your coordinates.</p>

				<button onclick="getLocation()">Try It</button>

				<p id="demo"></p>

				<script>
					var x = document.getElementById('demo');

					function getLocation() {
						if (navigator.geolocation) {
							navigator.geolocation.getCurrentPosition(showPosition, showError);
						} else {
							x.innerHTML = "Geolocation is not supported by this browser.";
						}
					}

					function showPosition(position) {
						x.innerHTML = 'Latitude: ' + position.coords.latitude + '<br />Longitude: ' + position.coords.longitude;
					}

					function showError(error) {
						switch (error.code) {
							case error.PERMISSION_DENIED:
								x.innerHTML = 'User denied the request for Geolocation.';
								break;
							case error.POSITION_UNAVAILABLE:
								x.innerHTML = 'Location information is unavailable.';
								break;
							case error.TIMEOUT:
								x.innerHTML = 'The request to get user location timed out.';
								break;
							case error.UNKNOWN_ERROR:
								x.innerHTML = 'An unknown error occurred.';
								break;
						}
					}
				</script>
			</body>
		</html>

3. Showing Markers:
	1. [Google Map Script](https://www.w3schools.com/html/tryit.asp?filename=tryhtml5_geolocation_map_script)
	2. Get a free API KEY [here](https://console.developers.google.com/apis/credentials?project=authentication-40b76)
	3. Example:

			<!DOCTYPE html>
			<html>
				<body>
					<p id="demo">Click the button to get your position.</p>

					<button onclick="getLocation()">Try it</button>

					<div id="mapholder"></div>

					<script src="https://maps.google.com/maps/api/js?sensor=false&key=AIzaSyCXt57RaaCvZCGC_uFqwQNUyKcf6-vaOi4"></script>
					<!-- To use this code on your website, get a free API key from Google. Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
					-->
					<script>
						var x = document.getElementById('demo');

						function getLocation() {
							if (navigator.gelocation) {
								navigator.gelocation.getCurrentPosition(showPosition, showError);
							} else {
								x.innerHTML = 'Geolocation is not supported by this browser.';
							}
						}

						function showPosition(position) {
							lat = position.coords.latitude;
							long = position.coords.longitude;
							latlon = new google.maps.LatLng(lat, lon);
							var mapholder = document.getElementById('mapholder');
							mapholder.style.height = '250px';
							mapholder.style.width = '500px';

							var myOptions = {
								center: latlon,
								zoom: 14,
								mapTypeId: google.maps.MapTypeId.ROADMAP,
								mapTypeControl: false,
								navigationControlOptions: {
									style: google.maps.NavigationControlStyle.SMALL
								}
							}

							var map = new google.maps.Map(document.getElementById('mapholder'), myOptions);

							var marker = new google.maps.Marker({
								position: latlon,
								map: map,
								title: 'You are here!'
							});
						}

						function showError(error) {
							switch (error.code) {
								case error.PERMISSION_DENIED:
									x.innerHTML = 'User denied the request for Geolocation.';
									break;
								case error.POSITION_UNAVAILABLE:
									x.innerHTML = 'Location information is unavalable.';
									break;
								case error.TIMEOUT:
									x.innerHTML = 'The request to get user location timed out.';
									break;
								case error.UNKNOWN_ERROR:
									x.innerHTML = 'An unknown error occurred.';
									break;
							}
						}
					</script>
				</body>
			</html>

#### Displaying the Result in a Map ####
1. Need access to a map service like Google Maps.
2. Example:

		function showPosition(position) {
			var latlon = position.coords.latitude + ',' + position.coords.longitude;

			var img_url = 'https://maps.googleapis.com/maps/api/staticmap?center=' + latlon + '&zoom=14&size=400x300&sensor=false&key=YOUR_:KEY';

			document.getElementById('mapholder').innerHTML = '<img src="' + img_url + '">';
		}

#### Location-specific Information ####
1. Information such as:
	1. Up-to-date local information
	2. Showing points of interest near the user
	3. Turn-by-turn navigation (GPS)

#### The getCurrentPosition() Method - Return Data
1. `getCurrentPosition()` returns an object on success
	1. `latitude`
	2. `longitude`
	3. `accuracy`
2. Other Optional properties are also returned if available:
	1. `coords.latitude`: decimal
	2. `coords.longitude`: decimal
	3. `coords.accuracy`: accuracy
	4. `coords.altitude`: in meters above mean sea level
	5. `coords.altitudeAccuracy`: accuracy
	6. `coords.heading`: degrees clockwise from North
	7. `coords.speed`: speed in meters per second
	8. `timestamp`: date/time of response

#### Geolocation Object - Other interesting Methods ####
1. Interesting methods in Geolocation object:
	1. `watchPosition()`: returns current position of user and continues to return updated position as the user moves (like GPS)
	2. `clearWatch()`: Stops watchPosition() method
2. Example:

		<script>
			var x = document.getElementById('demo');
			function getLocation() {
				if (navigation.geolocation) {
					navigator.geolocation.watchPosition(showPosition);
				} else {
					x.innerHTML = 'Geolocation is not supported by this browser.';
				}
			}

			function showPosition(position) {
				x.innerHTML = 'Latitude: ' + position.coords.latitude + '<br />Longitude: ' + position.coords.longitude;
			}
		</script>

### HTML Drag/Drop ###
#### Drag and Drop ####
1. Grab an object and drag it to a different location.
2. Drag and drop is part of HTML standard
	1. Any element can be draggable.

#### Browser Support ####
1. Chrome: 4.0
2. IE: 9.0
3. Firefox: 3.5
4. Safari: 6.0
5. Opera: 12.0

#### HTML Drag and Drop Example ####

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					#div1 {
						width: 339px;
						height: 69px;
						padding: 10px;
						border: 1px solid black;
					}
				</style>
				<script>
					function allowDrop(ev) {
						ev.prefentDefault();
					}

					function drag(ev) {
						ev.dataTransfer.setData('text', ev.target.id);
					}

					function drop(ev) {
						ev.preventDefault();
						var data = ev.dataTransfer.getData('text');
						ev.target.appendChild(document.getElementById(data));
					}
				</script>
			</head>
			<body>
				<div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div>

				<img id="drag1" src="img_logo.gif" draggable="true" ondragstart="drag(event)" width="336" height="69">
			</body>
		</html>

#### Make an Element Draggable ####
1. Set `draggable="true"` to make an element draggable.
	1. `<img draggable="true">`

#### What to Drag - ondragstart and setData() ####
1. Specify what should happen when element is dragged.
2. `ondragstart`: attribute
	1. Calls function `drag(event)` which specifies what data to be dragged
	2. `dataTransfer.setData()`: sets data type and the value of dragged data

			function drag(ev) {
				ev.dataTransfer.setData("text", ev.target.id);
			}
		
		1. `text`: data type
		2. `ev.target.id`: value is id of draggable element

#### Where to Drop - ondragover ####
1. `ondragover`: event specifies where dragged data can be dropped
	1. By default, data/elements cannot be dropped in other elements.
		1. To avoid default behavior, we must avoid default handling of element.
			1. Done by `event.prefentDefault()`

#### Do the Drop - ondrop ####
1. When dragged data is dropped, `drop` event occurs
2. `ondrop` attribute calls `drop(event)`

		function drop(ev) {
			ev.preventDefault();
			var data = ev.dataTransfer.getData("text");
			ev.target.appendChild(document.getElementById(data));
		}

	1. `preventDefault()`: prevents browser default handling of data (default: open as link on drop)
	2. `dataTransfer.getData()`: returns dragged data (returns data that was set to the type specified using `setData()`)
	3. data that was dragged is the id of dragged element
	4. Append dragged element into drop element

#### More Examples ####
1. How to drag (and drop) an image back and forth between two <div> elements.

### HTML Local Storage ###
1. local storage is better than cookies

#### What is HTML Local Storage ####
1. Web apps can store data locally withing user's browser
2. Before HTML5: app had to store data in cookies
	1. The cookies were included in every server request
3. Local storage:
	1. More secure than cookies
	2. Large amounts of data can be stored
		1. Storage limit (5 MB)
	3. Website performance is not affected
	4. Info is not transfered to server
	5. It is per origin (domain and protocol)
		1. All pages from the same origin can store and access same data

#### Browser Support ####
1. Chrome: 4.0
2. IE: 8.0
4. Firefox: 3.5
5. Safari: 4.0
6. Opera: 11.5

#### HTML Local Storage Objects ####
1. Two objects to store data:
	1. `window.localStorage` **(M)**: stores data with no expiration date
	2. `window.sessionStorage` **(M)**: stores data for a session (data is lost when browser tab is closed)
2. Check browser support:

		if (typeof(Storage) !== 'undefined') {
			// Code for localStorage/sessionStorage.
		} else {
			// Sorry! No Web Storage support
		} 

#### The localStorage Object ####
1. No expiration date
2. The data remains even if browser is closed.

		// Store
		localStorage.setItem('lastname', 'Smith');
		// Retrieve
		document.getElementById('result').innerHTML = localStorage.getItem('lastname');
	1. name = 'lastname', value = 'Smith'
	2. retrieve 'lastname' and assign it to an element
3. Another way to write the code

		// Store
		localStorage.lastname = 'Smith';
		// Retrieve
		document.getElementById('result').innerHTML = localStorage.lastname;

4. Remove the item:

		localStorage.removeItem('lastname');

5. name/value pairs are stored as strings. (Convert to another format if required)
6. Example: Get the number of times a user has clicked a button:

		if (localStorage.clickcount) {
			localStorage.clickcount = Number(localStorage.clickcount) + 1;
		} else {
			localStorage.clickcount = 1;
		}
		document.getElementById('result').innerHTML = 'You have clicked the button ' + localStorage.clickcount + ' time(s).';

#### The sessionStorage Object ####
1. `sessionStorage` is similar to `localStorage` but it stores data for only one session. (data is deleted when user closes specific browser tab)
2. Example:

		if (sessionStorage.clickcount) {
			sessionStorage.clickcount = Number(sessionStorage.clickcount) + 1;
		} else {
			sessionStorage.clickcount = 1;
		}
		document.getElementById('result').innerHTML = 'You have click the button ' + sessionStorage.clickcount + ' time(s) in this session.';

### HTML App Cache ###
1. Used to build an offline version of web app (by constructing a cache manifest file)

#### What is Application Cache? ####
1. A web application is cached and is accessable without internet connection
2. Advantages:
	1. Offline browsing: Users can use even if they are offline
	2. Speed: cached resources load faster
	3. Reduced server load: browser will download updated/ changed resources from server

#### Browser Support ####
1. Chrome: 4.0
2. IE: 10.0
3. Firefox: 3.5
4. Safari: 4.0
5. Opera: 11.5

#### HTML Cache Manifest Example ####

		<!DOCTYPE html>
		<html manifest="demo.appcache">
			<body>
				The content of the document ........
			</body>
		</html>

#### Cache Manifest Basics ####
1. `manifest` **(M)**: attribute that enables application cache
	1. When user visits the page, it will be cached
	2. If not specified, it may be specified directly in manifest file
2. `demo.appcache`:
	1. `.appcache`: recommended file extenion of manifest file
	2. manifest file must be served with correct media type of `text/cache-manifest` **(M)**

#### The Manifest File ####
1. Manifest file is a simple text file (tells browser what to cache and what not to cache)
2. Structure:
	1. Three sections:
		1. **CACHE MANIFEST**: files listed in this header will be cached after they are downloaded for the first time
		2. **NETWORK**: files listed under this header require connection to the server and will never be cached
		3. **FALLBACK**: files listed under this header specifies fallback pages if a page is inaccessible
3. **CACHE MANIFEST**
	1. Structure:

			CACHE MANIFEST
			/theme.css
			/logo.gif
			/main.js

		1. Lists three resources: a CSS file, a GIF image, JavaScript file. Browser will download the three files from root directory of the web site. (Even if a user is not connected to the internet the resources are still available)
4. **NETWORK**
	1. Structure:

			NETWORK:
			login.asp

		1. `login.asp` should never be cached and will not be available offline
	2. Structure 2:

			NETWORK:
			*

		1. * says all other resources/files require an internet connection
5. **FALLBACK**
	1. Structure:

			FALLBACK:
			/html/ /offline.html
		
		1. `offline.html` will be served in place of all files in `/html/` catalog in case an internet connection cannot be established

#### Updating the Cache ####
1. An application remains cached until the following happens:
	1. User clear's browser's cache
	2. Manifest file is modified
	3. Application cache is programmatically updated

#### Example - Complete Cache Manifest File ####

		CACHE MANIFEST
		# 2012-02-21 v1.0.0
		/theme.css
		/logo.gif
		/main.js

		NETWORK:
		login.asp

		FALLBACK:
		/html/ /offline.html

	1. `#` indicates a comment or can serve other purpose (updating the date will recache the files if changes in JavaScript funtion or image needs to be reflected)

#### Notes on Application Cache ####
1. Once a file is cached, browser will continue to show the cached version even if the file is changed in the server.
2. To ensure the browser updates the cache, change the manifest file
3. Browsers may have different cache limits (ex: 5MB limit per site)

### HTML Web Workers ###
1. Web worker: It is a JavaScript running in the background without affecting performance of the page

#### What is a Web Worker? ####
1. Usually, until a script is finished, the page becomes unresponsive
2. Web worker is a JavaScript that runs in the background, independently of other scripts. We can continue to interact with the page (click, select things, ...) while web worker runs in the background.

#### Browser Support ####
1. Chrome: 4.0
2. IE: 10.0
3. Firefox: 3.5
4. Safari: 4.0
5. Opera: 11.5

#### HTML Web Workers Example ####
1. Web worker that counts numbers in the background

		<!DOCTYPE html>
		<html>
			<body>
				<p>Count numbers: <output id="result"></output></p>
				<button onclick="startWorker()">Start Worker</button>
				<button onclick="stopWorker()">Stop Worker</button>

				<p><strong>Note:</strong> Internet Explorer 9 and earlier versions do not support Web Workers.</p>

				<script>
					var w;

					function startWorker() {
						if(typeof(Worker) !== 'undefined') {
							if (typeof(w) == 'undefined') {
								w = new Worker('demo_workers.js);
							}
							w.onmessage = function (event) {
								document.getElementById('result').innerHTML = event.data;
							}
						} else {
							document.getElementById('result').innerHTML = 'Sorry, your browser does not support Web Workers...';
						}
					}

					function stopWorker() {
						w.terminate();
						w = undefined;
					}
				</script>
			</body>
		</html>

	1. To run the file `python -m http.server` from the folder
	2. Access the file using: `http://0.0.0.0:8000/simple_page_34.html`

#### Check Web Worker Support ####

		if (typeof(Worker) !== 'undefined') {
			// Yes! Web worker support!
			// Some code.....
		} else {
			// Sorry! No Web Worker support..
		}

#### Creation of a Web Worker File ####
1. `demo_workers.js`

		var i = 0;

		function timedCount() {
			i = i + 1;
			postMessage();
			setTimeout('timedCount()', 500);
		}

		timedCount();

	1. `postMessage()` **(M)**: posts message back to html page
	2. Use web workers for more CPU intensive tasks 

#### Creation of a Web Worker Object ####
1. Check if worker already exists, if not, initiate a new web worker object and run the code in `demo_workers.js`

		if (typeof(w) == 'undefined') {
			w = new Worker('demo_workers.js');
		}

2. Send and receive message from web worker

		w.onmessage = function (event) {
			document.getElementById('result').innerHTML = event.data;
		}

	1. When web worker posts a message, the code within the event listener is executed. data is present in `event.data`

#### Terminate a Web Worker ####
1. Even if external script is finished, if web worker is not terminated, it will continue to listen for messages.
2. Terminating web worker will free browser/computer resources

		w.terminate();

#### Reuse the Web Worker ####
1. `w = 'undefined';` makes `w` reusable

#### Web Workers and the DOM ####
1. Web workers are in external files and hence do not have access to the following:
	1. window object
	2. document object
	3. parent object

### HTML SSE ###
1. Server-Sent Events allow a web page to get updates from a server.

#### Server-Sent Events - One Way Messaging ####
1. An event when a web page automatically gets updates from a server
	1. Previously, web page needed to ask if any updates were available.
	2. Now updates come automatically
2. Examples:
	1. Facebook/Twitter updates
	2. Stock price updates
	3. News feeds
	4. Sport results
	5. ...

#### Browser Support ####
1. Chrome: 6.0
2. IE: Not supported
3. Firefox: 6.0
4. Safari: 5.0
5. Opera: 11.5

#### Receive Server-Sent Event Notifications ####
1. `EventSource`: object used to receive server-sent event notifications
2. Example:

		<!DOCTYPE html>
		<html>
			<body>
				<h1>Getting server updates</h1>
				<div id="result"></div>

				<script>
					if (typeof(EventSource) !== 'undefined') {
						var source = new EventSource('demo_sse.php');
						source.onmessage = function (event) {
							document.getElementById('result').innerHTML += event.data + '<br />';
						};
					} else {
						document.getElementByid('result').innerHTML = 'Sorry, your browser does not support server-sent events...';
					}
				</script>
			</body>
		</html>

	1. Construct a new `EventSource` object and specify URL of the page sending updates
	2. Each time an update is received, `onmessage` event occurs
	3. When an onmessage event occurs, put the received data in the element with `id="result"`
	4. To run:
		1. `php -S 127.0.0.1:1800 -t .`
			1. `php [options] -S <addr>:<port> [-t docroot]`
		2. `http://127.0.0.1:1800/simple_page_35.html`


#### Check Server-Sent Events Support ####

		if (typeof(EventSource) !== 'undefined') {
			// Yes! Server-sent events support!
			// Some code....
		} else {
			// Sorry! No server-sent events support....
		}

#### Server-Side Code Example ####
1. Server file should be able to send updates (PHP or ASP)
2. Example: PHP

		<?php
		header('Content-Type: text/event-stream');
		header('Cache-Control: no-cache');

		$time = date('r');
		echo "data: The server time is: {$time}\n\n";
		flush();
		?>

	1. `Content-Type: text/event-stream`
	2. Specify that page should not cache
	3. Output the data
	4. Flush the output data back to web page

3. Example: ASP

		<%
			Response.ContentType = 'text/event-stream'
			Response.Expires = -1
			Response.Write('data: The server time is: ' & now())
			Response.Flush()
		%>

#### The EventSource Object ####
1. Other events:
	1. `onopen`: When a connection to server is opened
	2. `onmessage`: When a message is received
	3. `onerror`: When an error occurs
