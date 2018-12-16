## HTML Forms ##
#### The `<form>` Element ####
1. It defines a form used to collect user input

		<form>
			.
			form elements
			.
		</form>

2. It contains form elements
	1. form elements: different types of input elements
		1. text fields
		2. checkboxes
		3. radio buttons
		4. submit buttons
		5. ...

#### The `<input>` Element ####
1. Most important element
2. `type` defines the type of input element
3. Examples:
	1. `<input type="text">`: one-line text input field
	2. `<input type="radio">`: radio button (to select one of many choices)
	3. `<input type="sumit">`> Defines submit button (sumits form)

#### Text Input ####
1. Example:

		<form>
			First name:<br />
			<input type="text" name="firstname"><br />
			Last name:<br />
			<input type="text" name="lastname">
		</form>

	1. Default width: 20 characters

#### Radio Button Input ####
1. Used to select one of a limited number of choices

		<form>
			<input type="radio" name="gender" value="male" checked> Male<br />
			<input type="radio" name="gender" value="female"> Female<br />
			<input type="radio" name="gender" value="other"> Other
		</form>

#### The Submit Button ####
1. It is a button used to submit form data to form handler (server page say which processes input data)

		<form action="/action_page.php">
			First name:<br />
			<input type="text" name="firstname" value="Mickey"><br />
			Last name:<br />
			<input type="text" name="lastname" value="Mouse"><br />
			<input type="submit" value="Submit">
		</form>

#### The Action Attribute ####
1. It defines the action to be performed when form is submitted.
2. Usually data is sent to a web page on server
	1. `/action_page.php`: server side script that handles form data
3. **If action is omitted, the action is set to the current page**

#### The Method Attribute ####
1. Specifies HTTP method (GET or POST) used when submitting the form data
2. GET example:

		<form action="/action_page.php" method="get">

3. POST example:

		<form action="/action_page.php" method="post">

#### When to Use GET? ####
1. It is default method
2. Submitted form data is visible in the page address

		/action_page.php?firstname=Mickey&lastname=Mouse

3. Don't use when sending sensitive info

#### When to Use POST? ####
1. Used when form contains sensitive or personal info.
2. It does not display form data in submitted address field.
3. It has no size limitation

#### The Name Attribute ####
1. `<input ...name="..."`>: Each input field must have a name attribute
	1. If omitted, data is not sent

#### Grouping Form Data with `<fieldset>` ####
1. `<fieldset>` **(M)** groups related data
2. `<legend>` **(M)**: defines a caption for fieldset
3. Example:

		<form action="/action_page.php">
			<fieldset>
				<legend>Personal Information:</legend>
				First name:<br />
				<input type="text" name="firstname" value="Mickey"><br />
				Last name:<br />
				<input type="text" name="lastname" value="Mouse"></br />
				<input type="submit" value="Submit">
			</fieldset>
		</form>

#### `<form>` Attributes **(M)** ####
1. `accept-charset`: character set used in submitted form (default: page charset)
2. `action`: address (url) where to submit the form (default: submitting page)
3. `autocomplete`: should browser autocomplete the form (default: on)
4. `enctype`: encoding of submitted data (default: url-encoded)
5. `method`: HTTP method (default: GET)
6. `name`: name used to identify the form (DOM usage: document.forms.name)
7. `novalidate`: browser should not validate the form
8. `target`: target of address in action (default: _self)

### HTML Form Elements ###
#### The `<input>` Element ####
1. Displayed based on `type` value

#### The `<select>` Element ####
1. Defines a dropdown list

		<select name="cars">
			<option value="volvo">Volvo</option>
			<option value="saab">Saab</option>
			<option value="fiat">Fiat</option>
			<option value="audi">Audi</option>
		</select>

	1. `<option>`: defines an option that can be selected
	2. Default: First item is selected
2. `selected` **(M)**: defines a pre-selected option other than default

		<option value="fiat" selected>Fiat</option>

#### The `<textarea>` Element ####
1. Defines a multi-line input field

		<textarea name="message" rows="10" cols="30">
			The cat was playing in the garden.
		</textarea>

	1. `rows`: visible number of lines in a text area
	2. `cols`: visible number of columns in a text area

#### The `<button>` Element ####
1. It is a clickable button

		<button type="button" onclick="alert('Hello World!!)">Click Me!</button>

#### HTML5 Form Elements ####
1. `<datalist>`
2. `<keygen>`
3. `<output>`
4. If new elements are not supported browser will not display them

#### HTML5 `<datalist>` Element ####
1. `<datalist>`: list of predefined options for an `<input>` element
2. Example:

		<form action="/action_page.php">
			<input list="browsers">
			<datalist id="browsers">
				<option value="Internet Explorer">
				<option value="Firefox">
				<option value="Chrome">
				<option value="Opera">
				<option value="Safari">
			</datalist>
		</form>

#### HTML5 `<keygen>` Element ####
1. Purpose: Provides a secure way to authenticate users
2. Specifies key-pair generator field in a form
3. When the form is submitted, two keys are generated, one private and one public
	1. private key: is stored locally
	2. public key: is sent to server
		1. Can be used to generate a certificate to authenticate user in future
4. Example:

		<form action="/action_page.php">
			Username: <input type="text" name="user">
			Encryption: <keygen name="security">
			<input type="submit">

		</form>

#### HTML5 `<output>` Element ####
1. `<output>`: represents result of a calculation
2. Example:

		<form action="/action_page.php" oninput="x.value=parseInt(a.value) + parseInt(b.value)">
			0
			<input type="range" id="a" name="a" value="50">
			100 +
			<input type="number" id="b" name="b" value="50">
			=
			<output name="x" for="a b"></output>
			<input type="submit">
		</form>

#### HTML Form Elements ####
1. `<form>`: HTML form for user input
2. `<input>`: Input control
3. `<textarea>`: multiline input control (text area)
4. `<label>`: label for `<input>` element
	
		<label for="male">Male</label>
		<input type="radio" name="gender" id="male" value="male"><br />

	1. `for="<element-id>"`: which form element the label is bound to
	2. `form="<form-id>, ..."`: form(s) the label belongs to

5. `<fieldset>`: Groups related elements in a form
6. `<legend>`: Caption for field set
7. `<select>`: drop-down list
8. `<optgroup>`: group of related options in a drop-down list
9. `<button>`: clickable button
10. `<datalist>`: list of pre-defined options for input controls
11. `<keygen>`: key-pair generator field (for forms)
12. `<output>`: result of a calculation

### HTML Input Types ###
#### Input Type Text ####
1. `type="text"`: defines one line input element

		<form>
			First name:<br />
			<input type="text" name="firstname"><br />
			Last name:<br />
			<input type="text" name="lastname">
		</form>

#### Input Type Password ####
1. `type="password"`

		<form>
			User name:<br />
			<input type="text" name="username"><br />
			User password:<br />
			<input type="password" name="password">
		</form>

#### Input Type Submit ####
1. `type="submit"`: defines a button for submitting form data to a form-handler
	1. If `value` is omitted, it will get default value

#### Input Type Reset ####
1. `type="reset"` **(M)**: resets all form values to default values

		<form action="/action_page.php">
			First name:<br />
			<input type="text" name="firstname" value="Mickey"><br />
			Last name:<br />
			<input type="text" name="lastname" value="Mouse"><br />
			<input type="submit" value="Submit">
			<input type="reset">
		</form> 

#### Input Type Radio ####
1. `type="radio"`

		<form>
			<input type="radio" name="gender" value="male" checked> Male<br />
			<input type="radio" name="gender" value="female"> Female<br />
			<input type="radio" name="gender" value="other"> Other
		</form>

#### Input Type Checkbox ####
1. `type="checkbox"`: Used to select zero or more options
2. Example:

		<form>
			<input type="checkbox" name="vehicle1" value="Bike"> I have a bike<br />
			<input type="checkbox" name="vehicle2" value="Car"> I have a car<br />
		</form>

#### Input Type Button ####
1. `type="button"`: defines a button
2. Example:

		<input type="button" onclick="alert('Hello World!')" value="Click Me!">

#### HTML5 Input Types ####
1. HTML5 added new types:
	1. color
	2. date
	3. datetime-local
	4. email
	5. month
	6. number
	7. range
	8. search
	9. tel
	10. time
	11. url
	12. week
2. If input types are not supported then they will behave as `type="text"`

#### Input Type Color ####
1. `type="color"`: a color picker can show up (browser must support)
2. Example:

		<form>
			Pick your favorite color:
			<input type="color" name="favcolor">
		</form>

#### Input Type Date ####
1. `type="date"`: input fields that should contain a date
	1. If browser supports, a date picker can show up
2. Example:

		<form>
			Birthday:
			<input type="date" name="bday">
		</form>

3. We can add restrictions to dates

		<form>
			Enter a date before 1980-01-01:
			<input type="date" name="bday" max="1979-12-31"><br />
			Enter a date after 2000-01-01:
			<input type="date" name="bday" min="2000-01-02"><br />
		</form>

#### Input Type Datetime-local ####
1. `type="datetime-local"`: date and time input field with no timezone
2. Example:

		<form>
			Birthday (date and time):
			<input type="datetime-local" name="bdaytime">
		</form>

#### Input Type Email ####
1. `type="email"`: for inputs that must be email addresses
	1. If browser supports, emails can be automatically validated
2. Smartphones may recognize the input type and show `.com` on the keyboard
3. Example:

		<form>
			E-mail:
			<input type="email" name="email">
		</form>

#### Input Type Month ####
1. `type="month"`: allows user to select month and year
2. Example:

		<form>
			Birthday (month and year):
			<input type="month" name="bdaymonth">
		</form>

#### Input Type Number ####
1. `type="number"`: numeric input field
	1. We can also set restrictions on what numbers may be accepted
2. Example:

		<form>
			Quantity (between 1 and 5):
			<input type="number" name="quantity" min="1" max="5">
		</form>

#### Input Restrictions ####
1. Common input restrictions:
	1. `disabled`: input field should be disabled
	2. `max`: maximum value
	3. `maxlength`: maximum number of characters
	4. `min`: minimum value
	5. `pattern`: regular expression to check input value against
	6. `readonly`: input field is read only (cannot be changed)
	7. `required`: input field is required
	8. `size`: width (in characters)
	9. `step`: legal number intervals for input field
	1. `value`: default value
2. Example: Display numeric input field where we can enter a value between 0 to 100 in steps of 10. Default is 30

		<form>
			Quantity:
			<input type="number" name="quantity" min="0" max="100" step="10" value="30">
		</form>

#### Input Type Range ####
1. `type="range"`: a control for entering numbers whose exact value is not important (a slider). Default range is 0 to 100.
	1. Set min and max to set custom values
2. Example:

		<form>
			<input type="range" name="points" min="0" max="10">
		</form>

#### Input Type Search ####
1. `type="search"`: it is used for search fields (search field behaves like regular text field)
2. Example:

		<form>
			Search Google:
			<input type="search" name="googlesearch">
		</form>

#### Input Type Tel ####
1. `type="tel"`: input that should contain telephone number
	1. Safari 8 and above can support
2. Example:

		<form>
			Telephone:
			<input type="tel" name="usrtel">
		</form>

#### Input Type Time ####
1. `type="time"`: user can select time (no timezone)
2. If browser supports, a time picker can show up
3. Example:

		<form>
			Select a time:
			<input type="time" name="usr_time">
		</form>

#### Input Type URL ####
1. `type="url"`: input field that should contain URL address
2. If browser supports, url field can be automatically validated when submitted.
3. Some smartphones recognize url type, and adds `.com` to keyboard
4. Example:

		<form>
			Add your homepage:
			<input type="url" name="homepage">
		</form>

#### Input Type Week ####
1. `type="week"`: to select week and year
2. If browser supports, date picker can appear

		<form>
			<input type="week" name="week_year">
		</form>

### HTML Input Attributes ###
#### The value Attribute ####
1. Specifies initial value for an input field:

		<form action="">
			First name:<br />
			<input type="text" name="firstname" value="John">
		</form>

#### The readonly Attribute ####
1. Specifies that the input field is readonly (cannot be changed)

		<form action="">
			First name:<br />
			<input type="text" name="firstname" value="John" readonly>
		</form>

#### The disabled Attribute ####
1. `disabled`: specifies that the input field is disabled (unusable, unclickable, value is not sent when submitted)

		<form action="">
			First name:<br />
			<input type="text" name="firstname" value="John" disabled>
		</form>

#### The size Attribute ####
1. `size`: size in characters of input field (visibility)

		<form action="">
			First name:<br />
			<input type="text" name="firstname" value="John" size="40">
		</form>

#### The maxlength Attribute ####
1. `maxlength`: maximum allowed length for input field

		<form action="">
			First name:<br />
			<input type="text" name="firstname" maxlength="10">
		</form>

	1. input field will not accept more than the specified number of characters
		1. Javascript can illegally add more characters. Hence the length must also be checked by server

#### HTML5 Attributes ####
1. HTML5 added attributes (`<input>`):
	1. autocomplete
	2. autofocus
	3. form
	4. formaction
	5. formenctype
	6. formmethod
	7. formnovalidate
	8. formtarget
	9. height and width
	10. list
	11. min and max
	12. multiple
	13. pattern (regexp)
	14. placeholder
	15. required
	16. step
2. `<form>`
	1. autocomplete
	2. novalidate

#### The autocomplete Attribute ####
1. `autocomplete`: should a form or field have autocomplete on or off
2. Browser automatically completes input values based on values the user has entered before.
3. `autocomplete` can be on for form but off for specific fields
4. Works with: `form`, `text`, `search`, `url`, `tel`, `email`, `password`, `datepicker`, `range`, `color`
5. Example:

		<form action="/action_page.php" autocomplete="on">
			First name: <input type="text" name="fname"><br />
			Last name: <input type="text" name="lname"><br />
			E-mail: <input type="email" name="email" autcomplete="off"><br />
			<input type="submit">
		</form>

#### The novalidate Attribute ####
1. `novalidate`: form attribute which specifies that the form data should not be validated when submitted
2. Example:

		<form action="/action_page.php" novalidate>
			E-mail: <input type="email" name="user_email">
			<input type="submit">
		</form>

#### The autofocus Attribute ####
1. `autofocus`: input field should automatically get focus when page loads

		First name: <input type="text" name="fname" autofocus>

#### The form Attribute ####
1. `form`: one or more forms an input element belongs to (space separated list of form ids)
2. Example:

		<form action="/action_page.php" id="form1">
			First name: <input type="text" name="fname"><br />
			<input type="submit" value="Submit">
		</form>

		Last name: <input type="text" name="lname" form="form1">

#### The formaction Attribute ####
1. `formaction`: specifies URL of a file that will process the input control when the form is submitted.
	1. It overrides `action` attribute of `form`
2. It is used with `type="submit"` and `type="image"`
3. Example:

		<form action="/action_page.php">
			First name: <input type="text" name="fname"><br />
			Last name: <input type="text" name="lname"><br />
			<input type="submit" value="Submit"><br />
			<input type="submit" formaction="/action_page2.php" value="Submit as admin">
		</form>

#### The formenctype Attribute ####
1. `formenctype`: specifies how form data should be encoded when data is submitted
2. Overrides `enctype` attribute of `<form>` element
3. Used with `type="submit"` and `type="image"`

		<form action="/action_page_binary.asp" method="post">
			First name: <input type="text" name="fname"><br />
			<input type="submit" value="Submit">
			<input type="submit" formenctype="multipart/form-data" value="Submit as Multipart/form-data">
		</form>

#### The formmethod Attribute ####
1. `formmethod`: HTTP method to send form data to action URL
	1. It overrides the method attribute of `<form>`
	2. It can be used with `type="submit"` and `type="image"`
2. Example:

		<form action="/action_page.php" method="get">
			First name: <input type="text" name="fname"><br />
			Last name: <input type="text" name="lname"><br />
			<input type="submit" value="Submit">
			<input type="submit" formmethod="post" formaction="action_page_post.asp" value="Submit using POST">
		</form>

#### The formnovalidate Attribute ####
1. `formnovalidate`: overrides `novalidate` attribute of `<form>`
	1. It can be used with type `submit`

			<form action="/action_page.php">
				E-mail: <input type="email" name="userid"><br />
				<input type="submit" value="Submit"><br />
				<input type="submit" formnovalidate value="Submit without validation">
			</form>

#### The formtarget Attribute ####
1. `formtarget`: specifies name or keywoard that indicates where to display response that is received after submitting the form
	1. It overrides the `target` attribute of `<form>`
	2. It can be used with type `submit` and `image`
2. Example:

		<form action="/action_page.php">
			First name: <input type="text" name="fname"><br />
			Last name: <input type="text" name="lname"><br />
			<input type="submit" value="Submit as normal">
			<input type="submit" formtarget="_blank" value="Submit to a new window">
		</form>

#### The height and width Attributes ####
1. `height` and `width` attributes are used for `type="image"` (if not specified, page will flicker while image loads)
2. Example:

		<input type="image" src="https://www.w3schools.com/html/img_submit.gif" alt="Submit" width="48" height="48">

#### The list Attribute ####
1. `list` refers to a `<datalist>` element
2. Example:

		<input list="browsers">

		<datalist id="browsers">
			<option value="Internet Explorer">
			<option value="Firefox">
			<option value="Chrome">
			<option value="Opera">
			<option value="Safari">
		</datalist>

#### The min and max Attributes ####
1. `min` and `max` attributes are used to specify minimum and maximum values for an `<input>` element
	1. `number`, `range`, `date`, `datetime-local`, `month`, `time`, `week`
2. Example:

		Enter a date before 1980-01-01:
		<input type="date" name="bday" max="1979-12-31">

		Enter a date after 2000-01-01:
		<input type="date" name="bday" min="2000-01-02">

		Quantity (between 1 and 5):
		<input type="number" name="quantity" min="1" max="5">

#### The multiple Attribute ####
1. `multiple` **(M)**: User can enter multiple values in the input
	1. `email`, `file`
2. Example:

		Select images: <input type="file" name="img" multiple>

#### The pattern Attribute ####
1. `pattern` attribute specifies a regular expression that `<input>` element's value is checked against
	1. `text`, `search`, `url`, `tel`, `email`, `password`
2. Use `title` attribute to describe pattern to help user
3. [regular expressions](https://www.w3schools.com/js/js_regexp.asp)
4. Example:

		Country code: <input type="text" name="country_code" pattern="[A-Za-z]{3}" title="Three letter country code">

#### The placeholder Attribute ####
1. `placeholder` specifies a hint that describes expected value of input field (sample value or description of the format)
2. Hint is displayed in input field before user enters a value
3. Input types supporting the attribute:
	1. `text`, `search`, `url`, `tel`, `email`, `password`
4. Example:

		<input type="text" name="fname" placeholder="First name">

#### The required Attribute ####
1. `required`: specifies that an input field must be filled before submitting the form
2. Input fields supporting the attribute:
	1. `text`, `search`, `url`, `tel`, `email`, `password`, `date picker`, `number`, `checkbox`, `radio`, and `file`
3. Example:

		Username: <input type="text" name="usrname" required>

#### The step Attribute ####
1. `step` attribute specifies legal number intervals for an `<input>` element
2. Example: if `step="3"`, legal numbers are ... -3, 0, 3, 6, ...
3. Can be used with min and max
4. Works with the following types:
	1. `number`, `range`, `date`, `datetime-local`, `month`, `time`, and `week`
5. Example:

		<input type="number" name="points" step="3">

## HTML5 ##
### HTML5 Intro ###
#### What is New in HTML5? ####
1. `DOCTYPE` is simple
	1. `<DOCTYPE html>`
2. Character encodig (charset) is simple
	1. `<meta charset="UTF-8">`

#### New HTML5 Elements ####
1. Semantic elements:
	1. `<header>`, `<footer>`, `<article>`, `<section>`
2. Attributes of form elements:
	1. `number`, `date`, `time`, `calendar`, and `range`
3. Graphic elements:
	1. `<svg>`, `<canvas>`
4. Multimedia elements: `<audio>`, `<video>`

#### New HTML5 API's (Application Programming Interfaces) ####
1. HTML Geolocation
2. HTML Drag and Drop
3. HTML Local Storage
4. HTML Application Cache
5. HTML Web Workers
6. HTML SSE

#### Removed Elements in HTML5 ####
1. `<HTML4>`, `<HTML5>`
2. `<acronym>`, `<abbr>`
3. `<applet>`, `<object>`
4. `<basefont>`, CSS
5. `<big>`, CSS
6. `<center>`, CSS
7. `<dir>`, `<ul>`
8. `<font>`, CSS
9. `<frame>`, -
10. `<frameset>`, -
11. `<noframes>`, -
12. `<strike>`, CSS, `<s>`, or `<del>`
13. `<tt>`, CSS

#### HTML5 History ####
1. WHATWG (Web Hypertext Application Technology Working Group) wanted HTML to be a living standard: always updated and improved but old functionality cannot be removed.
	1. [WHATWG HTML5 Living Standard](http://whatwg.org/html/)
2. W3C wanted to develop a definitive HTML5 and XHTML standard
	1. [W3C HTML5 recommendation](http://www.w3.org/TR/html5/)
	2. [HTML 5.1 Candidate Recommendation](http://www.w3.org/TR/html51/)

### HTML5 Support ###
1. You can teach older browsers to handle HTML5 correctly.

#### HTML5 Browser Support ####
1. It is supported in all modern browsers.
2. All browsers, old and new, automatically handle unrecognized elements as inline elements.

#### Define Semantic Elements as Block Elements ####
1. 8 new semantic elements. All of them are `block-level` elements
2. For older browsers, set CSS `display` property to `block`

		header, section, footer, aside, nav, main, article, figure {
			display: block;
		}

#### Add New Elements to HTML ####
1. Using a browser trick, we can add new elements
2. Example:

		<!DOCTYPE html>
		<html>
			<head>
				<script>document.createElement('myHero')</script>
				<style>
					myHero {
						display: block;
						background-color: #dddddd;
						padding: 50px;
						font-size: 30px;
					}
				</style>
			</head>
			<body>
				<h1>A Heading</h1>
				<myHero>My Hero Element</myHero>
			</body>
		</html>

	1. `document.createElement('myHero')` is required in IE 9 and earlier

#### Problem With Internet Explorer 8 ####
1. IE 8 does not allow styling of unknown elements
2. HTML5Shiv: JavaScript workaround to enable styling of HTML5 elements in versions of IE prior to v9

#### Syntax For HTML5Shiv ####
1. It must be in `<head>`
2. It is a javascript file
3. Use HTML5Shiv when using new HTML5 elements (`<article>`, `<section>`, `<aside>`, `<nav>`, `<footer>`)
4. Source: [latest version of HTML5Shiv](https://github.com/aFarkas/html5shiv)
5. CDN: [https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js](https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js)
6. Syntax:

		<head>
			<!--[if lt IE 9]>
				<script src="/js/html5shiv.js"></script>
			<![endif]-->
		</head>

#### HTML5Shiv Example ####
1. Using CDN

		<!DOCTYPE html>
		<html>
			<head>
				<meta charset="UTF-8">
				<!--[if lt IE 9]>
					<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
				<![endif]-->
			</head>
			<body>
				<section>
					<h1>Famous Cities</h1>

					<article>
						<h2>London</h2>
						<p>London is the capital city of England. It is the most populous city in the United Kingdom, with a metropolitan area of over 13 million inhabitants.</p>
					</article>

					<article>
						<h2>Paris</h2>
						<p>Paris is the capital and most populous city of France.</p>
					</article>

					<article>
						<h2>Tokyo</h2>
						<p>Tokyo is the capital of Japan, the center of the Greater Tokyo Area, and the most populous metropolitan area in the world.</p>
					</article>
				</section>
			</body>
		</html>

### HTML5 Elements ###
#### New Semantic/Structural Elements ####
1. `<article>`: article
2. `<aside>`: content aside from page content
3. `<bdi>`: part of text that might be formatted in a different direction from other text
4. `<details>`: additional details that user can view or hide
5. `<dialog>`: dialog box or window
6. `<figcaption>`: caption for `<figure>` element
7. `<figure>`: self-contained content (illustrations, diagrams, photos, code listings, ...)
8. `<header>`: header for document or section
9. `<main>`: main content of document
10. `<mark>`: marked or highlighted text
11. `<menuitem>`: command/menu item that user can invoke from popup menu
12. `<meter>`: defines scalar measurement within known range (a guage)
13. `<nav>`: navigation links in document
14. `<progress>`: Defines progress of a task
15. `<rp>`: Defines what to show in browsers that do not support ruby annotations
16. `<ruby>`: Ruby annotation (for East Asian typography)
17. `<section>`: section
18. `<summary>`: visible heading for `<details>` element
19. `<time>`: Defines date/time
20. `<wbr>`: Defines possible line-break

#### New Form Elements ####
1. `<datalist>`: pre-defined options for input controls
2. `<keygen>`: key-pair generator field
3. `<output>`: result of calculation

#### New Input Types ####
1. New Input Types:
	1. color
	2. date
	3. datetime
	4. datetime-local
	5. email
	6. month
	7. number
	8. range
	9. search
	10. tel
	11. time
	12. url
	13. week
2. New Input Attributes
	1. autocomplete
	2. autofocus
	3. form
	4. formaction
	5. formenctype
	6. formmethod
	7. formnovalidate
	8. formtarget
	9. height and width
	10. list
	11. min and max
	12. multiple
	13. pattern (regexp)
	14. placeholder
	15. required
	16. step

#### HTML5 - New Attribute Syntax ####
1. 4 syntaxes:
	1. Empty: `<input type="text" value="John" disabled>`
	2. Unquoted: `<input type="text" value=John>`
	3. Double-quoted: `<input type="text" value="John Doe">`
	4. Single-quoted: `<input type="text" value='John Doe'>`

#### HTML5 Graphics ####
1. `<canvas>`: draw graphics on the fly, via scripting (usually JavaScript)
2. `<svg>`: draw scalable vector graphics

#### New Media Elements ####
1. `<audio>`: sound content
2. `<embed>`: external applications (like plug-ins)
3. `<source>`: sources for `<video>`, `<audio>`
4. `<track>`: tracks for `<video>` and `<audio>`
5. `<video>`: video or movie content

### HTML5 Semantics ###
1. Semantics: study of meanings of words and phrases in a language
	1. Semantic elements: elements with a meaning

#### What are Semantic Elements? ####
1. It describes its meaning to both browser and developer
2. Non-semantic elements:
	1. `<div>`, `<span>`: tells nothing about the content
3. Semantic elements:
	1. `<form>`, `<table>`, `<article>`: defines its content

#### Browser Support ####
1. Chrome
2. IE
3. Firefox
4. Safari
5. Opera

#### New Semantic Elements in HTML5 ####
1. New semantic elements:
	1. `<article>`
	2. `<aside>`
	3. `<details>`
	4. `<figcaption>`
	5. `<figure>`
	6. `<footer>`
	7. `<header>`
	8. `<main>`
	9. `<mark>`
	10. `<nav>`
	11. `<section>`
	12. `<summary>`
	13. `<time>`

	![Figure](img_sem_elements.gif)

#### HTML5 `<section>` Element ####
1. Defines a section in a document
	1. It is a thematic group of content typically with a heading
	2. Example:
		1. Introduction section
		2. Content section
		3. Contact section
2. Example:

		<section>
			<h1>WWF</h1>
			<p>The World Wide Fund for Nature (WWF) is ....</p>
		</section>

#### HTML5 `<article>` Element ####
1. Defines an independent self-contained content (possible to be read independently from the rest of the web-site).
2. Example usage:
	1. Forum post
	2. Blog post
	3. Newspaper article
3. Example:

		<article>
			<h1>What Does WWF Do?</h1>
			<p>WWF's mission is to stop the degradation of our planet's natural environment, and build a future in which  humans live in harmony with nature.</p>
		</article>

#### Nesting `<article>` in `<section>` or Vice Versa? ####
1. `<article>`: specifies independent, self contained content
2. `<section>`: defines section in a document.
3. We can nest one in another (no decision on hierarchy)
4. Example:
	1. sport articles in sport section may have technical section in each article

#### HTML5 `<header>` Element ####
1. `<header>` specifies header of a document or section.
	1. It must be used as a container for introductory content
2. Example:

		<article>
			<header>
				<h1>What Does WWF Do?</h1>
				<p>WWF's mission:</p>
			</header>
			<p>WWF's mission is to stop the degradation of our planet's natural environment, and build a future in which humans live in harmony with nature.</p>
		</article>

#### HTML5 `<footer>` Element ####
1. `<footer>` specifies a footer for the document or section
	1. Should contain information about its containing element
		1. Author
		2. Copyright info
		3. links to terms of use
		4. Contact information
		5. ...
2. A document can have many footer elements
3. Example:

		<footer>
			<p>Posted by: Someone</p>
			<p>Contact information: <a href="mailto:someone@example.com">someone@example.com</a>.</p>
		</footer>

#### HTML5 `<nav>` Element ####
1. `<nav>` defines a set of navigation links
	1. Intended only for major block of navigation links
2. Example:

		<nav>
			<a href="/html/">HTML</a> |
			<a href="/css/">CSS</a> |
			<a href="/js/">JavaScript</a> |
			<a href="/jquery/">jQuery</a>
		</nav>

#### HTML5 `<aside>` Element ####
1. `<aside>` defines content aside from content it is placed in (like a sidebar)
	1. Content should be related to surrounding content
2. Example:

		<p>His family and he visited The Epcot center</p>

		<aside>
			<h4>Epcot Center</h4>
			<p>The Epcot Center is a theme part in Disney World, Florida.</p>
		</aside>

#### HTML5 `<figure>` and `<figcaption>` Elements ####
1. `figure` caption adds visual explanation to an image
2. image and caption can be grouped in `<figure>`
3. Example:

		<figure>
			<img src="pic_mountain.jpg" alt="The Pulpit Rock" width="304" height="228">
			<figcaption>Fig1. - The Pulpit Rock, Norway.</figcaption>
		</figure>

#### Why Semantic Elements? ####
1. Preiously, developers styled elements using their own id/class. This made it difficult for search engines to identify correct web page content.
2. Semantic elements make it easier for search engines to identify web page content.
3. W3C: Semantic web allows data to be shared and reused across applications, enterprises, and communities.

#### Semantic Elements in HTML5 ####
1. Alphabetical list:
	1. `<article>`
	2. `<aside>`: content aside from page content
	3. `<details>`: additional details a user can view or hide

			<details>
				<summary>Copyright 1999-2014.</summary>
				<p> - by Refsnes Data. All Rights Reserved.</p>
				<p>All content and graphics on this web site are the property of the company Refsnes Data.</p>
			</details>

	4. `<figcaption>`: caption for `<figure>`
	5. `<footer>`: footer for a document or section
	6. `<header>`: header for a document or section
	7. `<main>`: main content of a document
	8. `<mark>`: marked/highlighted text
	9. `<nav>`: navigation links
	10. `<section>`: section
	11. `<summary>`: visible heading for `<details>` element
	12. `<time>`: date/time

### HTML5 Migration ###
#### Migration from HTML4 to HTML5 ####
1. `<div id="header">` to `<header>`
2. `<div id="menu">` to `<nav>`
3. `<div id="content">` to `<section>`
4. `<div id="article">` to `<article>`
5. `<div id="footer">` to `<footer>`

#### A Typical HTML4 Page ####
1. Example:

		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html lang="en">
			<head>
				<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
				<title>HTML4</title>
				<style>
					body {
						font-family: Verdana, sans-serif;											font-size: 0.0em;
					}

					div#header, div#footer {
						padding: 10px;
						color: white;
						background-color: black;
					}

					div#content {
						margin: 5px;
						padding: 10px;
						background-color: lightgrey;
					}

					div#menu ul {
						padding: 0;
					}

					div#menu ul li {
						display: inline;
						margin: 5px;
					}
				</style>
			</head>
			<body>
				<div id="header">
					<h1>Monday Times</h1>
				</div>

				<div id="menu">
					<ul>
						<li>News</li>
						<li>Sports</li>
						<li>Weather</li>
					</ul>
				</div>

				<div id="content">
					<h2>News Section</h2>
					<div class="article">
						<h2>News Article</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in porta lorem. Morbi condimentum est nibh, et consectetur tortor feugiat at.</p>
					</div>
					<div class="article">
						<h2>News Article</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in porta lorem. Morbi condimentum est nibh, et consectetur tortor feugiat at.</p>
				</div>

				<div id="footer">
					<p>&amp;copy; 2016 Monday Times. All rights reserved.</p>
				</div>

#### Change to HTML5 Doctype ####
1. Change doctype to:

		<!DOCTYPE html>

#### Change to HTML5 Encoding ####
1. Change encoding to:

		<meta charset="utf-8">

#### Add The HTML5Shiv ####
1. In order to teach old browsers how to handle "unknown" elements.
2. IE-8 and earlier does not allow styling of unknown elements. HTML5Shiv is JavaScript workaround to enable styling of HTML5 elements in IE < v9.
3. Example:

		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<![endif]-->

#### Change to HTML5 Semantic Elements ####
1. Replace the CSS by the following:

		body {
			font-family: Verdana, sans-serif;
			font-size: 0.9em;
		}

		header, footer {
			padding: 10px;
			color: white;
			background-color: black;
		}

		section {
			margin: 5px;
			padding: 10px;
			background-color: lightgrey;
		}

		article {
			margin: 5px;
			padding: 10px;
			background-color: white;
		}

		nav ul {
			padding: 0;
		}

		nav ul li {
			display: inline;
			margin: 5px;
		}

2. Change HTML5 elements to Semantic elements:

		<body>
			<header>
				<h1>Monday Times</h1>
			</header>

			<nav>
				<ul>
					<li>News</li>
					<li>Sports</li>
					<li>Weather</li>
				</ul>
			</nav>

			<section>
				<h2>News Section</h2>
				<article>
					<h2>News Article</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in porta lorem. Morbi condimentum est nibh, et consectetur tortor feugiat at.</p>
				</article>
				<article>
					<h2>News Article</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in porta lorem. Morbi condimentum est nibh, et consectetur tortor feugiat at.</p>
			</section>

			<footer>
				<p>&copy; 2014 Monday Times. All rights reserved.</p>
			</footer>
		</body>

#### The Difference Between `<article>` `<section>` and `<div>` ####
1. `<section>` is a block of related elements.
2. `<article>` is a complete, self-contained block of related elements.
3. `<div>` is a block of children elements.

### HTML5 Style Guide ###
#### HTML Coding Conventions ####
1. HTML5 is a bit sloppy when it comes to code validation.

#### Be Smart and Future Proof ####
1. Consistent use of style makes it more readable
	1. XML readers may want to read HTML
	2. Making it close to XHTML is good

#### Use Correct Document Type ####
1. Declare document type always

		<!DOCTYPE html>

2. Lowercase for consistency

		<!doctype html>

#### Use Lower Case Element Names ####
1. Because:
	1. Mixing cases is bad
	2. Developers usually use lowercase names
	3. Lowercase looks cleaner
	4. Lowercase are easier to write

#### Close All HTML Elements ####
1. Recommended.

#### Close Empty HTML Elements ####
1. `<meta charset="utf-8" />`

#### Use Lower Case Attribute Names ####
1. Recommended because:
	1. Mixing cases is bad
	2. Developers usually use lowercase names
	3. Lowercase looks cleaner
	4. Lowercase are easier to write (and read in my opinion)

#### Quote Attribute Values ####
1. Recommended:
	1. Easier to read
	2. Must use quotes if value contains spaces

#### Image Attributes ####
1. Always add `alt` to images.
	1. Image may not get displayed
2. Defines image width and height
	1. Reduces flickering because browser can reserve space for image before loading

#### Spaces and Equal Signs ####
1. Recommended:
	1. No spaces between = and attribute names and values (groups and makes it easier to read)

#### Avoid Long Code Lines ####
1. Difficult to read if long
2. <= 80 characters

#### Blank Lines and Indentation ####
1. Do not add blank lines without a reason
2. Add blank lines to separate large or logical code blocks.
3. Two spaces of indentation. (Do not use tab)
4. No unnecessary blanks and indentation.

#### Omitting `<html>` and `<body>`? ####
1. Not recommended.
2. Declare a language for accessiblity applications
	1. `<html lang="en-US">`
3. Consequences of omitting:
	1. `<html>` may crash DOM and XML software
	2. `<body>` may produce errors in older browsers (IE 9)

#### Omitting `<head>`? ####
1. Recommended.

#### Meta Data ####
1. Make title as meaningful as possible.
2. Language and character encoding must be defined as early as possible. (to ensure proper interpretation, correct search engine indexing)

#### Setting The Viewport ####
1. Viewport: user's visible area of a web page. (Varies with device)
2. Include the following:

		<meta name="viewport" content="width=device-width, initial-scale=1.0">

	1. Tells browser how to control page's dimensions and scaling.
	2. `width=device-width`: sets width of page to follow screen-width
	3. `initial-scale=1.0`: sets initial zoom level when page is first loaded by browser.

#### HTML Comments ####
1. `<!-- This is a comment -->`
2. Multiple lines:

		<!--
			This is a long comment example. This is a long comment example.
			This is a long comment example. This is a long comment example.
		-->

#### Style Sheets ####
1. Simple syntax for linking stylesheets:

		<link rel="stylesheet" href="styles.css">

2. Short rules on single lines:

		p.intro {font-family: Verdana, font-size: 16em;}

3. Long rules on multiple lines

		body {
			background-color: lightgrey;
			font-family: "Arial Black", Helvetica, sans-serif;
			font-size: 16em;
			color: black;
		}

	1. Place opening bracket on same line as selector
	2. One space before opening bracket
	3. Two spaces to indent
	4. Semicolon after each property-value pair, including the last
	5. Use quotes only if value contains spaces
	6. Place closing bracket on new line without leading spaces
	7. Avoid lines over 80 characters

#### Loading JavaScript in HTML ####
1. Simple syntax:

		<script src="myscript.js">

#### Accessing HTML Elements with JavaScript ####
1. Tidy up HTML to use the elements in JavaScript without errors.

#### Use Lower Case File Names ####
1. Some web servers are case sensitive and some are not.
2. Name the files consistently following a convention of lowercase only.

#### File Extensions ####
1. Use `.html` or `.htm`
2. CSS: `.css`
3. JavaScript: `.js`

#### Differences Between `.htm` and `.html` ####
1. No difference
2. Only cultural difference:
	1. `.htm`: like early DOS systems which limited file extension to 3 characters
	2. `.html`: line Unix OS that did not have this limitation. 

#### Technical Differences ####
1. If a URL does not specify filename, server returns default filename:
	1. `index.html`, `index.htm`, `default.html`, `default.htm`
2. If server is configured only for `index.html` then so must be the default filename and not `index.htm`
3. Servers can usually be set with multiple default filenames.
4. Full extension for HTML is `.html`