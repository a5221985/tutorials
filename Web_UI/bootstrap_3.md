# Bootstrap 3 #

## BS HOME ##
1. Most popular HTML, CSS and JavaScript framework for developing responsive, mobile-first web sites.
2. It is free to download and use.

### Try it Yourself Examples ###

		<div class="jumbotron text-center">
			<h1>My First Bootstrap Page</h1>
			<p>Resize this responsive page to see the effect!</p>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<h3>Column 1</h3>
					<p>Lorem ipsum dolor..</p>
					<p>Ut enim ad..</p>
				</div>
				<div class="col-sm-4">
					<h3>Column 2</h3>
					<p>Lorem ipsum dolor...</p>
					<p>Ut enim ad..</p>
				</div>
				<div class="col-sm-4">
					<h3>Column 3</h3>
					<p>Lorem ipsum dolor...</p>
					<p>Ut enim ad..</p>
				</div>
			</div>
		</div>

## BS Get Started ##
### What is Bootstrap? ###
1. Free front-end framework for faster and easier web development
2. Includes HTML, CSS based design templates for typography, forms, buttons, tables, navigation, modals, image carousels, ... + optional javascript plugins
3. Enables building responsive designs
4. What is responsive web design?
	1. Creation of websites that automatically adjust themselves to look good on all devices (small phones to large desktops)

### Bootstrap History ###
1. Developed by Mark Otto and Jacob Thornton at Twitter

### Why Use Bootstrap? ###
1. **Easy to use**: basic knowledge of HTML and CSS is enough to use bootstrap
2. **Responsive features**: Responsive CSS adjusts to phones, tablets, desktops
3. **Mobile-first approach**: Mobile-first styles are part of core framework
4. **Browser compatibility**: compatible with all modern browsers
	1. (chrome, firefox, Internet Explorer, Safari, Opera)

### Where to Get Bootstrap? ###
1. Two ways to use
	1. Download from [getbootstrap.com](getbootstrap.com)
	2. Include from a CDN

### Downloading Bootstrap ###
1. [getbootstrap.com](getbootstrap.com) (has instructions as well)

### Bootstrap CND ###
1. If we don't want to host bootstrap ourselves, use CDN
2. MaxCDN: CDN support for Bootstrap's CSS and JavaScript
	1. Include jQuery as well

			<!-- Latest compiled and minifed CSS -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

			<!-- jQuery library -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

			<!-- Latest compiled JavaScript -->
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	2. Advantage of CDN: If other users have downloaded when visiting another site, It is loaded from cache when they visit your site (faster load time).
		1. File is served from a server closest to us (faster load time)
	3. jQuery: Bootstrap uses jQuery for JavaScript plugins (modals, tooltips, ...)
		1. Not required when using only CSS part of jQuery

### First Web Page With Bootstrap ###
1. Add HTML5 doctype
	1. Bootstrap uses HTML elements and CSS properties that require HTML5 doctype
		1. Always include:
			1. `<!DOCTYPE html>`
			2. `<html lang="en">`
			3. `<meta charset="utf-8">`
2. Bootstrap 3 is mobile first
	1. Designed to be responsive to mobile devices
	2. For proper rendering and touch zooming add the following:

			<meta name="viewport" content="width=device-width,initial-scale=1">

		1. `width=device-width`: sets width of page to follow screen-width of device (varies with device)
		2. `initial-scale=1`: sets initial zoom level when page is first loaded by browser
3. Containers
	1. Bootstrap requires containing element to wrap site contents
		1. Two container classes:
			1. `.container`: provides responsive fixed width container
			2. `.container-fluid`: provides full width container (spanning entire width of viewport)
		2. Containers cannot be nested (no container inside container)

### Two Basic Bootstrap Pages ###

		<!DOCTYPE html>
		<html lang="en">
			<head>
				<title>Bootstrap Example</title>
				<meta charset="utf-8">
				<meta name="viewport" content="width=device-width,initial-scale=1">
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
				<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			</head>
			<body>
				<div class="container-fluid">
					<h1>My Bootstrap Page</h1>
					<p>This is some text.</p>
				</div>
			</body>
		</html>

## BS Grid Basic ##
### Bootstrap Grid System ###
1. Grid system allows upto 12 columns across page
2. Columns can be grouped into wider columns
3. Grid system is responsive and columns will re-arrange automatically depending on screen size

### Grid Classes ###
1. `xs`: for phones
2. `sm`: for tablets
3. `md`: for desktops
4. `lg`: for large desktops

### Basic Structure of a Bootstrap Grid ###
1. Basic structure:

		<div class="row">
			<div class="col-*-*"></div>
		</div>
		<div class="row">
			<div class="col-*-*"></div>
			<div class="col-*-*"></div>
			<div class="col-*-*"></div>
		</div>
		<div class="row">
			...
		</div>

	1. First start with row then add desired number of columns (with `.col-*-*` classes).
		1. Numbers in `.col-*-*` should always add up to 12 for each row

### Three Equal Columns ###
1. Starting with tablets and scaling to large desktops

		<div class="col-sm-4">.col-sm-4</div>
		<div class="col-sm-4">.col-sm-4</div>
		<div class="col-sm-4">.col-sm-4</div>

### Two Unequal Columns ###
1. Starting with tablets and scaling to large desktops

		<div class="row">
			<div class="col-sm-4">.col-sm-4</div>
			<div class="col-sm-8">.col-sm-8</div>
		</div>

## BS Typography ##
### Bootstrap's Default Settings ###
1. Global default font size: 14px
2. Line height: 1.428
	1. Applied to `<body>` and all `<p>`
3. All `<p>` have a bottom margin that is equal to 1/2 computed line height (10px by default)

### Bootstrap vs. Browser Defaults ###
1. Elements that are styled differently than browser defaults

### `<h1>` - `<h6>` ###

		<div class="container">
			<h1>h1 Bootstrap heading (36px)</h1>
			<h2>h2 Bootstrap heading (30px)</h2>
			<h3>h3 Bootstrap heading (24px)</h3>
			<h4>h4 Bootstrap heading (18px)</h4>
			<h5>h5 Bootstrap heading (14px)</h5>
			<h6>h6 Bootstrap heading (12px)</h6>
		</div>

### `<small>` ###
1. `<small>` is used to lighter secondary text in heading

		<div class="container">
			<h1>Lighter, Secondary Text</h1>
			<p>The small element is used for lighter, secondary text in any heading:</p>
			<h1>h1 heading <small>secondary text</small></h1>
			<h2>h2 heading <small>secondary text</small></h2>
			<h3>h3 heading <small>secondary text</small></h3>
			<h4>h4 heading <small>secondary text</small></h4>
			<h5>h5 heading <small>secondary text</small></h5>
			<h6>h6 heading <small>secondary text</small></h6>
		</div>

### `<mark>` ###
1. `<mark>` is automatically styled

		<div class="container">
			<h1>Highlight text</h1>
			<p>Use the mark element to <mark>highlight</mark> text.</p>
		</div>

### `<abbr>` ###
1. `<abbr>` is automatically styled

		<div class="container">
			<p>The <abbr title="World Health Organization">WHO</abbr> was founded in 1948</p>
		</div>

### `<blockquote>` ###
1. `<blockquote>` is automatically styled

		<div class="container">
			<blockquote>
				<p>For 50 years, WWF has been protecting the future of nature. The world's leading conservation organization, WWF works in 100 countries and is supported by 1.2 million members in the United States and close to 5 million globally.</p>
				<footer>From WWF's website</footer>
			</blockquote>
		</div>

2. `.blockquote-reverse`: shows blockquote on right

		<div class="container">
			<blockquote class="blockquote-reverse">
				<p>For 50 years, WWF has been protecting the future of nature. The world's leading conservation organization, WWF works in 100 countries and is supported by 1.2 million members in the United States and close to 5 million globally.</p>
				<footer>From WWF's website</footer>
			</blockquote>
		</div>

### `<dl>` ###

		<div class="container">
			<h1>Description Lists</h1>
			<p>The dl element indicates a description list:</p>
			<dl>
				<dt>Coffee</dt>
				<dd>- black hot drink</dd>
				<dt>Milk</dt>
				<dd>- white cold drink</dd>
			</dl>
		</div>

### `<code>` ###
1. `<code>`

		<div class="container">
			<h1>Code Snippets</h1>
			<p>Inline snippets of code should be embedded in the code element:</p>
			<p>The following HTML elements: <code>span</code>, <code>section</code>, and <code>div</code> defines a section in a document.</p>
		</div>

### `<kbd>` ###
1. `<kbd>` element

		<div class="container">
			<p>Use <kbd>ctrl + p</kbd> to open the Print dialog box.</p>
		</div>

### `<pre>` ###
1. `<pre>`: preserves spaces and line breaks

		<div class="container">
			<h1>Multiple Code Lines</h1>
			<p>For multiple lines of code, use the pre element:</p>
			<pre>
				Text in a pre element
				is displayed in a fixed-width
				font, and it preserves
				both      spaces and
				line breaks.
			</pre>
		</div>

### Contextual Colors and Backgrounds ###
1. Textual colors can be used to provide meaning through colors
	1. `.text-muted`
	2. `.text-primary`
	3. `.text-success`
	4. `.text-info`
	5. `.text-warning`
	6. `.text-danger`
2. For background colors:
	1. `.bg-primary`
	2. `.bg-success`
	3. `.bg-info`
	4. `.bg-warning`
	5. `.bg-danger`

### More Typography Classes ###
1. `.lead`: makes paragraph stand out
2. `.small`: indicates smaller text (85% of parent)
3. `.text-left`: indicates left aligned text
4. `.text-center`: indicates center-aligned text
5. `.text-right`: indicates right-aligned text
6. `.text-justify`: indicates justified text
7. `.text-nowrap`: indicates no wrap text
8. `.text-lowercase`: indicates lowercased text
9. `.text-uppercase`: indicates uppercased text
10. `.text-capitalize`: indicates capitalized text
11. `.initialism`: displays text in `<abbr>` element in slightly smaller font
12. `.list-unstyled`: Removes default list style and left margin on list items (for `<ul>` and `<ol>`)
	1. Applies to only immediate children list items (needs applying explicitly to nested lists)
13. `.list-inline`: places all list items in a single line
14. `.dl-horizontal`: lines up `<dt>` and `<dd>` in `<dl>` elements side-by-side
	1. Starts as default `<dl>` but lines up side by side when browser window expands
15. `.pre-scrollable`: Makes `<pre>` scrollable

### Complete Bootstrap Typography Reference ###
1. [Bootstrap Typography Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_css_text.asp)
2. [Bootstrap Helper Classes Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_css_helpers.asp)

## BS Tables ##
### Bootstrap Basic Table ###
1. Basic bootstrap table
	1. light padding and horizontal dividers
	2. `.table`: for basic styling

			<table class="table">
				<thead>
					<tr>
						<th>Firstname</th>
						<th>Lastname</th>
						<th>Email</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>John</td>
						<td>Doe</td>
						<td>john@example.com</td>
					</tr>
					<tr>
						<td>Mary</td>
						<td>Moe</td>
						<td>mary@example.com</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>july@example.com</td>
					</tr>
				</tbody>
			</table>

### Striped Rows ###
1. `.table-striped`: adds zebra stripes to table

		<table class="table table-striped">
			<thead>
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Email</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>John</td>
					<td>Doe</td>
					<td>john@example.com</td>
				</tr>
				<tr>
					<td>Mary</td>
					<td>Moe</td>
					<td>mary@example.com</td>
				</tr>
				<tr>
					<td>July</td>
					<td>Dooley</td>
					<td>july@example.com</td>
				</tr>
			</tbody>
		</table>

### Bordered Table ###
1. `.table-bordered`

		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Email</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>John</td>
					<td>Doe</td>
					<td>john@example.com</td>
				</tr>
				<tr>
					<td>Mary</td>
					<td>Moe</td>
					<td>mary@example.com</td>
				</tr>
				<tr>
					<td>July</td>
					<td>Dooley</td>
					<td>july@example.com</td>
				</tr>
			</tbody>
		</table>

### Hover Rows ###
1. `.table-hover`

		<table class="table table-hover">
			<thead>
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Email</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>John</td>
					<td>Doe</td>
					<td>john@example.com</td>
				</tr>
				<tr>
					<td>Mary</td>
					<td>Moe</td>
					<td>mary@example.com</td>
				</tr>
				<tr>
					<td>July</td>
					<td>Dooley</td>
					<td>july@example.com</td>
				</tr>
			</tbody>
		</table>

### Condensed Table ###
1. `.table-condensed`

		<table class="table table-condensed">
			<thead>
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Email</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>John</td>
					<td>Doe</td>
					<td>john@example.com</td>
				</tr>
				<tr>
					<td>Mary</td>
					<td>Moe</td>
					<td>mary@example.com</td>
				</tr>
				<tr>
					<td>July</td>
					<td>Dooley</td>
					<td>july@example.com</td>
				</tr>
			</tbody>
		</table>

### Contextual Classes ###
1. `success`
2. `danger`
3. `info`
4. `warning`
5. `active`

		<table class="table">
			<thead>
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Email</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Default</td>
					<td>Defaultson</td>
					<td>def@somemail.com</td>
				</tr>
				<tr class="success">
					<td>Success</td>
					<td>Doe</td>
					<td>john@example.com</td>
				</tr>
				<tr class="danger">
					<td>Danger</td>
					<td>Moe</td>
					<td>mary@example.com</td>
				</tr>
				<tr class="info">
					<td>Info</td>
					<td>Dooley</td>
					<td>july@example.com</td>
				</tr>
				<tr class="warning">
					<td>Warning</td>
					<td>Refs</td>
					<td>bo@example.com</td>
				</tr>
				<tr class="active">
					<td>Active</td>
					<td>Activeson</td>
					<td>act@example.com</td>
				</tr>
			</tbody>
		</table>

### Responsive Tables ###
1. `.table-responsive`:
	1. table scrolls horizontally on small devices (under 768px)
	2. No difference when viewed on larger devices (greater than 768px)

			<div class="table-responsive">
				<table class="table">
					...
				</table>
			</div>

### Complete Bootstrap Table Reference ###
1. [Bootstrap Tables Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_css_tables.asp)

## BS Images ##
### Bootstrap Image Shapes ###
1. Rounded corners
2. Circle
3. Thumbnail

### Rounded Corners ###
1. `.img-rounded` (not supported in IE8)

		<img src="https://www.w3schools.com/bootstrap/cinqueterre.jpg" class="img-rounded" alt="Cinque Terre" width="304" height="236">

### Circle ###
1. `.img-circle` (not supported in IE8)

		<img src="https://www.w3schools.com/bootstrap/cinqueterre.jpg" class="img-circle" alt="Cinque Terre" width="304" height="236">

### Thumbnail ###
1. `.img-thumbnail`

		<img src="https://www.w3schools.com/bootstrap/cinqueterre.jpg" class="img-thumbnail" alt="Cinque Terre" widht="304" height="236">

### Responsive Images ###
1. Responsive images adjust to fit the size of screen
2. Add `.img-responsive` to `<img>` (scales nicely to parent element)
	1. Applies `display: block;` and `max-width: 100%;` and `height: auto;`

			<img class="img-responsive" src="https://www.w3schools.com/bootstrap/img_chania.jpg" alt="Chania">

### Image Gallery ###
1. Use grid system with `.thumbnail` class for image gallery

		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="https://www.w3schools.com/w3images/lights.jpg">
						<img src="https://www.w3schools.com/w3images/lights.jpg" alt="Lights" style="width:100%">
						<div class="caption">
							<p>Lorem ipsum...</p>
						</div>
					</a>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="https://www.w3schools.com/w3images/nature.jpg">
						<img src="https://www.w3schools.com/w3images/nature.jpg" alt="Nature" style="width:100%">
						<div class="caption">
							<p>Lorem ipsum...</p>
						</div>
					</a>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="https://www.w3schools.com/bootstrap/w3images/fjords.jpg">
						<img src="https://www.w3schools.com/bootstrap/w3images/fjords.jpg" alt="Fjords" style="width:100%">
						<div class="caption">
							<p>Lorem ipsum...</p>
						</div>
					</a>
				</div>
			</div>
		</div>

### Responsive Embeds ###
1. Classes can be applied directly to `<iframe>`, `<embed>`, `<video>`, `<object>`
2. Example:

		<div class="embed-responsive embed-responsive-16by9">
			<iframe class="embed-responsive-item" src="...">
			</iframe>
		</div>

	1. `.embed-responsive-item`: for video to scale nicely to parent element.
	2. Containing `<div>` defines aspect ratio of the video
		1. aspect ratio: proportional relationship between width and height (4:3 (universal video format), 16:9 (HD tv and EU digital tv))
			1. Two aspect ratios can be chosen

					<!-- 16:9 aspect ratio -->
					<div class="embed-responsive embed-responsive-16by9">
						<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/XGSy3_Czz8k">
						</iframe>
					</div>

					<!-- 4:3 aspect ratio -->
					<div class="embed-responsive embed-responsive-4by3">
						<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/XGSy3_Czz8k">
						</iframe>
					</div>

### Complete Bootstrap Image Reference ###
1. [Bootstrap Image Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_css_images.asp)

## BS Jumbotron ##
### Creation of a Jumbotron ###
1. It is a big box for calling extra attention to special content or info
2. Displayed as grey box with rounded corners. Font size is also big
3. We can put any valid HTML inside
4. Syntax:

		<div class="jumbotron">

### Jumbotron Inside Container ###
1. Used if jumbotron must not exceed edge of screen.

		<div class="container">
			<div class="jumbotron">
				<h1>Bootstrap Tutorial</h1>
				<p>Bootstrap is the most popular HTML, CSS, and JS framework for developing responsive, mobile-first projects on the web.</p>
			</div>
			<p>This is some text.</p>
			<p>This is another text.</p>
		</div>

### Jumbotron Outside Container ###
1. Used if jumbotron has to extend to screen edges

		<div class="jumbotron">
			<h1>Bootstrap Tutorial</h1>
			<p>Bootstrap is the most popular HTML, CSS and JS framework for developing responsive, mobile-first projects on the web.</p>
		</div>
		<div class="container">
			<p>This is some text.</p>
			<p>This is another text.</p>
		</div>

### Creation of a Page Header ###
1. `.page-header` adds horizontal line under heading (+ extra space around element)

### Example Page Header ###

		<div class="page-header">
			<h1>Example Page Header</h1>
		</div>

## BS Wells ##
### Wells ###
1. `.well`: adds rounded border around element with gray background and some padding
2. Example:

		<div class="well">Basic Well</div>

### Well Size ###
1. `.well-sm`: small well
2. `.well-lg`: large well
3. Example:

		<div class="well well-sm">Small Well</div>
		<div class="well well-lg">Large Well</div>

## BS Alerts ##
### Alerts ###
1. `.alert` main class
2. `.alert-success`
3. `.alert-info`
4. `.alert-warning`
5. `.alert-danger`
6. Example:

		<div class="alert alert-success">
			<strong>Success!</strong> Indicates a successful or positive action.
		</div>

		<div class="alert alert-info">
			<strong>Info!</strong> Indicates a neutral informative change or action.
		</div>

		<div class="alert alert-warning">
			<strong>Warning!</strong> Indicates a warning that might need attention.
		</div>

		<div class="alert alert-danger">
			<strong>Danger!</strong> Indicates a dangerous or potentially negative action.
		</div>

### Alert Links ###
1. `alert-link`: used to add to `<a>` inside alert box (for matching colored links)
2. Example:

		<div class="alert alert-success">
			<strong>Success!</strong> You should <a href="#" class="alert-link">read this message</a>.
		</div>

### Closing Alerts ###
1. `.alert-dismissable`: add it to alert container
2. `class="close"` and `data-dismiss="alert"`: add to link or button element
3. Example:

		<div class="alert alert-success alert-dismissable">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<strong>Success!</strong> Indicates a successful or positive action.
		</div>

	1. `aria-label="close"`: to improve accessibility for people using screen readers
	2. `&times;`: icon for close buttons

### Animated Alerts ###
1. `.fade`, `.in`: add fading effect when closing alert message

		<div class="alert alert-danger fade in">

### Complete Bootstrap Alert Reference ###
1. [Bootstrap JS Alert Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_js_alert.asp)

## BS Buttons ##
### Button Styles ###
1. `.btn`
2. `.btn-default`
3. `.btn-primary`
4. `.btn-success`
5. `.btn-info`
6. `.btn-warning`
7. `.btn-danger`
8. `.btn-link`
9. Example:

		<button type="button" class="btn">Basic</button>
		<button type="button" class="btn btn-default">Default</button>
		<button type="button" class="btn btn-primary">Primary</button>
		<button type="button" class="btn btn-success">Success</button>
		<button type="button" class="btn btn-info">Info</button>
		<button type="button" class="btn btn-warning">Warning</button>
		<button type="button" class="btn btn-danger">Danger</button>
		<button type="button" class="btn btn-link">Link</button>

10. `<a>`, `<button>`, `<input>` can have the above classes
	1. Example:

			<a href="#" class="btn btn-info" role="button">Link Button</a>
			<button type="button" class="btn btn-info">Button</button>
			<input type="button" class="btn btn-info" value="Input Button">
			<input type="submit" class="btn btn-info" value="Submit Button">

		1. `#`: avoids 404 message

### Button Sizes ###
1. `.btn-lg`
2. `.btn-md`
3. `.btn-sm`
4. `.btn-xs`
5. Example:

		<button type="button" class="btn btn-primary btn-lg">Large</button>
		<button type="button" class="btn btn-primary btn-md">Medium</button>
		<button type="button" class="btn btn-primary btn-sm">Small</button>
		<button type="button" class="btn btn-primary btn-xs">XSmall</button>

### Block Level Buttons ###
1. Spans entire width of parent element
	1. `.btn-block`

			<button type="button" class="btn btn-primary btn-block">Button 1</button>

### Active/Disabled Buttons ###
1. `.active`: makes button appear pressed
2. `.disabled`: makes button unclickable
3. Example:

		<button type="button" class="btn btn-primary active">Active Primary</button>
		<button type="button" class="btn btn-primary disabled">Disabled Primary</button>

### Complete Bootstrap Button Reference ###
1. [Bootstrap Button Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_css_buttons.asp)

## BS Button Groups ##
### Button Groups ###
1. Buttons can be grouped on a single line
2. `.btn-group` class must be added to `<div>`

		<div class="btn-group">
			<button type="button" class="btn btn-primary">Apple</button>
			<button type="button" class="btn btn-primary">Samsung</button>
			<button type="button" class="btn btn-primary">Sony</button>
		</div>

3. `.btn-group-lg|sm|xs`: sizes all buttons in the group

		<div class="btn-group btn-group-lg">
			<button type="button" class="btn btn-primary">Apple</button>
			<button type="button" class="btn btn-primary">Samsung</button>
			<button type="button" class="btn btn-primary">Sony</button>
		</div>

### Vertical Button Groups ###
1. `.btn-group-vertical`
2. Example:

		<div class="btn-group-vertical">
			<button type="button" class="btn btn-primary">Apple</button>
			<button type="button" class="btn btn-primary">Samsung</button>
			<button type="button" class="btn btn-primary">Sony</button>
		</div>

### Justified Button Groups ###
1. `.btn-group-justified`
2. Example:

		<div class="btn-group btn-group-justified">
			<a href="#" class="btn btn-primary">Apple</a>
			<a href="#" class="btn btn-primary">Samsung</a>
			<a href="#" class="btn btn-primary">Sony</a>
		</div>

3. For button, wrap each `<button>` with `.btn-group`

		<div class="btn-group btn-group-justified">
			<div class="btn-group">
				<button type="button" class="btn btn-primary">Apple</button>
			</div>
			<div class="btn-group">
				<button type="button" class="btn btn-primary">Samsung</button>
			</div>
			<div class="btn-group">
				<button type="button" class="btn btn-primary">Sony</button>
			</div>
		</div>

### Nesting Button Groups & Dropdown Menus ###
1. For dropdown menus

		<div class="btn-group">
			<button type="button" class="btn btn-primary">Apple</button>
			<button type="button" class="btn btn-primary">Samsung</button>
			<div class="btn-group">
				<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
					Sony <span class="caret"></span></button>
				<ul class="dropdown-menu" role="menu">
					<li><a href="#">Tablet</a></li>
					<li><a href="#">Smartphone</a></li>
				</ul>
			</div>
		</div>

### Split Button Dropdowns ###
1. Example:

		<div class="btn-group">
			<button type="button" class="btn btn-primary">Sony</button>
			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#">Tablet</a></li>
				<li><a href="#">Smartphone</a></li>
			</ul>
		</div>

## BS Glyphicons ##
### Glyphicons ###
1. There are 260 glyphicons: [Glyphicons](http://glyphicons.com/)
2. Can be used in text, buttons, toolbars, navigation, forms, ...
3. Examples:
	1. Envelope glyphicon
	2. Print glyphicon
	3. Search glyphicon
	4. Download glyphicon

### Glyphicon Syntax ###
1. Syntax:

		<span class="glyphicon glyphicon-<name>"></span>

### Glyphicon Example ###
1. Example:

		<p>Envelope icon: <span class="glyphicon glyphicon-envelope"></span></p>
		<p>Envelope icon as a link:
			<a href="#"><span class="glyphicon glyphicon-envelope"></span></a>
		</p>
		<p>Search icon: <span class="glyphicon glyphicon-search"></span></p>
		<p>Search icon on a button:
			<button type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-search"></span>
			</button>
		</p>
		<p>Search icon on a styled button:
			<button type="button" class="btn btn-info">
				<span class="glyphicon glyphicon-search"></span>
			</button>
		</p>
		<p>Print icon: <span class="glyphicon glyphicon-print"></span></p>
		<p>Print icon on a styled link button:
			<a href="#" class="btn btn-success btn-lg">
				<span class="glyphicon glyphicon-print"></span>
			</a>
		</p>

### Complete Bootstrap Glyphicon Reference ###
1. [Bootstrap Glyphicon Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_comp_glyphs.asp)

## BS Badges/ Labels ##
### Badges ###
1. Numerical indicators for how many items are associated with a link
2. `.badge` class must be added to `<span>`

		<a href="#">News <span class=".badge">5</span></a><br>
		<a href="#">Comments <span class=".badge">10</span></a><br>
		<a href="#">Updates <span class=".badge">2</span></a>

3. Badges can be used inside other elements:

		<button type="button" class="btn btn-primary">Primary <span class="badge">7</span></button>

### Labels ###
1. Provide additional info about something:
2. Label classes inside `<span>`:
	1. `.label`
		1. `.label-default`
		2. `.label-primary`
		3. `.label-info`
		4. `.label-success`
		5. `.label-warning`
		6. `.label-danger`
3. Example:

		<h1>Example <span class="label label-default">New</span></h1>
		<h2>Example <span class="label label-default">New</span></h2>
		<h3>Example <span class="label label-default">New</span></h3>
		<h4>Example <span class="label label-default">New</span></h4>
		<h5>Example <span class="label label-default">New</span></h5>
		<h6>Example <span class="label label-default">New</span></h6>

## BS Progress Bars ##
### Basic Progress Bar ###
1. To show progress of a process
2. `.progress`: for default progress bar
	1. Add it to `<div>`

			<div class="progress">
				<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:70%">
					<span class="sr-only">70% Complete</span>
				</div>
			</div>

		1. `aria-*`: used to improve accessibility for people using screen readers

### Progress Bar With Label ###
1. Remove `.sr-only`

		<div class="progress">
			<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:70%">
				70%
			</div>
		</div>

### Colored Progress Bars ###
1. `.progress-bar-success`
2. `.progress-bar-info`
3. `.progress-bar-warning`
4. `.progress-bar-danger`
5. Example:

		<div class="progress">
			<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
				40% Complete (success)
			</div>
		</div>

		<div class="progress">
			<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:50%">
				50% Complete (info)
			</div>
		</div>

		<div class="progress">
			<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:60%">
				60% Complete (warning)
			</div>
		</div>

		<div class="progress">
			<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:70%">
				70% Complete (danger)
			</div>
		</div>

### Striped Progress Bars ###

		<div class="progress">
			<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
				40% Complete (success)
			</div>
		</div>

		<div class="progress">
			<div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:50%">
				50% Complete (info)
			</div>
		</div>

		<div class="progress">
			<div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:60%">
				60% Complete (warning)
			</div>
		</div>

		<div class="progress">
			<div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:70%">
				70% Complete (danger)
			</div>
		</div>

### Animated Progress Bar ###
1. `.active`

		<div class="progress">
			<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
				40%
			</div>
		</div>

### Stacked Progress Bars ###
1. Place multiple bars into same `<div class="progress">`
2. Example:

		<div class="progress">
			<div class="progress-bar progress-bar-success" role="progresssbar" style="width:40%">
				Free Space
			</div>
			<div class="progress-bar progress-bar-warning" role="progressbar" style="width:10%">
				Warning
			</div>
			<div class="progress-bar progress-bar-danger" role="progressbar" style="width:20%">
				Danger
			</div>
		</div>

## BS Pagination ##
### Basic Pagination ###
1. Adding pagination to each page
2. Example:

		<ul class="pagination">
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>

### Active State ###
1. `.active`

		<ul class="pagination">
			<li><a href="#">1</a></li>
			<li class="active"><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>

### Disabled State ###
1. `.disabled` (disables a link)
2. Example:

		<ul class="pagination">
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li class="disabled"><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>

### Pagination Sizing ###
1. `.pagination-lg`
2. `.pagination-sm`
3. Example:

		<ul class="pagination pagination-lg">
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>
	
		<ul class="pagination pagination-sm">
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>

### Breadcrumbs ###
1. `.breadcrumb`

		<ul class="breadcrumb">
			<li><a href="#">Home</a></li>
			<li><a href="#">Private</a></li>
			<li><a href="#">Pictures</a></li>
			<li class="active">Vacation</li>
		</ul>

### Complete Bootstrap Navigation Reference ###
1. [Bootstrap Navigation Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_comp_navs.asp)

## BS Pager ##
### What is Pager? ###
1. Provides previous and next buttons
2. Add `.pager` to `<ul>` element

		<ul class="pager">
			<li><a href="#">Previous</a></li>
			<li><a href="#">Next</a></li>
		</ul>

### Align Buttons ###
1. `.previous`: aligns button to left side of the page
2. `.next`: aligns button to right side of the page
3. Example:

		<ul class="pager">
			<li class="previous"><a href="#">Previous</a></li>
			<li class="next"><a href="#">Next</a></li>
		</ul>

### Complete Bootstrap Navigation Reference ###
1. [Bootstrap Navigation Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_comp_navs.asp)

## BS List Groups ##
### Basic List Groups ###
1. Basic list group: Unordered list with list items
	1. Use `<ul>` with `.list-group` and `<li>` elements with class `.list-group-item`
		1. Example:

				<ul class="list-group">
					<li class="list-group-item">First item</li>
					<li class="list-group-item">Second item</li>
					<li class="list-group-item">Third item</li>
				</ul>

### List Group With Badges ###
1. Badges are positioned to the right automatically
	1. Add `.badge` to a `<span>` inside list item

			<ul class="list-group">
				<li class="list-group-item">New <span class="badge">12</span></li>
				<li class="list-group-item">Deleted <span class="badge">5</span></li>
				<li class="list-group-item">Warnings <span class="badge">3</span></li>
			</ul>

### List Group With Linked Items ###
1. Adds grey background color on hover
2. Use `<div>` instead of `<ul>` and `<a>` instead of `<li>`:
	1. Example:

			<div class="list-group">
				<a href="#" class="list-group-item">First item</a>
				<a href="#" class="list-group-item">Second item</a>
				<a href="#" class="list-group-item">Third item</a>
			</div>

### Active State ###
1. Use `.active` to highlight current item
	1. Example:

			<div class="list-group">
				<a href="#" class="list-group-item active">First item</a>
				<a href="#" class="list-group-item">Second item</a>
				<a href="#" class="list-group-item">Third item</a>
			</div>

### Disabled Item ###
1. Use `.disabled` to disable current item
	1. Example:

			<div class="list-group">
				<a href="#" class="list-group-item disabled">First item</a>
				<a href="#" class="list-group-item">Second item</a>
				<a href="#" class="list-group-item">Third item</a>
			</div>

### Contextual Classes ###
1. Classes:
	1. `.list-group-item-success`
	2. `.list-group-item-info`
	3. `.list-group-item-warning`
	4. `.list-group-item-danger`
2. Example:

		<ul class="list-group">
			<li class="list-group-item list-group-item-success">First item</li>
			<li class="list-group-item list-group-item-info">Second item</li>
			<li class="list-group-item list-group-item-warning">Third item</li>
			<li class="list-group-item list-group-item-danger">Fourth item</li>
		</ul>

### Custom Content ###
1. Classes:
	1. `.list-group-item-heading`
	2. `.list-group-item-text`
2. Example:

		<div class="list-group">
			<a href="#" class="list-group-item active">
				<h4 class="list-group-item-heading">First List Group Item Heading</h4>
				<p class="list-group-item-text">List Group Item Text</p>
			</a>
			<a href="#" class="list-group-item">
				<h4 class="list-group-item-heading">Second List Group Item Heading</h4>
				<p class="list-group-item-text">List Group Item Text</p>
			</a>
			<a href="#" class="list-group-item">
				<h4 class="list-group-item-heading">Third List Group Item Heading</h4>
				<p class="list-group-item-text">List Group Item Text</p>
			</a>
		</div>

## BS Panels ##
### Panels ###
1. Panel: bordered box with some padding around its content
2. `.panel`
	1. `.panel-body`

			<div class="panel panel-default">
				<div class="panel-body">A Basic Panel</div>
			</div>

### Panel Heading ###
1. `.panel-heading`: adds heading to panel
2. Example:

		<div class="panel panel-default">
			<div class="panel-heading">Panel Heading</div>
			<div class="panel-body">Panel Content</div>
		</div>

### Panel Footer ###
1. `.panel-footer`: adds footer to panel
2. Example:

		<div class="panel panel-default">
			<div class="panel-body">Panel Content</div>
			<div class="panel-footer">Panel Footer</div>
		</div>

### Panel Group ###
1. Group panels by wrapping them with `<div class="panel-group">`
	1. `.panel-group`: clears bottom margin of each panel
2. Example:

		<div class="panel-group">
			<div class="panel panel-default">
				<div class="panel-body">Panel Content</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-body">Panel Content</div>
			</div>
		</div>

### Panel with Contextual Classes ###
1. Used for coloring the panels:
	1. `.panel-default`
	2. `.panel-primary`
	3. `.panel-success`
	4. `.panel-info`
	5. `.panel-warning`
	6. `.panel-danger`
2. Example:

		<div class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">Panel with panel-default class</div>
				<div class="panel-body">Panel Content</div>
			</div>
			<div class="panel panel-primary">
				<div class="panel-heading">Panel with panel-primary class</div>
				<div class="panel-body">Panel Content</div>
			</div>
			<div class="panel panel-success">
				<div class="panel-heading">Panel with panel-success class</div>
				<div class="panel-body">Panel Content</div>
			</div>
			<div class="panel panel-warning">
				<div class="panel-heading">Panel with panel-warning class</div>
				<div class="panel-body">Panel Content</div>
			</div>
			<div class="panel panel-danger">
				<div class="panel-heading">Panel with panel-danger class</div>
				<div class="panel-body">Panel Content</div>
			</div>
		</div>

## BS Dropdowns ##
### Basic Dropdown ###
1. Allows user to select one value from a pre-defined list
2. Example:

		<div class="dropdown">
			<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Dropdown Example <span class="caret"></span></button>
			<ul class="dropdown-menu">
				<li><a href="#">HTML</a></li>
				<li><a href="#">CSS</a></li>
				<li><a href="#">JavaScript</a></li>
			</ul>
		</div>

#### Example Explained ####
1. `.dropdown`: indicates dropdown menu
2. `.dropdown-toggle` and `data-toggle="dropdown"`: used with button or link to open dropdown menu
3. `.caret`: displays a caret icon
4. `.dropdown-menu`: added to `<ul>` to build the menu

### Dropdown Divider ###
1. `.divider`: separates links in dropdown menu with a thin horizontal border
2. Example:

		<li class="divider"></li>

### Dropdown Header ###
1. `.dropdown-header`: Adds header inside dropdown menu
2. Example:

		<li class="dropdown-header">Dropdown header 1</li>

### Disable and Active Items ###
1. `.active`: highlights an item (with blue background color)
2. `.disabled`: disables an item (gets light-grey color and "no-parking-sign" icon on hover)
3. Example:

		<li class="disabled"><a href="#">CSS</a></li>
		<li class="active"><a href="#">HTML</a></li>

### Dropdown Position ###
1. `.dropdown-menu-right`
2. Example:

		<ul class="dropdown-menu dropdown-menu-right">

### Dropup ###
1. Change `<div>` element with `class="dropdown"` to `class="dropup"`
2. Example:

		<div class="dropup">

### Dropdown Accessibility ###
1. To improve accessibility for people using screen readers, include `role`, `aria-*`
2. Example:

		<div class="dropdown">
			<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Tutorials <span class="caret"></span></button>
			<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
				<li role="presentation"><a role="menuitem" href="#">HTML</a></li>
				<li role="presentation"><a role="menuitem" href="#">CSS</a></li>
				<li role="presentation"><a role="menuitem" href="#">JavaScript</a></li>
				<li role="presentation" class="divider"></li>
				<li role="presentation"><a role="menuitem" href="#">About Us</a></li>
			</ul>
		</div>

### Complete Bootstrap Dropdown Reference ###
1. [Bootstrap JS Dropdown Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_js_dropdown.asp)

## BS Collapse ##
### Basic Collapsible ###
1. Used to hide or show large amount of contents
2. Example:

		<button data-toggle="collapse" data-target="#demo">Collapsible</button>
		<div id="demo" class="collapse">
			Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
		</div>

#### Example Explained ####
1. `.collapse`: indicates collapsible element
	1. content that is hidden or shown with click
2. `data-toggle="collapse"`: to control (show/hide)
	1. Add it to `<a>` or `<button>`
3. `data-target="#id"`: connects button with collapsible content (`<div id="demo">`)
	1. For `<a>` use `href` instead of `data-target`

			<a href="#demo" data-toggle="collapse" class="btn btn-info">Collapsible</a>

			<div id="demo" class="collapse">
				Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
			</div>

4. Use `.in` class to show content by default

		<div id="demo" class="collapse in">
			Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
		</div>

### Collapsible Panel ###
1. Example:

		<div class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" href="#collapse1">Collapsible panel</a>
					</h4>
				</div>
				<div id="collapse1" class="panel-collapse collapse">
					<div class="panel-body">Panel body</div>
					<div class="panel-footer">Panel Footer</div>
				</div>
			</div>
		</div>

### Collapsible List Group ###
1. Example:

		<div class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" href="#collapse1">Collapsible list group</a>
					</h4>
				</div>
				<div id="collapse1" class="panel-collapse collapse">
					<ul class="list-group">
						<li class="list-group-item">One</li>
						<li class="list-group-item">Two</li>
						<li class="list-group-item">Three</li>
					</ul>
					<div class="panel-footer">Footer</div>
				</div>
			</div>
		</div>

### Accordion ###
1. `data-parent`: all collapsible elements under specified parent will be closed when on of the collapsible item is shown
2. Example:

		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Collapsible Group 1</a>
					</h4>
				</div>
				<div id="collapse1" class="panel-collapse collapse in">
					<div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Collapsible Group 2</a>
					</h4>
				</div>
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Collapsible Group 3</a>
					</h4>
				</div>
				<div id="collapse3" class="panel-collapse collapse">
					<div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse4">Collapsible Group 4</a>
					</h4>
				</div>
				<div id="collapse4" class="panel-collapse collapse">
					<div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
				</div>
			</div>

### Complete Bootstrap Collapse Reference ###
1. [Bootstrap JS Collapse Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_js_collapse.asp)

## BS Tabs/Pills ##
### Menus ###
1. Defined as unordered list `<ul>`

		<ul>
			<li><a href="#">Home</a></li>
			<li><a href="#">Menu 1</a></li>
			<li><a href="#">Menu 2</a></li>
			<li><a href="#">Menu 3</a></li>
		</ul>

2. Add `.list-inline` to `<ul>` for horizontal menu

		<ul class="list-inline">

### Tabs ###
1. `<ul class="nav nav-tabs">`
2. `<li class="active">`: used to mark current page
3. Example:

		<ul class="nav nav-tabs">
			<li class="active"><a href="#">Home</a></li>
			<li><a href="#">Menu 1</a></li>
			<li><a href="#">Menu 2</a></li>
			<li><a href="#">Menu 3</a></li>
		</ul>

### Tabs With Dropdown Menu ###
1. Example:

		<ul class="nav nav-tabs">
			<li class="active"><a href="#">Home</a></li>
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">Menu 1 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">Submenu 1-1</a></li>
					<li><a href="#">Submenu 1-2</a></li>
					<li><a href="#">Submenu 1-3</a></li>
				</ul>
			</li>
			<li><a href="#">Menu 2</a></li>
			<li><a href="#">Menu 3</a></li>
		</ul>

### Pills ###
1. `<ul class="nav nav-pills">`
2. `<li class="active">`: marks current page
3. Example:

		<ul class="nav nav-pills">
			<li class="active"><a href="#">Home</a></li>
			<li><a href="#">Menu 1</a></li>
			<li><a href="#">Menu 2</a></li>
			<li><a href="#">Menu 3</a></li>
		</ul>

### Vertical Pills ###
1. Add `.nav-stacked` to `<ul>`
2. Example:

		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="#">Home</a></li>
			<li><a href="#">Menu 1</a></li>
			<li><a href="#">Menu 2</a></li>
			<li><a href="#">Menu 3</a></li>
		</ul>

### Vertical Pills in a Row ###
1. Displaying vertical pill menu on the right on large screen and in single column in small screen
2. Example:

		<div class="col-md-3">
			<ul class="nav nav-pills nav-stacked">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#">Menu 1</a></li>
				<li><a href="#">Menu 2</a></li>
				<li><a href="#">Menu 3</a></li>
			</ul>
		</div>

### Pills With Dropdown Menu ###
1. Example:

		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="#">Home</a></li>
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">Menu 1 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">Submenu 1-1</a></li>
					<li><a href="#">Submenu 1-2</a></li>
					<li><a href="#">Submenu 1-3</a></li>
				</ul>
			</li>
			<li><a href="#">Menu 2</a></li>
			<li><a href="#">Menu 3</a></li>
		</ul>

### Centered Tabs and Pills ###
1. To center/justify tabs and pills use `.nav-justified`
	1. List items are stacked for screens less than 768px
2. Example: Centered tabs

		<!-- Centered Tabs -->
		<ul class="nav nav-tabs nav-justified">
			<li class="active"><a href="#">Home</a></li>
			<li><a href="#">Menu 1</a></li>
			<li><a href="#">Menu 2</a></li>
			<li><a href="#">Menu 3</a></li>
		</ul>

		<!-- Centered Pills -->
		<ul class="nav nav-pills nav-justified">
			<li class="active"><a href="#">Home</a></li>
			<li><a href="#">Menu 1</a></li>
			<li><a href="#">Menu 2</a></li>
			<li><a href="#">Menu 3</a></li>
		</ul>

### Toggleable / Dynamic Tabs ###
1. Add `data-toggle="tab"` to each link
2. Add `.tab-pane` class with a unique ID for every tab and wrap them inside `<div>` with class `.tab-content`
3. If we want them to fade in and out, add `.fade` class to `.tab-pane`
4. Example:

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">Home</a></li>
			<li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
			<li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<h3>HOME</h3>
				<p>Some content.</p>
			</div>
			<div id="menu1" class="tab-pane fade">
				<h3>Menu 1</h3>
				<p>Some content in menu 1.</p>
			</div>
			<div id="menu2" class="tab-pane fade">
				<h3>Menu 2</h3>
				<p>Some content in menu 2.</p>
			</div>
		</div>

### Toggleable / Dynamic Pills ###
1. Change to `data-toggle="pill"`
2. Example:

		<ul class="nav nav-pills">
			<li class="active"><a data-toggle="pill" href="#home">Home</a></li>
			<li><a data-toggle="pill" href="#menu1">Menu 1</a></li>
			<li><a data-toggle="pill" href="#menu2">Menu 2</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<h3>HOME</h3>
				<p>Some content.</p>
			</div>
			<div id="menu1" class="tab-pane fade">
				<h3>Menu 1</h3>
				<p>Some content in menu 1.</p>
			</div>
			<div id="menu2" class="tab-pane fade">
				<h3>Menu 2</h3>
				<p>Some content in menu 2.</p>
			</div>
		</div>

### Complete Bootstrap Navigation Reference ###
1. [Bootstrap Navigation Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_comp_navs.asp)
2. [Bootstrap JS Tab Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_js_tab.asp)

## BS Navbar ##
### Navigation Bars ###
1. It is navigation header placed at the top of the page
2. It can expand or collapse (depends on screen size)
3. `<nav class="navbar navbar-default">`
4. Example:

		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">WebSiteName</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">Page 1</a></li>
					<li><a href="#">Page 2</a></li>
					<li><a href="#">Page 3</a></li>
				</ul>
			</div>
		</nav>

	1. A navigation bar can expand or collapse based on screen size.
	2. `<nav class="navbar navbar-default">`: it is for standard navigation bar

### Inverted Navigation Bar ###
1. It is a black navigation bar
	1. Change `.navbar-default` to `.navbar-inverse`
2. Example: Adding a navbar to the top of the page

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">WebSiteName</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">Page 1</a></li>
					<li><a href="#">Page 2</a></li>
					<li><a href="#">Page 3</a></li>
				</ul>
			</div>
		</nav>

### Navigation Bar With Dropdown ###
1. Navigation bars can hold dropdown menus
2. Example:

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">WebSiteName</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li>
						<a class="dropdown" data-toggle="dropdown" href=#>Page 1 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Page 1-1</a></li>
							<li><a href="#">Page 1-2</a></li>
							<li><a href="#">Page 1-3</a></li>
						</ul>
					</li>
					<li><a href="#">Page 2</a></li>
					<li><a href="#">Page 3</a></li>
				</ul>
			</div>
		</nav>

### Right-Aligned Navigation Bar ###
1. `.navbar-right`: to right align navigation bar buttons
2. Example:

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">WebSiteName</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">Page 1</a></li>
					<li><a href="#">Page 2</a></li>
					<li><a href="#">Page 3</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</ul>
			</div>
		</nav>

### Navbar Buttons ###
1. Add `.navbar-btn` on button
2. Example:

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">WebSiteName</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">Link</a></li>
					<li><a href="#">Link</a></li>
				</ul>
				<button class="btn btn-danger navbar-btn">Button</button>
			</div>
		</nav>

### Navbar Forms ###
1. `.navbar-form` adds form inside navigation bar
	1. `.navbar-left`
2. `.form-group`: added to `<div>` container input(s)
	1. Adds proper padding if we have multiple inputs
3. Example:

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">WebSiteName</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">Page 1</a></li>
					<li><a href="#">Page 2</a></li>
				</ul>
				<form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
		</nav>

4. Use `.input-group` and `.input-group-addon` to attach an icon or help text to input field
	1. Example:

			<form class="navbar-form navbar-left">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>

### Navbar Text ###
1. `.navbar-text` aligns any element vertically inside navbar that are not links (for proper padding and text color)
2. Example:

		<nav class="navbar navbar-inverse">
			<ul class="nav navbar-nav">
				<li><a href="#">Link</a></li>
				<li><a href="#">Link</a></li>
			</ul>
			<p class="navbar-text">Some text</p>
		</nav>

### Fixed Navigation Bar ###
1. Navbar can be fixed at the top or bottom of the page
2. `.navbar-fixed-top`: fixed at the top
3. Example:

		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">WebSiteName</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">Page 1</a></li>
					<li><a href="#">Page 2</a></li>
					<li><a href="#">Page 3</a></li>
				</ul>
			</div>
		</nav>

4. `.navbar-fixed-bottom`: makes navbar stay at the bottom
5. Example:

		<nav class="navbar navbar-inverse navbar-fixed-bottom">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">WebSiteName</a>
				</div>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#">Page 1</a></li>
				<li><a href="#">Page 2</a></li>
				<li><a href="#">Page 3</a></li>
			</ul>
		</nav>

### Collapsing The Navigation Bar ###
1. We should hide navigation bar on small screens and show it on big screens
	1. Replace navbar with button on top right corner (navbar is displayed when button is clicked)
2. Example:

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">WebSiteName</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#">Page 1</a></li>
						<li><a href="#">Page 2</a></li>
						<li><a href="#">Page 3</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
						<li><a href="#"><span class="glyphiocn glyphicon-log-in"></span> Login</a></li>
					</ul>
				</div>
			</div>
		</nav>

## BS Forms ##
### Bootstrap's Default Settings ###
1. Form controls receive global styling with Bootstrap
2. `<input>`, `<textarea>`, `<select>` elements with class `.form-control` have width of 100%

### Bootstrap Form Layouts ###
1. Three types of form layouts
	1. Vertical form (default)
	2. Horizontal form
	3. Inline form
2. Standard rules for all three form layouts
	1. Wrap labels and form controls in `<div class="form-group">` (for optimum spacing)
	2. Add class `.form-control` to all text `<input>`, `<textarea>`, and `<select>` elements

### Bootstrap Vertical Form (default) ###
1. Example: Vertical form

		<form>
			<div class="form-group">
				<label for="email">Email address:</label>
				<input type="email" class="form-control" id="email">
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label>
				<input type="password" class="form-control" id="pwd">
			</div>
			<div class="checkbox">
				<label><input type="checkbox"> Remember me</label>
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>

### Bootstrap Inline Form ###
1. All elements are inline, left aligned and labels are alongside
	1. For viewports of atleast 768px wide
2. Additional rule:
	1. Add `.form-inline` to `<form>`

### Bootstrap Horizontal Form ###

## BS Inputs ##
### Supported Form Controls ###
### Bootstrap Input ###
### Bootstrap Textarea ###
### Bootstrap Checkboxes ###
### Bootstrap Radio Buttons ###
### Bootstrap Select List ###

## BS Inputs 2 ##
### Static Control ###
### Bootstrap Input Groups ###
### Bootstrap Form Control States ###

## BS Input Sizing ##
### Input Sizing in Forms ###
### Height Sizing ###
### Column Sizing ###
### Help Text ###

## BS Media Objects ##
### Media Objects ###
### Basic Media Object ###
#### Example Explained ####
### Top, Middle or Bottom Alignment ###
### Nested Media Objects ###
### Another Example of Nesting ###

## BS Carousel ##
### The Carousel Plugin ###
### Carousel Example ###
### How To Build a Carousel ###
#### Example Explained ####
### Add Captions to Slides ###
### Complete Bootstrap Carousel Reference ###

## BS Modal ##
### The Modal Plugin ###
### How to Build a Modal ###
#### Example Explained ####
### Modal Size ###
### Complete Bootstrap Modal Reference ### 

## BS Tooltip ##
### The Tooltip Plugin ###
### How To Build a Tooltip ###
### Positioning Tooltips ###
### Complete Bootstrap Tooltip Reference ###

## BS Popover ##
### The Popover Plugin ###
### How To Build a Popover ###
### Positioning Popovers ###
### Closing Popovers ###
### Complete Bootstrap Popover Reference ###

## BS Scrollspy ##
### The Scrollspy Plugin ###
### How To Build a Scrollspy ###
#### Example Explained ####
### Scrollspy Vertical Menu ###
### Complete Bootstrap Scrollspy Reference ###

## BS Affix ##
### The Affix Plugin ###
### How To Build an Affixed Navigation Menu ###
#### Example Explained ####
### Scrollspy & Affix ###
### Complete Bootstrap Affix Reference ###

## Bootstrap Grids ##
### BS Grid System ###
#### Bootstrap Grid System ####
#### Grid Classes ####
#### Grid System Rules ####
#### Basic Structure of a Bootstrap Grid ####
#### Grid Options ####
#### Examples ####

### BS Stacked/ Horizontal ###
#### Bootstrap Grid Example: Stacked-to-horizontal ####

### BS Grid Small ###
#### Bootstrap Grid Example: Small Devices ####

### BS Grid Medium ###
#### Bootstrap Grid Example: Medium Devices ####
#### Using Only Medium ####

### BS Grid Large ###
#### Bootstrap Grid Example: Large Devices ####
#### Using Only Large ###

### BS Grid Examples ###
#### Threee Equal Columns ####
#### Three Unequal Columns ####
#### Two Unequal Columns ####
#### Two Columns With Two Nested Columns ####
#### Mixed: Mobile And Desktop ####
#### Mixed: Mobile, Tablet And Desktop ####
#### Clear Floats ####
#### Offsetting Columns ####
#### Push And Pull - Change Column Ordering ####

## Bootstrap Themes ##
### BS Templates ###
#### W3Schools' Bootstrap Templates ####

### BS Theme "Simply Me" ###
#### Creation of a Theme: "Simply Me" ####
#### HTML Start Page ####
#### Add Bootstrap CDN and Put Elements in Container ####
#### Add Background Color and Center Text ####
#### Circle Image ####
#### More Content ####
#### Add Padding ####
#### Add a Button ####
#### Add an Icon ####
#### Modify The Third Container (Add Grid) ####
#### Make The Images Responsive ####
#### Add a Navbar ####
#### Style The Navbar ####
#### Add a Footer ####
#### Final Touch ####
#### Complete "Simply Me" Theme ####

### BS Theme "Company" ###
#### Creation of a Theme: "Company" ####
#### Add Bootstrap CDN and Add a Jumbotron ####
#### Add Background Color and Center Text ####
#### Add Form ####
#### Add Containers ####
#### Add Padding ####
#### Add a Grid ####
#### Add Services Container ####
#### Styling Icons ####
#### Add Portfolio Container ####
#### Styling Thumbmail Images ####
#### Add a Carousel ####
#### Style The Carousel ####
#### Add Pricing Container ####
#### Styling Panels ####
#### Add Contact Container ####
#### Add Google Maps ####
#### Add a Navbar ####
#### Style The Navbar ####
#### Add Scrollspy ####
#### Add a Footer ####
#### Adding Smooth Scrolling ####
#### Final Touch ####
##### Slide In Elements #####
#### Complete "Company" Theme ####

### BS Theme "Band" ###
#### Creation of a Theme: "The Band" ####
#### HTML Start Page ####
#### Add Bootstrap CDN and Add a Container ####
#### Center Text ####
#### Add Padding ####
#### Add a Grid ####
#### Circle Image ####
#### Collapsibles ####
#### Add a Carousel ####
#### Style The Carousel ####
#### Add Tour Container ####
#### Add Labels & Badges ####
#### Add Thumbnail Images ####
#### Style Lists, Thumbnails & Buttons ####
#### Add a Modal ####
#### Add Contact Container ####
#### Add Toggable Tabs ####
#### Google Maps ####
#### Add a Navbar ####
#### Style The Navbar ####
#### Add Scrollspy ####
#### Add a Footer ####
#### Adding Smooth Scrolling ####
#### Final Touch ####
#### Complete "The Band" Theme ####