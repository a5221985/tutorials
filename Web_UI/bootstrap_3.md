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
3. Example:

		<form class="form-inline">
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

### Bootstrap Horizontal Form ###
1. Labels are aligned next to input field (on large or medium screens).
	1. It is a vertical form on small screens (labels appear on top of each input)
2. Additional rules:
	1. Add class `.form-horizontal` to `<form>`
	2. Add class `.control-label` to all `<label>`s
3. We can use grid classes to align labels and groups of form controls in horizontal layout
4. Example:

		<form class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">Email:</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="email" placeholder="Enter email">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Password:</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="pwd" placeholder="Enter password">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<label><input type="checkbox"> Remember me</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Submit</button>
				</div>
			</div>
		</form>

## BS Inputs ##
### Supported Form Controls ###
1. Form controls supported
	1. `input`
	2. `textarea`
	3. `checkbox`
	4. `radio`
	5. `select`

### Bootstrap Input ###
1. All HTML5 input types are supported:
	1. `text`
	2. `password`
	3. `email`
	4. `url`
	5. `search`
	6. `tel`
	7. `color`
2. Example:

		<div class="form-group">
			<label for="usr">Name:</label>
			<input type="text" class="form-control" id="usr">
		</div>
		<div class="form-group">
			<label for="pwd">Password:</label>
			<input type="password" class="form-control" id="pwd">
		</div>

### Bootstrap Textarea ###
1. Example:

		<div class="form-group">
			<label for="comment">Comment:</label>
			<textarea class="form-control" rows="5" id="comment"></textarea>
		</div>

### Bootstrap Checkboxes ###
1. Used to select any number of options from given options.
2. Example:

		<div class="checkbox">
			<label><input type="checkbox" value="">Option 1</label>
		</div>
		<div class="checkbox">
			<label><input type="checkbox" value="">Option 2</label>
		</div>
		<div class="checkbox disabled">
			<label><input type="checkbox" value="" disabled>Option 3</label>
		</div>

3. Use `.checkbox-inline` for making checkboxes appear on same line

		<label class="checkbox-inline">
			<input type="checkbox" value="">Option 1
		</label>
		<label class="checkbox-inline">
			<input type="checkbox" value="">Option 2
		</label>
		<label class="checkbox-inline">
			<input type="checkbox" value="">Option 3
		</label>

### Bootstrap Radio Buttons ###
1. Example:

		<div class="radio">
			<label><input type="radio" name="optradio">Option 1</label>
		</div>
		<div class="radio">
			<label><input type="radio" name="optradio">Option 2</label>
		</div>
		<div class="radio disabled">
			<label><input type="radio" name="optradio" disabled>option 3</label>
		</div>

2. `.radio-inline`: if you want radio buttons to appear inline

		<label class="radio-inline"><input type="radio" name="optradio">Option 1</input></label>
		<label class="radio-inline"><input type="radio" name="optradio">Option 2</input></label>
		<label class="radio-inline"><input type="radio" name="optradio">Option 3</input></label>

### Bootstrap Select List ###
1. Options:
	1. Select one
	2. Multiple select
2. Example:

		<div class="form-group">
			<label for="sel1">Select list:</label>
			<select class="form-control" id="sel1">
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
			</select>
			<label for="sel2">Multiple select list (hold shift to select more than one):</label>
			<select multiple class="form-control" id="sel2">
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
			</select>
		</div>

## BS Inputs 2 ##
### Static Control ###
1. To insert plain text next to form label in horizontal form, use `.form-control-static` in `<p>`
2. Example:

		<form class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">Email:</label>
				<div class="col-sm-10">
					<p class="form-control-static">someone@example.com</p>
				</div>
			</div>
		</form>

### Bootstrap Input Groups ###
1. `.input-group`: it is a container to enhance input by adding an icon, text or button in from or behind it as a "help text"
2. `.input-group-addon`: attaches icon or help text to input field
3. Example:

		<form>
			<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i><span>
				<input id="email" type="text" class="form-control" name="email" placeholder="Email">
			</div>
			<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
				<input id="password" type="password" class="form-control" name="password" placeholder="Password">
			</div>
			<div class="input-group">
				<span class="input-group-addon">Text</span>
				<input id="msg" type="text" class="form-control" name="msg" placeholder="Additional info">
			</div>
		</form>

4. `.input-group-btn`: attaches button next to input. (used with search)
5. Example:

		<form>
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search">
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</form>

### Bootstrap Form Control States ###
1. **INPUT FOCUS**: Outline of input is removed and box-shadow is applied on focus
2. **DISABLED INPUTS**: Add a `disabled` attribute to disable an input field
3. **DISABLED FIELDSETS**: Add a `disabled` attribute to a fieldset to disable all controls within
4. **READONLY INPUTS**: Add a `readonly` attribute to an input to prevent user input
5. **VALIDATION STATES**: Bootstrap includes validation styles for error, warning, success messages. To use, add `.has-warning`, `.has-error`, or `.has-success` to parent element
6. **ICONS**: Add feedback icons with `.has-feedback` class and an icon
7. **HIDDEN LABELS**: `.sr-only` on non-visible labels
8. Example:

		<form class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">Focuses</label>
				<div class="col-sm-10">
					<input class="form-control" id="focusedInput" type="text" value="Click to focus">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">Disabled</label>
				<div class="col-sm-10">
					<input class="form-control" id="disabledInput" type="text" disabled>
				</div>
			</div>
			<fieldset disabled>
				<div class="form-group">
					<label for="disabledTextInput" class="col-sm-2 control-label">Fieldset disabled</label>
					<div class="col-sm-10">
						<input type="text" id="disabledTextInput" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="disabledSelect" class="col-sm-2 control-label"></label>
					<div class="col-sm-10">
						<select id="disabledSelect" class="form-control">
							<option>Disabled select</option>
						</select>
					</div>
				</div>
			</fieldset>
			<div class="form-group has-success has-feedback">
				<label class="col-sm-2 control-label" for="inputSuccess">Input with success and icon</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputSuccess">
					<span class="glyphicon glyphicon-ok form-control-feedback"></span>
				</div>
			</div>
			<div class="form-group has-warning has-feedback">
				<label class="col-sm-2 control-label" for="inputWarning">
					Input with warning and icon
				</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputWarning">
					<span class="glyphicon glyphicon-warning-sign form-control-feedback"></span>
				</div>
			</div>
			<div class="form-group has-error has-feedback">
				<label class="col-sm-2 control-label" for="inputError">Input with error and icon</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputError">
					<span class="glyphicon glyphicon-remove form-control-feedback"></span>
				</div>
			</div>
		</form>

9. Inline form:

		<form class="form-inline">
			<div class="form-group">
				<label for="focusedInput">Focused</label>
				<input class="form-control" id="focusedInput" type="text">
			</div>
			<div class="form-group">
				<label for="inputPassword">Disabled</label>
				<input class="form-control" id="disabledInput" type="text" disabled>
			</div>
			<div class="form-group has-success has-feedback">
				<label class="inputSuccess2">Input with success</label>
				<input type="text" class="form-control" id="inputSuccess2">
				<span class="glyphicon glyphicon-ok form-control-feedback"></span>
			</div>
			<div class="form-group has-warning has-feedback">
				<label for="inputWarning2">Input with warning</label>
				<input type="text" class="form-control" id="inputWarning2">
				<span class="glyphicon glyphicon-warning-sign form-control-feedback"></span>
			</div>
			<div class="form-group has-error has-feedback">
				<label for="inputError2">Input with error</label>
				<input type="text" class="form-control" id="inputError2">
				<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			</div>
		</form>

## BS Input Sizing ##
### Input Sizing in Forms ###
1. `.input-lg`: large height
2. `.input-sm`: small height
3. `.col-lg-*`: large width
4. `.col-sm-*`: small width

### Height Sizing ###
1. Example:

		<form>
			<div class="form-group">
				<label for="inputsm">Small input</label>
				<input class="form-control input-sm" id="inputsm" type="text">
			</div>
			<div class="form-group">
				<label for="inputdefault">Default input</label>
				<input class="form-control" id="inputdefault" type="text">
			</div>
			<div class="form-group">
				<label for="inputlg">Large input</label>
				<input class="form-control input-lg" id="inputlg" type="text">
			</div>
		</form>

2. For sizing labels and form controls:
	1. Add `.form-group-*` to `<div class="form-group">`
		1. Example: `<div class="form-group form-group-lg">`
3. Sizing inputs:
	1. Add `.input-group-*` to `<div class="input-group">`
		1. Example: `<div class="input-group input-group-lg">`

### Column Sizing ###
1. `.col-xs-*`
2. Example:

		<div class="form-group row">
			<div class="col-xs-2">
				<label for="ex1">col-xs-2</label>
				<input class="form-control" id="ex1" type="text">
			</div>
			<div class="col-xs-3">
				<label for="ex2">col-xs-3</label>
				<input class="form-control" id="ex2" type="text">
			</div>
			<div class="col-xs-4">
				<label for="ex3">col-xs-4</label>
				<input class="form-control" id="ex3" type="text">
			</div>
		</div>

### Help Text ###
1. `.help-block`: adds block level help text in forms
2. Example:

		<div class="form-group">
			<label for="pwd">Password:</label>
			<input type="password" class="form-control" id="pwd" placeholder="Enter password">
			<span class="help-block">This is some help text...</span>
		</div>

## BS Media Objects ##

### Media Objects ###
1. BS can align media objects to left or right of content.
	1. For blog comments, tweets, ...

### Basic Media Object ###
1. Example:

		<!-- Left-aligned -->
		<div class="media">
			<div class="media-left">
				<img src="img_avatar1.png" class="media-object" style="width: 60px">
			</div>
			<div class="media-body">
				<h4 class="media-heading">John Doe</h4>
				<p>Lorem ipsum...</p>
			</div>
		</div>

		<!-- Right-aligned -->
		<div class="media">
			<div class="media-body">
				<h4 class="media-heading">John Doe</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
			<div class="media-right">
				<img class="img_avatar1.png" class="media-object" style="width: 60px">
			</div>
		</div>

#### Example Explained ####
1. `<div>` with `.media`: container for media objects
2. `.media-left`: aligns media object to the left
3. `.media-right`: aligns media object to the right
4. `<div>` with `.media-body`: contains text that must appear next to the image
5. `.media-heading`: for headings

### Top, Middle or Bottom Alignment ###
1. `.media-top`: top aligns media object
2. `.media-middle`: middle aligns media object
3. `.media-bottom`: bottom aligns media object
4. Example:

		<!-- Media top -->
		<div class="media">
			<div class="media-left media-top">
				<img src="img_avatar1.png" class="media-object" style="width: 60px">
			</div>
			<div class="media-body">
				<h4 class="media-heading">Media Top</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
		</div>

		<!-- Media middle -->
		<div class="media">
			<div class="media-left media-middle">
				<img class="media-object" src="avatar1.png" style="width: 60px">
			</div>
			<div class="media-body">
				<h4 class="media-heading">Media Middle</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
		</div>

		<!-- Media bottom -->
		<div class="media">
			<div class="media-left media-bottom">
				<img class="media-object" src="avatar1.png" style="width: 60px">
			</div>
			<div class="media-body">
				<h4 class="media-heading">Media Bottom</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
		</div>

### Nested Media Objects ###
1. Example:

		<div class="media">
			<div class="media-left">
				<img class="media-object" src="https://www.w3schools.com/bootstrap/img_avatar1.png" style="width: 60px">
			</div>
			<div class="media-body">
				<h4 class="media-heading">John Doe <small><i>Posted on July 04, 2017</i></small></h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
				<div class="media">
					<div class="media-left">
						<img class="media-object" src="https://www.w3schools.com/bootstrap/img_avatar2.png" style="width: 60px">
					</div>
					<div class="media-body">
						<h4 class="media-heading">John Doe <small><i>Posted on July 04, 2017</i></small></h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
						<div class="media">
							<div class="media-left">
								<img class="media-object" src="https://www.w3schools.com/bootstrap/img_avatar3.png" style="width: 60px">
							</div>
							<div class="media-body">
								<h4 class="media-heading">John Doe <small><i>Posted on July 04, 2017</i></small></h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

### Another Example of Nesting ###
1. Similar

## BS Carousel ##
### The Carousel Plugin ###
1. Component for cycling through elements
2. To include the plugin, use individual `carousel.js` or `bootstrap.min.js`

### Carousel Example ###
1. Not supported in browser `<=` IE-9

### How To Build a Carousel ###
1. Example:

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="la.jpg" alt="Los Angeles" style="width: 100%">
				</div>

				<div class="item">
					<img src="chicago.jpg" alt="Chicago" style="width: 100%">
				</div>

				<div class="item">
					<img src="ny.jpg" alt="New York" style="width: 100%">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

#### Example Explained ####
1. `id="myCarousel"`: id needed for controls to function properly
2. `class="carousel"`: tells that the `<div>` contains a carousel
3. `.slide`: adds CSS transition and animation effect
4. `data-ride="carousel"`: tells bootstrap to begin animation as soon as page loads
5. Indicators: little dots at the bottom of each slide
	1. `.carousel-indicators`: added to `<ol>`
	2. `data-target`: points to id of carousel
	3. `data-slide-to`: specifies which slide to go to when a dot is clicked
6. Wrapper for slides:
	1. Slides are specified in `<div>` with class `.carousel-inner`
	2. Content of each slide is defined in a `<div>` with class `.item`
		1. Can be text or image
	3. `.active` added to one of the slides
7. The "Left and right controls" part:
	1. Left and right buttons are added
	2. `data-slide`: `"prev"` or `"next"` - alter slide position relative to current position

### Add Captions to Slides ###
1. Add `<div class="carousel-caption">` in each `<div class="item">` for captions to each slide
2. Example:

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="la.jpg" alt="Chania">
					<div class="carousel-caption">
						<h3>Los Angeles</h3>
						<p>LA is always so much fun!</p>
					</div>
				</div>

				<div class="item">
					<img src="chicago.jpg" alt="Chicago">
					<div class="carousel-caption">
						<h3>Chicago</h3>
						<p>Thank you, Chicago!</p>
					</div>
				</div>

				<div class="item">
					<img src="ny.jpg" alt="New York">
					<div class="carousel-caption">
						<h3>New York</h3>
						<p>We love the Big Apple!</p>
					</div>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

### Complete Bootstrap Carousel Reference ###
1. [Bootstrap JS Carousel Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_js_carousel.asp)

## BS Modal ##
### The Modal Plugin ###
1. Modal plugin: dialog box/popup window displayed on top of current page
2. Can be included using individual "modal.js" or using "bootstrap.min.js"

### How to Build a Modal ###
1. Example:

		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

		<!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				
				<!-- Modal content -->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Modal Header</h4>
					</div>
					<div class="modal-body">
						<p>Some text in the modal.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>

#### Example Explained ####
1. Trigger part:
	1. Include `data-toggle="modal"` - opens modal window
	2. Include `data-target="#myModal"` - points to the id of modal
2. Modal part:
	1. Parent `<div>` of modal must have ID that is same as value of `data-target` attribute
	2. `.modal`: identifies content of `<div>` as modal and brings focus to it
	3. `.fade`: adds transition effect which fades modal in and out
	4. `role="dialog"`: improves accessibility for people using screen readers
	5. `.modal-dialog`: sets proper width and margin of the modal
3. Modal content part:
	1. `<div>` with `class="modal-content"` styles the modal (border, background-color, ...)
		1. Add modal's header, body and footer in it
	2. `.modal-header`: Defines style for header of modal
		1. `<button>` in it has `data-dismiss="modal"`: closes modal if you click on it.
	3. `.close`: styles close button
	4. `.modal-title`: styles header with proper line-height
	5. `.modal-body`: defines style for body of modal
		1. Can contain any markup
	6. `.modal-footer`: defines style for footer of modal

### Modal Size ###
1. Modal size can be changed by adding `.modal-sm` or `.modal-lg`
	1. Add it to `<div>` with class `.modal-dialog`
	2. Exmaple: `<div class="modal-dialog modal-sm">`
	2. Example: `<div class="modal-diaolog modal-lg">`

### Complete Bootstrap Modal Reference ###
1. [Bootstrap JS Modal Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_js_modal.asp)

## BS Tooltip ##
### The Tooltip Plugin ###
1. Small popup box that appears when user moves mouse pointer over an element
2. Can be included individually using "tooltip.js" or at once using "bootstrap.min.js"

### How To Build a Tooltip ###
1. Add `data-toggle="tooltip"` to an element
2. Add `title` containing text to display in tooltip
3. Example:

		<a href="#" data-toggle="tooltip" title="Hooray!">Hover over me</a>

4. Initialize tooltips with jQuery:
	1. Select the element and call `tooltip()` method
	2. Example:

			<script>
				$(document).ready(function () {
					$('[data-toggle="tooltip"]').tooltip();
				});
			</script>

### Positioning Tooltips ###
1. `data-placement` can be used to set position of tooltip (top, bottom, left, right)
2. Example: 

		<a href="#" data-toggle="tooltip" data-placement="top" title="Hooray!">Hover</a>
		<a href="#" data-toggle="tooltip" data-placement="bottom" title="Hooray!">Hover</a>
		<a href="#" data-toggle="tooltip" data-placement="left" title="Hooray!">Hover</a>
		<a href="#" data-toggle="tooltip" data-placement="right" title="Hooray!">Hover</a>

3. `data-placement="auto"`: browser decides the position
	1. Exmaple: `auto left`: displays on left when possible, or on the right

### Complete Bootstrap Tooltip Reference ###
1. [Bootstrap JS Tooltip Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_js_tooltip.asp)

## BS Popover ##
### The Popover Plugin ###
1. Similar to tooltip. pop-up box that appears when user clicks on element.
2. It can contain more content than tooltip
3. Include "popover.js" or "bootstrap.min.js"

### How To Build a Popover ###
1. Add `data-toggle="popover"` to an element
2. Add `title` to specify header text of popover
3. Add `data-content` to specify body text of popover
4. Example:

		<a href="#" data-toggle="popover" title="Popover Header" data-content="Some content inside the popover">Toggle popover</a>

5. Initialize with jQuery by selecting element and calling `popover()` method on it.
	1. Example:

			<script>
				$(document).ready(function () {
					$('[data-toggle="popover"]').popover();
				});
			</script>

### Positioning Popovers ###
1. Use `data-placement` to set position of popover on top, bottom, left or right side
2. Example:

		<a href="#" title="Header" data-toggle="popover" data-content="Content" data-placement="top">Click</a>
		<a href="#" title="Header" data-toggle="popover" data-content="Content" data-placement="bottom">Click</a>
		<a href="#" title="Header" data-toggle="popover" data-content="Content" data-placement="left">Click</a>
		<a href="#" title="Header" data-toggle="popover" data-content="Content" data-placement="right">Click</a>

3. `data-placement="auto"`: lets browser decide the position of popover
	1. Example: `auto left` - popover will display on left side when possible otherwise on right

### Closing Popovers ###
1. `data-trigger="focus"`: closes popover when clicking outside the element
2. Example:

		<a href="#" title="Dismissible popover" data-toggle="popover" data-trigger="focus" data-content="Click anywhere in the document to close this popover">Click me</a>

3. `data-trigger="hover"` - popover is displayed when you move mouse over element

### Complete Bootstrap Popover Reference ###
1. [Bootstrap JS Popover Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_js_popover.asp)

## BS Scrollspy ##
### The Scrollspy Plugin ###
1. Used to update links in navigation list based on scroll position

### How To Build a Scrollspy ###
1. Example:

		<style>
			body {
				position: relative;
			}
			#section1 { padding-top: 50px; height: 500px; color: #fff; background-color: #1E88E5; }
			#section2 { padding-top: 50px; height: 500px; color: #fff; background-color: #673ab7; }
			#section3 { padding-top: 50px; height: 500px; color: #fff; background-color: #ff9800; }
			#section41 { padding-top: 50px; height: 500px; color: #fff; background-color: #00bcd4; }
			#section42 { padding-top: 50px; height: 500px; color: #fff; background-color: #009688; }
		</style>
		...
		<!-- The scrollable area -->
		<body data-spy="scroll" data-target=".navbar" data-offset="50">
			<!-- The navbar - The <a> elements are used to jump to a section in the scrollable area -->
			<nav class="navbar navbar-inverse navbar-fixed-top">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">WebSiteName</a>
					</div>
					<div>
						<div class="collapse navbar-collapse" id="myNavbar">
							<ul class="nav navbar-nav">
								<li><a href="#section1">Section 1</a></li>
								<li><a href="#section2">Section 2</a></li>
								<li><a href="#section3">Section 3</a></li>
								<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Section 4 <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="#section41">Section 4-1</a></li>
										<li><a href="#section42">Section 4-2</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</nav>
			<div id="section1" class="container-fluid">
				<h1>Section 1</h1>
				<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
				<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
			</div>
			<div id="section2" class="container-fluid">
				<h1>Section 2</h1>
				<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
				<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
			</div>
			<div id="section3" class="container-fluid">
				<h1>Section 3</h1>
				<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
				<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
			</div>
			<div id="section41" class="container-fluid">
				<h1>Section 4 Submenu 1</h1>
				<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
				<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
			</div>
			<div id="section42" class="container-fluid">
				<h1>Section 4 Submenu 2</h1>
				<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
				<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
			</div>
		</body>

#### Example Explained ####
1. Add `data-spy="scroll"` to scrollable area (oftend in `<body>`)
2. Add `data-target` with value equal to id or class name of navigation bar (`.navbar`)
	1. Navbar gets connected to scrollable area
3. Scrollable elements must match ID of links inside navbar's list items (`<div id="section1">` matches `<a href="#section1">`)
4. `data-offset` specifies number of pixels to offset from top when calculating the position of scroll.
	1. To avoid changing links in navbar too soon when jumping to scrollable elements (Default is 10 pixels)
5. `data-spy` requires `position` property set to `relative` for the element to work properly

### Scrollspy Vertical Menu ###
1. Example:

		<style>
			body {
				position: relative;
			}
			ul.nav-pills {
				top: 20px;
				position: fixed;
			}
			div.col-sm-9 div {
				height: 250px;
				font-size: 28px;
			}
			#section1 {color: #fff; background-color: #1E88E5;}
			#section2 {color: #fff; background-color: #673ab7;}
			#section3 {color: #fff; background-color: #ff9800;}
			#section41 {color: #fff; background-color: #00bcd4;}
			#section42 {color: #fff; background-color: #009688;}
			@media screen and (max-width: 810px) {
				#section1, #section2, #section3, #section41, #section42  {
					margin-left: 150px;
				}
			}
		</style>
		...
		<body data-spy="scroll" data-target="#myScrollSpy" data-offset="20">
			<div class="container">
				<div class="row">
					<nav class="col-sm-3" id="myScrollspy">
						<ul class="nav nav-pills nav-stacked">
							<li><a href="#section1">Section 1</a></li>
							...
						</ul>
					</nav>
					<div class="col-sm-9">
						<div id="section1">
							<h1>Section 1</h1>
							<p>Try to scroll this page and look at the navigation list while scrolling!</p>
						</div>
						...
					</div>
				</div>
			</div>
		</body>

### Complete Bootstrap Scrollspy Reference ###
1. [Bootstrap JS Scrollspy Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_js_scrollspy.asp)

## BS Affix ##
### The Affix Plugin ###
1. Allows an element to become affixed (locked) to an area on the page.
	1. Example: Navigation menus, social icons (they stick at a specific area while scrolling up and down the page)
2. Plugin toggles the behavior on and off
	1. changes the value of `position` from `static` to `fixed` depending on scroll position

### How To Build an Affixed Navigation Menu ###
1. Example:

		<nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="197">

2. Full Example:

		<!DOCTYPE html>
		<html>
			<head>
				<title>Bootstrap Example</title>
				<meta charset="utf-8">
				<meta name="viewport" content="width=device-width, intitial-scale=1">
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
				<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
				<style>
					/* Note: Try to remove the following lines to see the effect of CSS positioning */
					.affix {
						top: 0;
						width: 100%;
					}

					.affix + .container-fluid {
						padding-top: 70px;
					}
				</style>
			</head>
			<body>
				<div class="container-fluid" style="background-color:#F44336;color:#fff;height:200px;">
					<h1>Bootstrap Affix Example</h1>
					<h3>Fixed (sticky) navbar on scroll</h3>
					<p>Scroll this page to see how the navbar behaves with data-spy="affix".</p>
					<p>The navbar is attached to the top of the page after you have scrolled a specified amount of pixels.</p>
				</div>

				<nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="197">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">Basic Topnav</a></li>
						<li><a href="#">Page 1</a></li>
						<li><a href="#">Page 2</a></li>
						<li><a href="#">Page 3</a></li>
					</ul>
				</nav>

				<div class="container-fluid" style="height:1000px">
					<h1>Some text to enable scrolling</h1>
					<h1>Some text to enable scrolling</h1>
					<h1>Some text to enable scrolling</h1>
					<h1>Some text to enable scrolling</h1>
					<h1>Some text to enable scrolling</h1>
					<h1>Some text to enable scrolling</h1>
					<h1>Some text to enable scrolling</h1>
					<h1>Some text to enable scrolling</h1>
					<h1>Some text to enable scrolling</h1>
					<h1>Some text to enable scrolling</h1>
					<h1>Some text to enable scrolling</h1>
				</div>
			</body>
		</html>

3. Vertical affixed navigation menu

		<!DOCTYPE html>
		<html lang="en">
			<head>
				<title>Bootstrap Example</title>
				<meta charset="utf-8">
				<meta name="viewport" content="width=device-width, initial-scale=1">
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
				<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
				<style>
				/* Note: Try to remove the following lines to see the effect of CSS positioning */
				.affix {
					top: 20px;
				}
				</style>
			</head>
			<body>
				<div class="container-fluid" style="background-color:#2196F3;color:#fff;height:200px;">
					<h1>Bootstrap Affix Example</h1>
					<h3>Fixed (sticky) vertical sidenav on scroll</h3>
					<p>Scroll this page to see how the left navigation menu behaves with data-spy="affix".</p>
					<p><strong>The left menu sticks to the page when you have scrolled a specified amount of pixels.</strong></p>
				</div>

				<div class="containder">
					<div class="row">
						<nav class="col-sm-3">
							<ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="205">
								<li class="active"><a href="#section1">Section 1</a></li>
								<li><a href="#section2">Section 2</a></li>
								<li><a href="#section3">Section 3</a></li>
							</ul>
						</nav>
						<div class="col-sm-9">
							<h1>Some text to enable scrolling</h1>
							<h1>Some text to enable scrolling</h1>
							<h1>Some text to enable scrolling</h1>
							<h1>Some text to enable scrolling</h1>
							<h1>Some text to enable scrolling</h1>
							<h1>Some text to enable scrolling</h1>
							<h1>Some text to enable scrolling</h1>
							<h1>Some text to enable scrolling</h1>
							<h1>Some text to enable scrolling</h1>
							<h1>Some text to enable scrolling</h1>
							<h1>Some text to enable scrolling</h1>
							<h1>Some text to enable scrolling</h1>
							<h1>Some text to enable scrolling</h1>
							<h1>Some text to enable scrolling</h1>
							<h1>Some text to enable scrolling</h1>
							<h1>Some text to enable scrolling</h1>
						</div>
					</div>
				</div>
			</body>
		</html>

#### Example Explained ####
1. `data-spy="affix"` - added to element we want affixed
2. `data-offset-top|bottom` - optional, to calculate position of scroll

##### How it works #####
1. Affix plugin toggles between three classes: `.affix`, `.affix-top` and `.affix-bottom`
	1. Each class represents a particular state
	2. Add CSS properties to handle actual positions (exception: `position:fixed`) on `.affix`
		1. Plugin adds `.affix-top` and `.affix-bottom` to indidicate element is in top-most or bottom-most position. (CSS is not required at this point)
		2. Scrolling past affixed element triggers actual affixing - At this point, plugin replaced `.affix-top` or `.affix-bottom` with `.affix` class (sets `position:fixed`)
			1. At this point we must add CSS `top` or `bottom` property to position the affixed element in the page
		3. If bottom offset is defined, scrolling past it replaced `.affix` class with `.affix-bottom`
			1. Offset is optional. If set it requires CSS property `position:absolute` when necessary
2. Example explained:
	1. Affix plugin adds `.affix` class `position:fixed` to `<nav>` when we have scrolled 197 pixels from the top.
		1. `top` is set to `0` to `.affix` - Makes navbar stay at the top of the page at all time when we scrolled 197 pixels from the top

### Scrollspy & Affix ###
1. Using Affix plugin with [Scrollspy](https://www.w3schools.com/bootstrap/bootstrap_scrollspy.asp) plugin
2. [Example](https://www.w3schools.com/bootstrap/tryit.asp?filename=trybs_scrollspy_affix&stacked=h)

		<body data-spy="scroll" data-target=".navbar" data-offset="50">

			<nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="197">
			...
			</nav>
			...
		</body>

3. [Example](https://www.w3schools.com/bootstrap/tryit.asp?filename=trybs_scrollspy_affix2&stacked=h)

		<body data-spy="scroll" data-target="#myScrollspy" data-offset="15">

			<nav class="col-sm-3" id="myScrollspy">
				<ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="205">
				...
			</nav>
			...
		</body>

### Complete Bootstrap Affix Reference ###
1. [Bootstrap JS Affix Reference](https://www.w3schools.com/bootstrap/bootstrap_ref_js_affix.asp)

## Bootstrap Grids ##
### BS Grid System ###

#### Bootstrap Grid System ####
1. Allows upto 12 columns across the page
2. We can group columns for wider columns
3. Bootstrap's grid system is responsive (columns will re-arrange depending on screen size)
	1. Bigger screens may have 3 columns
	2. Smaller screens may have columns stacked on top of each other
4. Grid columns should add upto 12, if `>` 12, columns will stack irrespective of the viewport

#### Grid Classes ####
1. 4 Classes
	1. xs (for phones)
	2. sm (for tablets)
	3. md (for desktops)
	4. lg (for large desktops)
2. Each class scales up - if we want to set same widths for xs and sm, specify only xs

#### Grid System Rules ####
1. Rules
	1. Rows must be placed within `.container` (fixed-width) or `.container-fluid` (full-width) for proper alignment and padding
	2. Rows must be created for horizontal groups of columns
	3. Content should be placed in columns and only columns must be immediate children of rows
	4. Predefined classes like `.row` and `.col-sm-4` are available for quickly making grid layouts
	5. Columns contain gutters (gaps between column content) via padding. Padding is offset in rows for first and last column via negative margin on `.rows`
	6. Grid columns are created by specifying number of 12 available columns we wish to span.
		1. `.col-sm-4` is used for tree equal columns

#### Basic Structure of a Bootstrap Grid ####
1. Structure:

		<div class="container">
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
		</div>

2. First container must be created: `<div class="container">`
3. A row must be created: `<div class="row">`
4. Columns must be added: tags with `.col-*-*` (numbers in them should add upto 12)

#### Grid Options ####
1. Extra small devices Phones (`<768px`): Grid behavior - Horizontal at all times, Container width - None (auto), Class prefix - `.col-xs-`, Number of columns - `12`, column width - Auto, Gutter width - 30px (15px on each side of a column), Nestable - Yes, Offsets - Yes, Column ordering - Yes
2. Small devices Tables (`>=768px`): Grid behavior - Collapsed to start, horizontal above breakpoints, Container width - 750px, Class prefix - `.col-sm-`, Number of columns - 12, Column width - `~62px`, Gutter width - 30px (15px on each side of a column), Nestable - Yes, Offsets - Yes, Column ordering - Yes
3. Medium devices Desktops (`>=992px`): Grid behavior - Collapsed to start, horizontal above breakpoints, Container width - 970px, Class prefix - `.col-md-`, Number of columns - 12, Column width - `~81px`, Gutter width - 30px (15px on each side of a column), Nestable - Yes, Offset - Yes, Column ordering - Yes
4. Large devices Desktops (`>=1200px`): Grid behavior - Collapsed to start, horizontal above breakpoints, Container width - 1170px, Class prefix - `.col-lg-`, Number of columns - 12, Column width - `~97px`, Gutter width - 30px (15px on each side of a column), Nestable - Yes, Offsets - Yes, Column ordering - Yes

#### Examples ####
1. [Stacked-to-horizontal](https://www.w3schools.com/bootstrap/bootstrap_grid_stacked_to_horizontal.asp)
2. [Small devices](https://www.w3schools.com/bootstrap/bootstrap_grid_small.asp)
3. [Medium devices](https://www.w3schools.com/bootstrap/bootstrap_grid_medium.asp)
4. [Large devices](https://www.w3schools.com/bootstrap/bootstrap_grid_large.asp)

### BS Stacked/ Horizontal ###
#### Bootstrap Grid Example: Stacked-to-horizontal ####
1. Basic grid system that starts out stacked on mobiles/tablets (small devices) before becoming horizontal on desktops (medium/large devices)
2. Example: `col-sm-6` - Two column layout which will result in 50%/50% split on all screens except for extra small screens which it will automatically stack (100%)

		<div class="container">
			<h1>Hello World!</h1>
			<div class="row">
				<div class="col-sm-6" style="background-color:yellow;">
					<p>Lorem ipsum...</p>
				</div>
				<div class="col-sm-6" style="background-color:pink;">
					<p>Sed ut perpiciatis...</p>
				</div>
			</div>
		</div>

3. Numbers in `.col-sm-*` indicate the number of columns div should span (out of 12)
4. To change fixed width layout to full width layout by changing `.container` to `.container-fluid`
5. Fluid container:

		<div class="container-fluid">
			<h1>Hello World!</h1>
			<div class="row">
				<div class="col-sm-6" style="background-color:yellow;">
					<p>Lorem ipsum...</p>
				</div>
				<div class="col-sm-6" style="background-color:pink;">
					<p>Sed ut perspiciatis...</p>
				</div>
			</div>
		</div>

### BS Grid Small ###
#### Bootstrap Grid Example: Small Devices ####
1. For columns to be 25% and 75% for small devices (768 pixels to 991 pixels)
2. Use `.col-sm-*`
	1. At small size, look for classes with `-sm-` in then and use those
	2. Split on small (and medium and large) devices and stack on extra small devices
3. Example:

		<div class="container-fluid">
			<h1>Hello World!</h1>
			<div class="row">
				<div class="col-sm-3" style="background-color:yellow;">
					<p>Lorem ipsum...</p>
				</div>
			</div>
			<div class="col-sm-9" style="background-color:pink;">
				<p>Sed ut perspiciatis...</p>
			</div>
		</div>

### BS Grid Medium ###
#### Bootstrap Grid Example: Medium Devices ####
1. For a 50%/50% split
2. They have screen width from 992 pixels to 1199 pixels
3. We must use `.col-md-*` classes
4. Example:

		<div class="col-sm-3 col-md-6">...</div>
		<div class="col-sm-9 col-md-6">...</div>

	1. For small size, look at classes with `-sm-` and use those.
	2. For medium size, look at classes with `-md-` and use those.

#### Using Only Medium ####
1. Only `-md-`

		<div class="col-md-6">...</div>
		<div class="col-md-6">...</div>

### BS Grid Large ###
#### Bootstrap Grid Example: Large Devices ####
1. Large devices have screen width from 1200 pixels and above
2. Use `.col-lg-*` classes

		<div class="col-sm-3 col-md-6 col-lg-4">...</div>
		<div class="col-sm-3 col-md-6 col-lg-8">...</div>

	1. At small size look at classes with `-sm-`
	2. At medium size look at classes with `-md-`
	4. At large size look at classes with `-lg-`

#### Using Only Large ###
1. `.col-lg-6` will split for large devices by 50%/50% but for medium and small devices it will be stcked

### BS Grid Examples ###
#### Three Equal Columns ####
1. Example:

		<div class="row">
			<div class="col-sm-4">.col-sm-4</div>
			<div class="col-sm-4">.col-sm-4</div>
			<div class="col-sm-4">.col-sm-4</div>
		</div>

#### Three Unequal Columns ####
1. Example:

		<div class="row">
			<div class="col-sm-3">.col-sm-3</div>
			<div class="col-sm-6">.col-sm-6</div>
			<div class="col-sm-3">.col-sm-3</div>
		</div>

#### Two Unequal Columns ####
1. Example:

		<div class="row">
			<div class="col-sm-4">.col-sm-4</div>
			<div class="col-sm-8">.col-sm-8</div>
		</div>

#### Two Columns With Two Nested Columns ####
1. Example:

		<div class="row">
			<div class="col-sm-8">
				.col-sm-8
				<div class="row">
					<div class="col-sm-6">.col-sm-6</div>
					<div class="col-sm-6">.col-sm-6</div>
				</div>
			</div>
			<div class="col-sm-4">.col-sm-4</div>
		</div>

#### Mixed: Mobile And Desktop ####
1. Classes can be combined for flexible layouts
2. Example:

		<div class="row">
			<div class="col-xs-9 col-md-7">.col-xs-9 .col-md-7</div>
			<div class="col-xs-3 col-md-5">.col-xs-3 .col-md-5</div>
		</div>

		<div class="row">
			<div class="col-xs-6 col-md-10">.col-xs-6 .col-md-10</div>
			<div class="col-xs-6 col-md-2">.col-xs-6 .col-md-2</div>
		</div>

		<div class="row">
			<div class="col-xs-6">.col-xs-6</div>
			<div class="col-xs-6">.col-xs-6</div>
		</div>

#### Mixed: Mobile, Tablet And Desktop ####
1. Example:

		<div class="row">
			<div class="col-xs-7 col-sm-6 col-lg-8">.col-xs-7 .col-sm-6 .col-lg-8</div>
			<div class="col-xs-5 col-sm-6 col-lg-4">.col-xs-5 .col-sm-6 .col-lg-4</div>
		</div>

		<div class="row">
			<div class="col-xs-6 col-sm-8 col-lg-10">.col-xs-6 .col-sm-8 .col-lg-10</div>
			<div class="col-xs-6 col-sm-4 col-lg-2">.col-xs-6 .col-sm-4 .col-lg-2</div>
		</div>

#### Clear Floats ####
1. `.clearfix`: if inserted at specific breakpoints to prevent strange wrapping with uneven content
2. Example:

		<div class="row">
			<div class="col-xs-6 col-sm-3">
				Column 1
				<br />
				Resize the browser window to see the effect.
			</div>
			<div class="col-xs-6 col-sm-3">Column 2</div>
			<!-- Add clearfix for only the required viewport -->
			<div class="clearfix visible-xs"></div>
			<div class="col-xs-6 col-sm-3">Column 3</div>
			<div class="col-xs-6 col-sm-3">Column 4</div>
		</div>

#### Offsetting Columns ####
1. `.col-md-offset-*`: moves columns to the right by increasing left margin by * columns
2. Example:

		<div class="row">
			<div class="col-sm-5 col-sm-6">.col-sm-5 .col-md-6</div>
			<div class="col-sm-5 col-sm-offset-2 col-md-6 col-md-offset-0">.col-sm-5 .col-sm-offset-2 .col-md-6 .col-md-offset-0</div>
		</div>

#### Push And Pull - Change Column Ordering ####
1. `.col-md-push-*` - pushes the column by * pixels
2. `.col-md-pull-*` - pulls the column by * pixels
3. Example:

		<div class="row">
			<div class="col-sm-4 col-sm-push-8">.col-sm-4 .col-sm-push-8</div>
			<div class="col-sm-8 col-sm-pull-4">.col-sm-8 .col-sm-pull-4</div>
		</div>

## Bootstrap Themes ##
### BS Templates ###
#### W3Schools' Bootstrap Templates ####
1. Responsive HTML Templates which are free
2. [Blog](https://www.w3schools.com/bootstrap/tryit.asp?filename=trybs_temp_blog&stacked=h)
3. [Portfolio](https://www.w3schools.com/bootstrap/tryit.asp?filename=trybs_temp_portfolio&stacked=h)
4. [Webpage](https://www.w3schools.com/bootstrap/tryit.asp?filename=trybs_temp_webpage&stacked=h)
5. [Social](https://www.w3schools.com/bootstrap/tryit.asp?filename=trybs_temp_social&stacked=h)
6. [Marketing](https://www.w3schools.com/bootstrap/tryit.asp?filename=trybs_temp_marketing&stacked=h)
7. [Marketing 2](https://www.w3schools.com/bootstrap/tryit.asp?filename=trybs_temp_marketing2&stacked=h)
8. [Analytics](https://www.w3schools.com/bootstrap/tryit.asp?filename=trybs_temp_analytics&stacked=h)
9. [Online Store](https://www.w3schools.com/bootstrap/tryit.asp?filename=trybs_temp_store&stacked=h)

### BS Theme "Simply Me" ###
#### Creation of a Theme: "Simply Me" ####
1. A bootstrap theme

#### HTML Start Page ####
1. HTML page

		<!DOCTYPE html>
		<html lang="en">
			<head>
				<title>Bootstrap Theme Simply Me</title>
				<meta charset="utf-8">
				<meta name="viewport" content="width=device-width, initial-scale=1">
			</head>
			<body>
				<h3>Who Am I?</h3>
				<img src="bird.jpg" alt="Bird">
				<h3>I'm an adventurer</h3>
			</body>
		</html>

#### Add Bootstrap CDN and Put Elements in Container ####
1. Add Bootstrap CDN and a link to jQuery and put HTML elements inside a container:

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		...
		<div class="container-fluid">
			<h3>Who Am I?</h3>
			<img src="bird.jpg" alt="Bird">
			<h3>I'm an adventurer</h3>
		</div>

#### Add Background Color and Center Text ####
1. Add custom class `.bg-1` to container to add a background color
2. Add `.text-center` class to center the text inside container

		<style>
			bg-1 {
				background-color: #1abc9c;	/* Green */
				color: #ffffff;
			}
		</style>
		...
		<body>
			<div class="... bg-1 text-center">
				...
			</div>
		</body>

#### Circle Image ####
1. Shape image to circle with `.img-circle` class

		<img src="bird.jpg" class="img-circle" alt="Bird">

#### More Content ####
1. Add more content and put it inside new containers

		<style>
			...
			.bg-2 {
				background-color: #474e5d;	/* Dark Blue */
				color: #ffffff;
			}
			.bg-3 {
				background-color: #ffffff;	/* White */
				color: #555555;
			}
		</style>
		...
		<body>
			...
			<div class="container-fluid bg-2 text-center">
				<h3>What Am I?</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			</div>
		
			<div class="container-fluid bg-3 text-center">
				<h3>Where To Find Me?</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			</div>

#### Add Padding ####
1. Makes containers look good with padding:

		<style>
			.container-fluid {
				padding-top: 70px;
				padding-bottom: 70px;
			}
			...
		</style>

#### Add a Button ####
1. Add button to mid container:

		<div class="container-fluid bg-2 text-center">
			<h3>What Am I?</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			<a href="#" class="btn btn-default btn-lg">Search</a>
		</div>

#### Add an Icon ####
1. Add search icon on "Search" button

		<a ...>
			<span class="glyphicon glyphicon-search"></span>
			...
		</a>

#### Modify The Third Container (Add Grid) ####
1. Add three columns of equal width inside third container (`.col-sm-4`)

		<div class="container-fluid bg-3 text-center">
			<h3>Where To Find Me?</h3>
			<div class="row">
				<div class="col-sm-4">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					<img src="https://www.w3schools.com/bootstrap/birds1.jpg" alt="Image">
				</div>
				<div class="col-sm-4">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					<img src="https://www.w3schools.com/bootstrap/birds2.jpg" alt="Image">
				</div>
				<div class="col-sm-4">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					<img src="https://www.w3schools.com/bootstrap/birds3.jpg" alt="Image">
				</div>
			</div>
		</div>

#### Make The Images Responsive ####
1. Add `.img-responsive` to all images
2. Add `display:inline` to first image to force it to be centered (`.img-responsive` adds `display:block` to image which makes it jump to left of the screen)
	1. When image begins to stack we can make it to span entire width with `width:100%`
3. Example:

		<!-- The circular bird -->
		<img src="https://www.w3schools.com/bootstrap/bird.jpg" class="img-responsive img-circle" style="display:inline" alt="Bird">

		<!-- The birds in our grid: -->
		<img src="https://www.w3schools.com/bootstrap/birds1.jpg" class="img-responsive" style="width:100%" alt="Image">
		<img src="https://www.w3schools.com/bootstrap/birds2.jpg" class="img-responsive" style="width:100%" alt="Image">
		<img src="https://www.w3schools.com/bootstrap/birds3.jpg" class="img-responsive" style="width:100%" alt="Image">

#### Add a Navbar ####
1. Add navigation bar at the top of the page and make it collapsible on smaller screens

		<nav class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Me</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">WHO</a></li>
						<li><a href="#">WHAT</a></li>
						<li><a href="#">WHERE</a></li>
					</ul>
				</div>
			</div>
		</nav>

#### Style The Navbar ####
1. CSS to customize navigation bar

		.navbar {
			padding-top: 15px;
			padding-bottom: 15px;
			border: 0;
			border-radius: 0;
			margin-bottom: 0;
			font-size: 12px;
			letter-spacing: 5px;
		}

		.navbar-nav li a:hover {
			color: #1abc9c !important;
		}

#### Add a Footer ####
1. Add footer and use CSS to style it:

		<style>
			.bg-4 {
				background-color: #2f2f2f;
				color: #ffffff;
			}
		</style>

		<footer class="container-fluid bg-4 text-center">
			<p>Bootstrap Theme Made By <a href="https://www.w3schools.com">www.w3schools.com</a></p>
		</footer>

#### Final Touch ####
1. Personalize by adding font of choice: "Montserrat" from Google's Font Library

		<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

2. Use it in the page:

		body {
			font: 20px "Montserrat", sans-serif;
			line-height: 1.8;
			color: #f5f6f7;
		}

		p { font-size: 16px; }

3. Helper margin class to add extra space where it may be needed

		.margin { margin-bottom: 45px; }

#### Complete "Simply Me" Theme ####