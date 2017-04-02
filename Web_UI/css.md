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

### List - Shorthand property ###
### Styling List With Colors ###
### More Examples ###
### All CSS List Properties ###

## CSS Tables ##
### Table Borders ###
### Collapse Table Borders ###
### Table Width and Height ###
### Horizontal Alignment ###
### Vertical Alignment ###
### Table Padding ###
### Horizontal Dividers ###
### Hoverable Table ###
### Striped Tables ###
### Table Color ###
### Responsive Table ###
### More Examples ###
### CSS Table Properties ###

## CSS Layout - The display Property ##
### The display Property ###
### Block-level Elements ###
### Inline Elements ###
### Display: none; ###
### Override The Default Display Value ###
### Hide an Element - display:none or visibility:hidden?
### More Examples ###
### CSS Display/Visibility Properties ###

## CSS Layout - width and max-width ##
### Using width, max-widht and margin: auto; ###

## CSS Layout - The position Property ##
### The position property ###
### position: static; ###
### position: relative; ###
### position: fixed; ###
### position: absolute; ###
### Overlapping Elements ###
### Positioning Test In an Image ###
### More Examples ###
### All CSS Positioning Properties ###

## CSS Layout - Overflow ##
### CSS Overflow ###
### Visible ###
### Hidden ###
### Scroll ###
### Auto ###
### overflow-x and overflow-y ###

## CSS Layout - float and clear ##
### The float Property ###
### The clear Property ###
### The clearfix Hack ###
### Web Layout Example ###
### More Examples ###
### All CSS Float Properties ###

## CSS Layout - inline-block ##
### The inline-block Value ###

## CSS Layout - Horizontal & Vertical Align ##
### Center Align Elements ###
### Center Align Text ###
### Center and Image ###
### Left and Right Align - Using position ###
### Left and Right Align - Using float ###
### Center Vertically - Using padding ###
### Center Vertically - Using line-height ###
### Center Vertically - Using position & transform ###

## CSS Combinators ##
### CSS Combinators ###
### Descendent Selector ###
### Child Selector ###
### Adjacent Sibling Selctor ###
### Genaral Sibling Selector ###

## CSS Pseudo-class ##
### What are Pseudo-classes? ###
### Syntax ###
### Anchor Pseudo-classes ###
### Pseudo-classes and CSS Classes ###
### Hover on `<div>` ###
### Simple Tooltip Hover ###
### CSS - The `:first-child` Pseudo-class ###
### Match the first `<p>` element ###
### Match the first `<i>` element in all `<p>` elements ###
### Match all `<i>` elements in all first child `<p>` elements ###
### CSS - The `:lang` Pseudo-class ###
### More Examples ###
### All CSS Pseudo Classes ###
### All CSS Pseudo Elements ###

## CSS Pseudo-element ##
### What are Pseudo-Elements? ###
### Syntax ###
### The `::first-line` Pseudo-element ###
### The `::first-letter` Pseudo-element ###
### Pseudo-elements and CSS Classes ###
### Multiple Pseudo-elements ###
### CSS - The `::before` Pseudo-element ###
### CSS - The `::after` Pseudo-element ###
### CSS - The `::selection` Psudo-element ###
### All CSS Pseudo Elements ###
### All CSS Pseudo Classes ###

## CSS Opacity ##
### Transparent Image ###
### Transparent Hover Effect ###
#### Example explained ####
### Transparent Box ###
### Transparency using RGBA ###
### Text in Transparent Box ###

## CSS Navigation Bar ##
### Demo: Navigation Bars ###
### Navigation Bars ###
### Navigation Bar = List of Links ###
### Vertical Navigation Bar ###
### Vertical Navigation Bar Examples ###
#### Active/ Current Navigation Link ####
#### Center Links & Add Borders ####
#### Full-height Fixed Vertical Navbar ####
### Horizontal Navigation Bar ###
#### Floating List Items ####
### Horizontal Navigation Bar Examples ###
#### Active/ Current Navigation Link ####
#### Right-Align Links ####
#### Border Dividers ####
#### Fixed Navigation Bar ####
#### Gray Horizontal Navbar ####
### More Examples ###

## CSS Dropdowns ##
### Demo: Dropdown Examples ###
### Basic Dropdown ###
#### Example Explained ####
### Dropdown Menu ###
### Right-aligned Dropdown Content ###
### More Examples ###

## CSS Tooltips ##
### Demo: Tooltip Examples ###
### Basic Tooltip ###
#### Example Explained ####
### Position Tooltips ###
### Tooltip Arrows ###
#### Example Explained ####
### Fade In Tooltips (Animation) ###

## CSS Image Gallery ##
### Image Gallery ###
### More Examples ###

## CSS Image Sprites ##
### Image Sprites ###
### Image Sprites - Simple Example ###
### Image Sprites - Creation of a Navigation List ###
### Image Sprites - Hover Effect ###

## CSS Attr Selectors ##
### Style HTML Elements With Specific Attributes ###
### CSS [attribute] Selector ###
### CSS `[attribute="value"]` Selector ###
### CSS `[attribute~="value"]` Selector ###
### CSS `[attribute|="value"]` Selector ###
### CSS `[attribute^="value"]` Selector ###
### CSS `[attribute$="value"]` Selector ###
### CSS `[attribute*="value"]` Selector ###
### Styling Forms ###
### More Examples of CSS Selectors ### 

## CSS Forms ##
### Styling Input Fields ###
### Padded Inputs ###
### Bordered Inputs ###
### Colored Inputs ###
### Focused Inputs ###
### Input with icon/image ###
### Animated Search Input ###
### Styling Textareas ###
### Styling Select Menus ###
### Styling Input Buttons ###

## CSS Counters ##
### Automatic Numbering With Counters ###
### Nesting Counters ###
### CSS Counter Properties ###

# CSS 3 #
## CSS3 Introduction ##
### CSS3 Modules ###

## CSS3 Rounded Corners ##
### Browser Support ###
### CSS3 `border-raduis` Property ###
### CSS3 `border-radius` - Specify Each Corner
### CSS3 Rounded Corners Properties ###

## CSS3 Border Images ##
### Browser Support ###
### CSS3 Border-image Property ###
### CSS3 border-image - Different Slice Values ###
### CSS3 Border Properties ###

## CSS3 Backgrounds ##
### Browser Support ###
### CSS3 Multiple Backgrounds ###
### CSS3 Background Size ###
### Defines Sizes of Multiple Background Images ###
### Full Size Background Image ###
### CSS3 `background-origin` Property ###
### CSS3 `background-clip` Property ###
### CSS3 Background Properties ###

## CSS3 Colors ##
### CSS3 Colors ###
### Browser Support ###
### RGBA Colors ###
### HSL Colors ###
### HSLA Colors ###
### Opacity ###

## CSS3 Gradients ##
### Browser Support ###
### CSS3 Linear Gradients ###
### Using Angles ###
### Using Multiple Color Stops ###
### Using Transparency ###
### Repeating a `linear-gradient` ###
### CSS3 Radial Gradients ###
### Set Shape ###
### Use of Different Size Keywords ###
### Repeating a radial-gradient ###

## CSS3 Shadows ##
### CSS3 Shadow Effects ###
### Browser Support ###
### CSS3 Text Shadow ###
### Multiple Shadows ###
### CSS3 `box-shadow` Property ###
### Cards ###
### CSS3 Shadow Properties ###

## CSS3 Text ##
### CSS3 Text ###
### Browser Support ###
### CSS3 Text Overflow ###
### CSS3 Word Wrapping ###
### CSS3 Word Breaking ###
### CSS3 Text Properties ###

## CSS3 Fonts ##
### CSS3 Web Fonts - The `@font-face` Rule ###
### Browser Support ###
### Different Font Formats ###
### Browser Support for Font Formats ###
### Using The Font You Want ###
### Using Bold Text ###
### CSS3 Font Descriptors ###

## CSS3 2D Transforms ##
### CSS3 Transforms ###
### Browser Support for 2D Transforms ###
### CSS3 2D Transforms ###
### The `translate()` Method ###
### The `rotate()` Method ###
### The `scale()` Method ###
### The `skewX()` Method ###
### The `skewY()` Method ###
### The `skew()` Method ###
### The `matrix()` Method ###
### CSS3 Transform Properties ###
### 2D Transform Methods ###

## CSS3 3D Transforms ##
### CSS3 3D Transforms ###
### Browser Support for 3D Transforms ###
### CSS3 3D Transforms ###
### The `rotateX()` Method ###
### The `rotateY()` Method ###
### The `rotateZ()` Method ###
### CSS3 Transform Properties ###
### 3D Transform Methods ###

## CSS3 Transitions ##
### CSS3 Transitions ###
### Browser Support for Transitions ###
### How to Use CSS3 Transitions? ###
### Change Several Property Values ###
### Specify the Speed Curve of the Transition ###
### Delay the Transition Effect ###
### Transition + Transformation ###
### More Transition Examples ###
### CSS3 Transition Properties ###

## CSS3 Animations ##
### CSS3 Animations ###
### Browser Support for Animations ###
### What are CSS3 Animations? ###
### The `@keyframes` Rule ###
### Delay an Animation ###
### Set How Many Times an Animation Should Run ###
### Run Animation in Reverse Direction or Alternate Cycles ###
### Specify the Speed Curve of the Animation ###
### Animation Shorthand Property ###
### CSS3 Animation Properties ###

## CSS3 Images ##
### Rounded Images ###
### Thumbnail Images ###
### Responsive Images ###
### Center an Image ###
### Poloroid Images/ Cards ###
### Transparent Image ###
### Image Text ###
### Image Filters ###
### Image Hover Overlay ###
### Responsive Image Gallery ###
### Image Modal (Advanced) ###

## CSS3 Buttons ##
### Basic Button Styling ###
### Button Colors ###
### Button Sizes ###
### Rounded Buttons ###
### Colored Button Borders ###
### Hoverable Buttons ###
### Shadow Buttons ###
### Disabled Buttons ###
### Button Width ###
### Button Groups ###
### Bordered Button Groups ###
### Vertical Button Groups ###
### Animated Buttons ###

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
