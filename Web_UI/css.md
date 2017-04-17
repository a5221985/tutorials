# CSS #

## CSS Tutorial ##
1. CSS describes style of an HTML document.
2. CSS describes how an HTML element should be displayed.
3. Tutorial goal: Teach CSS from basic to advanced.

### CSS Examples ###
1. 300 examples: With built in editor
2. [CSS Examples](https://www.w3schools.com/css/css_examples.asp)

### CSS Free Templates ###
1. Responsive W3.CSS templates (free to modify, free to share, free to use)
2. [Free CSS Templates](https://www.w3schools.com/css/css_rwd_templates.asp)

### CSS Exercises and Quiz Test ###
1. [Start CSS Quiz](https://www.w3schools.com/css/css_quiz.asp)
2. [Start CSS Exercises](https://www.w3schools.com/css/exercise.asp?filename=exercise_syntax1)

### CSS References ###
1. [CSS Properties Reference](https://www.w3schools.com/cssref/default.asp)
2. [CSS Selectors Reference](https://www.w3schools.com/cssref/css_selectors.asp)
3. [CSS Functions Reference](https://www.w3schools.com/cssref/css_functions.asp)
4. [CSS Animatable Reference](https://www.w3schools.com/cssref/css_animatable.asp)
5. [CSS Aural Reference](https://www.w3schools.com/cssref/css_ref_aural.asp)
6. [CSS Units](https://www.w3schools.com/cssref/css_units.asp)
7. [CSS Color Reference](https://www.w3schools.com/cssref/css_colors.asp)
8. [CSS Default Values](https://www.w3schools.com/cssref/css_default_values.asp)

### Example - Get Your Diploma! ###
1. [HTML Certificate](https://www.w3schools.com/cert/default.asp)
2. [CSS Certificate](https://www.w3schools.com/cert/default.asp)
3. [JavaScript Certificate](https://www.w3schools.com/cert/default.asp)
4. [jQuery Certificate](https://www.w3schools.com/cert/default.asp)
5. [PHP Certificate](https://www.w3schools.com/cert/default.asp)
6. [XML Certificate](https://www.w3schools.com/cert/default.asp)
7. [Bootstrap Certificate](https://www.w3schools.com/cert/default.asp)


## CSS Introduction ##
### What is CSS ###
1. CSS: Cascading Style Sheets
2. Describes how HTML elements must be displayed on screen, paper, or in other media
3. Saves work (controls multiple web pages all at once)
4. External stylesheets are stored in CSS files

### Why use CSS? ###
1. CSS is used to define styles for web pages.
	1. Design
	2. Layout
	3. Variations in display for different devices and screen sizes

### CSS Solved a Big Problem ###
1. HTML only describes content of a web page.
2. `<font>` and `color` were introduced in HTML 3.2 which resulted in adding such information to every single page which is expensive.
3. Hence CSS was introduced which removed style formatting from HTML page.

### CSS Saves a Lot of Work! ###
1. With external CSS file, we can change the look of an entire website by modifying just one file.

## CSS Syntax and Selectors ##
### CSS Syntax ###
1. CSS rule-set:
	1. Selector + Declaration block
		1. Selector: points to HTML element that needs to be styled
		2. Declaration block: one or more declarations separated by `;`
			1. Declaration: css property name, value pair separated by `:`
			2. Surrounded by `{` and `}`
2. Example:

		p {
			color: red;
			text-align: center;
		}

	1. All `p` elements will be center-aligned and will contain red color text

### CSS Selectors ###
1. Used to find or select HTML elements based on:
	1. name
	2. id
	3. class
	4. attribute
	5. ...

### The element Selector ###
1. Selecting elements based on element name
2. Example:

		p {
			color: red;
			text-align: center;
		}

### The id Selector ###
1. Uses `id` attribute of HTML element to select a specific element.
2. Syntax: `#<id>`
3. Example: Consider an element with `id="para1"`:

		#para1 {
			text-align: center;
			color: red;
		}

### The class Selector ###
1. Used to select element with a specific class attribute
2. Syntax: `.<class-name>`
3. Example:
		
		.center {
			text-align: center;
			color: red;
		}

4. Selecting specific elements of a class:

		p.center {
			text-align: center;
			color: red;
		}

	1. Select `<p>` elements with `class="center"`
5. HTML elements can refer to multiple classes:

		<p class="center large">This paragraph refers to two classes.</p>

### Grouping Selectors ###
1. Group by separating each selector by a comma:

		h1, 
		h2, 
		p {
			text-align: center;
			color: red;
		}

### CSS Comments ###
1. May be used to explain the code
2. Syntax: `/* ... */`
3. Example:

		p {
			color: red;
			/* This is a single-line comment */
			text-align: center;
		}

		/* This is
		a multi-line
		comment */

## CSS How To... ##
### Three Ways to Insert CSS ###
1. External style sheet
2. Internal style sheet
3. Inline style

### External Style Sheet ###
1. Each page must include a reference to the external style sheet file in `<link>` inside `<head>` section.
2. Example:

		<head>
			<link rel="stylesheet" type="text/css" href="mystyle.css" />
		</head>

3. Save external stylesheet with `.css` extension.
4. `mystyle.css`

		body {
			background-color: lightblue;
		}

		h1 {
			color: navy;
			margin-left: 20px;
		}

### Internal Style Sheet ###
1. Used if a single page has a unique style.
2. Syntax:

		<style>
			styling content
		</style>

3. Example:

		<head>
			<style>
				body {
					background-color: linen;
				}

				h1 {
					color: maroon;
					margin-left: 40px;
				}
			</style>
		</head>

### Inline Styles ###
1. Used to apply style to a single element
2. Syntax: `< ... style="...">`
3. Example:

		<h1 style="color:blue;margin-left:30px;">This is a heading</h1>

4. Tip: Use it sparingly

### Multiple Style Sheets ###
1. If different properties are defined for same selector in multiple stylesheets, the value from last read stylesheet will be used.
2. Example: If external stylesheet defines h1 color as navy and internal stylesheet defines h1 color as orange and if internal stylesheet appears after the link to external stylesheet, the color of h1 would be orange.

		<head>
			<link rel="stylesheet" type="text/css" href="mystyle.css" />
			<style>
				h1 {
					color: orange;
				}
			</style>
		</head>

### Cascading Order ###
1. If more than one style is specified for an HTML element:
	1. All styles will "cascade" into a new virtual stylesheet by the following rules (highest priority on top)
		1. Inline style (inside an HTML element) (highest priority - overrides all other styles)
		2. External and internal style sheets (in head section)
		3. Browser default

## CSS Colors ##
1. Specified by:
	1. color name: `red`
	2. RGB value: `rgb(255, 0, 0)`
	3. HEX value: `#ff0000`

### Color Names ###
1. Names:
	1. red
	2. green
	3. blue
	4. orange
	5. yellow
	6. cyan
	7. black
8. Color names are Insensitive (Red is same as red which is same as RED)
9. [140 color names](https://www.w3schools.com/colors/colors_names.asp)

### RGB (Red, Green, Blue) ###
1. Syntax: `rgb(red, green, blue)`
	1. Prameter: 0-255 (intensity)
2. RGB equivalents:
	1. Red: `rgb(255, 0, 0)`
	2. Green: `rgb(0, 255, 0)`
	3. Blue: `rgb(0, 0, 255)`
	4. Orange: `rgb(255, 165, 0)`
	5. Yellow: `rgb(255, 255, 0)`
	6. Cyan?: `rgb(0, 255, 255)`
	7. Black: `rgb(0, 0, 0)`
	8. Grey: `rgb(128, 128, 128)`
	9. White: `rgb(255, 255, 255)`

### Hexadecimal Colors ###
1. Syntax: `#RRGGBB`
	1. `RR`: Red
	2. `GG`: Green
	3. `BB`: Blue
2. Range: 00 - FF
3. Example: `#FF0000`
4. Hex values are case insensitive: ff is same as FF which are same as fF and Ff
5. Hex equivalents:
	1. Red: #FF0000
	2. Green: #00FF00
	3. Blue: #0000FF
	4. Orange: #FFA500
	5. Yellow: #FFFF00
	6. Cyan: #00FFFF
	7. Black: #000000
	8. Grey: #808080
	9. White: #FFFFFF
6. [Advanced Colors](https://www.w3schools.com/css/css3_colors.asp)

## CSS Backgrounds ##
1. Used to define background effects of elements
2. Properties:
	1. `background-color`
	2. `background-image` **(M)**
	3. `background-repeat` **(M)**
	4. `background-attachment` **(M)**
	5. `background-position` **(M)**

### Background Color ###
1. Specifies background color of an element
2. Setting the background color of a page

		body {
			background-color: lightblue;
		}

3. Example:

		h1 {
			background-color: green;
		}

		div {
			background-color: lightblue;
		}

		p {
			background-color: yellow;
		}

### Background Image ###
1. `background-image`: defines an image to use as a background of an element.
	1. Image is repeated by default to cover the element
2. Example:

		body {
			background-image: url("https://www.w3schools.com/css/paper.gif");
		}

### Background Image - Repeat Horizontally or Vertically ###
1. Default: `background-image`
2. Repeating an image horizontally:

		body {
			background-image: url("https://www.w3schools.com/css/gradient_bg.png")
			background-repeat: repeat-x;
		}

### Background Image - Set position and no-repeat ###
1. Example:

		body {
			background-image: url("https://www.w3schools.com/css/img_tree.png");
			background-repeat: no-repeat;
		}		

2. Changing the position of the image using `background-position` **(M)**

		body {
			background-image: url("https://www.w3schools.com/css/img_tree.png");
			background-repeat: no-repeat;
			background-position: top right;
		}

### Background Image - Fixed position ###
1. Background image can be fixed and will not roll with the page using `background-attachment: fixed;` **(M)**
2. Example:

		body {
			background-image: url("https://www.w3schools.com/css/img_tree.png");
			background-repeat: no-repeat;
			background-position: top right;
			background-attachment: fixed;
		}

### Background - Shorthand property ###
1. Shorthand property: Used to specify all properties in one single property.
2. `background` **(M)** is a shorthand property
3. Example:

		body {
			background: #ffffff url("https://www.w3schools.com/css/img_tree.png") no-repeat right top;
		}

4. Order: (even if properties are missed, order must be maintained)
	1. `background-color`
	2. `background-image`
	3. `background-repeat`
	4. `background-attachment`
	5. `background-position`

### All CSS Background Properties ###
1. `background`
2. `background-attachment`
3. `background-color`
4. `background-image`
5. `background-position`
6. `background-repeat`

## CSS Borders ##
### CSS Border Properties ###
1. `border`: property used to specify style, width, color or element's border.

### Border Style ###
1. `border-style` **(M)**: specifies the kind of border to display
	1. `dotted`
	2. `dashed`
	3. `solid`
	4. `double`: double border
	5. `groove`: 3D grooved border (effect depends on border-color)
	6. `ridge`: 3D ridged border
	7. `inset`: 3D inset border
	8. `outset`: 3D outset border
	9. `none`: no border
	10. `hidden`: hidden border
2. Example:

		p.dotted { border-style: dotted; }
		p.dashed { border-style: dashed; }
		p.solid { border-style: solid; }
		p.double { border-style: double; }
		p.groove { border-style: groove; }
		p.ridge { border-style: ridge; }
		p.inset { border-style: inset; }
		p.outset { border-style: outset; }
		p.none { border-style: none; }
		p.hidden { border-style: hidden; }
		p.mix { border-style: dotted dashed solid double; }

### Border Width ###
1. `border-width` **(M)**: specifies width of the four borders
2. Width can be specific size (px, pt, cm, em, ...) or pre defined values (thin, medium, thick)
3. Four values: top border, right border, bottom border, left border
4. Example:

		p.one {
			border-style: solid;
			border-width: 5px;
		}

		p.two {
			border-style: solid;
			border-width: medium;
		}

		p.three {
			border-style: solid;
			border-width: 2px 10px 4px 20px;
		}

### Border Color ###
1. `border-color` **(M)**: to set border color
	1. It can have one to four values
2. If it is not set, it inherits the color of the element
3. Example:

		p.one {
			border-style: solid;
			border-color: red;
		}

		p.two {
			border-style: solid;
			border-color: green;
		}

		p.three {
			border-style: solid;
			border-color: red green blue yellow;
		}

### Border - Individual Sides ###
1. Different properties for each side:
	1. `border-top-style`
	2. `border-right-style`
	3. `border-bottom-style`
	4. `border-left-style`
2. Example:

		p {
			border-top-style: dotted;
			border-right-style: solid;
			border-bottom-style: dotted;
			border-left-style: solid;
		}

3. Example:

		p {
			border-style: dotted solid;
		}

4. Order:
	1. Top border
	2. Right border
	3. Bottom border
	4. Left border
5. If three values:
	1. Top border
	2. Right and left border
	3. Bottom border
6. If two values:
	1. Top and bottom border
	2. Right and left border
7. If one value:
	1. All four borders

### Border - Shorthand Property ###
1. `border`: shorthand property
	1. Order:
		1. `border-width`
		2. `border-style` (required)
		3. `border-color`
2. Example:

		p {
			border: 5px solid red;
		}

3. Border properties for just one side:

		p {
			border-left: 6px solid red;
			background-color: lightgrey;
		}

4. Bottom border:

		p {
			border-bottom: 6px solid red;
			background-color: lightgrey;
		}

### Rounded Borders ###
1. `border-radius` **(M)**: for rounded borders
2. Example:

		p {
			border: 2px solid red;
			border-radius: 5px;
		}

### More Examples ###
1. [Top border properties in one declaration](https://www.w3schools.com/css/tryit.asp?filename=trycss_border-top)
2. [Style of bottom border](https://www.w3schools.com/css/tryit.asp?filename=trycss_border-bottom-style)
3. [Width of left border](https://www.w3schools.com/css/tryit.asp?filename=trycss_border-left-width)
4. [Color of four borders](https://www.w3schools.com/css/tryit.asp?filename=trycss_border-color)
5. [Color of right border](https://www.w3schools.com/css/tryit.asp?filename=trycss_border-right-color)

### All CSS Border Properties ###
1. `border`
2. `border-bottom`
3. `border-bottom-color`
4. `border-bottom-style`
5. `border-bottom-width`
6. `border-color`
7. `border-left`
8. `border-left-color`
9. `border-left-style`
10. `border-left-width`
11. `border-radius`
12. `border-right`
13. `border-right-color`
14. `border-right-style`
15. `border-right-width`
16. `border-style`
17. `border-top`
18. `border-top-color`
19. `border-top-style`
20. `border-top-width`
21. `border-width`

## CSS Margins ##
### CSS Margins ###
1. `margin`: generates space around elements.
	1. It sets white space outside the element border
2. There are CSS properties to set margin for each side (top, right, bottom, left)

### Margin - Individual Sides ###
1. For each side:
	1. `margin-top`
	2. `margin-right`
	3. `margin-bottom`
	4. `margin-left`
2. Possible values:
	1. `auto`
	2. length in px, pt, cm, ...
	3. `%` of width of containing element
	4. `inherit`: margin should be inherited from parent
3. Example:

		p {
			margin-top: 100px;
			margin-bottom: 100px;
			margin-right: 150px;
			margin-left: 80px;
		}

### Margin - Shorthand Property ###
1. `margin`: shorthand property
2. Order:
	1. `margin-top`
	2. `margin-right`
	3. `margin-bottom`
	4. `margin-left`
3. Example:

		p {
			margin: 100px 150px 100px 80px;
		}

4. If four values are mentioned:
	1. top margin
	2. right margin
	3. bottom margin
	4. left margin
5. If three values are mentioned:
	1. top margin
	2. right and left margin
	3. bottom margin
6. If two values are mentioned:
	1. top and bottom margin	
	2. right and left margin
7. If single value is mentioned
	1. all margins

### The auto Value ###
1. `auto`: horizontally center element within it's container
	1. Remaining space is split between left and right margins
2. Example:

		div {
			width: 300px;
			margin: auto;
			border: 1px solid red;
		}

### The inherit Value ###
1. Inherit margin from parent
2. Example:

		div.container {
			border: 1px solid red;
			margin-left: 100px;
		}

		p.one {
			margin-left: inherit;
		}

### Margin Collapse ###
1. Top and bottom margins are sometimes collapsed into a single margin that is equal to the largest of the two.
2. Example:

		h1 {
			margin: 0 0 50px 0;
		}

		h2 {
			margin: 20px 0 0 0;
		}

		...
		<h1>Heading 1</h1>
		<h2>Heading 2</h2>

	1. Since bottom margin of h1 is 50px and top margin of h2 is 20px, since h2 is just below h1, the bottom margin of h1 and top margin of h2 are collapsed into a single margin of 50px.

### All CSS Margin Properties ###
1. `margin`
2. `margin-bottom`
3. `margin-left`
4. `margin-right`
5. `margin-top`

## CSS Padding ##
### CSS Padding ###
1. Used to generate space around content (inside the border)
2. There are CSS properties for setting each side (top, right, bottom, left)

### Padding - Individual Sides ###
1. Properties for each side of an element:
	1. `padding-top`
	2. `padding-right`
	3. `padding-bottom`
	4. `padding-left`
2. Values:
	1. length: px, pt, cm, ...
	2. `%` of the width of the container
	3. `inherit`: padding should be inherited from the parent
3. Example:
	
		p {
			padding-top: 50px;
			padding-right: 30px;
			padding-bottom: 50px;
			padding-left: 80px;
		}

### Padding - Shorthand Property ###
1. `padding`: shorthand property
2. Order:
	1. `padding-top`
	2. `padding-right`
	3. `padding-bottom`
	4. `padding-left`
3. Example:

		p {
			padding: 50px 30px 50px 80px;
		}

4. If 4 values are specified:
	1. Top
	2. Right
	3. Bottom
	4. Left
5. If 3 values are specified:
	1. Top
	2. Right and left
	3. Bottom
6. If 2 values are specified:
	1. Top and bottom
	2. Right and left
7. If 1 value is specified:
	1. All 4

### More Examples ###
1. [Padding properties in one declaration](https://www.w3schools.com/css/tryit.asp?filename=trycss_padding)
2. [Set left padding](https://www.w3schools.com/css/tryit.asp?filename=trycss_padding-left)
3. [Set top padding](https://www.w3schools.com/css/tryit.asp?filename=trycss_padding-top)
4. [Set bottom padding](https://www.w3schools.com/css/tryit.asp?filename=trycss_padding-bottom)
### All CSS Padding Properties ###
1. `padding`
2. `padding-bottom`
3. `padding-left`
4. `padding-right`
5. `padding-top`

## CSS Height and Width ##
### Setting height and width ###
1. `height`, `width`: set height and width of an element
2. Default: `auto` (browser calculates the height and width).
3. Specifying length: px, cm, ...,
4. Specifying % of containing block
5. Example:

		div {
			height: 200px;
			width: 50%;
			background-color: powderblue;
		}

6. Height and width properties do not include
	1. padding
	2. borders
	3. margins
7. They set area inside padding, border, margin

### Setting max-width ###
1. `max-width` **(M)**
	1. length: px, cm, ...
	2. % of containing block
	3. none (default: no maximum width)
2. If specific length is given: If browser window is smaller than the width of the element, a scroll bar will be added.
3. `max-width` overrides `width`
4. Example:

		div {
			max-width: 500px;
			height: 100px;
			background-color: powderblue;
		}

### Try it Yourself - Examples ###
1. [Set height and width](https://www.w3schools.com/css/tryit.asp?filename=trycss_dim_height)
2. [Set height and width of an image using percent](https://www.w3schools.com/css/tryit.asp?filename=trycss_dim_height_percent)
3. [Set min-width and max-width of an element](https://www.w3schools.com/css/tryit.asp?filename=trycss_dim_max-width)
4. [Set min-height and max-height](https://www.w3schools.com/css/tryit.asp?filename=trycss_dim_max-height)

### All CSS Dimension Properties ###
1. `height`
2. `max-height`
3. `max-width`
4. `min-height`
5. `min-width`
6. `width`

## CSS Box Model ##
### CSS Box Model ###
1. HTML elements can be considered as boxes.
2. Box model: used to talk about design and layout
3. CSS Box: a box that wraps around every HTML element
	1. Content: margins, borders, padding, actual content

	![boxmodel-image](boxmodel-image.png)

4. Parts:
	1. Content: content where text and images appear
	2. Padding: An area around the content.
	3. Border: border that goes around padding and content
	4. Margin: Area outside border. margin is transparent
5. Example:
		
		div {
			width: 300px;
			border: 25px solid green;
			padding: 25px;
			margin: 25px;
		}

### Width and Height of an Element ###
1. To calculate full width and height, add content width and height, border, margin and padding
2. Example: Styling a div with total width of 350px

		div {
			width: 320px;
			padding: 10px;
			border: 5px solid gray;
			margin: 0;
		}

	1. Total width = width + left padding + right padding + left margin + right margin + left border + right border
3. Note: IE-8 includes padding and border in the width property

## CSS Outline ##
### CSS Outline ###
1. `outline` **(M)**: specifies style, color and width of an outline
	1. It is a line that is drawn around an element (outside borders) to make the element stand out

### Outline Style ###
1. `outline-style` **(M)**
	1. `dotted`
	2. `dashed`
	3. `solid`
	4. `double`
	5. `goove`
	6. `ridge`
	7. `inset`
	8. `outset`
	9. `none`
	10. `hidden`
2. Example:

		p {
			border: 1px solid black;
			outline-color: red;
		}

		p.dotted { outline-style: dotted; }
		p.dashed { outline-style: dashed; }
		p.solid { outline-style: solid; }
		p.double { outline-style: double; }
		p.groove { outline-style: groove; }
		p.ridge { outline-style: ridge; }
		p.inset { outline-style: inset; }
		p.outset { outline-style: outset; }

### Outline Color ###
1. `outline-color` **(M)**: sets color of the outline
2. colors:
	1. name
	2. `rgb(r, g, b)`
	3. `#RRGGBB`
	4. `invert`: color inversion (outline is visible regardless of color background)

### Outline Width ###
1. `outline-width`: width of outline
	1. size: px, pt, cm, em, ...
	2. thin, medium, thick
2. Example:

		p { border: 1px solid black; }
	
		p.one {
			outline-style: double;
			outline-color: red;
			outline-width: thick;
		}

		p.two {
			outline-style: double;
			outline-color: green;
			outline-width: 3px;
		}

### Outline - Shorthand Property ###
1. `outline`: shorthand property
2. Order:
	1. `outline-width`
	2. `outline-style` (required)
	3. `outline-color`
3. Example:

		p {
			border: 1px solid black;
			outline: 5px dotted red;
		}

### All CSS Outline Properties ###
1. `outline`
2. `outline-color`
3. `outline-offset`
4. `outline-style`
5. `outline-width`

## CSS Text ##
### Text Color ###
1. `color`: sets color of text
	1. Values:
		1. name
		2. `rgb(r, g, b)`
		3. `#RRGGBB`
2. [CSS Color Values](https://www.w3schools.com/cssref/css_colors_legal.asp)
3. Example:

		body {
			color: blue;
		}

		h1 {
			color: green;
		}

	1. default color is defined in the body selector
4. Note: For W3C compliance, specify `background-color` as well

### Text Alignment ###
1. `text-align`: horizontal alignment
	1. Left align (default if text direction is left to right)
	2. Right align (default if text direction is right to left)
	3. Center
	4. Justify (each line is stretched to have the same width and left and right margins are straight lines)
2. Example:

		h1 {
			text-align: center;
		}

		h2 {
			text-align: left;
		}

		h3 {
			text-align: right;
		}

		h4 {
			text-align: justify;
		}

### Text Decoration ###
1. `text-decoration` **(M)**: is used to set or remove decouration from text
	1. `text-decoration: none;`: removes underlines from links
2. Example:

		a {
			text-decoration: none;
		}

3. Other text decoration values:
	1. `overline`
	2. `line-through`
	3. `underline`
4. Example:

		h1 {
			text-decoration: overline;
		}

		h2 {
			text-decoration: line-through;
		}

		h3 {
			text-decoration: underline;
		}

### Text Transformation ###
1. `text-transform` **(M)**: Used to specify upper case and lower case letters in a text
	1. Turn everything to uppercase (`uppercase`)
	2. Turn everything to lowercase (`lowercase`)
	3. Capitalize first letter of each word (`capitalize`)
2. Example:

		p.uppercase {
			text-transform: uppercase;
		}

		p.lowercase {
			text-transform: lowercase;
		}

		p.capitalize {
			text-transform: capitalize;
		}

### Text Indentation ###
1. `text-indent` **(M)**: Used to specify indentation of first line of a text:
2. Example:

		p {
			text-indent: 50px;
		}

### Letter Spacing ###
1. `letter-spacing` **(M)**: to specify space between characters in a text.
2. Example:

		h1 {
			letter-spacing: 3px;
		}

		h2 {
			letter-spacing: -3px;
		}

### Line Height ###
1. `line-height` **(M)**: specifies space between lines
2. Example:

		p.small {
			line-height: 0.8;
		}

		p.big {
			line-height: 1.8;
		}

### Text Direction ###
1. `direction` **(M)**
2. Example:

		div {
			direction: rtl;
		}

### Word Spacing ###
1. `word-spacing` **(M)**: Used to specify space between words in a text
2. Example:

		h1 {
			word-spacing: 10px;
		}

### Text Shadow ###
1. `text-shadow` **(M)**: Adds shadow to text
	1. Horizontal shadow
	2. Vertical shadow
	3. Color of shadow
2. Example:

		h1 {
			text-shadow: 3px 2px red;
		}

### More Examples ###
1. [Disable text wrapping inside an element](https://www.w3schools.com/css/tryit.asp?filename=trycss_text_white-space)
2. [Vertical alignment of an image](https://www.w3schools.com/css/tryit.asp?filename=trycss_vertical-align)

### All CSS Text Properties ###
1. `color`
2. `direction`
3. `letter-spacing`
4. `line-height`
5. `text-align`
6. `text-decoration`
7. `text-indent`
8. `text-shadow`
9. `text-transform`
10. `text-overflow`: Specifies how overflowed content that is not displayed should be signaled to the user.
11. `unicode-bidi`: Used with `direction` to set or return whether the text should be overridden to support multiple languages in the same document.
12. `vertical-align`: sets vertical alignment
13. `white-space`: specifies how white-space inside an element is handled
14. `word-spacing`

## CSS Fonts ##
1. To define font family, boldness, size, style

### Difference Between Serif and Sans-serif Fonts ###
1. Sans-serif: plain
2. Serif: decorated

	![serif](serif.gif)


### CSS Font Families ###
1. Two types of font-family names
	1. generic family: group of font families with similar look (Serif, Monospace)
	2. font family: specific font family (Times New Roman, Arial)
2. Generic Family, Font family, Description
	1. Serif, (Times New Roman, Georgia), They have small lines at the ends of some characters
	2. Sans-serif, (Arial, Verdana), "Sans" means without - these fonts do not have lines at the ends of characters
	3. Monospace, (Courier New, Lucida Console), All monospace characters have the same width
3. Note: sans-serif fonts are easer to read

### Font Family ###
1. `font-family`: should hold several font names as a fallback
	1. If browser does not support first one, it tries next font, ...
	2. Try with font we want and end with generic family (Browser picks a similar font in the generic family if no other fonts are available)
2. If font name has multiple words, it must have double quotes ("Times New Roman")
3. Example:

		p {
			font-family: "Times New Roman", Times, serif;
		}

	1. [Web Safe Font Combinations](https://www.w3schools.com/cssref/css_websafe_fonts.asp)

### Font Style ###
1. `font-style` **(M)**: mostly for italic text
	1. Three values:
		1. `normal`
		2. `italic`
		3. `oblique`: leaning text
2. Example:

		p.normal {
			font-style: normal;
		}

		p.italic {
			font-style: italic;
		}

		p.oblique {
			font-style: oblique;
		}

### Font Size ###
1. `font-size`: size of the text
	1. Do not make paragraphs look like headings and vice versa
2. It can be absolute or relative size
	1. Absolute size: Specific size and user cannot change in browsers (bad for accessibility)
		1. Use it when physical size of output is known
	2. Relative size:
		1. Size relative to surrounding elements
		2. Allows user to change text size in browsers

### Set Font Size With Pixels ###
1. Example:

		h1 {
			font-size: 40px;
		}

		h2 {
			font-size: 30px;
		}

		p {
			font-size: 14px;
		}

	1. Note: Zoom tool can still be used to resize the entire page if pixels are used.

### Set Font Size With Em ###
1. It allows users to resize text in browser (instead of pixels)
2. 1em = current font size. (default: 16px = 1em)
	1. em = pixels/16
3. Example:

		h1 {
			font-size: 2.5em; /* 40px/16 = 2.5em */
		}

		h2 {
			font-size: 1.875em /* 30px/16 = 1.875em */
		}

		p {
			font-size: 0.875em /* 14px/16 = 0.875em */
		}

	1. Problem with old IE: becomes larger than it should or smaller than it should when resized.

### Use a Combination of Percent and Em ###
1. Set default font-size in percent for `<body>`
2. Use em to define for other elements

		body {
			font-size: 100%;
		}

		h1 {
			font-size: 2.5em;
		}

		h2 {
			font-size: 1.875em;
		}

		p {
			font-size: 0.875em;
		}

### Font Weight ###
1. `font-weight` **(M)**
	1. `normal`
	2. `bold`
2. Example:

		p.normal {
			font-weight: normal;
		}

		p.bold {
			font-weight: bold;
		}

### Font Variant ###
1. `font-variant` **(M)**: whether or not text should be displayed in small-caps font
	1. All lowercase letters are converted to upper-case letters but coverted uppercase letters appear in smaller font size than original uppercase letters.
2. Values;
	1. `normal`
	2. `small-caps`
3. Example:

		p.small {
			font-variant: small-caps;
		}

### More Examples ###
1. [All font properties in one declaration](https://www.w3schools.com/css/tryit.asp?filename=trycss_font)
	1. Shorthand property `font: <style> <weight> <size> <family>`

### All CSS Font Properties ###
1. `font`
2. `font-family`
3. `font-size`
4. `font-style`
5. `font-variant`
6. `font-weight`

## CSS Icons ##
### How to Add Icons ###
1. Using Icon library (Font Awesome)
2. Add name of specified icon class to inline HTML element (`<i>` or `<span>`)
3. Icons are scalable vectors and the following properties can be set:
	1. size
	2. color
	3. shadow
	4. ...

### Font Awesome Icons ###
1. Add the following line:

		<link rel="stylesheet" herf="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

2. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
			</head>
			<body>
				<i class="fa fa-cloud"></i>
				<i class="fa fa-heart"></i>
				<i class="fa fa-car"></i>
				<i class="fa fa-file"></i>
				<i class="fa fa-bars"></i>
			<body>
		</html>

### Bootstrap Icons ###
1. Glyphicons:
2. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
			</head>
			<body>
				<i class="glyphicon glyphicon-cloud"></i>
				<i class="glyphicon glyphicon-remove"></i>
				<i class="glyphicon glyphicon-user"></i>
				<i class="glyphicon glyphicon-envelope"></i>
				<i class="glyphicon glyphicon-thumbs-up"></i>
			</body>
		</html>

### Google Icons ###
1. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
			</head>
			<body>
				<i class="material-icons">cloud</i>
				<i class="material-icons">favorite</i>
				<i class="material-icons">attachment</i>
				<i class="material-icons">computer</i>
				<i class="material-icons">traffic</i>
			</body>
		</html>
2. [Icon Tutorial](https://www.w3schools.com/icons/default.asp): For complete list

## CSS Links ##
### Styling Links ###
1. Links can be styled with any CSS property (`color`, `font-family`, `background`)
2. Example:

		a {
			color: hotpink;
		}

3. Links can be styled differently based on what state they are in:
	1. Four states:
		1. `a:link`: unvisited link
		2. `a:visited`
		3. `a:hover`
		4. `a:active`
4. Example:

		a:link {
			color: red;
		}

		a:visited {
			color: green;
		}

		a:hover {
			color: hotpink;
		}

		a:active {
			color: blue;
		}
	
5. a:hover must come after a:link and a:visited
6. a:active must come after a:hover

### Text Decoration ###
1. `text-decoration`: usually used to remove underlines from links
2. Example:

		a:link {
			text-decoration: none;
		}

		a:visited {
			text-decoration: none;
		}

		a:hover {
			text-decoration: none;
		}

		a:active {
			text-decoration: none;
		}

### Background Color ###
1. `background-color`: specify background color for links
2. Example:

		a:link {
			background-color: yellow;
		}

		a:visited {
			background-color: cyan;
		}

		a:hover {
			background-color: lightgreen;
		}

		a:active {
			background-color: hotpink;
		}

### Advanced - Link Buttons ###
1. Displaying links as boxes or buttons:

		a:link, a:visited {
			background-color: #f44336;
			color: white;
			padding: 14px 25px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
		}

		a:hover, a:active {
			background-color: red;
		}

### More Examples ###
1. [Add different styles to hyperlinks](https://www.w3schools.com/css/tryit.asp?filename=trycss_link2)
2. [Advanced - Creation of link button with borders](https://www.w3schools.com/css/tryit.asp?filename=trycss_link_advanced2)

## CSS Lists ##
### HTML Lists and CSS List Properties ###
1. Two types of lists:
	1. Unordered lists: List items marked with bullets
	2. Orderd lists: list items marked with numbers or letters
2. CSS list properties can be used to do the following:
	1. Set different list item markers for ordered lists
	2. Set different list item markers for unorderd lists
	3. Set an image as list item marker
	4. Add background colors to lists and list items

### Different List Item Markers ###
1. `list-style-type`: specifies type of list item marker
2. Example:

		ul.a {
			list-style-type: circle;
		}

		ul.b {
			list-style-type: square;
		}

		ol.c {
			list-style-type: upper-roman;
		}

		ol.d {
			list-style-type: lower-alpha;
		}

### An Image as The List Item Marker ###
1. `list-style-image` **(M)**: image as list item marker
2. Example:

		ul {
			list-style-image: url('sqpurple.gif');
		}

### Position The List Item Markers ###
1. `list-style-position` **(M)**
	1. Specifies if list item markers should appear inside or outside content flow(?)
2. Example:

		ul {
			list-style-position: inside;
		}

### Remove Default Settings ###
1. `list-style-type: none;`: to remove markerts/ bullets.
2. Use `margin: 0;` and `padding: 0` to remove default margin and padding
3. Example:

		ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
		}

### List - Shorthand property ###
1. `list-style` **(M)**: shorthand property
	1. Order:
		1. `list-style-type` (displayed if image cannot be displayed)
		2. `list-style-position`
		3. `list-style-image`
2. Example:

		ul {
			list-style: square inside url('sqpurple.gif');
		}

### Styling List With Colors ###
1. Properties added to `<ol>` and `<ul>` affect the entire list
2. Properties added to `<li>` affect only the list item
3. Example:

		ol {
			background: #ff9999;
			padding: 20px;
		}

		ul {
			background: #3399ff;
			padding: 20px;
		}

		ol li {
			background: #ffe5e5;
			padding: 5px;
			margin-left: 35px;
		}

		ul li {
			background: #cce5ff;
			margin: 5px;
		}

### More Examples ###
1. [Customized list with a red left border](https://www.w3schools.com/css/tryit.asp?filename=trycss_list-style-red-border)
2. [Full-width bordered list](https://www.w3schools.com/css/tryit.asp?filename=trycss_list-style-border)
3. [All the different list-item markers for lists](https://www.w3schools.com/css/tryit.asp?filename=trycss_list-style-type_all)

### All CSS List Properties ###
1. `list-style`
2. `list-style-image`
3. `list-style-position`
4. `list-style-type`

## CSS Tables ##
### Table Borders ###
1. `border`: Use it to specify table borders
2. Example:

		table, th, td {
			border: 1px solid black;
		}

### Collapse Table Borders ###
1. `border-collapse`: whether table borders should be collapsed into a single border.
2. Example:

		table {
			border-collapse: collapse;
		}

		table, th, td {
			border: 1px solid black;
		}

3. If you want border only for table, specify border for `table`

		table {
			border: 1px solid black;
		}

### Table Width and Height ###
1. `width`, `height`: for table
2. Example:

		table {
			width: 100%;
		}

		th {
			height: 50px;
		}

### Horizontal Alignment ###
1. `text-align`: sets horizontal alignment (left, right, center) of `<th>` or `<td>`
	1. Default: `<th>` are center aligned. `<td>` are left aligned.
2. Example:

		th {
			text-align: left;
		}

### Vertical Alignment ###
1. `vertical-align` **(M)**
	1. top, bottom or middle (default for `<th>` and `<td>`)
2. Example:

		td {
			height: 50px;
			vertical-align: bottom;
		}

### Table Padding ###
1. `padding`: used to control space between border and content
2. Example:

		th, td {
			padding: 15px;
			text-align: left;
		}

### Horizontal Dividers ###
1. `border-bottom`: for `<th>` and `<td>`
2. Example:

		th, td {
			border-bottom: 1px solid #ddd;
		}

### Hoverable Table ###
1. `tr:hover`: To highlight table rows on mouse over
2. Example:

		tr:hover { background-color: #f5f5f5; }

### Striped Tables ###
1. `nth-child()`: To style even or odd table rows:
2. Example:

		tr:nth-child(even) { background-color: #f2f2f2; }

### Table Color ###
1. Example:

		th {

		}

### Responsive Table ###
1. Responsive table will display a horizontal scroll bar if screen is too small to display the full content
2. Add a container `<div>` around `<table>` with style `overflow-x: auto;`

		<div style="overflow-x: auto;">
			<table>
				... table content ...
			</table>
		</div>

### More Examples ###
1. [Make a fancy table](https://www.w3schools.com/css/tryit.asp?filename=trycss_table_fancy)
2. [Set the position of the table caption](https://www.w3schools.com/css/tryit.asp?filename=trycss_table_caption-side)

### CSS Table Properties ###
1. `border`
2. `border-collapse`
3. `border-spacing`
4. `caption-side`: specifies placement of a table caption

		caption {
			caption-side: bottom;
		}

		<table ...>
			<caption>Table 1.1 Customers</caption>
			...
		</table>

5. `empty-cells`: Specifies whether or not to display borders and background on empty cells in a table

		empty-cells: show|hide|initial|inherit;

6. `table-layout`: sets layout algorithm to be used for a table

		table-layout: auto|fixed|initial|inherit;

## CSS Layout - The display Property ##
1. `display`: most important property for controlling layout

### The display Property ###
1. `display` specifies if or how an element is displayed
	1. Every element has a default display value which depends on the element type
		1. `block`
		2. `inline`

### Block-level Elements ###
1. It starts on a new line and takes up the entire width available (stretches out to left and right as far as it can)
2. Block-level elements:
	1. `<div>`
	2. `<h1>-<h6>`
	3. `<p>`
	4. `<form>`
	5. `<header>`
	6. `<footer>`
	7. `<section>`

### Inline Elements ###
1. An inline element does not start on a newline and takes up only as much width as necessary.
2. Inline elements:
	1. `<span>`
	2. `<a>`
	3. `<img>`

### Display: none; ###
1. `display: none;`: used to hide elements without deletion and recreation.
	1. `<script>` uses `display: none;` as default

### Override The Default Display Value ###
1. We can change inline element to block element and vice-versa
2. Example: Make `<li>` elements inline for menus

		li {
			display: inline;
		}

	1. Note: changing `display` does not change the kind of element it is. An `inline` element with `display: block;` does not allow other `block` elements in it.
3. Example: Display `span` elements as `block` elements

		span {
			display: block;
		}
4. Example:

		a {
			display: block;
		}

### Hide an Element - display:none or visibility:hidden?
1. `dislay: none;` hides the element and the page will be displayed as if the element does not exist
2. Example:

		h1.hidden {
			display: none;
		}

3. `visibility: hidden;` **(M)**: hides the element but it takes up the space as before.
4. Example:

		h1.visibility {
			visibility: hidden;
		}

### More Examples ###
1. [Differences between display: none; and visibility: hidden;](https://www.w3schools.com/css/tryit.asp?filename=trycss_display)
2. [Using CSS with JavaScript to show content](https://www.w3schools.com/css/tryit.asp?filename=trycss_display_js)

### CSS Display/Visibility Properties ###
1. `display`: should be displayed or not
2. `visibility`: should be visible or not

## CSS Layout - width and max-width ##
### Using width, max-widht and margin: auto; ###
1. Setting `width` of block level elements prevents it from stretching out to the edges of it's container.
2. `margin` when set to `auto` horizontally centers the element within it's container
	1. Element takes specified width and remaining space will be split between two margins.
3. `<div>`: if browser window is smaller than the width, a horizontal scroll bar is added.
	1. Use `max-width` instead
		1. If window size is greater than the `max-width`, the element will have width equal to `max-width`
		2. If window size is less than the `max-width`, the element will have a width less than `max-width`
4. Example:

		div.ex1 {
			width: 500px;
			margin: auto;
			border: 3px solid #73AD21;
		}

		div.ex2 {
			max-width: 500px;
			margin: auto;
			border: 3px solid #73AD21;
		}

## CSS Layout - The position Property ##
1. `position` **(M)**: Specifies type of position property for an element:
	1. `static`
	2. `relative`
	3. `fixed`
	4. `absolute`

### The position property ###
1. `position` property should be set first in order to position an element to `top`, `bottom`, `right` or `left`

### position: static; ###
1. `static`: default:
	1. Elements are not affected by `top`, `right`, `bottom` and `left` properties
	2. Positioning is according to the normal flow of the page (no special positioning)
2. Example:

		div.static {
			position: static;
			border: 3px solid #73AD21;
		}

### position: relative; ###
1. `position: relative;`: positioning is relative to it's normal position
	1. Setting `top`, `left`, `right`, `bottom` will cause it be adjusted away from its normal position.
2. Other elements will not be adjusted to fit into gap left by the element.
3. Example:

		div.relative {
			position: relative;
			left: 30px;
			border: 3px solid #73AD21;
		}

### position: fixed; ###
1. `position: fixed;`: Element is positioned relative to the view port
	1. It always stays in the same place even if the page is scrolled
	2. Use `top`, `right`, `left`, and `bottom` to position the element
	3. Fixed element does not leave any gap in the page
2. Example:

		div.fixed {
			position: fixed;
			bottom: 0;
			right: 0;
			width: 300px;
			border: 3px solid #73AD21;
		}

### position: absolute; ###
1. `position: absolute;`: Element is positioned relative to it's nearest positioned ancestor.
	1. If the nearest ancestor is not positioned, the elment uses the document `<body>` and moves along with page scrolling
	2. Positioned element: anything except `static`
2. Example:

		div.relative {
			position: relative;
			width: 400px;
			height: 200px;
			border: 3px solid #73AD21;
		}

		div.absolute {
			position: absolute;
			top: 80px;
			right: 0;
			width: 200px;
			height: 100px;
			border: 3px solid #73AD21;
		}

### Overlapping Elements ###
1. Elements can overlap other elements.
2. `z-index` **(M)**: Specifies stack order of an element (which element should be placed in from of or behind the others)
	1. Values: +ve or -ve
3. Example:

		img {
			position: absolute;
			left: 0px;
			top: 0px;
			z-index: -1;
		}

	1. If `z-index` is not specified for two overlapping elements, the last element defined will overlap the former.

### Positioning Test In an Image ###
1. Top left:

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					.container {
						position: relative;
					}

					.topleft {
						position: absolute;
						top: 8px;
						left: 16px;
						font-size: 18px;
					}

					img {
						width: 100%;
						height: auto;
						opacity: 0.3;
					}
				</style>
			</head>
			<body>
				<h2>Image text</h2>
				<p>Add some text to an image in the top left corner:</p>
			
				<div class="container">
					<img src="https://www.w3schools.com/css/trolltunga.jpg" alt="Norway" width="1000" height="300" />
					<div class="topleft">Top Left</div>
				</div>
			</body>
		</html>

2. Centered:

### More Examples ###
1. [Set the shape of an element](https://www.w3schools.com/css/tryit.asp?filename=trycss_clip)
2. [How to show overflow in an element using scroll](https://www.w3schools.com/css/tryit.asp?filename=trycss_overflow)
3. [How to set the browser to automatically handle overflow](https://www.w3schools.com/css/tryit.asp?filename=trycss_pos_overflow_auto)
4. [Change the cursor](https://www.w3schools.com/css/tryit.asp?filename=trycss_cursor)

### All CSS Positioning Properties ###
1. `bottom`
2. `clip`: clips an absolutely positioned element
3. `cursor`: specifies type of cursor to be displayed
4. `left`: Sets left margin edge
5. `overflow`: specifies what happens if content overflows an element's box
6. `overflow-x`
7. `overflow-y`
8. `position`
9. `right`
10. `top`
11. `z-index`

## CSS Layout - Overflow ##
### CSS Overflow ###
1. `overflow` **(M)**: specify whether to clip content or to add scrollbars when content of an element is too big.
2. Values:
	1. `visible`: default. Overflow is not clipped, it renders outside the element's box.
	2. `hidden`: overflow is clipped. Rest of the content will be invisible.
	3. `scroll`: overflow is clipped. Scrollbar is added to see the rest of the content.
	4. `auto`: overflow is clipped. A scrollbar should be added to see the rest of the content.
3. Note: works only for block elements with a height.
4. Note: OS X Lion: scrollbars are hidden by default and only show when being used.

### Visible ###
1. Example:

		div {
			width: 200px;
			height: 50px;
			background-color: #eee;
			overflow: visible;
		}

### Hidden ###
1. `overflow: hidden;`: overflow is clipped and the rest of the content is hidden.
2. Example:

		div {
			width: 200px;
			height: 50px;
			background-color: #eee;
			overflow: hidden;
		}

### Scroll ###
1. `overflow: scroll;`: overflow is clipped and a scrollbar is added to scroll inside the box. (Adds scrollbars both horizontally and vertically)
2. Example:

		div {
			width: 200px;
			height: 50px;
			background-color: #eee;
			overflow: scroll;
		}

### Auto ###
1. `overflow: auto;`: Adds scrollbar when necessary
2. Example:

		div {
			width: 200px;
			height: 50px;
			background-color: #eee;
			overflow: auto;
		}

### overflow-x and overflow-y ###
1. `overflow-x`, `overflow-y`: to change overflow property horizontally and/ or vertically
	1. `overflow-x`: tells what to do with left/right edges of content.
	2. `overflow-y`: tells what to do with top/bottom edges of content.
2. Example:

		div {
			overflow-x: hidden;  /* Hide horizontal scrollbar */
			overflow-y: scroll;  /* Add vertical scrollbar */
		}

3. `white-space: nowrap;`

## CSS Layout - float and clear ##
1. `float`: specifies whether an element should float or not
2. `clear`: used to control the behavior of floating elements

### The float Property ###
1. Usage: to wrap text around images.
2. Example: An image that floats to the right in a text

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					img {
						float: right;
						margin: 0 0 10px 10px;
					}
				</style>
			</head>
			<body>
				<p>In this example, the image will float to the right in the paragraph, and the text in the paragraph will wrap around the image.</p>

				<p><img src="w3css.gif" alt="W3Schools.com" width="100" height="140">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio, vitae scelerisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa. Fusce luctus vestibulum augue ut aliquet. Mauris ante ligula, facilisis sed ornare eu, lobortis in odio. Praesent convallis urna a lacus interdum ut hendrerit risus congue. Nunc sagittis dictum nisi, sed ullamcorper ipsum dignissim ac. In at libero sed nunc venenatis imperdiet sed ornare turpis. Donec vitae dui eget tellus gravida venenatis. Integer fringilla congue eros non fermentum. Sed dapibus pulvinar nibh tempor porta. Cras ac leo purus. Mauris quis diam velit.</p>
			</body>
		</html>

### The clear Property ###
1. `clear` is used to control the behavior of floating elements.
	1. Default: Elements after the floating element will flow around it.
	2. `clear`: avoids the default behavior
		1. specifies on which sides of an element, the floating elements are not allowed to float.
2. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<style>

				</style>
			</head>
			<body>
				<h2>Without clear</h2>
				<div class="div1">div1</div>
				<div class="div2">div2 - Notice that the div2 element is after div1, in the HTML code. However, since div1 is floated to the left, this happens: the text in div2 is floated around div1, and div2 surrounds the whole thing.</div>

				<h2>Using clear</h2>
				<div class="div3">div3</div>
				<div class="div4">div4 - Using clear moves div4 down below the floated div3. The value "left" clears elements floated to the left. You can also clear "right" and "both".</div>
			</body>
		</html>

### The clearfix Hack ###
1. If an element is taller than the element containing it, and it is floated, it will overflow outiside of its container.
	1. Fix: `overflow: auto;` (needs control on margins and padding)
2. Safer approach:

		.clearfix::after {
			content: "";
			clear: both;
			display: table;
		}

	1. `::after`: pesudo-element
3. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					div {
						border: 3px solid #73AD21;
					}

					.img1 {
						float: right;
					}

					.clearfix::after {
						content: "";
						clear: both;
						display: table;
					}

					.img2 {
						float: right;
					}
				</style>
			</head>
			<body>
				<p>In this example, the image is taller than the element containing it, and it is floated, so it overflows outside of its container:</p>

				<div><img class="img1" src="w3css.gif" alt="W3Schools.com" width="100" height="140">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum...</div>

				<p style="clear:right">Add the clearfix hack to the containing element, to fix this problem:</p>

				<div class="clearfix"><img class="img2" src="w3css.gif" alt="W3Schools.com" width="100" height="140">
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum...
				</div>
			</body>
		</html>

### Web Layout Example ###
1. `float` can be used to do the entire web layouts
2. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					* {
						box-sizing: border-box;
					}

					.header, .footer {
						background-color: grey;
						color: white;
						padding: 15px;
					}

					.column {
						float: left;
						padding: 15px;
					}

					.clearfix::after {
						content: "";
						clear: both;
						display: table;
					}

					.menu {
						width: 25%;
					}

					.content {
						width: 75%;
					}

					.menu ul {
						list-style-type: none;
						margin: 0;
						padding: 0;
					}

					.menu li {
						padding: 8px;
						margin-bottom: 8px;
						background-color: #33b5e5;
						color: #ffffff;
					}

					.menu li:hover {
						background-color: #0099cc;
					}
				</style>
			</head>
			<body>
				<div class="header">
					<h1>Chania</h1>
				</div>

				<div class="clearfix">
					<div class="column menu">
						<ul>
							<li>The Flight</li>
							<li>The City</li>
							<li>The Island</li>
							<li>The Food</li>
						</ul>
					</div>
				</div>

				<div class="column content">
					<h1>The City</h1>
					<p>Chania is the capital of the Chania region on the island of Crete. The city can be divided in two parts, the old town and the modern city.</p>
					<p>You will learn more about web layout and responsive web pages in a later chapter.</p>
				</div>

				<div class="footer">
					<p>Footer Text</p>
				</div>
			</body>
		</html>

### More Examples ###
1. [An image with border and margins that floats to the right in a paragraph](https://www.w3schools.com/css/tryit.asp?filename=trycss_float2)
2. [An image with a caption that floats to the right](https://www.w3schools.com/css/tryit.asp?filename=trycss_float3)
3. [Let the first letter of a paragraph float to the left](https://www.w3schools.com/css/tryit.asp?filename=trycss_float4)
4. [Creation of a horizontal menu](https://www.w3schools.com/css/tryit.asp?filename=trycss_float5)
5. [Creation of a homepage without tables](https://www.w3schools.com/css/tryit.asp?filename=trycss_layout_webpage)

### All CSS Float Properties ###
1. `clear`: Which sides of an element where floating elements are not allowed to float.
2. `float`
3. `overflow`
4. `overflow-x`
5. `overflow-y`

## CSS Layout - inline-block ##
### The inline-block Value ###
1. `inline-block`: Like inline elements but they can have width and height
2. Example: Using float and clear

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					.floating-box {
						float: left;
						width: 150px;
						height: 75px;
						margin: 10px;
						border: 3px solid #73AD21;
					}

					.after-box {
						clear: left;
						border: 3px solid red;
					}
				</style>
			</head>
			<body>
				<h2>The Old Way - using float</h2>

				<div class="floating-box">Floating box</div>
				<div class="floating-box">Floating box</div>
				<div class="floating-box">Floating box</div>
				<div class="floating-box">Floating box</div>
				<div class="floating-box">Floating box</div>
				<div class="floating-box">Floating box</div>
				<div class="floating-box">Floating box</div>
				<div class="floating-box">Floating box</div>

				<div class="after-box">Another box, after the floating boxes...</div>
			</body>
		</html>

3. Using `inline-block`

		.floating-box {
			display: inline-block;
			width: 150px;
			height: 75px;
			margin: 10px;
			border: 3px solid #73AD21;
		}

## CSS Layout - Horizontal & Vertical Align ##
### Center Align Elements ###
1. `margin: auto`: horizontally centers a block element (`<div>`)
2. Setting a width prevents it from stretching out to the edges of it's container
3. Element will take the specified width and the remaining space will be split between the left and right margins.
4. Example:

		.center {
			margin: auto;
			width: 50%;
			border: 3px solid green;
			padding: 10px;
		}

### Center Align Text ###
1. `text-align: center;`
2. Example:

		.center {
			text-align: center;
			border: 3px solid green;
		}

### Center and Image ###
1. Steps:
	1. Make it a block element: `display: block;`
	2. Make margin auto: `margin: auto;`
2. Example:

		img {
			display: block;
			margin: auto;
			width: 40%;
		}

### Left and Right Align - Using position ###
1. `position: absolute;`
2. Example:

		.right {
			position: absolute;
			right: 0px;
			width: 300px;
			border: 3px solid #73AD21;
			padding: 10px;
		}

3. Tip: Define `margin` and `padding` for `<body>` elements. (To avoid visual differences between browsers)
	1. Always set `!DOCTYPE` when using `position`
4. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					body {
						margin: 0;
						padding: 0;
					}

					.container {
						position: relative;
						width: 100%;
					}

					.right {
						position: absolute;
						right: 0px;
						width: 300px;
						background-color: #b0e0e6;
					}
				</style>
			</head>
			<body>
				<h2>Right Align</h2>

				<div class="container">
					<div class="right">
						<p><b>Note: </b>When aligning using the position property, always include the !DOCTYPE declaration! If missing, it can produce strange results in IE browsers.</p>
				</div>
			</body>
		</html>

### Left and Right Align - Using float ###
1. Example:

		body {
			margin: 0;
			padding: 0;
		}

		.right {
			float: right;
			width: 300px;
			border: 3px solid #73AD21;
			padding: 10px;
		}

### Center Vertically - Using padding ###
1. Simple solution: `padding`
2. Example:

		.center {
			padding: 70px 0;
			border: 3px solid green;
		}

3. To center horizontally as well, use:

		.center {
			padding: 70px 0;
			text-align: center;
			border: 3px solid green;
		}

### Center Vertically - Using line-height ###
1. Example:

		.center {
			line-height: 200px;
			height: 200px;
			border: 3px solid green;
			text-align: center;
		}

		/* If the text has multiple lines, add the following: */
		.center p {
			line-height: 1.5;
			display: inline-block;
			vertical-align: middle;
		}

### Center Vertically - Using position & transform ###
1. Use positioning and transform property
2. Example:

		.center {
			height: 200px;
			position: relative;
			border: 3px solid green;
		}

		.center p {
			margin: 0;
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
		}

## CSS Combinators ##
### CSS Combinators ###
1. A combinator explains the relationship between selectors.
	1. A CSS selctor can contain more than one simple selector.
	2. A combinator is included between simple selectors.
2. 4 Combinators:
	1. (space): Descendent selector
	2. `>`: child selector
	3. `+`: Adjacent selector
	4. `~`: general sibling selector

### Descendent Selector ###
1. Matches all elements that are descendents of a specified element.
2. Exmaple: The following matches all `p` elements inside `div`

		div p {
			background-color: yellow;
		}

### Child Selector ###
1. Selects all elements that are immediate children of the specified element.
2. Example: The following selects all immediate children of `<div>` element

		div > p {
			background-color: yellow;
		}

### Adjacent Sibling Selector ###
1. Selects all elements that are adjacent siblings of the specified element (they must have the same parent)
	1. Adjacent: immediately following
2. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					div + p {
						background-color: yellow;
					}
				</style>
			</head>
			<body>
				<div>
					<p>Paragraph 1 in the div.</p>
					<p>Paragraph 2 in the div.</p>
				</div>
	
				<p>Paragraph 3. No in a div.</p> <!-- Only this will be selected -->
				<p>Paragraph 4. No in a div.</p>
			</body>
		</html>

### Genaral Sibling Selector ###
1. Selects all siblings of the specified element
2. Selecting all `p` elements that are siblings of `div` element

		div ~ p {
			background-color: yellow;
		}

3. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					div ~ p {
						background-color: yellow;
					}
				</style>
			</head>
			<body>
				<p>Paragraph 1.</p>
				<div>
					<code>Some code.</code>
					<p>Paragraph 2.</p>
				</div>

				<p>Paragraph 3.</p> <!-- gets selected -->
				<code>Some code.</code>
				<p>Paragraph 4.</p> <!-- gets selected -->
			</body>
		</html>

## CSS Pseudo-class ##
### What are Pseudo-classes? ###
1. pseudo-class is used to define special state of an element.
2. Examples:
	1. Style an element when user mouses over it.
	2. Style visited and unvisited links differently.
	3. Style an element when it gets focus.

### Syntax ###

		selector:pseudo-class {
			property: value;
		}

### Anchor Pseudo-classes ###
1. For links:

		/* unvisited link */
		a:link {
			color: #FF0000;
		}

		/* visited link */
		a:visited {
			color: #00FF00;
		}

		/* mouse over link */
		a:hover {
			color: #FF00FF;
		}

		/* selected link */
		a:active {
			color: #0000FF;
		}

### Pseudo-classes and CSS Classes ###
1. pseudo-classes can be combined with CSS classes.
2. Example:

		a.highlight:hover {
			color: #ff0000;
		}

### Hover on `<div>` ###
1. Example:

		div:hover {
			background-color: blue;
		}

### Simple Tooltip Hover ###
1. Hover over a `<div>` element to show a `<p>` element (like tooltip)
2. Example:

		p {
			display: none;
			background-color: yellow;
			padding: 20px;
		}

		div:hover p {
			display: block;
		}

### CSS - The `:first-child` Pseudo-class ###
1. `:first-child` matches an element that is the first child of another element.

### Match the first `<p>` element ###
1. Example: The following matches `<p>` element that is the first child of any other element.

		p:first-child {
			color: blue;
		}

### Match the first `<i>` element in all `<p>` elements ###
1. Example:

		p i:first-child {
			color: blue;
		}

### Match all `<i>` elements in all first child `<p>` elements ###
1. Example:

		p:first-child i {
			color: blue;
		}

### CSS - The `:lang` Pseudo-class ###
1. `:lang` **(M)**
2. Example: quotation marks for `<q>` elements with `lang="no"`

		<html>
			<head>
				<style>
					q:lang(no) {
						quotes: "~" "~";
					}
				</style>
			</head>
			<body>
				<p>Some text <q lang="no">A quote in a paragraph</q> Some text.</p>
			</body>
		</html>

### More Examples ###
1. [Add different styles to hyperlinks](https://www.w3schools.com/css/tryit.asp?filename=trycss_link2)
2. [Use of :focus](https://www.w3schools.com/css/tryit.asp?filename=trycss_link_focus)

### All CSS Pseudo Classes ###
1. `:active`
2. `:checked`: `input:checked` - select every checked `<input>` element
3. `:disabled`: `input:disabled` - select every disabled `<input>` element
4. `:empty`: `p:empty` - select every `<p>` element that has no children
5. `:enabled`: `input:enabled` - select every enabled `<input>` element
6. `:first-child`: `p:first-child` - select every `<p>` element that is the first child of its parent
7. `:first-of-type`: `p:first-of-type` - selects every `<p>` element that is the first `<p>` element of its parent
	1. Element is the first child of the particular type for its parent
	2. Example: `p:first-of-type`: first child of an element which is of type `p`
8. `:focus`: `input:focus`
9. `:hover`: `a:hover`
10. `:in-range`: `input:in-range` - selects `input` with a value within a specified range
11. `:invalid`: `input:invalid` - selects `input` with an invalid value
12. `:lang(language)`: `p:lang(it)` - selects p element with a lang attribute value starting with `it`
13. `:last-child`: `p:last-child`
14. `:last-of-type`: `p:last-of-type`
15. `:link`
16. `:not(selector)`: `:not(p)` - selects every element that is not a `<p>`
17. `:nth-child(n)`: `p:nth-child(2)` - selects every `<p>` element that is the second child of it's parent
18. `:nth-last-child(n)`: `p:nth-last-child(2)` - selects every `<p>` element that is the second child counting from the last child.
19. `:nth-last-of-type(n)`: `p:nth-last-of-type(2)` - selects every `<p>` element that is the second `<p>` element of its parent, counting from the last child
20. `:nth-of-type(n)`: `p:nth-of-type(2)` - selects every `<p>` element that is the second `<p>` element of its parent
21. `:only-of-type`: `p:only-of-type` - selects every `<p>` element that is the only `<p>` element of its parent
22. `:only-child`: `p:only-child` - selects every `<p>` element that is the only child of its parent.
23. `:optional`: `input:optional` - selects `<input>` elements with no required attribute
24. `:out-of-range`: `input:out-of-range` - selects `<input>` elements with a value outside a specified range
25. `:read-only`: `input:read-only` - selects `<input>` elements with a "readonly" attribute specified
26. `:read-write`: `input:read-write` - selects `<input>` elements with no "readonly" attribute
27. `:required`: `input:required` - selects `<input>` elements with a "required" attribute specified
28. `:root`: `root` - selects the document's root element
29. `:target`: `#news:target` - selects the current active #news element (clicked on a URL containing the anchor name)
30. `:valid`: `input:valid` - selects all `<input>` elements with a valid value
31. `:visited`: `a:visited` - selects all visited links

### All CSS Pseudo Elements ###
1. `::after`: `p::after` - insert content after every `<p>` element
2. `::before`: `p::before` - insert content before every `<p>` element
3. `::first-letter`: `p::first-letter` - selects the first letter of every `<p>` element
4. `::first-line`: `p::first-line` - selects the first line of every `<p>` element.
5. `::selection`: `p::selection` - selects the portion of an element that is selected by a user.

## CSS Pseudo-element ##
### What are Pseudo-Elements? ###
1. psudo-elements are used to style specified parts of an element.
	1. First letter, or line, or an element
	2. Insert content before or after the content of an element.

### Syntax ###

		selector::pseudo-element {
			property: value;
		}

### The `::first-line` Pseudo-element ###
1. `::first-line` is used to add special style to the first line of a text
2. Example:

		p::first-line {
			color: #ff0000;
			font-variant: small-caps;
		}

3. It can only be applied to block level elements.
4. Properties applied to `::first-line` pseudo-element:
	1. font properties
	2. color properties
	3. background properties
	4. word-spacing
	5. letter-spacing
	6. text-decoration
	7. vertical-align
	8. text-transform
	9. line-height
	10. clear

### The `::first-letter` Pseudo-element ###
1. Example:

		p::first-letter {
			color: #ff0000;
			font-size: xx-large;
		}

2. It can only be applied to block level element
3. Properties that apply:
	1. font properties
	2. color properties
	3. background properties
	4. margin properties
	5. padding properties
	6. border properties
	7. `text-decoration`
	8. `vertical-align` (only if "float" is "none")
	9. `text-transform`
	10. `line-height`
	11. `float`
	12. `clear`

### Pseudo-elements and CSS Classes ###
1. Pseudo elements can be combined with CSS classes.
2. Example:

		p.intro::first-letter {
			color: #ff0000;
			font-size: 200%;
		}

### Multiple Pseudo-elements ###
1. Example:

		p::first-letter {
			color: #ff0000;
			font-size: xx-large;
		}

		p::first-line {
			color: #0000ff;
			font-variant: small-caps;
		}

### CSS - The `::before` Pseudo-element ###
1. `::before` **(M)**: to insert content before the content of an element.
2. Example: inserting an image before the content of an `<h1>` element

		h1::before {
			content: url(smiley.gif);
		}

### CSS - The `::after` Pseudo-element ###
1. `::after` **(M)** to insert content after the content of an element.
2. Example: inserting an image after the content of each `<h1>`

		h1::after {
			content: url(smiley.gif);
		}

### CSS - The `::selection` Psudo-element ###
1. `::selection` **(M)**: matches the portion of an element selected by the user
2. CSS properties applicable:
	1. `color`
	2. `background`
	3. `cursor`
	4. `outline`
3. Example:

		::selection {
			color: red;
			background: yellow;
		}

### All CSS Pseudo Elements ###
1. `::after`
2. `::before`
3. `::first-letter`
4. `::first-line`
5. `::selection`

### All CSS Pseudo Classes ###
1. `:active`
2. `:checked`: `input:checked`
3. `:disabled`: `input:disabled`
4. `:empty`: `p:empty`
5. `:enabled`: `input:enabled`
6. `:first-child`: `p:first-child`
7. `:first-of-type`: `p:first-of-type`
8. `:focus`: `input:focus`
9. `:hover`
10. `:in-range`: `input:in-range`
11. `:invalid`: `input:invalid`
12. `:lang(language)`
13. `:last-child`
14. `:last-of-type`
15. `:link`
16. `:not(selector)`
17. `:nth-child(n)`
18. `:nth-last-child(n)`
19. `:nth-last-of-type(n)`
20. `:nth-of-type(n)`
21. `:only-of-type`
22. `:only-child`
23. `:optional`: `input:optional`
24. `:out-of-range`: `input:out-of-range`
25. `:read-only`: `input:read-only`
26. `:read-write`: `input:read-write`
27. `:required`
28. `:root`
29. `:target`: `#news:target`
30. `:valid`: `input:valid`
31. `:visited`

## CSS Opacity ##
1. `opacity` **(M)**: specifies the opacity/transparency of an element.

### Transparent Image ###
1. It takes a value for 0.0 to 1.0.
2. For IE-8 and earlier: `filter:alpha(opacity=x)`
	1. `x` can be any value between 0 to 100
	2. Example:

			img {
				opacity: 0.5;
				filter: alpha(opacity=50); /* For IE8 and earlier */
			}

### Transparent Hover Effect ###
1. Example:
		
		img {
			opacity: 0.5;
			filter: alpha(opacity=50); /* For IE8 and earlier */
		}

		img:hover {
			opacity: 1.0;
			filter: alpha(opacity=100); /* For IE8 and earlier */
		}

### Transparent Box ###
1. If `opacity` is used for an element's background, all of its child elements inherit the same transparency.
	1. Problem: The text inside the element will also be transparent and becomes hard to read.
		1. Example:

				div {
					opacity: 0.3;
					filter: alpha(opacity=30); /* For IE8 and earlier */
				}

### Transparency using RGBA ###
1. Solution to above problem: Use `rgba` color vlaues.
	1. `rgba`: RGB with an Alpha channel
	2. Syntax: `rgba(R, G, B, alpha)`
		1. `alpha`: 0.0 - 1.0
2. Example:

		div {
			background: rgba(76, 175, 80, 0.3); /* Green background with 30% opacity */
		}

### Text in Transparent Box ###
1. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					div.background {
						background: url(klematis.jpg) repeat;
						border: 2px solid black;
					}

					div.transbox {
						margin: 30px;
						background-color: #ffffff;
						border: 1px solid black;
						opacity: 0.6;
						filter: alpha(opacity=60); /* For IE8 and earlier */
					}

					div.transbox p {
						margin: 5%;
						font-weight: bold;
						color: #000000;
					}
				</style>
			</head>
			<body>
				<div class="background">
					<div class="transbox">
						<p>This is some text that is placed in the transparent box.</p>
					</div>
				</div>
			</body>
		</html>

### Navigation Bars ###
1. Using CSS we can transform boring HTML menus into good-looking navigation bars.

### Navigation Bar = List of Links ###
1. Building navigation bar from standard HTML list.
2. Example:

		<ul>
			<li><a href="default.asp">Home</a></li>
			<li><a href="news.asp">News</a></li>
			<li><a href="contact.asp">Contact</a></li>
			<li><a href="about.asp">About</a></li>
		</ul>

3. Removing bullets, margins and padding from the list

		ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
		}

	1. `list-style-type: none;` removes bullets
	2. `margin: 0;`, `padding: 0;` removes browser default settings.

### Vertical Navigation Bar ###
1. Example:

		li a {
			display: block;
			width: 60px;
		}

	1. `display: block;` - Displaying links as block elements. (Makes whole linke area clicable and not just the text). It allows us to specify the width.
	2. `width: 60px;` - Block elements take up the full width available by default.
2. Alternative:

		ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
			width: 60px;
		}

		li a {
			display: block;
		}

### Vertical Navigation Bar Examples ###
1. Basic navigation bar with a gray background color and change background color of links when user moves mouse over them.
2. Example:

		ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
			width: 200px;
			background-color: #f1f1f1;
		}

		li a {
			display: block;
			color: #000;
			padding: 8px 16px;
			text-decoration: none;
		}

		/* Change the link color on hover */
		li a:hover {
			background-color: #555;
			color: white;
		}

#### Active/ Current Navigation Link ####
1. Add active class to current link to let user know which page he/she is on:
2. Example:

		.active {
			background-color: #4CAF50;
			color: white;
		}

#### Center Links & Add Borders ####
1. `text-align:center`
2. Add `border` property to `<ul>` to add border around navbar.
3. Add `border-bottom` to all `<li>` elements to add border inside navbar
4. Example:

		ul {
			border: 1px solid #555;
		}

		li {
			text-align: center;
			border-bottom: 1px solid #555;
		}

		li:last-child {
			border-bottom: none;
		}

#### Full-height Fixed Vertical Navbar ####
1. Example:

		ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
			width: 25%;
			background-color: #f1f1f1;
			height: 100%; /* Full height */
			position: fixed; /* Make it stick, even on scroll */
			overflow: auto; /* Enable scrolling if the sidenav has too much content */
		}

### Horizontal Navigation Bar ###
1. Two ways to build a horizontal navigation bar:
	1. Using `inline`
	2. Using floating

#### Inline List Items ####
1. Example:
		
		li {
			display: inline;
		}

	1. By default `<li>` elements are `block` elements.

#### Floating List Items ####
1. Float the `<li>` elements and specify a layout for navigation links

		li {
			float: left;
		}

		a {
			display: block;
			padding: 8px;
			background-color: #dddddd;
		}

	1. `float: left;` slides block elements next to each other
2. Add `background-color` to `<ul>` instead of each `<a>` element

### Horizontal Navigation Bar Examples ###
1. Example:

		ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
			background-color: #333;
		}

		li {
			float: left;
		}

		li a {
			display: block;
			color: white;
			text-align: center;
			padding: 14px 16px;
			text-decoration: none;
		}

		/* Change the link color to #111 (black) on hover */
		li a:hover {
			background-color: #111;
		}

#### Active/ Current Navigation Link ####
1. Example:

		.active {
			background-color: #4CAF50;
		}

#### Right-Align Links ####
1. `float: right;`

		<ul>
			<li><a href="#home">Home</a></li>
			<li><a href="#news">News</a></li>
			<li><a href="#contact">Contact</a></li>
			<li style="float:right"><a href="#about">About</a></li>
		</ul>

#### Border Dividers ####
1. Example:

		li {
			border-right: 1px solid #bbb;
		}

		li:last-child {
			border-right: none;
		}

#### Fixed Navigation Bar ####
1. Fixed top:

		ul {
			position: fixed;
			top: 0;
			width: 100%;
		}

2. Fixed bottom:

		ul {
			position: fixed;
			bottom: 0;
			width: 100%;
		}

#### Gray Horizontal Navbar ####
1. Example:

		ul {
			border: 1px solid #e7e7e7;
			background-color: #f3f3f3;
		}

		li a {
			color: #666;
		}

### More Examples ###
1. [Responsive Topnav](https://www.w3schools.com/css/css_navbar.asp)
2. [Responsive Sidenav](https://www.w3schools.com/css/css_navbar.asp)
3. [Dropdown navbar](https://www.w3schools.com/css/css_navbar.asp)

## CSS Dropdowns ##
1. Hoverable dropdown with CSS

### Basic Dropdown ###
1. Example:

		<style>
			.dropdown {
				position: relative;
				display: inline-block;
			}

			.dropdown-content {
				display: none;
				position: absolute;
				background-color: #f9f9f9;
				min-width: 160px;
				box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
				padding: 12px 16px;
				z-index: 1;
			}

			.dropdown:hover .dropdown-content {
				display: block;
			}
		</style>

		<div class="dropdown">
			<span>Mouse over me</span>
			<div class="dropdown-content">
				<p>Hello World!</p>
			</div>
		</div>

#### Example Explained ####
1. Use an element to open the dropdown content. (`<span>` or `<button>`)
2. Use a container element like `<div>` to build dropdown content and add its contents.
3. Wrap `<div>` element around elements to position the dropdown content correctly with CSS.
4. `.dropdown` should have `position:relative` to place dropdown content below (using `position:absolute`)
5. `.dropdown-content` holds the actual dropdown content.
	1. It is hidden by default
	2. It should be displayed on hover
6. `min-width` is set to `160px` (if the width needs to be as much wide as the button, set `width: 100%`)
	1. `overflow:auto`: to enable scroll on small screens
7. `box-shadow`: makes dropdown look like a card.
8. `:hover` pseudo-class is used to show dropdown menu when user moves the mouse over.

### Dropdown Menu ###
1. Dropdown menu to choose an option from the list

		<style>
			/* Style The Dropdown Button */
			.dropbtn {
				background-color: #4CAF50;
				color: white;
				padding: 16px;
				font-size: 16px;
				border: none;
				cursor: pointer;
			}

			/* The container <div> - needed to position the dropdown content */
			.dropdown {
				position: relative;
				display: inline-block;
			}

			/* Dropdown Content (Hidden by Default) */
			.dropdown-content {
				display: none;
				position: absolute;
				background-color: #f9f9f9;
				min-width: 160px;
				box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
				z-index: 1;
			}

			/* Links inside the dropdown */
			.dropdown-content a {
				color: black;
				padding: 12px 16px;
				text-decoration: none;
				display: block;
			}

			/* Change color of dropdown links on hover */
			.dropdown-content a:hover { background-color: #f1f1f1 }

			/* Show the dropdown menu on hover */
			.dropdown:hover .dropdown-content {
				display: block;
			}

			/* Change the background color of the dropdown button
			when the dropdown content is shown */
			.dropdown:hover .dropbtn {
				background-color: #3e8341;
			}
		</style>

		<div class="dropdown">
			<button class="dropbtn">Dropdown</button>
			<div class="dropdown-content">
				<a href="#">Link 1</a>
				<a href="#">Link 2</a>
				<a href="#">Link 3</a>
			</div>
		</div>

### Right-aligned Dropdown Content ###
1. If dropdown menu has to go from right to left instead of left to right:

		.dropdown-content {
			right: 0;
		}

### More Examples ###
1. Adding image and other content inside dropdown box
	1. [https://www.w3schools.com/css/tryit.asp?filename=trycss_dropdown_image](https://www.w3schools.com/css/tryit.asp?filename=trycss_dropdown_image)
2. Dropdown navbar:
	1. [https://www.w3schools.com/css/tryit.asp?filename=trycss_dropdown_navbar](https://www.w3schools.com/css/tryit.asp?filename=trycss_dropdown_navbar)


## CSS Tooltips ##
### Demo: Tooltip Examples ###
1. Tooltip is usually used to give extra information about something when the user moves the mouse pointer over an element.

### Basic Tooltip ###
1. Example:

		<style>
			/* Tooltip container */
			.tooltip {
				position: relative;
				display: inline-block;
				border-bottom: 1px dotted black; /* If you want dots under the hoverable text */
			}

			/* Tooltip text */
			.tooltip .tooltiptext {
				visibility: hidden;
				width: 120px;
				background-color: black;
				color: #fff;
				text-align: center;
				padding: 5px 0;
				border-radius: 6px;

				/* Position the tooltip text - see examples below! */
				position: absolute;
				z-index: 1;
			}

			/* Show the tooltip text when you mouse over the tooltip container */
			.tooltip:hover .tooltiptext {
				visibility: visible;
			}
		</style>

		<div class="tooltip">Hover over me
			<span class="tooltiptext">Tooltip text</span>
		</div>

#### Example Explained ####
1. Use container `<div>` and add `tooltip` class to it.
2. When user mouses over `<div>`, it will show tooltip text.
3. Tooltip text is placed inside an inline element `<span>` with `class="tooltiptext"`
4. `tooltip` class uses `position: relative` which needs to position tooltip text `position:absolute`
5. `tooltiptext` class holds the tooltip text.
	1. It is hidden by default
	2. The text will be visible on hover
6. `border-radius` is used to add rounded corners to tooltip text
7. `:hover` is used to show tooltip text when user moves the mouse over the `<div>` with `class="tooltip"`

### Position Tooltips ###
1. `left:105%`: tooltip is placed to the right of hoverable text
2. `top:-5px`: to place it in the middle of the container element (because top and bottom padding is 5px)
3. Example:

		.tooltip .tooltiptext {
			top: -5px;
			left: 105%;
		}

4. Left tooltip:

		.tooltip .tooltiptext {
			top: -5px;
			right: 105%;
		}

5. Top:

		.tooltip {
			position: relative;
			display: inline-block;
			border-bottom: 1px dotted black;
		}

		.tooltip .tooltiptext {
			visibility: hidden;
			width: 120px;
			background-color: black;
			color: #fff;
			text-align: center;
			border-radius: 6px;
			padding: 5px 0;

			/* Position the tooltip */
			position: absolute;
			z-index: 1;
			bottom: 100%;
			left: 50%;
			margin-left: -60px; /* Use half of the width (120/2 = 60), to center the tooltip */
		}

		.tooltip:hover .tooltiptext {
			visibility: visible;
		}

6. Bottom: 

		.tooltip, tooltiptext {
			width: 120px;
			top: 100%;
			left: 50%;
			margin-left: -60px; /* Use half of the width (120/2 = 60), to center the tooltip */
		}

### Tooltip Arrows ###
1. Steps:
	1. Add empty content after tooltip with `::after` together with `content`
	2. Arrow is built using borders
2. Example:

		.tooltip .tooltiptext::after {
			content: "";
			position: absolute;
			top: 100%;
			left: 50%;
			margin-left: -5px;
			border-width: 5px;
			border-style: solid;
			border-color: black transparent transparent transparent;
		}

#### Example Explained ####
1. `top: 100%` will place the arrow at the bottom of the tooltip
2. `left: 50%;` will center the arrow
3. `border-width`: size of the arrow
	1. `margin-left` should be set accordingly
4. `border-color`: Used to set top border black and rest to transparent (if all sides were black it should be a square box)
5. Example: To add arrow to the top of the tooltip:

		.tooltip .tooltiptext::after {
			content: "";
			position: absolute;
			bottom: 100%;
			left: 50%;
			margin-left: -5px;
			border-width: 5px;
			border-style: solid;
			border-color: transparent transparent black transparent;
		}

### Fade In Tooltips (Animation) ###
1. `transition` **(M)**

		.tooltip .tooltiptext {
			opacity: 0;
			transition: opacity 1s;
		}

		.tooltip:hover .tooltiptext {
			opacity: 1;
		}

## CSS Image Gallery ##
### Image Gallery ###
1. Example:

		<html>
			<head>
				<style>
					div.gallery {
						margin: 5px;
						border: 1px solid #ccc;
						float: left;
						width: 180px;
					}

					div.gallery:hover {
						border: 1px solid #777;
					}

					div.gallery img {
						width: 100%;
						height: auto;
					}

					div.desc {
						padding: 15px;
						text-align: center;
					}
				</style>
			</head>
			<body>
				<div class="gallery">
					<a target="_blank" href="fjords.jpg">
						<img src="fjords.jpg" alt="Fjords" width="300" height="200" />
					</a>
					<div class="desc">Add a description of the image here</div>
				</div>

				<div class="gallery">
					<a target="_blank" href="forest.jpg">
						<img src="forest.jpg" alt="Forest" width="300" height="200" />
					</a>
					<div class="desc">Add a description of the image here</div>
				</div>

				<div class="gallery">
					<a target="_blank" href="lights.jpg">
						<img src="lights.jpg" alt="Northern Lights" width="300" height="200" />
					</a>
					<div class="desc">Add a description of the image here</div>
				</div>

				<div class="gallery">
					<a target="_blank" href="mountains.jpg">
						<img src="mountains.jpg" alt="Mountains" width="300" height="200" />
					</a>
					<div class="desc">Add a description of the image here</div>
				</div>
			</body>
		</html>

### More Examples ###
1. [Responsive Image Gallery](https://www.w3schools.com/css/tryit.asp?filename=trycss_image_gallery_responsive)

## CSS Image Sprites ##
### Image Sprites ###
1. Image sprite: collection of images put into a single image
	1. Reason: If a web page has many images, it takes a long time to load and may generate multiple server requests.
		1. Image sprites will reduce the number of requests

### Image Sprites - Simple Example ###
1. Get image sprite and using CSS show only a part of the image
2. Example:

		#home {
			width: 46px;
			height: 44px;
			background: url(img_navsprites.gif) 0 0;
		}

		#next {
			width: 43px;
			height: 44px;
			background: url(img_navsprites.gif) -91px 0;
		}

		<img id="home" src="img_trans.gif"><br><br>
		<img id="next" src="img_trans.gif">

	1. `<img id="home" src="img_trans.gif">`: Defines a small transparent image because the src attribute cannot be empty.
	2. `width: 46px; height: 44px;` Defines portion of image we want to use
	3. `background: url(img_navsprites.gif) 0 0;`: Defines background image and its position.

### Image Sprites - Creation of a Navigation List ###
1. Example:

		#navlist {
			position: relative;
		}

		#navlist li {
			margin: 0;
			padding: 0;
			list-style: none;
			position: absolute;
			top: 0;
		}

		#navlist li, #navlist a {
			height: 44px;
			display: block;
		}

		#home {
			left: 0px;
			width: 46px;
			background: url('img_navsprites.gif') 0 0;
		}

		#prev {
			left: 63px;
			width: 43px;
			background: url('img_navsprites.gif') -47px 0;
		}

		#next {
			left: 129px;
			width: 43px;
			background: url('img_navsprites.gif') -91px 0;
		}

		<ul id="navlist">
			<li id="home"><a href="default.asp"></a></li>
			<li id="prev"><a href="css_intro.asp"></a></li>
			<li id="next"><a href="css_syntax.asp"></a></li>
		</ul>

	1. `#prev { background: url('img_navsprites.gif') -47px 0;}` - Image that is 47 pixels to the right (46px + 1px line divider)

### Image Sprites - Hover Effect ###
1. Example:

		#home a:hover {
			background: url('img_navsprites_hover.gif') 0 -45px;
		}

		#prev a:hover {
			background: url('img_navsprites_hover.gif') -47px -45px;
		}

		#next a:hover {
			background: url('img_navsprites_hover.gif') -91px -45px;
		}

## CSS Attr Selectors ##
### Style HTML Elements With Specific Attributes ###
1. Used to style elements with specific attributes or attribute values

### CSS [attribute] Selector ###
1. `[attribute]` **(M)**
	1. selects elements with specified `attribute`
2. Example:

		a[target] {
			background-color: yellow;
		}

		<a href="https://www.w3schools.com/">w3schools.com</a>
		<a href="https://www.disney.com/" target="_blank">disney.com</a>
		<a href="https://www.wikipedia.org/" target="_top">wikipedia.org</a>

### CSS `[attribute="value"]` Selector ###
1. `[attribute="value"]`: selects elements with the specified `attribute` and `value`
2. Example:

		a[target="_blank"] {
			background-color: yellow;
		}

### CSS `[attribute~="value"]` Selector ###
1. `[attribute~="value"]` selects elements with an attribute value containing a specified word.
2. Example: Select element with title attribute containing a space separated list of words one of which is `flower`

		[title~="flower"] {
			border: 5px solid yellow;
		}

		<img src="klematis.jpg" title="klematis flower" width="150" height="113">
		<img src="img_flwr.gif" title="flower" width="224" height="162">
		<img src="img_tree.gif" title="tree" width="200" height="358">

### CSS `[attribute|="value"]` Selector ###
1. `[attribute|="value"]` selects elements with specified attribute starting with specified value
2. Example: Select elements with `class` attribute value starting with `top`
	1. Value has to be a whole word ("top") or hyphen separated words ("top-text")

			[class|="top"] {
				background: yellow;
			}

			<h1 class="top-header">Welcome</h1>
			<p class="top-text">Hello world!</p>
			<p class="topcontent">Are you learning CSS?</p>

### CSS `[attribute^="value"]` Selector ###
1. `[attribute^="value"]` selects elements whose attribute value begins with specified value

		[class^="top"] {
			background: yellow;
		}

### CSS `[attribute$="value"]` Selector ###
1. `[attribute$="value"]` selects elements whose attribute value ends with specified value

		[class$="top"] {
			background: yellow;
		}

### CSS `[attribute*="value"]` Selector ###
1. `[attribute*="value"]` selects elements whose attribute value contains specified value
2. Example:

		[class*="te"] {
			background: yellow;
		}

### Styling Forms ###
1. Example:

		input[type="text"] {
			width: 150px;
			display: block
			margin-bottom: 10px;
			background-color: yellow;
		}

		input[type="button"] {
			width: 120px;
			margin-left: 35px;
			display: block;
		}

		<form name="input" action="" method="get">
			Firstname:<input type="text" name="Name" value="Peter" size="20">
			Lastname:<input type="text" name="Name" value="Griffin" size="20">
			<input type="button" value="Example Button">
		</form>

### More Examples of CSS Selectors ###
1. [CSS Selector Tester](https://www.w3schools.com/cssref/trysel.asp) 
2. [CSS Selectors Reference](https://www.w3schools.com/cssref/css_selectors.asp)

## CSS Forms ##
### Styling Input Fields ###
1. `width`: to set width of the input fields

		input {
			width: 100%;
		}

	1. Use attribute selectors to style specific inputs

### Padded Inputs ###
1. `padding` is used to add space inside text field

		input[type="text"] {
			width: 100%;
			padding: 12px 20px;
			margin: 8px 0;
			box-sizing: border-box;
		}

	1. `box-sizing: border-box;`: includes padding and borders in total width and height of element
		1. [CSS3 Box Sizing](https://www.w3schools.com/css/css3_box-sizing.asp)

### Bordered Inputs ###
1. `border` to change border size and color
2. `border-radius` to add rounded corners.

		input[type="text"] {
			border: 2px solid red;
			border-radius: 4px;
		}

3. For only bottom border: `border-bottom`

		input[type="text"] {
			border: none;
			border-bottom: 2px solid red;
		}

### Colored Inputs ###
1. `background-color`: add background color to input
2. `color`: change text color

		input[type="text"] {
			background-color: #3CBC8D;
			color: white;
		}

### Focused Inputs ###
1. Some browsers add blue outline when clicked on.
	1. Remove this by adding: `outline: none;` on focus
2. Example:

		input[type="text"]:focus {
			background-color: lightblue;
		}

### Input with icon/image ###
1. If we want an icon inside the input, use `background-image` and position it with `background-position`
2. Add left padding to reserve space for icon

		input[type="text"] {
			background-color: white;
			background-image: url('searchicon.png');
			background-position: 10px 10px;
			background-repeat: no-repeat;
			padding-left: 40px;
		}

### Animated Search Input ###
1. `transition`: CSS3 property used to animate width of search input when it gets focus.
2. Example:

		input[type="text"] {
			-webkit-transition: width 0.4x ease-in-out;
			transition: width 0.4s ease-in-out;
		}

		input[type=text]:focus {
			width: 100%;
		}

### Styling Textareas ###
1. `resize: none;`: prevents user from resizing the text area.

		textarea {
			width: 100%;
			height: 150px;
			padding: 12px 20px;
			box-sizing: border-box;
			border: 2px solid #ccc;
			background-color: #f8f8f8;
			resize: none;
		}

### Styling Select Menus ###
1. Example:

		select {
			width: 100%;
			padding: 16px 20px;
			border: none;
			border-radius: 4px;
			background-color: #f1f1f1;
		}

### Styling Input Buttons ###
1. Example:

		input[type="button"], 
		input[type="submit"], 
		input[type="reset"] {
			background-color: #4CAF50;
			border: none;
			color: white;
			padding: 16px 32px;
			text-decoration: none;
			margin: 4px 2px;
			cursor: pointer;
		}

## CSS Counters ##
1. Counters are variables maintained by CSS
	1. Values of variables can be incremented by CSS rules
2. Uses:
	1. Change appearance of content based on its placement in the document.

### Automatic Numbering With Counters ###
1. Properties:
	1. `counter-reset`: constructs or resets a counter
	2. `counter-increment`: increments a counter value
	3. `content`: inserts generated content
	4. `counter()` or `counters()` function - adds value of counter to an element
2. Example: Construct a counter for the page and increment counter value for each `<h2>` and add `Section <value of counter>:` to the beginning of `<h2>`

		body {
			counter-reset: section;
		}

		h2::before {
			counter-increment: section;
			content: "Section " counter(section) ": ";
		}

		<h1>Using CSS Counters:</h1>
		<h2>HTML Tutorial</h2>
		<h2>CSS Tutorial</h2>
		<h2>JavaScript Tutorial</h2>
		

### Nesting Counters ###
1. One counter for page (section) and one counter for each `<h1>` element (subsection).
2. "section" counter will be counted for each `<h1>` element with `Section <value of the section counter>.`, and "subsection" counter will be counted for each `<h2>` element with "<value of the section counter>.<value of the subsection counter>"

		body {
        	counter-reset: section;
		}

		h1 {
			counter-reset: subsection;
		}

		h1::before {
        	counter-increment: section;
        	content: "Section " counter(section) ": ";
		}

		h2::before {
        	counter-increment: subsection;
        	content: counter(section) "." counter(subsection);
		}

### CSS Counter Properties ###
1. A new instance of counter is automatically created in child elements.
2. Example:

		ol {
			counter-reset: section;
			list-style-type: none;
		}

		li::before {
			counter-increment: section;
			content: counters(section,".") " ";
		}

### CSS Counter Properties ###
1. `content`: Used to insert generated content.
2. `counter-increment`: increments one or more counter values

# CSS 3 #
## CSS3 Introduction ##
1. Latest standard for CSS
2. It is completely backwards compatible with earlier versions
3. The section teaches new features in CSS3

### CSS3 Modules ###
1. CSS3 is split into modules
	1. Old CSS specification
	2. New modules
2. Important CSS3 modules:
	1. Selectors
	2. Box model
	3. Backgrounds and Borders
	4. Image Values and Replaced Content
	5. Text Effects
	6. 2D/3D Transformations
	7. Animations
	8. Multiple Column Layout
	9. User Interface
3. Most of the new CSS3 properties are implemented in modern browsers.

## CSS3 Rounded Corners ##
### Browser Support ###
1. Chrome: 5.0 4.0 - webkit-
2. IE: 9.0
3. Firefox: 4.0, 3.0 - moz-
4. Safari: 5.0, 3.1 - webkit-
5. Opera: 10.5

### CSS3 `border-radius` Property ###
1. We can give any element "rounded corners" using `border-radius` property
2. Example:

		#rcorners1 {
			border-radius: 25px;
			background: #73AD21;
			padding: 20px;
			width: 200px;
			height: 150px;
		}

		#rcorners2 {
			border-radius: 25px;
			border: 2px solid #73AD21;
			padding: 20px;
			width: 200px;
			height: 150px;
		}

		#rcorners3 {
			border-radius: 25px;
			background: url(paper.gif);
			background-position: left top;
			background-repeat: repeat;
			padding: 20px;
			width: 200px;
			height: 150px;
		}

3. `border-radius`: shorthand for `border-top-left-radius`, `border-top-right-radius`, `border-bottom-right-radius`, `border-bottom-left-radius`

### CSS3 `border-radius` - Specify Each Corner
1. If only one value is specified, the radius is applied to all four corners.
2. Specifying corners:
	1. 4 values: top-left, top-right, bottom-right, bottom-left

			border-radius: 15px 50px 30px 5px;

	2. 3 values: top-left, top-right & bottom-left, bottom-right

			border-radius: 15px 50px 30px

	3. 2 values: top-left & bottom-right, top-right & bottom-left

			border-radius: 15px 50px;

	4. 1 value: all four
3. Example:

		#rcorners4 {
			border-radius: 15px 50px 30px 5px;
			background: #73AD21;
			padding: 20px;
			width: 200px;
			height: 150px;
		}

		#rcorners5 {
			border-radius: 15px 50px 30px;
			background: #73AD21;
			padding: 20px;
			width: 200px;
			height: 150px;
		}

		#rcorners6 {
			border-radius: 15px 50px;
			background: #73AD21;
			padding: 20px;
			width: 200px;
			height: 150px;
		}

4. Example: Elliptical corners and ellipse

		#rcorners7 {
			border-radius: 50px/15px;
			background: #73AD21;
			padding: 20px;
			width: 200px;
			height: 150px;
		}

		#rcorners8 {
			border-radius: 15px/50px;
			background: #73AD21;
			padding: 20px;
			width: 200px;
			height: 150px;
		}

		#rcorners9 {
			border-radius: 50%;
			background: #73AD21;
			padding: 20px;
			width: 200px;
			height: 150px;
		}

		<p>Elliptical border - border-radius: 50px/15px:</p>
		<p id="rcorners7"></p>

		<p>Elliptical border - border-radius: 15px/50px;</p>
		<p id="rcorners8"></p>

		<p>Ellipse border - border-radius: 50%:</p>
		<p id="rcorners9"></p>

### CSS3 Rounded Corners Properties ###
1. `border-radius`
2. `border-top-left-radius`
3. `border-top-right-radius`
4. `border-bottom-right-radius`
5. `border-bottom-left-radius`

## CSS3 Border Images ##
1. `border-image` **(M)**: used to set image to be used as border around an element.

### Browser Support ###
1. Chrome: 16.0, 4.0 -webkit-
2. IE: 11.0
3. Firefox: 15.0, 3.5 -moz-
4. Safari: 6.0, 3.1 -webkit-
5. Opera: 15.0, 11.0 -o-

### CSS3 Border-image Property ###
1. We can use image instead of normal border around an element.
2. The property has 3 parts:
	1. image
	2. where to slice the image
	3. Whether middle sections should be repeated or streached
3. `border-image` takes an image and slices it into 9 sections (like tic-tac-toe) board.
	1. The corners are placed at the corners
	2. Middle sections are stretched or repeated as specified
4. Note: `border` must be set
5. Example:

		#borderimg {
			border: 10px solid transparent;
			padding: 15px;
			-webkit-border-image: url(border.png) 30 round; /* Safari 3.1-5 */
			-o-border-image: url(border.png) 30 round; /* Opera 11-12.1 */
			border-image: url(border.png) 30 round;
		}

6. Stretching the middle portion for border:

		#borderimg {
			border: 10px solid transparent;
			padding: 15px;
			-webkit-border-image: url(https://www.w3schools.com/css/border.png) 30 stretch;
			-o-border-image: url(https://www.w3schools.com/css/border.png) 30 stretch;
			border-image: url(https://www.w3schools.com/css/border.png) 30 stretch;
		}

7. Tip:
	1. `border-image`: shorthand property for:
		1. `border-image-source`
		2. `border-image-slice`
		3. `border-image-width`
		4. `border-image-outset`
		5. `border-image-repeat` 

### CSS3 border-image - Different Slice Values ###
1. `border-image: url(border.png) 50 round;`
2. `border-image: url(border.png) 20% round;`
3. `border-image: url(border.png) 30% round;`

### CSS3 Border Properties ###
1. `border-image`
2. `border-image-source`
3. `border-image-slice`
4. `border-image-width`: widths of border image
5. `border-image-outset`: amount by which border image area extends beyong the border box
6. `border-image-repeat`: repeated, rounded or streatched.

## CSS3 Backgrounds ##
1. New background properties:
	1. `background-size`
	2. `background-origin`
	3. `background-clip`

### CSS3 Multiple Backgrounds ###
1. `background-image`: can be used to add multiple background images
	1. The images are stacked on each other (first image is closest to the viewer)
2. Example:

		#example1 {
			background-image: url(img_flwr.gif), url(paper.gif);
			background-position: right bottom, left top;
			background-repeat: no-repeat, repeat;
		}

3. `background` shorthand property:

		#example1 {
			background: url(img_flwr.gif) right bottom no-repeat, url(paper.gif) left top repeat;
		}

### CSS3 Background Size ###
1. `background-size` **(M)**
	1. To specify size of background images
	2. In lengths, %s, or using keywords `contain` or `cover`
2. Example:

		#div1 {
			background: url(img_flower.jpg);
			background-size: 100px 80px;
			background-repeat: no-repeat;
		}

3. `contain` **(M)**: scales background image to be as large as possible (height and width must fit the content area) - some areas may not get covered.
4. `cover` **(M)**: scales background image such that the complete area is covered. (Height and width are equal to or exceeds the area) - some parts of the background image may not be visible.
5. Example:

		#div1 {
			background: url(img_flwr.gif);
			background-size: contain;
			background-repeat: no-repeat;
		}

		#div2 {
			background: url(img_flwr.gif);
			background-size: cover;
			background-repeat: no-repeat;
		}

### Define Sizes of Multiple Background Images ###
1. `background-size` accepts multiple values (as a comma separated list)
2. Example:

		#example1 {
			background: url(img_flwr.gif) left top no-repeat, url(img_flwr.gif) right bottom no-repeat, url(paper.gif) left top repeat;
			background-size: 50px, 130px, auto;
		}

### Full Size Background Image ###
1. An image that covers entire browser window at all times
2. Requirements:
	1. Fill the entire page with the image (no white space)
	2. Scale image as needed
	3. Center image on page
	4. Do not cause scrollbars
3. Implementation:

		html {
			background: url(img_flower.jpg) no-repeat center fixed;
			background-size: cover;
		}

### CSS3 `background-origin` Property ###
1. `background-origin` **(M)**
2. Takes three values:
	1. `border-box` - background image starts from upper left corner of border
	2. `padding-box` (default) - background image starts from upper left corner of padding edge
	3. `content-box` - background image starts from upper left corner of content
3. Example:

		#example1 {
			border: 10px solid black;
			padding: 35px;
			background: url(img_flwr.gif);
			background-repeat: no-repeat;
			background-origin: content-box;
		}

### CSS3 `background-clip` Property ###
1. `background-clip` **(M)**: painting area of background
2. It takes 3 different values:
	1. `border-box` (default)
	2. `padding-box`
	3. `content-box`
3. Example:

		#example1 {
			border: 10px dotted black;
			padding: 35px;
			background: yellow;
			background-clip: content-box;
		}

### CSS3 Background Properties ###
1. `background`
2. `background-clip`
3. `background-image`
4. `background-origin`
5. `background-size`

## CSS3 Colors ##
### CSS3 Colors ###
1. CSS3 introduced:
	1. RGBA colors
	2. HSL colors
	3. HSLA colors
	4. opacity

### Browser Support ###
1. RGBA, HSL, and HSLA
	1. Chrome: 4.0
	2. IE: 9.0
	3. Firefox: 3.0
	4. Safari: 3.1
	5. Opera: 10.1
2. Opacity:
	1. Chrome: 4.0
	2. IE: 9.0
	3. Firefox: 2.0
	4. Safari: 3.1
	5. Opera: 10.1

### RGBA Colors ###
1. RGB with Alpha channel
	1. Alpha channel: Specifies opacity for a color.
	2. `rgba(red, green, blue, alpha)`
2. Example:

		#p1 { background-color: rgba(255, 0, 0, 0.3); }
		#p2 { background-color: rgba(0, 255, 0, 0.3); }
		#p3 { background-color: rgba(0, 0, 255, 0.3); }

### HSL Colors ###
1. Hue Saturation Lightness:
2. `hsl(hue, saturation, lightness)`
	1. hue: degree on color wheel
		1. 0 (360) is red
		2. 120 is green
		3. 240 is blue
	2. saturation: percentage value - 100% is full color
	3. lightness: percentage - 0% is black, 100% is white
3. Example:

		#p1 { background-color: hsl(120, 100%, 50%); }
		#p2 { background-color: hsl(120, 100%, 75%); }
		#p3 { background-color: hsl(120, 100%, 25%); }
		#p4 { background-color: hsl(120, 60%, 70%); }

### HSLA Colors ###
1. HSL with alpha channel
2. `hsla(hue, saturation, lightness, alpha)`
3. Example:

		#p1 { background-color: hsla(120, 100%, 50%, 0.3); }
		#p2 { background-color: hsla(120, 100%, 75%, 0.3); }
		#p3 { background-color: hsla(120, 100%, 25%, 0.3); }
		#p4 { background-color: hsla(120, 60%, 70%, 0.3); }

### Opacity ###
1. `opacity`: sets opacity of the whole element (background color and text)
2. Example:

		#p1 { background-color: rgb(255, 0, 0); opacity: 0.6; }
		#p2 { background-color: rgb(0, 255, 0); opacity: 0.6; }
		#p3 { background-color: rgb(0, 0, 255); opacity: 0.6; }

## CSS3 Gradients ##
1. Gradients let you display smooth transitions between two or more specified colors.
	1. Reduces download time and bandwidth because of not using images.
	2. They look better when zoomed as compared to images
2. Two types of gradients:
	1. **Linear gradient** (goes down/up/left/right/diagonally)
	2. **Radial gradient** (defined by center)

### CSS3 Linear Gradients ###
1. We must define atleast two color stops
	1. color stops: colors you want to render smooth transitions among
2. We can set starting point and direction (or angle)
3. Syntax:

		background: linear-gradient(direction, color-stop1, color-stop2, ...);

#### Linear Gradient - Top to Bottom (this is default) ####
1. Example:

		#grad {
			background: red; /* For browsers that do not support gradients */
			background: -webkit-linear-gradient(red, yellow); /* For Safari 5.1 to 6.0 */
			background: -o-linear-gradient(red, yellow); /* For Opera 11.1 to 12.0 */
			background: -moz-linear-gradient(red, yellow); /* For Firefox 3.6 to 15 */
			background: linear-gradient(red, yellow); /* Standard syntax */
		}

#### Linear Gradient - Left to Right ####
1. Example:

		#grad {
			background: red; /* For browsers that do not support gradients */
			background: -webkit-linear-gradient(left, red, yellow); /* For Safari 5.1 to 6.0 */
			background: -o-linear-gradient(right, red, yellow); /* For Opera 11.1 to 12.0 */
			background: -moz-linear-gradient(right, red, yellow); /* For Firefox 3.6 to 15 */
			background: linear-gradient(to right, red, yellow);
		}

#### Linear Gradient - Diagonal ####
1. Specify vertical and horizontal starting positions.
2. Example:

		#grad {
			background: red; /* For browsers that do not support gradients */
			background: -webkit-linear-gradient(left top, red, yellow);
			background: -o-linear-gradient(right bottom, red, yellow);
			background: -moz-linear-gradient(right bottom, red, yellow);
			background: linear-gradient(to right bottom, red, yellow);
		}

### Using Angles ###
1. Syntax:

		background: linear-gradient(angle, color-stop1, color-stop2);
	1. `angle`: angle between horizontal line (x-axis) and gradient line
2. Example:

		#grad {
			background: red; /* For browsers that do not support gradients */
			background: -webkit-linear-gradient(-90deg, red, yellow);
			background: -o-linear-gradient(-90deg, red, yellow);
			background: -moz-linear-gradient(-90deg, red, yellow);
			background: linear-gradient(-90deg, red, yellow);
		}

### Using Multiple Color Stops ###
1. Example:

		#grad {
			background: red;
			background: -webkit-linear-gradient(red, yellow, green);
			background: -o-linear-gradient(red, yellow, green);
			background: -moz-linear-gradient(red, yellow, green);
			background: linear-gradient(red, yellow, green);
		}

2. Example:

		#grad {
			background: red;
			background: -webkit-linear-gradient(left, red, orange, yellow, green, blue, indigo, violet);
			background: -o-linear-gradient(right, red, orange, yellow, green, blue, indigo, violet);
			background: -moz-linear-gradient(right, red, orange, yellow, green, blue, indigo, violet);
			background: linear-gradient(to right, red, orange, yellow, green, blue, indigo, violet);
		}

### Using Transparency ###
1. Used for fading effects.
2. Use `rgba()` to define color stops
3. Example:

		#grad {
			background: red;
			background: -webkit-linear-gradient(left, rgba(255, 0, 0, 0), rgba(255, 0, 0, 1));
			background: -o-linear-gradient(right, rgba(255, 0, 0, 0), rgba(255, 0, 0, 1));
			background: -moz-linear-gradient(right, rgba(255, 0, 0, 0), rgba(255, 0, 0, 1));
			background: linear-gradient(to right, rgba(255, 0, 0, 0), rgba(255, 0, 0, 1));
		}

### Repeating a `linear-gradient` ###
1. Example:

		#grad {
			background: red;
			background: -webkit-repeating-linear-gradient(red, yellow 10%, green 20%);
			background: -o-repeating-linear-gradient(red, yellow 10%, green 20%);
			background: -moz-repeating-linear-gradient(red, yellow 10%, green 20%);
			background: repeating-linear-gradient(red, yellow 10%, green 20%);
		}

### CSS3 Radial Gradients ###
1. Defined by its center
2. Need at leat two color stops

#### Syntax ####

		background: radial-gradient(shape size at position, start-color, ..., last-color);

1. Default: shape: ellipse, size: `farthest-corner`, position: center
2. Example:

		#grad {
			background: red;
			background: -webkit-radial-gradient(red, yellow, green);
			background: -o-radial-gradient(red, yellow, green);
			background: -moz-radial-gradient(red, yellow, green);
			background: radial-gradient(red, yellow, green);
		}

#### Radial Gradient - Differently Spaced Color Stops ####

		#grad {
			background: red;
			background: -webkit-radial-gradient(red 5%, yellow 15%, green 60%);
			background: -o-radial-gradient(red 5%, yellow 15%, green 60%);
			background: -moz-radial-gradient(red 5%, yellow 15%, green 60%);
			background: radial-gradient(red 5%, yellow 15%, green 60%);
		}

### Set Shape ###
1. shape can be `circle` or `ellipse` (default)
2. Example:

		#grad {
			background: red;
			background: -webkit-radial-gradient(circle, red, yellow, green);
			background: -o-radial-gradient(circle, red, yellow, green);
			background: -moz-radial-gradient(circle, red, yellow, green);
			background: radial-gradient(circle, red, yellow, green);
		}

### Use of Different Size Keywords ###
1. size can be:
	1. `closest-side`
	2. `farthest-side`
	3. `closest-corner`
	4. `farthest-corner`
2. Example:

		#grad1 {
			background: red;
			background: -webkit-radial-gradient(60% 55%, closest-side, red, yellow, black);
			background: -o-radial-gradient(60% 55%, closest-side, red, yellow, black);
			background: -moz-radial-gradient(60% 55%, closest-side, red, yellow, black);
			background: radial-gradient(60% 55%, closest-side, red, yellow, black);
		}

		#grad2 {
			background: red;
			background: -webkit-radial-gradient(60% 55%, farthest-side, red, yellow, black);
			background: -o-radial-gradient(60% 55%, farthest-side, red, yellow, black);
			background: -moz-radial-gradient(60% 55%, farthest-side, red, yellow, black);
			background: radial-gradient(60% 55%, farthest-side, red, yellow, black);
		}

### Repeating a radial-gradient ###
1. Example:

		#grad {
			background: red;
			background: -webkit-repeating-radial-gradient(red, yellow 10%, green 15%);
			background: -o-repeating-radial-gradient(red, yellow 10%, green 15%);
			background: -moz-repeating-radial-gradient(red, yellow 10%, green 15%);
			background: repeating-radial-gradient(red, yellow 10%, green 15%);
		}

## CSS3 Shadows ##
### CSS3 Shadow Effects ###
1. Properties:
	1. `text-shadow` **(M)**
	2. `box-shadow` **(M)**

### Browser Support ###
1. `text-shadow`
	1. Chrome: 4.0
	2. IE: 10.0
	3. Firefox: 3.5
	4. Safari: 4.0
	5. Opera: 9.5
2. `box-shadow`
	1. Chrome: 10.0, 4.0 -webkit-
	2. IE: 9.0
	3. Firefox: 4.0, 3.5 -moz-
	4. Safari: 5.1, 3.1 -webkit-
	5. Opera: 10.5

### CSS3 Text Shadow ###
1. Simplest use:

		h1 {
			text-shadow: 2px 2px; /* horizontal vertical */
		}

2. Add color:

		h1 {
			text-shadow: 2px 2px red;
		}

3. Blur effect:

		h1 {
			text-shadow: 2px 2px 5px red;
		}

4. White text with black shadow:

		h1 {
			color: white;
			text-shadow: 2px 2px 4px #000000;
		}

5. Red neon glow shadow:

		h1 {
			text-shadow: 0 0 3px #FF0000;
		}

### Multiple Shadows ###
1. Add a comma separated list of shadows:
2. Example: red and blue neon glow shadow:

		h1 {
			text-shadow: 0 0 3px #FF0000, 0 0 5px #0000FF;
		}

3. Example: White text with black, blue and darkblue shadow:

		h1 {
			color: white;
			text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;
		}

4. Construct plain border around text without shadow:

		h1 {
			color: yellow;
			text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
		}

### CSS3 `box-shadow` Property ###
1. `box-shadow` **(M)**: applies shadow to elements.
2. Example: simple horizontal and vertical shadow

		div {
			box-shadow: 10px 10px;
		}

3. Different color shadow:

		div {
			box-shadow: 10px 10px grey;
		}

4. Adding Blur:

		div {
			box-shadow: 10px 10px 5px grey;
		}

### Cards ###
1. Example:

		div.card {
			width: 250px;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			text-align: center;
		}

		div.header {
			background-color: #4CAF50;
			color: white;
			padding: 10px;
			font-size: 40px;
		}

		div.container {
			padding: 10px;
		}

		<h2>Cards</h2>
		<p>The box-shadow property can be used for creation of paper-line cards:</p>

		<div class="card">
			<div class="header">
				<h1>1</h1>
			</div>

			<div class="container">
				<p>January 1, 2016</p>
			</div>
		</div>

2. Example:

		<div class="polaroid">
			<img src="rock600x400.jpg" alt="Norway" style="width:100%">
			<div class="container">
				<p>Hardanger, Norway</p>
			</div>
		</div>

### CSS3 Shadow Properties ###
1. `box-shadow`
2. `text-shadow`

## CSS3 Text ##
### CSS3 Text ###
1. `text-overflow` **(M)**
2. `word-wrap` **(M)**
3. `word-break` **(M)**

### Browser Support ###
1. `text-overflow`
	1. Chrome: 4.0
	2. IE: 6.0
	3. Firefox: 7.0
	4. Safari: 3.1
	5. Opera: 11.0, 9.0 -o-
2. `word-wrap`
	1. Chrome: 23.0
	2. IE: 5.5
	3. Firefox: 3.5
	4. Safari: 6.1
	5. Opera: 12.1
3. `word-break`
	1. Chrome: 4.0
	2. IE: 5.5
	3. Firefox: 15.0
	4. Safari: 3.1
	5. Opera: 15.0

### CSS3 Text Overflow ###
1. `text-overflow`: tells how overflowed content that is not displayed should be signaled to user.
	1. It can be clipped (`clip`)
	2. It can be rendered as ellipsis (`ellipsis`)
2. Example:

		p.test1 {
			white-space: nowrap;
			width: 200px;
			border: 1px solid #000000;
			overflow: hidden;
			text-overflow: clip;
		}

		p.test2 {
			white-space: nowrap;
			width: 200px;
			border: 1px solid #000000;
			overflow: hidden;
			text-overflow: ellipsis;
		}

		<p class="test1">This is some long text that will not fit in the box</p>
		<p class="test2">This is some long text that will not fit in the box</p>

3. Display remaining text when hovering over the element.

		div.test:hover {
			text-overflow: inherit;
			overflow: visible;
		}

### CSS3 Word Wrapping ###
1. `word-wrap`: long words will be broken and wrapped into next line.
	1. A word may be split in the middle.
2. Example:

		p {
			word-wrap: break-word;
		}

### CSS3 Word Breaking ###
1. `word-break` **(M)**
2. Example:

		p.test1 {
			word-break: keep-all;
		}

		p.test2 {
			word-break: break-all;
		}

### CSS3 Text Properties ###
1. `text-align-last`: specifies how to align last line of a text
2. `text-justify`: Specifies how justified text should be aligned and spaced
3. `text-overflow`
4. `word-break`
5. `word-wrap`

## CSS3 Fonts ##
### CSS3 Web Fonts - The `@font-face` Rule ###
1. Web fonts allows us to use fonts that are not installed on user's computer
2. How to implement:
	1. Include a font file on web server and it will automatically be downloaded to user when needed.

### Browser Support ###
1. Chrome: 4.0
2. IE: 9.0
3. Firefox: 3.5
4. Safari: 3.2
5. Opera: 10.0

### Different Font Formats ###
1. TrueType Fonts (TTF): Common font format for Mac OS and Microsoft Windows OS.
2. OpenType Fonts (OTF): Registered trademark of Microsoft. Used on major computer platforms.
3. The Web Open Font Format (WOFF): For use in web pages. It is W3C recommendation. OpenType or TrueType with compression and additional metadata. Support font distribution from server to client over network with bandwidth constraints.
4. The Web Open Font Format (WOFF 2.0): Better compression than WOFF 1.0.
5. SVG Fonts/Shapes: SVG is used as glyphs when displaying text. We can apply CSS to SVG documents.
6. Embedded OpenType Fonts (EOT): Compact form of OpenType fonts designed by Microsoft for use as embedded fonts on web pages.

### Using The Font You Want ###
1. `@font-face`
	1. Defines a name for font
	2. Points to a font file (use lowercase letters for URL)
2. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					@font-face {
						font-family: myFirstFont;
						src: url(https://www.w3schools.com/css/sansation_light.woff);
					}
				</style>
			</head>
			<body>
				<div>
				With CSS3, websites can finally use fonts other than the pre-selected "web-safe" fonts.
				</div>
			</body>
		</html>

### Using Bold Text ###
1. Add another `@font-face` rule containing descriptors for bold text:

		@font-face {
			font-family: myFirstFont;
			src: url(sansation_bold.woff);
			font-weight: bold;
		}

### CSS3 Font Descriptors ###
1. Font descriptors for `@font-face`
	1. `font-family`
	2. `src`
	3. `font-stretch`: tells how font should be stretched. (default: normal)
		1. `normal`
		2. `condensed`
		3. `ultra-condensed`
		4. `extra-condensed`
		5. `semi-condensed`
		6. `expanded`
		7. `semi-expanded`
		8. `extra-expanded`
		9. `ultra-expanded`
	4. `font-style`:
		1. `normal`
		2. `italic`
		3. `oblique`
	5. `font-weight`: defines boldness
		1. `bold`
		2. `100`
		3. `200`
		4. `300`
		5. `400`
		6. `500`
		7. `600`
		8. `700`
		9. `800`
		10. `900`
	6. `unicode-range`: Range of unicode characters the font supports. Default: "U+0-10FFFF"
		1. unicode-range

## CSS3 2D Transforms ##
### CSS3 Transforms ###
1. To translate, rotate, scale and skew elements.
	1. Change of shape, size and position
2. 2D and 3D transforms are supported.

### Browser Support for 2D Transforms ###
1. `transform`
	1. Chrome: 36.0, 4.0 -webkit-
	2. IE: 10.0, 9.0 -ms-
	3. Firefox: 16.0, 3.5 -moz-
	4. Safari: 9.0, 3.2 -webkit-
	5. Opera: 23.0, 15.0 -webkit-, 12.1, 10.5 -o-
2. `transform-origin` (two-value syntax)
	1. Chrome: 36.0, 4.0 -webkit-
	2. IE: 10.0, 9.0 -ms-
	3. Firefox: 16.0, 3.5 -moz-
	4. Safari: 9.0, 3.2 -webkit-
	5. Opera: 23.0, 15.0 -webkit-, 12.1, 10.5 -o- 

### CSS3 2D Transforms ###
1. Methods:
	1. `translate()` **(M)**
	2. `rotate()` **(M)**
	3. `scale()` **(M)**
	4. `skewX()` **(M)**
	5. `skewY()` **(M)**
	6. `matrix()` **(M)**

### The `translate()` Method ###
1. `translate()` moves an element from its current position
2. Example:

		div {
			-ms-transform: translate(50px, 100px);
			-webkit-transform: translate(50px, 100px);
			transform: translate(50px, 100px);
		}

### The `rotate()` Method ###
1. `rotate()`: rotates an element clockwise or counter clockwise according to given degree.
2. Example:

		div {
			-ms-transform: rotate(20deg);
			-webkit-transform: rotate(20deg);
			transform: rotate(20deg);
		}

3. Example: Counter clockwise rotation:

		div {
			-ms-transform: rotate(-20deg);
			-webkit-transform: rotate(-20deg);
			transform: rotate(-20deg);
		}

### The `scale()` Method ###
1. `scale()`: increases or decreases size of an element.
2. Example: increase 2 times original width and 3 times original height

		div {
			-ms-transform: scale(2, 3);
			-webkit-transform: scale(2, 3);
			-transform: scale(2, 3);
		}

3. Example: Decrease width and height to half of its original width and height

		div {
			-ms-transform: scale(0.5, 0.5);
			-webkit-transform: scale(0.5, 0.5);
			transform: scale(0.5, 0.5);
		}

### The `skewX()` Method ###
1. `skewX()`: skews an element along x-axis by the given angle
2. Example:

		div {
			-ms-transform: skewX(20deg);
			-webkit-transform: skewX(20deg);
			transform: skewX(20deg);
		}

### The `skewY()` Method ###
1. `skewY()`: skews an element along y-axis by given angle.
2. Example:

		div {
			-ms-transform: skewY(20deg);
			-webkit-transform: skewY(20deg);
			transform: skewY(20deg);
		}

### The `skew()` Method ###
1. `skew()`: skews an element along x and y axes by given angles;
2. Example:

		div {
			-ms-transform: skew(20deg, 10deg);
			-webkit-transform: skew(20deg, 10deg);
			transform: skew(20deg, 10deg);
		}
3. If any value is omitted, then it is 0deg

		div {
			-ms-transform: skew(20deg);
			-webkit-transform: skew(20deg);
			transform: skew(20deg);
		}

### The `matrix()` Method ###
1. `matrix()`: combines all 2D transform methods into one.
2. Syntax:
	
		matrix(scaleY(), skewY(), skewX(), scaleX(), translateX(), translateY());

3. Example:

		div {
			-ms-transform: matrix(1, -0.3, 0, 1, 0, 0);
			-webkit-transform: matrix(1, -0.3, 0, 1, 0, 0);
			transform: matrix(1, -0.3, 0, 1, 0, 0);
		}

### CSS3 Transform Properties ###
1. `transform`
2. `transform-origin`: allows us to change position of transformed elements
	1. `transform-origin: x-axis y-axis z-axis|initial|inherit;`
		1. `initial`: sets this property to its default value
		2. `inherit`: inherits this property for its parent element

### 2D Transform Methods ###
1. `matrix(n, n, n, n, n, n)`
2. `translate(x, y)`
3. `translateX(n)`
4. `translateY(n)`
5. `scale(x, y)`
6. `scaleX(n)`
7. `scaleY(n)`
8. `rotate(angle)`
9. `skew(x-angle, y-angle)`
10. `skewX(angle)`
11. `skewY(angle)`

## CSS3 3D Transforms ##
### CSS3 3D Transforms ###
1. `rotateX()`
3. `rotateY()`
4. `rotateZ()`

### The `rotateX()` Method ###
1. `rotateX()`: rotates an element along x axis
2. Example:

		div {
			-webkit-transform: rotateX(150deg);
			transform: rotateX(150deg);
		}

### The `rotateY()` Method ###
1. `rotateY()`: rotates an element around its Y-axis at a given degree:
2. Example:

		div {
			-webkit-transform: rotateY(130deg);
			transform: rotateY(130deg);
		}

### The `rotateZ()` Method ###
1. `rotateZ()`: rotates an element around Z-axis at a given degree.
2. Example:

		div {
			-webkit-transform: rotateZ(90deg);
			transform: rotateZ(90deg);
		}

### CSS3 Transform Properties ###
1. `transform`
2. `transform-origin`
3. `transform-style`: specifies how nested elements are rendered in 3D space
	1. Values:
		1. `flat`: child elements should not preserve their 3D position
		2. `preserve-3d`: child elements should preserve their 3D position
		3. `initial`: default value
		4. `inherit`: inherits the property from parent element
4. `perspective`: specifies how many pixels a 3D element is placed from the view.
	1. It is the child elements that get the perspective view and not the element itself
5. `perspective-origin`: specifies bottom position of 3D elements
6. `backface-visibility`: whether or not an element should be visible when not facing the screen
	1. `visible`
	2. `hidden`

### 3D Transform Methods ###
1. `matrix3d(n, n, n, n, n, n, n, n, n, n, n, n, n, n, n, n)`: 16 values
2. `translate3d(x, y, z)`
3. `translateX(x)`
4. `translateY(y)`
5. `translateZ(z)`
6. `scale3d(x, y, z)`
7. `scaleX(x)`
8. `scaleY(y)`
9. `scaleZ(z)`
10. `rotate3d(x, y, z, angle)`
11. `rotateX(angle)`
12. `rotateY(angle)`
13. `rotateZ(angle)`
14. `perspective(n)`: defines a perspective view for a 3D transformed element

## CSS3 Transitions ##
### CSS3 Transitions ###
1. Allows us to change property values smoothly from one value to an other over a given duration.

### Browser Support for Transitions ###
1. Properties:
	1. `transition`
	2. `transition-delay`
	3. `transition-duration`
	4. `transition-property`
	5. `transition-timing-function`

### How to Use CSS3 Transitions? ###
1. Specify two things:
	1. CSS property we want to add effect to
	2. Duration of effect (if not specified, it is 0)
2. Example:

		div {
			width: 100px;
			height: 100px;
			background: red;
			-webkit-transition: width 2s;
			transition: width 2s;
		}

		div:hover {
			width: 300px;
		}

	1. Transition effect starts when 

### Change Several Property Values ###
1. Example:

		div {
			-webkit-transition: width 2s, height 4s;
			transition: width 2s, height 4s;
		}

### Specify the Speed Curve of the Transition ###
1. `transition-timing-function`: specifies speed curve of transition effect.
2. Values:
	1. `ease`: slow start, then fast, then slow end
	2. `linear`: same speed from start to end
	3. `ease-in`: slow start
	4. `ease-out`: slow end
	5. `ease-in-out`: slow start and slow end
	6. `cubic-bezier(n, n, n, n)`: own values in function
3. Example:

		#div1 { transition-timing-function: linear; }
		#div2 { transition-timing-function: ease; }
		#div3 { transition-timing-function: ease-in; }
		#div4 { transitiion-timing-function: ease-out; }
		#div5 { transition-timing-function: ease-in-out; }

### Delay the Transition Effect ###
1. `transition-delay` **(M)**: delay before starting the transition
2. Example:

		div {
			-webkit-transition-delay: 1s;
			transition-delay: 1s;
		}

### Transition + Transformation ###
1. Adding transition effect to transformation:

		<!DOCTYPE html>
		<html>
			<head>
    			<style>
					div {
						margin: 60px;
						width: 100px;
						height: 100px;
						background-color: red;
						-webkit-transition: width 2s, height 2s, transform 2s;
						transition: width 2s, height 2s, transform 2s;
					}

					div:hover {
						width: 300px;
						height: 300px;
						-webkit-transform: rotate(180deg);
						transform: rotate(180deg);
					}
				</style>
			</head>
			<body>
				<div></div
			</body>
		</html>

### More Transition Examples ###
1. Example:

		div {
			transition-property: width;
			transition-duration: 2s;
			transition-timing-function: linear;
			transition-delay: 1s;
		}

2. Example: Shorthand

		div { transition: width 2s linear 1s; }

### CSS3 Transition Properties ###
1. `transition`
2. `transition-delay`
3. `transition-duration`
4. `transition-property`
5. `transition-timing-function`

## CSS3 Animations ##
### CSS3 Animations ###
1. CSS3 animation allows animations without using JavaScript or Flash

### Browser Support for Animations ###
1. `@keyframes`:
	1. Chrome: 43.0, 4.0 -webkit-
	2. IE: 10.0
	3. Firefox: 16.0, 5.0 -moz-
	4. Safari: 9.0, 4.0 -webkit-
	5. Opera: 30.0, 15.0 -webkit-, 12.0 -o-
2. `animation`:
	1. Chrome: 43.0, 4.0 -webkit-
	2. IE: 10.0
	3. Firefox: 16.0, 5.0 -moz-
	4. Safari: 9.0, 4.0 -webkit-
	5. Opera: 30.0, 15.0 -webkit-, 12.0 -o-

### What are CSS3 Animations? ###
1. Animation lets element change graudally from one style to another.
	1. We can change as many CSS properties as we want.
	2. We can change the properties as many times as we want.
2. Steps:
	1. Specify keyframes (styles the elements may have at specified times)

### The `@keyframes` Rule ###
1. Used to specify styles:
	1. Animation will change from current style to new style at certain times.
2. Example: gradually change background color of `<div>` from red to yellow

		@keyframes  example {
			from { background-color: red; }
			to { background-color: yellow; }
		}

		div {
			width: 100px;
			height: 100px;
			background-color: red;
			animation-name: example;
			animation-duration: 4s;
		}

	1. If `animation-duration` is not specified, the value is 0
	2. `from`: 0% (start), `to`: 100% (complete)
		1. We can use % as well
3. Example:

		@keyframes example {
			0% { background-color: red; }
			25% { background-color: yellow; }
			50% { background-color: blue; }
			100% { background-color: green; }
		}

		div {
			width: 100px;
			height: 100px;
			background-color: red;
			animation-name: example;
			animation-duration: 4s;
		}

4. Example: Change both background-color and position of `<div>` in different stages

		@keyframes example {
			0% { background-color: red; left: 0px; top: 0px; }
			25% { background-color: yellow; left: 200px; top 0px; }
			50% { background-color: blue; left: 200px; top: 200px; }
			75% { background-color: green; left: 0px; top: 200px; }
			100% { background-color: red; left: 0px; top: 0px; }
		}

### Delay an Animation ###
1. `animation-delay` **(M)**
2. Example:

		div {
			width: 100px;
			height: 100px;
			position: relative;
			background-color: red;
			animation-name: example;
			animation-duration: 4s;
			animation-delay: 2s;
		}

### Set How Many Times an Animation Should Run ###
1. `animation-iteration-count`
2. Example:

		div {
			...
			animation-iteration-count: 3;
		}

3. Example: To continue animation for ever

		div {
			...
			animation-iteration-count: infinite;
		}

### Run Animation in Reverse Direction or Alternate Cycles ###
1. `animation-direction` **(M)**
	1. `reverse`
	2. `alternate`
2. Example: Reverse

		div {
			...
			animation-direction: reverse;
		}

3. Example: Alternate

		div {
			...
			animation-direction: alternate;
		}

### Specify the Speed Curve of the Animation ###
1. `animation-timing-function` **(M)**
	1. `ease`
	2. `linear`
	3. `ease-in`
	4. `ease-out`
	5. `ease-in-out`
	6. `cubic-bezier(n, n, n, n)`
2. Example:

		#div1 { animation-timing-function: linear; }
		#div2 { animation-timing-function: ease; }
		#div3 { animation-timing-function: ease-in; }
		#div4 { animation-timing-function: ease-out; }
		#div5 { animation-timing-function: ease-in-out; }

### Animation Shorthand Property ###
1. Example:

		div {
			animation-name: example;
			animation-duration: 5s;
			animation-timing-function: linear;
			animation-delay: 2s;
			animation-iteration-count: infinite;
			animation-direction: alternate;
		}

2. Example: Shorthand

		div { animation: example 5s linear 2s infinite alternate; }

### CSS3 Animation Properties ###
1. `@keygrames`
2. `animation`
3. `animation-delay`
4. `animation-direction`
5. `animation-duration`
6. `animation-fill-mode`: specifies style for element when animation is not playing (when finished or when there is delay)
7. `animation-iteration-count`
8. `animation-name`
9. `animation-play-state`: running or paused
10. `animation-timing-function`

## CSS3 Images ##
### Rounded Images ###
1. `border-radius`
2. Example:

		img {
			border-radius: 8px;
		}

### Thumbnail Images ###
1. Example:

		img {
			border: 1px solid #ddd;
			border-radius: 4px;
			padding: 5px;
			width: 150px;
		}

		img:hover {
			box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
		}

		<a href="paris.jpg">
			<img src="paris.jpg" alt="Paris" />
		</a>

### Responsive Images ###
1. Example:

		img {
			max-width: 100%;
			height: auto;
		}

### Center an Image ###
1. `margin: auto;` & `display: block;`
2. Example:

		img {
			display: block;
			margin: auto;
			width: 50%;
		}

### Poloroid Images/ Cards ###
1. Example:

		div.polaroid {
			width: 80%;
			background-color: white;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		}

		img { width: 100% }

		div.container {
			text-align: center;
			padding: 10px 20px;
		}

		<div class="polaroid">
			<img src="rock600x400.jpg" alt="Norway" style="width:100%">
			<div class="container">
				<p>The Troll's tongue in Hardanger, Norway</p>
			</div>
		</div>

### Transparent Image ###
1. `opacity`
2. Example:

		img {
			opacity: 0.5;
			filter: alpha(opacity=50); /* For IE8 and earlier */
		}

### Image Text ###
1. top-left
2. top-right
3. bottom-left
4. bottom-right
5. centered

### Image Filters ###
1. `filter` **(M)**: Adds visual effects (blur, saturation, ...)
	1. Not supported in IE, Edge 12, and Safari 5.1 and earlier
2. Example: Change image to grayscale

		img {
			-webkit-filter: grayscale(100%);
			filter: grayscale(100%);
		}

3. methods:
	1. `blur(4px)`
	2. `brightness(250%)`
	3. `contrast(180%)`
	4. `grayscale(100%)`
	5. `hue-rotate(180deg)`
	6. `invert(100%)`
	7. `opacity(50%)`
	8. `saturate(7)`
	9. `sepia(100%)`
	10. `drop-shadow(8px 8px 10px green)`

### Image Hover Overlay ###
1. Example:

		.container {
			position: relative;
			width: 50%;
		}

		.image {
			display: block;
			width: 100%;
			height: auto;
		}

		.overlay {
			position: absolute;
			top: 0;
			bottom: 0;
			left: 0;
			right: 0;
			height: 100%;
			width: 100%;
			opacity: 0;
			transition: .5s ease;
			background-color: #008CBA;
		}

		.container:hover .overlay {
			opacity: 1;
		}

		.text {
			color: white;
			font-size: 20px;
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			-ms-transform: translate(-50%, -50%);
		}

		<div class="container">
			<img src="img_avatar.png" alt="Avatar" class="image">
			<div class="overlay">
				<div class="text">Hello World</div>
			</div>
		</div>

2. Example: Slide down overlay

### Responsive Image Gallery ###
1. Example:

		.responsive {
			padding: 0 6px;
			float: left;
			width: 24.99999%;
		}

		@media only screen and (max-width: 700px) {
			.responsive {
				width: 49.99999%;
				margin: 6px 0;
			}
		}

		@media only screen and (max-width: 500px) {
			.responsive {
				width: 100%;
			}
		}

### Image Modal (Advanced) ###
1. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<style>
					body {
						position: relative;
					}
 
					.image {
						max-width: 300px;
						border-radius: 5px;
						transition: opacity 0.2s;
					}

					.image:hover {
						opacity: 0.7;
					}

					.modal {
						padding-top: 100px;
						background-color: rgba(0, 0, 0, 0.9);
						position: fixed;
						width: 100%;
						height: 100%;
						top: 0;
						left: 0;
						display: none;
						z-index: 1;
					}

					.close {
						position: fixed;
						top: 15px;
						right: 35px;
						color: #f1f1f1;
						font-size: 300%;
						font-wight: bold;
						transition: color 0.1s;
					}

					.close:hover {
						cursor: pointer;
						color: #bbb;
					}

					.modal-image {
						display: block;
						margin: auto;
						animation-name: zoom;
						animation-duration: 0.6s;
					}

					#caption {
						display: block;
						color: #ccc;
						width: 80%;
						max-width: 700px;
						margin: auto;
						text-align: center;
						padding: 10px 0;
						height: 150px;
						animation-name: zoom;
						animation-duration: 0.6s;
					}

					@keyframes zoom {
						from { transform: scale(0.1) }
						to { transform: scale(1) }
					}
				</style>
			</head>
			<body>
				<img class="image" src="https://www.w3schools.com/css/img_lights.jpg" alt="Northern Lights, Norway" />

				<div class="modal">
					<span class="close">&#x2715</span>
					<img class="modal-image" />
					<div id="caption"></div>
				</div>

				<script>
					var x = document.getElementsByClassName('close')[0];
					var modal = document.getElementsByClassName('modal')[0];
					var modalImage = document.getElementsByClassName('modal-image')[0];
					var image = document.getElementsByClassName('image')[0];
					var captionText = document.getElementById('caption');

					x.onclick = function () {
						modal.style.display = 'none';
					}

					image.onclick = function() {
						modal.style.display = 'block';
						modalImage.src = this.src;
						captionText.innerHTML = this.alt;
					}
				</script>
			</body>
		</html> 


## CSS3 Buttons ##
### Basic Button Styling ###
1. Example:

		.button {
			background-color: #4CAF50;
			border: none;
			color: white;
			padding: 15px 32px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
		}

### Button Colors ###
1. Example:

		.button1 { background-color: #4CAF50; } /* Green */
		.button2 { background-color: #008CBA; } /* Blue */
		.button3 { background-color: #f44336; } /* Red */
		.button4 { background-color: #e7e7e7; color: black; } /* Gray */
		.button5 { background-color: #555555; } /* Blackish */ 

### Button Sizes ###
1. Example:

		.button1 { font-size: 10px; }
		.button2 { font-size: 12px; }
		.button3 { font-size: 16px; }
		.button4 { font-size: 20px; }
		.button5 { font-size: 24px; }

2. Example: Padding

		.button1 { padding: 10px 24px; }
		.button2 { padding: 12px 28px; }
		.button3 { padding: 14px 40px; }
		.button4 { padding: 32px 16px; }
		.button5 { padding: 16px; }

### Rounded Buttons ###
1. Example:

		.button1 { border-radius: 2px; }
		.button2 { border-radius: 4px; }
		.button3 { border-radius: 8px; }
		.button4 { border-radius: 12px; }
		.button5 { border-radius: 50%; }

### Colored Button Borders ###
1. Example:

		.button1 {
			background-color: white;
			color: black;
			border: 2px solid #4CSF50;
		}

### Hoverable Buttons ###
1. Example:

		.button {
			-webkit-transition-duration: 0.4s;
			transition-duration: 0.4s;
		}

		.button:hover {
			background-color: #4CAF50;
			color: white;
		}

### Shadow Buttons ###
1. Example:

		.button1 {
			box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		}

		.button2:hover {
			box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
		}

### Disabled Buttons ###
1. Example:

		.disabled {
			opacity: 0.6;
			cursor: not-allowed;
		}

		<button ... disabled></button>

### Button Width ###
1. Example:

		.button1 { width: 250px; }
		.button2 { width: 50%; }
		.button3 { width: 100%; }

### Button Groups ###
1. Example:

		.button {
			float: left;
		}

### Bordered Button Groups ###
1. Example:

		.button {
			float: left;
			border: 1px solid green;
		}

### Vertical Button Groups ###
1. Example:

		.button {
			display: block;
		}

### Animated Buttons ###
1. Example:

		.button span {
			cursor: pointer;
			display: inline-block;
			position: relative;
			transition: 0.5s;
		}
	
		.button span:after {
			content: '\00bb';
			position: absolute;
			opacity: 0;
			top: 0;
			right: -20px;
			transition: 0.5s;
		}

		.button:hover span {
			opacity: 1;
			right: 0;
		}

2. Example: Box shadow:

		.button {
			...
			box-shadow: 0 9px #999;
		}

		.button:active {
			box-shadow: 0 5px #666;
			transform: translateY(4px);
		}

3. Example: Flash

		.button {
			position: relative;
			background-color: #4CAF50;
			border: none;
			font-size: 28px;
			color: #FFFFFF;
			padding: 20px;
			width: 200px;
			text-align: center;
			-webkit-transition-duration: 0.4s; /* Safari */
			transition-duration: 0.4s;
			text-decoration: none;
			overflow: hidden;
			cursor: pointer;
		}

		.button:after {
			content: "";
			background: #f1f1f1;
			display: block;
			position: absolute;
			padding-top: 300%;
			padding-left: 350%;
			margin-left: -20px !important;
			margin-top: -120%;
			opacity: 0;
			transition: all 0.8s
		}

		.button:active:after {
			padding: 0;
			margin: 0;
			opacity: 1;
			transition: 0s
		}

## CSS3 Pagination ##
### Simple Pagination ###
### Active and Hoverable Pagination ###
#### Rounded Active and Hoverable Buttons ####
#### Hoverable Transition Effect ####
### Bordered Pagination ###
#### Rounded Borders ####
#### Space Between Links ####
### Pagination Size ###
### Centered Pagination ###
### More Examples ###
### Breadcrumbs ###

## CSS3 Multiple Columns ##
### CSS3 Multi-column Layout ###
### Browser Support ###
### CSS3 Multi-column Properties ###
### CSS3 Creation of Multiple Columns ###
### CSS3 Specify the Gap Between Columns ###
### CSS3 Column Rules ###
### Specify How Many Columns an Element Should Span ###
### Specify The Column Width ###
### CSS3 Multi-columns Properties ###

## CSS3 User Interface ##
### CSS3 User Interface ###
### Browser Support ###
### CSS3 Resizing ###
### CSS3 Outline Offset ###
### CSS3 User Interface Properties ###

## CSS3 Box Sizing ##
### CSS3 Box Sizing ###
### Browser Support ###
### Without the CSS3 box-sizing Property ###
### With the CSS3 box-sizing Property ###

## CSS3 Flexbox ##
### CSS3 Flexbox ###
### Browser Support ###
### CSS3 Flexbox Concepts ###
### Flex Direction ###
### The `justify-content` Property ###
### The `align-items` Property ###
### The `flex-wrap` Property ###
### The `align-content` Property ###
### Flex Item Properties ###
#### Ordering ####
#### Margin ####
#### Perfect Centering ####
#### `align-self` ####
#### flex ####
### More Examples ###
### CSS3 Flexbox Properties ###

## CSS3 Media Queries ##
### CSS2 Introduced Media Types ###
### CSS3 Introduced Media Queries ###
### Browser Support ###
### Media Query Syntax ###
### CSS3 Media Types ###
### Media Queries Simple Examples ###
### CSS3 `@media` Reference ###

## CSS3 MQ Examples ##
### CSS3 Media Queries - More Examples ###
### Width from 520 to 699px - Apply an email icon to each link ###
### Width from 700 to 1000px - Preface the links with a text ###
### Width above 1001px - Apply email address to links ###
### Width above 1151px - Add icon as we used before ###
### More Examples ###

# CSS Responsive #
## RWD Intro ##
### What is Responsive Web Design? ###
### Designing For The Best Experience For All users ###

## RWD Viewport ##
### What is The Viewport? ###
### Setting The Viewport ###
### Size Content to The Viewport ###

## RWD Grid View ##
### What is a Grid-View? ###
### Building a Responsive Grid-View ###

## RWD Media Queries ##
### What is a Media Query? ###
### Add a Breakpoint ###
### Always Design for Mobile First ###
### Another Breakpoint ###
### Orientation: Portrait/ Landscape ###

## RWD Images ##
### Using The width Property ###
### Using The `max-width` Property ###
### Add an Image to The Example Web Page ###
### Background Images ###
### Different Images for Different Devices ###
### HTML5 `<picture>` Element ###

## RWD Videos ##
### Using the `width` Property ###
### Using The `max-width` Property ###
### Add a Video to the Example Web Page ###

## RWD Frameworks ##
### Using W3.CSS ###
### Bootstrap ###

## RWD Templates ##
### W3.CSS Web Site Templates ###
