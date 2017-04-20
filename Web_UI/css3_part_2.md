## CSS Pagination ##
### Simple Pagination ###
1. Example:

		<!DOCTYPE html>
		<hmtl>
			<head>
				<style>
					.pagination {
						display: inline-block;
					}
					
					.pagination a {
						color: black;
						float: left;
						padding: 8px 16px;
						text-decoration: none;
					}
				</style>
			 </head>
			 <body>
			 	<h2>Simple Pagination</h2>
			 	<div class="pagination">
			 		<a href="#">&laquo;</a>
			 		<a href="#">1</a>
			 		<a href="#">2</a>
			 		<a href="#">3</a>
			 		<a href="#">4</a>
			 		<a href="#">5</a>
			 		<a href="#">6</a>
			 		<a href="#">&raquo;</a>
			 	</div>
			 </body>
		</html>

### Avtive and Hoverable Pagination ###
1. Example:

		.pagination a.active {
			backgrounc-color: #4CAF50;
			color: white;
		}
		
		.pagination a:hover:not(.active) { background-color: #ddd; }

### Rounded Active and Hoverable Buttons ###
1. Example:

		.pagination a {
			border-radius: 5px;
		}
		
		.pagination a.active {
			border-radius: 5px;
		}

### Hoverable Transition Effect ###
1. Example:

		.pagination a {
			transition: background-color 0.3s;
		}

### Bordered Pagination ###
1. Example:

		.pagination a {
			border: 1px solid #ddd;
		}

### Rounded Borders ###
1. Example:

		.pagination a:first-child {
			border-top-left-radius: 5px;
			border-bottom-left radius: 5px;
		}
		
		.pagination a:last-child {
			border-top-right-radius: 5px;
			border-bottom-right-radius: 5px;
		}

### Space Between Links ###
1. Example:

		.pagination a {
			margin: 0 4px;
		}

### Pagination Size ###
1. Example:

		.pagination a {
			font-size: 22px;
		}

### Centered Pagination ###
1. Example:

		.center {
			text-align: center;
		}
		
		<div  class="center">
			<div class="pagination">
				...
			</div>
		</div>

### More Examples ###
1. Example:

		<div class="pagination">
			<a href="#">&lt;</a>
			<a href="#">&gt;</a>
		</div>

### Breadcrumbs ###
1. Example:

		ul.breadcrumb {
			padding: 8px 16px;
			list-style: none;
			background-color: #eee;
		}
		
		ul.breadcrumb li { display: inline; }
		
		ul.breadcrumb li+li:before {
			padding: 8px;
			color: black;
			content: "/\00a0";
		}
		
## CSS3 Multiple Columns ##
### CSS3 Multi-column Layout ###
1. Allows easy definition of multiple columns of text - (like a newspaper)

### CSS3 Multi-column Properties ###
1. Multi-column properties:
	1. `column-count`
	2. `column-gap`
	3. `column-rule-style`
	4. `column-rule-width`
	5. `column-rule-color`
	6. `column-rule`
	7. `column-span`
	8. `column-width`

### CSS3 Creation of Multiple Columns ###
1. `column-count`: number of columns an element must be divided into.

		div {
			-webkit-column-count: 3;
			-moz-column-count: 3;
			column-count: 3;
		}
		
		<div class="newspaper">
			Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.
		</div>

### CSS3 Specify the Gap Between Columns ###
1. `column-gap` **(M)**: specifies gap betwen columns
2. Example:

		div {
			-webkit-column-gap: 40px;
			-moz-column-gap: 40px;
			column-gap: 40px;
		}

### CSS3 Column Rules ###
1. `column-rule-style` **(M)**
2. Example:

		div {
			-webkit-column-rule-style: solid;
			-moz-column-rule-style: solid;
			column-rule-style: solid;
		}
		
3. `column-rule-width` **(M)**

		div {
			-webkit-column-rule-width: 1px;
			-moz-column-rule-width: 1px;
			column-rule-width: 1px;
		}
		
4. `column-rule-color` **(M)**

		div {
			-webkit-column-rule-color: lightblue;
			-moz-column-rule-color: lightblue;
			column-rule-color: lightblue;
		}
		
5. `column-rule` **(M)**

		div {
			-webkit-column-rule: 1px solid lightblue;
			-moz-column-rule: 1px solid lightblue;
			column-rule: 1px solid lightblue;
		}

### Specify How Many Columns an Element Should Span ###
1. `column-span` **(M)**: Specifies how many columns an element should span.
2. Example:

		h2 {
			-webkit-column-span: all;
			column-span: all;
		}
		
		<div class="newspaper">
			<h2>Lorem Ipsum Dolor Sit Amet</h2>
			Lorem ipsum ...
		</div>

### Specify The Column Width ###
1. `column-width` **(M)**: Suggested optimal width for columns.
2. Example:

		div {
			-webkit-column-width: 100px;
			-moz-column-width: 100px;
			column-width: 100px;
		}

### CSS3 Multi-columns Properties ###
1. `column-count`
2. `column-fill`: how to fill columns
	1. `auto`
	2. `balance`
3. `column-gap`
4. `column-rule`
5. `column-rule-color`
6. `column-rule-style`
7. `column-rule-width`
8. `column-span`
9. `column-width`
10. `columns`: shorthand property for `column-width` and `column-count`

## CSS3 User Interface ##
### CSS3 User Interface ###
1. CSS3 New features:
	1. Resizing elements, outlines, box sizing
2. User interface properties:
	1. `resize` **(M)**
	2. `outline-offset` **(M)**

### Browser Support ###
1. `resize`:
	1. Chrome: 4.0
	2. IE: No support
	3. Firefox: 5.0, 4.0 -moz-
	4. Safari: 4.0
	5. Opera: 15.0
2. `outline-offset`
	1. Chrome: 4.0
	2. IE: No support
	3. Firefox: 5.0, 4.0 -moz-
	4. Safari: 4.0
	5. Opera: 9.5

### CSS3 Resizing ###
1. `resize` **(M)**: Specifies if an element is resizable by user
2. Example: Allow to resize only width of an element

		div {
			resize: horizontal;
			overflow: auto;
		}

3. Example: Allow to resize only height of an element

		div {
			resize: vertical;
			overflow: auto;
		}
		
4. Example: Allow to resize both height and width of an element
		
		div {
			resize: both;
			overflow: auto;
		}
### CSS3 Outline Offset ###
1. `outline-offset`: adds space between an outline and edge of a border
2. How are outlines different from borders:
	1. It is a line draws around elements, outside border edge
	2. Outline does not take up space
	3. Outline may be non-rectangular
3. Example:

		div {
			border: 1px solid black;
			outline: 1px solid red;
			outline-offset: 15px;
		}

### CSS3 User Interface Properties ###
1. `box-sizing`: allows inclusion of border and padding in total width and height
2. `nav-down`: specifies where to navigate when using arrow-down navigation key
3. `nav-index`: specifies tabbing order or an element
4. `nav-left`: specifies where to navigate when using the arrow-left navigation key
5. `nav-right`: specifies where to navigate when using the arrow-right key
6. `nav-up`: specifies where to navigate when using the arrow-up key
7. `outline-offset`: Adds space between an outline and edge or border of an element.
8. `resize`: specifies whether or not an element is resizable by user.

## CSS3 Box Sizing ##
### CSS3 Box Sizing ###
1. `box-sizing`: allows us to include padding and border in an elements's total width and height.

### Browser Support ###
1. `box-sizing`:
	1. Chrome: 10.0, 4.0 -webkit-
	2. IE: 8.0
	3. Firefox: 29.0, 2.0 -moz-
	4. Safari: 5.1, 3.1 -webkit-
	5. Opera: 9.5

### Without the CSS3 box-sizing Property ###
1. Default:
	1. width + padding + border = actual width of an element
	2. height + padding + border = actual height of an element
2. `width` and `height` does not include `padding` and `border`
3. Example:

		.div1 {
			width: 300px;
			height: 100px;
			border: 1px solid blue;
		}
		
		.div2 {
			width: 300px;
			height: 100px;
			padding: 50px;
			border: 1px solid red;
		}

### With the CSS3 box-sizing Property ###
1. `box-sizing: border-box;` - includes padding and border in width and height.
2. Example:

		.div1 {
			width: 300px;
			height: 100px;
			border: 1px solid blue;
			box-sizing: border-box;
		}
		
		div2 {
			width: 300px;
			height: 100px;
			padding: 50px;
			border: 1px solid red;
			box-sizing: border-box;
		}

3. Applying it to all elements:

		* {
			box-sizing: border-box;
		}
		
## CSS3 Flexible Box ##
### CSS3 Flexbox ###
1. Flexible box (Flexbox) is new layout mode in CSS3.
2. Ensures that elements behave predictably when page layout must accommodate different screen sizes and display devices.
3. It is an improvement over block model
	1. No floats
	2. Flex container's margins do not collapse with content's margins

### Browser Support ###
1. Basic support:
	1. Chrome: 29.0, 21.0 -webkit-
	2. IE: 11.0
	3. Firefox: 22.0, 18.0 -moz-
	4. Safari: 6.1 -webkit-
	5. Opera: 12.1 -webkit-
2. Multi-line flexbox:
	1. Chrome: 29.0, 21.0 -webkit-
	2. IE: 11.0
	3. Firefox: 28.0
	4. Safari: 6.1 -webkit-
	5. Opera: 17.0, 15.0 -webkit-, 12.1

### CSS3 Flexbox Concepts ###
1. It has flex containers and flex items.
2. Flex container:
	1. Declared using one of the following:
		1. `display: flex` (block)
		2. `display: inline-flex` (inline)
	2. It has one or more flex items
3. Everything outside flex container and inside flex item is rendered as usual.
	1. Flexbox defines how flex items are layed out in a flex container
4. Example: Default positioning is along horizontal flex line from left to right

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					.flex-container {
						display: -webkit-flex;
						display: flex;
						width: 400px;
						height: 250px;
						background-color: lightgrey;
					}
					
					.flex-item {
						background-color: cornflowerblue;
						width: 100px;
						height: 100px;
						margin: 10px;
					}
				</style>
			</head>
			<body>
				<div class="flex-container">
					<div class="flex-item">flex item 1</div>
					<div class="flex-item">flex item 2</div>
					<div class="flex-item">flex item 3</div>
				</div>
			</body>
		</html>
		
2. Set `direction: rtl` for text to be drawn right to left and flex line to change its direction.

		body {
			direction: rtl;
		}

### Flex Direction ###
1. `flex-direction`: defines direction of flexible items inside flex container.
	1. Values:
		1. `row` (default)
		2. `row-reverse`
		3. `column`
		4. `column-reverse`
2. Example: `row-reverse`

		.flex-container {
			display: -webkit-flex;
			display: flex;
			-webkit-flex-direction: row-reverse;
			flex-direction: row-reverse;
			width: 400px;
			height: 250px;
			background-color: lightgrey;
		}
		
3. Example: `column`

		.flex-container {
			display: -webkit-flex;
			display: flex;
			-webkit-flex-direction: column;
			flex-direction: column;
			width: 400px;
			height: 250px;
			background-color: lightgrey;
		}
		
4. Example: `column-reverse`

		.flex-container {
			display: -webkit-flex;
			display: flex;
			-webkit-flex-direction: column-reverse;
			flex-direction: column-reverse;
			width: 400px;
			height: 250px;
			background-color: lightgrey;
		}

### The `justify-content` Property ###
1. `justify-content`: horizontally aligns the flexible container's items when items do not use all available space on main-axis.
2. Values:
	1. `flex-start`: default. Items are positioned at the beginning of the container
	2. `flex-end`: Items are placed at the end of the container
	3. `center`: Items are positioned at the center of the container
	4. `space-between`: Items are positioned with space between the lines
	5. `space-around`: Items are positioned with space before, between and after the lines.
3. Example:

		.flex-container {
			display: -webkit-flex;
			display: flex;
			-webkit-justify-content: flex-end;
			justify-content: flex-end;
			width: 400px;
			height: 250px;
			background-color: lightgrey;
		}
		
4. Example: `center`

		.flex-container {
			display: -webkit-flex;
			display: flex;
			-webkit-justify-content: center;
			justify-content: center;
			width: 400px;
			height: 250px;
			background-color: lightgrey;
		}
		
5. Example: `space-between`

		.flex-container {
			display: -webkit-flex;
			display: flex;
			-webkit-justify-content: space-between;
			justify-content: space-between;
			width: 400px;
			height: 250px;
			background-color: lightgrey;
		}
		
6. Example: `space-around`

		.flex-container {
			display: -webkit-flex;
			display: flex;
			-webkit-justify-content: space-around;
			justify-content: space-around;
			width: 400px;
			height: 250px;
			background-color: lightgrey;
		}

### The `align-items` Property ###
1. `align-items`: vertically aligns flexible container's items when items do not use all the space on cross-axis.
2. Values:
	1. `stretch` (default). Items are stretched to fit the container
	2. `flex-start`: Items are positioned at the top of the container
	3. `flex-end`: Itmes are positioned at the bottom of the container
	4. `center`: Items are positoined at the center of the container
	5. `baseline`: Items are positioned at the baseline of the container
3. `stretch`:

		.flex-container {
			display: -webkit-flex;
			display: flex;
			-webkit-align-items: stretch;
			align-items: stretch;
			width: 400px;
			height: 250px;
			background-color: lightgrey;
		}
		
4. `flex-start`:

		.flex-container {
			display: -webkit-flex;
			display: flex;
			-webkit-align-items: flex-start;
			align-items: flex-start;
			width: 400px;
			height: 250px;
			background-color: lightgrey;
		}
		
5. `flex-end`

		.flex-container {
			display: -webkit-flex;
			display: flex;
			-webkit-align-items: flex-start;
			align-items: flex-start;
			width: 400px;
			height: 250px;
			background-color: lightgrey;
		}
		
6. `center`

		.flex-container {
			display: -webkit-flex;
			display: flex;
			-webkit-align-items: center;
			align-items: center;
			width: 400px;
			height: 250px;
			background-color: lightgrey;
		}
		
7. `baseline`

		.flex-container {
			display: -webkit-flex;
			display: flex;
			-webkit-align-items: baseline;
			align-items: baseline;
			width: 400px;
			height: 250px;
			background-color: lightgrey;
		}

### The `flex-wrap` Property ###
1. `flex-wrap`: specifies whether flex items should wrap or not if there is not much room for them on one flex line.
2. Values:
	1. `nowrap` (default). Flexible items will not wrap
	2. `wrap`: flexible items will wrap if necessary
	3. `wrap-reverse`: flexible items will wrap if necessary in reverse order.
3. Example: `nowrap`

		.flex-container {
			display: -webkit-flex;
			display: flex;
			-webkit-flex-wrap: nowrap;
			flex-wrap: nowrap;
			width: 300px;
			height: 250px;
			background-color: lightgrey;
		}
		
4. Example: `wrap`

		.flex-container {
			display: -webkit-flex;
			display: flex;
			-webkit-flex-wrap: wrap;
			flex-wrap: wrap;
			width: 300px;
			height: 250px;
			background-color: lightgrey;
		}
		
5. Example: `wrap-reverse`

		.flex-container {
			display: -webkit-flex;
			display: flex;
			-webkit-flex-wrap: wrap-reverse;
			flex-wrap: wrap-reverse;
			width: 300px;
			height: 250px;
			background-color: lightgrey;
		}

### The `align-content` Property ###
1. `align-content`: modifies behavior of `flex-wrap` property.
	1. It is similar to `align-items` but it aligns flex lines instead of flex items.
2. Values:
	1. `stretch` (default). Lines stretch to take up the remaining space
	2. `flex-start`: lines are packed toward the start of the container
	3. `flex-end`: lines are packed toward th end of the container
	4. `center`: lines are packed toward the center of the flex container
	5. `space-between`: lines are evenly distributed in flex container
	6. `space-around`: lines are evenly distributed in flex container, with half-size spaces on either end
3. Example:

		.flex-container {
			display: -webkit-flex;
			display: flex;
			-webkit-flex-wrap: wrap;
			flex-wrap: wrap;
			-webkit-align-content: center;
			align-content: center;
			width: 300px;
			height: 300px;
			background-color: lightgrey;
		}

### Flex Item Properties ###
#### Ordering ####
1. `order`: specifies the order of a flexible item relative to rest of the flexible items inside the same container.
2. Example:

		.flex-item {
			background-color: cornflowerblue;
			width: 100px;
			height: 100px;
			margin: 10px;
		}
		
		.first {
			-webkit-order: -1;
			order: -1;
		}

#### Margin ####
1. `margin: auto` will absorb extra space. It can be used to push flex items into different positions.
2. Example: `margin-right: auto;` absorbs extra space to the right of the item.

		.flex-item {
			background-color: cornflowerblue;
			width: 75px;
			height: 75px;
			margin: 10px;
		}
		
		.flex-item:first-child {
			margin-right: auto;
		}

#### Perfect Centering ####
1. Example: `margin-auto` centers items in a flex-container in both axes.

		.flex-item {
			background-color: cornflowerblue;
			width: 75px;
			height: 75px;
			margin: auto;
		}

#### `align-self` ####
1. `align-self` overrides `align-items` property of flex container. It takes the same values as `align-items`
2. Example:

		.flex-item {
			background-color: cornflowerblue;
			width: 60px;
			min-height: 100px;
			margin: 10px;
		}
		
		.item1 {
			-webkit-align-self: flex-start;
			align-self: flex-start;
		}
		
		.item2 {
			-webkit-align-self: flex-end;
			align-self: flex-end;
		}
		
		.item3 {
			-webkit-align-self: center;
			align-self: center;
		}
		
		.item4 {
			-webkit-align-self: baseline;
			align-self: baseline;
		}
		
		.item5 {
			-webkit-align-self: stretch;
			align-self: stretch;
		}

#### `flex` ####
1. `flex` specifies length of flex item relative to the rest of the flex items inside the same container.
2. Example: First item consumes 2/4th of free space, and rest of the items consume 1/4th of the free space each.

		.flex-item {
			background-color: cornflowerblue;
			margin: 10px;
		} 
		
		.item1 {
			-webkit-flex: 2;
			flex: 2;
		}
		
		.item2 {
			-webkit-flex: 1;
			flex: 1;
		}
		
		.item3 {
			-webkit-flex: 1;
			flex: 1;
		}

### More Examples ###
1. [Responsive Website with flexbox](https://www.w3schools.com/css/tryit.asp?filename=trycss3_flexbox_website)

### CSS3 Flexbox Properties ###
1. `display`: specifies type of box used
2. `flex-direction`: direction of flexible items inside flex container
3. `justify-content`: Horizontally aligns flex items when items do no used all the available space on main-axis.
4. `align-items`: Vertically aligns flex items when items do not use all available space on the cross-axis.
5. `flex-wrap`: specifies whether the flex items should wrap or not, if there is not enough room for them on one flex line.
6. `align-content`
7. `flex-flow`: shorthand property for `flex-direction` and `flex-wrap`
8. `order`: order of flexible item relative to rest of flex items inside same container.
9. `align-self`
10. `flex`: specifies length of flex item

## CSS3 Media Queries ##
### CSS2 Introduced Media Types ###
1. `@media` rule: Introduced in CSS2.
	1. Can be used to define style rules for different media types.
		1. One stle rule for computer screen
		2. One style rule for printers
		3. One style rule for handheld devices
		4. One style rule for television type devices

### CSS3 Introduces Media Queries ###
1. Extends CSS2 media types idea.
	1. Difference: looks for capability of device instead of type of device.
2. Media queries can be used to check:
	1. width and height of the viewport
	2. width and height of the device
	3. orientation (is the tablet/phone in landscape or portrait mode?)
	4. resolution
3. Used to deliver tailored style sheet for tablets, iPhones, Androids.

### Browser Support ###
1. `@media`:
	1. Chrome: 21.0
	2. IE: 9.0
	3. Firefox: 3.5
	4. Safari: 4.0
	5. Opera: 9.0

### Media Query Syntax ###
1. Contains media type and ore or more expressions (resolves to either true or false)

		@media not|only mediatype and (expressions) {
			CSS-Code;
		}
		
2. Result of query is true if specified media type matches type of device the document is being displayed on and all expressions in media query are true.
	1. If media query is true, the corresponding style rules are applied
3. mediatype: optional and must be used with either `not` or `only`
	1. If mediatype is not specified, `all` type is implied
4. Using different stylesheets for different media:

		<link rel="stylesheet" media="mediatype and|not|only (expressions)" href="print.css">

### CSS3 Media Types ###
1. `all`: for all media type devices
2. `print`: for printers
3. `screen`: for computer screens, tablets, smart-phones ...
4. `speech`: for screenreaders that "read" the page out loud

### Media Queries Simple Examples ###
1. Having an alternate CSS section in stylesheet:


		body {
			backgorund-color: pink;
		}

		@media screen and (min-width: 480px) {
			body {
				background-color: lightgreen;
			}
		}
		
2. Example: Menu that floats to the left of the page if viewport is atleast 480px wide.

		@media screen and (min-width: 480px) {
			#leftsidebar { width: 200px; float: left; }
			#main { margin-left: 216px; }
		}
		
		<div class="wrapper">
			<div id="lefsidebar">
				<ul id="menulist">
					<li class="menuitem">Menu - item 1</li>
					<li class="menuitem">Menu - item 2</li>
					<li class="menuitem">Menu - item 3</li>
					<li class="menuitem">Menu - item 4</li>
					<li class="menuitem">Menu - item 5</li>
				</ul>
			</div>
		</div>

### CSS3 `@media` Reference ###
1. [Full overfiew of features/expressions](https://www.w3schools.com/cssref/css3_pr_mediaquery.asp)

## CSS3 Media Queries - Examples ##
### CSS3 Media Queries - More Examples ###
1. List of names which function as email links.

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					ul {
						list-style-type: none;
					}
					
					ul li a {
						color: green;
						text-decoration: none;
						padding: 3px;
						display: block;
					}
				</style>
			</head>
			<body>
				<ul>
					<li><a data-email="johndoe@example.com" href="mailto:johdoe@example.com">John Doe</a></li>
					<li><a data-email="marymoe@example.com" href="mailto:marymoe@example.com">May Moe</a></li>
					<li><a data-email="amandapanda@example.com" href="mailto:amandapanda@example.com">Amanda Panda</a></li>
				</ul>
			</body>
		</html>
		
	1. `data-email`: `data-` is used to store information.

### Width from 520 to 699px - Apply an email icon to each link ###
1. When browser's width is between 520 snf 699pc apply an email icon to each email link.

		@media screen and (max-width: 699px) and (min-width: 520px) {
			ul li a {
				padding-left: 30px;
				background: url(email-icon.png) left center no-repeat;
			}
		}

### Width from 700 to 1000px - Preface the links with a text ###

		@media screen and (max-width: 1000px) and (min-width: 700px) {
			ul li a:before {
				content: "Email: ";
				font-style: italic;
				color: #666666;
			}
		}

### Width above 1001px - Apply email address to links ###

		@media screen and (min-width: 1001px) {
			ul li a:after {
				content: " (" attr(data-email) ")";
				font-size: 12px;
				font-style: italic;
				color: #666666;
			}
		}

### Width above 1151px - Add icon as we used before ###

		@media screen and (max-width: 699px) and (min-width: 520px), (min-width: 1151px) {
			ul li a {
				padding-left: 30px;
				background: url(email-icon.png) left center no-repeat;
			}
		}
		
### More Examples ###
1. [List of email links on a sidebar in a web page](https://www.w3schools.com/css/tryit.asp?filename=trycss3_mediaqueries_ex6)