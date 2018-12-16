# Python Programming for Professionals #

## Three Typical Python Programs ##
1. Commandline program
	1. Not planning to distribute to normal users
2. GUI app
	1. Want to distribute to specific number of users (for example for employees)
3. Web app
	1. For large audience

## Installing Python ##
1. Download Python 3.x
	1. Python 2.x will not be supported by 2020.

## Installing FAQs ##
1. `python3 <file>.py`
2. `pip3 install package_name` **(M)**: installs packages in python3
3. Open a file for python program
	1. `print('A program')`
4. Execute: `python test.py`

## Python Components ##
1. Objects, Methods and Functions
2. `print('Ardit'.replace('A', 'O'))`
	1. `<string>.replace(<substring-1>, <substring-2>)`
3. String: object data type
4. Functions vs Methods:
	1. Methods are associated with objects
	2. Function are not associated with objects (they usually get objects as arguments)
		1. `print(<string-object>)`

## Variables ##
1. Container used to store objects
2. It can also be transported
3. Example:

		replaced='Ardit'.replace('A', 'O')
		print(replaced)
		currency = 145
		currency_today = 100.5
		currency1 = 'nothing'
		print(currency, currency_today, currency1)

## Functions ##
1. print(1) - built in function
2. Custom functions

		def currency_converter(rate, euros):
		    dollars = euros * rate
		    return dollars

		print(currency_converter(100, 1000))

## Using the Python Interactive Shell ##
1. `python`

		>>> print("Here")
		Here
		>>> help(print) **(M)**
		...
		>>> dir('asdfsdf') **(M)**
		(avaiable methods)
		>>> dir('asdfdsf'.replace) **(M)**
		(description)
		>>> dir(str.replace)
		(description)

## Setting up Atom ##
1. View > Panes > Split Right
2. Install packages
	1. Atom > Preferences
	2. Search for terminal or platformio-ide-terminal
	3. Click Install
3. Click + button at the bottom of the screen to open a terminal (multiple terminals can be opened)
4. Right click on folder > New File > script.py
5. Right click on folder > New Folder > <name>

## Numbers ##
1. Types:
	1. Integers
	2. Floats
	3. Complex numbers
2. `python`
	1. `print("hey")`
3. Integers
	2. `10`
	3. `v = 3`
	4. `type(v)`
4. Floats
	1. `6.1`
	2. `6.0`
	3. `type(6.0)`
5. Complex
	1. `56j`
	2. `type(56j)`
6. Convertion
	1. `float(8)`
	2. `int(0.6)`
	3. `round(8.6)`

## More on Numbers: Using Python as a Calculator ##
1. `6+7.1`
2. `6 - 4`
3. `6 * 7.1`
4. `7 / 2`
5. `7 % 3`
6. `3 ** 2`
7. `import math` **(M)**
	1. External modules: need to be installed
	2. Standard modules: available
	3. `math.sqrt(9)`
	4. `dir(math)`
8. `3*10+1` (BODMAS)
9. `1+3*10/5**2` - 7.0 (BODMAS)
	1. Always float output on division
10. Series:
	1. `rate=10`
	2. `98 * rate`

## Strings ##
1. Everything inside quotes is string
	
		'sdfasdfdsf'
		'65h'
		type('65qf')
		'7'
		type('7')
		'7'+'1' -> concatenation
		int('7') + 1 -> 8
2. Index

		'Friday' -> 012345
		day = 'Today is Wednesday'
		day[9:18] -> Wednesday
		day[9:] -> Wednesday
		day[:5] -> Today
		day[-9:] -> Wednesday
	
3. String multiplication

		'abd'*3

## Lists and Tuples ##
1. List: Array of objects

		li=['Today', 'Tomorrow', 3]
		li
		li[-1]
		len(li) **(M)** 
		
2. Remove

		del li[2]

3. Multiply

		li * 2

4. Append

		li.append(3)

5. Insert

		li.insert(1, 2)

6. Remove

		li.remove('Tomorrow')

7. List of functions

		functions = [currency_converter(100, 1000), currency_converter(100, 2000)]

### Tuples ###
1. Tuples are immutable lists
2. `t = (1, 2, 3)`
3. Example: object to hold buttons and you want it to be immutable

## Dictionaries ##
1. Explicit indexing
2. Examples:

		dict = {'Name': 'Ardit', 'Profession': 'Instructor'}
		dict['Name']
3. Extract values

		dict.values() **(M)**
	1. Returns dict_values datatype value
	2. `a = list(dict.values())`

## Summary of Data Types ##
1. Integer
2. Float
3. Strings
4. Complex numbers
5. List
6. Tuples
7. Dictionaries

## Conditional Blocks ##
1. Code

		v = 3
		if v < 3:
		    print("Less")
			print("Really")
		elif v == 3:
			print("Equal")
		else:
			print("Equal or greater")

## Inline Conditionals ##
1. Example

		a = 2
		print("Positive" if a > 0 else "Negative")

## Loops ##
1. Allows us to execute a statement multiple times
2. Types:
	1. for
	2. while
3. for

		emails = ['me@gmail.com', 'you@hotmail.com', 'they@gmail.com']
		
		for email in emails:
		    print(email)

		for item in emails:
			if 'gmail' is in item:
				print(item)

## User Input ##
1. Example:

		plannet = input('What plannet are you from?')
		print(plannet)

2. With function

		def currency_converter(rate, euros):
			dollars = euros * rate
			return dollars

		r = input("Enter rate: ")
		e = input("Enter euros: ")
		print(currency_converter(float(r), float(e)))

## The While Loop ##
1. while

		password = ''
		while password != 'python123':
		    password = input('Enter password: ')
			if password == 'python123':
				print('You are logged in')
			else:
				print('Sorry, try again!')

## For Loop with Multiple Lists ##
1. Example

		name = ['james', 'john', 'jack']
		email_domains = ['gmail', 'hotmail', 'yahoo']

		for i, j in zip(names, email_domains):
			print(i, j)

## Opening and Reading a File ##
1. `example.txt`

		Line 1
		Line 2
		Line 3

2. Code to access file

		file = open("example.txt", 'r')
		type(file)
		content = file.read()
		type(content)
		print(content)
		
3. File pointer is initially before the begenning of first character

		file.seek(0) # **(M)** places pointer to the begenning of the file
		content = file.readlines() # **(M)** reads all lines into a list
		content = [i.rstrip("\n") for i in content]

4. Close the file

		file.close() # **(M)**

## Opening and Writing Text to a Text File ##
1. Open a new file or existing file in write mode

		file = open('example.txt', 'w')
		file.write('Line 1') # returns number of characters written

2. To continue writing:
		
		file = open('example.txt', 'a')

3. We can run write multiple times to write multiple lines in one session.

		l = ['Line 1', 'Line 2', 'Line 3']
		file = open('example.txt', 'w')
		for item in l:
			file.write(item + '\n')
		file.close()

## Append to a Text File ##
1. Append

		file = open('example.txt', 'a')
		file.write('Line 4')
		file.close()

## The Rest of File Handling ##
1. `r`: read only
2. `r+`: both reading and writing, file pointer placed at beginning
3. `w+`: both writing and reading, 
	1. Overwrites existing file if file exists.
4. `a`: append mode. File pointer is at end of file
5. `a+`: append and read. File pointer is at the end of file

## The "With" Statement ##
1. Code 
	
		with open('example.txt', 'a+') as file:
			file.seek(0)
			content = file.read()
			file.write('\nLine6')

2. We don't have to close the file

## Modules, Libraries and Packages ##
1. Importing a library

		import os
		os.listdir()

2. Module:
	1. A python file
		1. `os.__file__` **(M)**: full path of the file
3. Library:	
	1. `import sqlite3`
		1. runs `__init__.py` which imports a module ...
4. Packages: Third party modules and libraries
	1. Installation:
		1. `pip install glob2` **(M)**
		2. `import glob2`
		3. `glob2.glob("*.txt")` -> returns all txt files

## Commenting and Documenting Your Code ##
1. Single line comments:

		# Open empty file
		def open_file():
			with open(filename, 'w') as file:
				file.write('')

2. Doc strings

		'''
		This script creates an empty file.
		'''

		"""
			
		"""

3. Raw string:
		
		r'''
			special characters like '\n' are not interpreted
		'''

4. Import the file

		import example
		example.__doc__

5. imp library

		import imp
		imp.reload(example)
		example.__doc__
		example.create_file.__doc__

## Working with Dates and Times ##
1. Modules
	1. `datetime`
		1. Manipulate dates
	2. `time`
		1. Control time when script runs
2. datetime

		import datetime **(M)**
		datetime.datetime.now() # **(M)**: grabs time from computer

3. Difference between dates

		yesterday = datetime.datetime(2016,5,13,11,0,0,0)
		now = datetime.datetime.now()
		delta = yesterday - now
		delta.total_seconds() **(M)**

4. Example:

		import datetime

		filename=str(datetime.datetime.now().strftime('%Y-%%m-%d-%H-%M-%S-%f')) = '.txt'

		def open_file():
			with open(filename, 'w') as file:
				file.write('')

5. Adding a period to date

		after = now + datetime.timedelta(days=2)
		
6. time: to delay

		import time
		lst = []
		for i in range(5):
			lst.append(datetime.datetime.now())
			time.sleep(1)

## Demonstration of the Text Generator Application ##
1. Program that generates baby names

## Building Version 1 ##
1. Think of smallest pieces first
2. Build bigger pieces using the smaller pieces
3. Example:
	1. Build one string
		1. How to generate letters
				
				import string
				string.ascii_lowercase # generates all lowercase letter
		2. How to generate a random letter

				import random
				random.choice('<string>')
				random.choice(string.ascii_lowercase)
		3. script

				import random, string

				def generator():
					letter1 = random.choice(string.ascii_lowercase)
					letter2 = random.choice(string.ascii_lowercase)
					letter3 = random.choice(string.ascii_lowercase)
					name = letter1 + letter2 + letter3
					return(name)

				print(generate())

## Building Version 2 ##
1. Inputs

		vowels = 'aeiouy'
		consonents = 'bcdfghjklmnpqrstvwxz'
		letters = string.ascii_lowercase
		letter_input_1 = input("What letter do you want? Enter 'v' for vowels, 'c' for consonents, '1' for any letter: ")
		letter_input_2 = input("What letter do you want? Enter 'v' for vowels, 'c' for consonents, '1' for any letter: ")
		letter_input_3 = input("What letter do you want? Enter 'v' for vowels, 'c' for consonents, '1' for any letter: ")

		print(letter_input1, letter_input2, letter_input_3)

		def generator():
			if letter_input_1 == 'v':
				letter1 = random.choice(vowels)
			elif letter_input_1 == 'c':
				letter1 = random.choice(consonents)
			elif letter_input_1 == 'l':
				letter1 = random.choice(letters)
			else
				letter1 = letter_input_1

			if letter_input_2 == 'v':
				letter2 = random.choice(vowels)
			elif letter_input_2 == 'c':
				letter2 = random.choice(consonents)
			elif letter_input_2 == 'l':
				letter2 = random.choice(letters)
			else
				letter2 = letter_input_2

			if letter_input_3 == 'v':
				letter3 = random.choice(vowels)
			elif letter_input_3 == 'c':
				letter3 = random.choice(consonents)
			elif letter_input_3 == 'l':
				letter3 = random.choice(letters)
			else
				letter3 = letter_input_3

## Building Version 3 ##
1. Looping

		for i in range(20):
			print(generator())

## What is Pandas? ##
1. Very important python library
	1. Provides data structures and data analysis tools (code)
2. To load data from different sources, analyse data and produce results
3. For data structures
4. Installation

		pip3 install pandas

	1. If it fails, install precompiled python packages 'numpy' and 'pandas'

## Getting Started with Pandas ##
1. Provides data structures and data analysis tools in Python
2. `ipython` (alternative: jupiter notebook - browser based, efficient)
	
		import pandas

		df1 = pandas.DataFrame([[2, 4, 6], [10, 20, 30]])
		
		df1

		df1 = pandas.DataFrame([2, 4, 6], [10, 20, 30], columns = ['Price', 'Age', 'Value'], index = ['First', 'Second'])

		df1

		df2 = pandas.DataFrame([{'Name': 'John', 'Surname': 'Jones'}, {'Name': 'Rob', 'Surname': 'Bla'}])

		df2

		df1.mean()

		df1.mean().mean()

		df1.Price.mean()

		type(df1) -> pandas.core.series.DataFrame

		type(df1.mean()) -> pandas.core.series.Series
		
		type(df1.Price) -> pandas.core.series.Series

## Getting Started with Jupyter ##
1. [jupyter.org](jupyter.org)
	1. Click **Install**
2. Installation from commandline
	1. `pip3 install jupyter`
3. Open terminal
	1. `jupyter notebook` **(M)**
4. Notebook
	1. New > Python3
	2. Change Untitled to Testing
	3. We can enter multiple statements in a cell
		
			print(1)
			print(2)

	4. Commands:
		1. Alt + Enter -> New cell
		2. dd -> delete existing cell
		3. Shift + Enter -> Executes current cell contents and goes to a new cell
	5. Modes:
		1. Command mode:
			1. Gray rectangle
		2. Edit mode: Press Enter and then edit. We can enter code
	6. Keyboard shortcuts: Help > Keyboard Shortcuts
	7. DataFrame:

			import pandas
			df = pandas.read_csv('<file>')
			df
	8. Web scrapping
		
			from bs4 import BeautifulSoup
			import requests
			print(1)

			r = requests.get('https://en.wikipedia.org/wiki/Eagle')
			print(r.content)

			soup = BeautifulSoup(r.content)
			print(soup.prettify)

## Loading Data in Pyton from CSV, Excel, TXT and J... ##
1. Loading a csv file

		import pandas
		df1 = pandas.read_csv('supermarkets.csv')
		df1

		df1 = pandas.read_csv('supermarkets.csv', header = None)
		df1

		df1.set_index('ID')

2. Loading a json file

		df2 = pandas.read_json('supermarkets.json')
		df2.set_index('ID')

3. Loading an excel file
	1. Install xlrd
		1. `sudo pip3 install xlrd`
	2. Load

			df3 = pandas.read_excel('supermarkets.xlsx', sheetname = 0)
			df3.set_index('ID')

4. Loading a comma separated txt file

		df4 = pandas.read_csv('supermarkets_commas.txt')
		df4.set_index('ID')

5. Loading a `;` separated txt file

		df5 = pandas.read_csv?
		df5 = pandas.read_csv('supermarkets-semi-colons.txt', sep = ';')
		df5.set_index('ID')

6. Reading files from website
	1. [pythonhow.com/supermarkets.csv](pythonhow.com/supermarkets.csv)
	2. Code

			df6 = pandas.read_csv('http://pythonhow.com/supermarkets.csv')
			df6.set_index('ID')

	3. Read json from website

			df7 = pandas.read_csv('http://pythonhow.com/supermarkets.json')
			df7.set_index('ID')

## Indexing and Slicing Dataframes ##
1. Changing dataframe

		df7 = df7.set_index('Address')
		df7.set_index?
		# df7.set_index('Address', inplace = True)

2. Slicing using label based indexing

		df7.loc['332 Hill St' : '3995 23rd St', 'Country' : 'ID']

		df7.loc['332 Hill St', 'Country']

		df7.loc[:, 'Country']

		list(df7.loc[:, 'Country'])

3. Slicing using index based indexing

		df7.iloc[1:3, 1:3]

		df7.iloc[:, 1:3]
	
		df7.iloc[3, 1:4]

7. Slicing using mixed indexing

		df7.ix[3, 'Name']


## Dropping Dataframe Columns and Rows ##
1. Drop columns

		df7.drop('City') **(M)**

2. Drop Row

		df7.drop('332 Hill St', 0)

3. Drop multiple rows using indices

		df7.drop(df7.index[1:3], 0)

	1. df7.index -> gives all names of indices 

4. Drop multiple columns using indices

		df7.drop(df7.columns[0:3], 1)

	1. df7.columns -> gives all names of columns

## Updating and Adding New COlumns and Rows ##
1. Pass list with exact number of rows

		df7.shape -> returns (5, 7)
		df7.shape[0] -> returns 5
		df7.shape[0] * ['North America'] -> ['North America', 'North America', 'North America', 'North America', 'North America']

		df7['Continent'] = df7.shape[0] * ['North America']

2. Update Column

		df7['Continent'] = df7['Country'] + ',' + 'North America'

3. Update Rows

		df7_t = df7.T (Transpose)
	
	1. Add a new column (Row)

			df7_t['My Address'] = ['My City', 'My Country', 10, 7, 'My Shop', 'My State', 'My Continent']

			df7 = df7_t.T
			df7

	2. Updating exising column (Row)

			df7_t[<existing-column>] = ...

## Geocoding Addresses With Pandas ... ##
1. Google Maps use latitudes and longitudes to add marker
2. Geocoding: Converting address to coordinates
	1. Reverse of Geocoding: Converting coordinates to address
3. Geocoding using geopy:
	1. `sudo pip3 install geopy`
	2. Code

			from geopy.geocoders import Nominatim
			nom = Nominatim()
			n = nom.geocode('3995 23rd St, San Francisco, CA 94114')
			n.latitude
			n.longitude

	3. Converting dataframe into latitudes and longitudes
		
			import pandas
			df = pandas.read_csv("supermarkets.csv")
			df['Full Address'] = df['Address'] + ', ' + df.['City'] + ', ' + df['State'] + ', ' + df['Country']
			df

			df["Coordinates"] = df['Full Address'].apply(nom.geocode)			df.Coordinates
			df.Coordinates[0].letitude
			df.Coordinates[0].longitude

			df['Latitude'] = df['Coordinates'].apply(lambda x: x.latitude if x != None else None)
			df['longitude'] = df['Coordinates'].apply(lambda y: y.longitude if y != None else None)

## What is Numpy ##
1. Programs use numbers to images
2. Python can do image processing
	1. Possible representation

			[[123, 12, 123, 12, 33], [], []] -> not very inefficient, lot of memory, slow down operations

	2. Numpy: Python library that provide multidimensional objects
3. Installation
	1. `sudo pip3 install numpy`
4. Use `numpy`

		import numpy
		n = numpy.arange(27)
		type(n) -> numpy.ndarray

5. Convert to two dimensional array

		n.reshape(3, 9) **(M)**

6. Convert to three dimensional array
	
		n.reshape(3, 3, 3)

7. Numpy Arrays from Python list

		m = numpy.asarray([[...],[],[]])
		type(m)
8. Pandas, OpenCV are based on numpy

## Installing OpenCV ##
1. Upgrade pip
	1. `pip3 install --upgrade pip` **(M)**
	2. `pip3 install opencv-python`
	3. `import cv2`

## Images to Numpy and Vice-Versa ##
1. Code

		import cv2
		im_g = cv2.imread('smallgray.png', 0) # 0- gray scale, 1 - bgr (not rgb)
		im_g
2. Write an image from numpy array

		cv2.imwrite('newsmallgray.png', im_g)

## Indexing, Slicing and Iterating ##
1. Extract numbers

		im_g[0:2] -> first two rows
		im_g[0:2, 2:4]
		im_g.shape -> (3, 5)
		im_g[:, 2:4]
		im_g[2, 4]

2. Iterating through numpy array

		for row in im_g:
			print(row)

3. Columns

		for col in im_g.T:
			print(col)

4. Flat

		for f in im_g.flat:
			print(i)

## Stacking and Splitting ##
1. Stacking

		ims = numpy.hstack((im_g, im_g)) **(M)**

		ims = numpy.vstack((im_g, im_g))

2. Splitting

		lst = numpy.hsplit(ims, 5)

3. Vertical Splitting

		lst = numpy.vsplit(ims, 3) -> produces list
		lst[0]

## Demonstration of the Web Mapping Application ##
1. Map of Volcanoes

## Open Street Map with Python ##
1. Folium

		sudo pip3 install folium
		sudo pip3 install jinja2 (html templating)

2. Code

		import folium
		dir(folium)
		map = folium.Map(location = [45.372, -121.697], zoom_start = 10, tiles='Stamen Terrain')
		map.create_map(path = 'test.html')

## Adding Markers to the Map ##
1. `script1.py`

		import folium
		map = folium.Map(location = [45.372, -121.697], zoom_start = 12, tiles = 'Stamen Terrain')
		map.simple_marker(location = [45.3288, -121.6625], popup = 'Mt, Hood Meadows', marker_color = 'red')	
		map.simple_marker(location = [45.3311, -121.7311], popup = 'Timberlake Lodge', marker_color = 'green')
		map.create_map(path = 'test.html')

## Adding Markers to the Map from CSV Data ##
1. Extend script

		import pandas

		df = pandas.read_csv('Volcanos_USA.txt')
	
		map = folium.Map(location = [45.372, -121.697], zoom_start = 6, tiles = 'Stamen Terrain')		

		for lat, lon, name in zip(df['LAT'], df['LON'], df['NAME']):
		    map.simple_marker(location = [lat, lon], popup = name, marker_color = 'red')

		map.create_map(path = 'test.html')

## Rule Based Coloring of Markers ##
1. Extension
		
		for lat, lon, name, elev in zip(..., df['ELEV']):
			map.simple_marker(..., marker_color = 'green' if elev in range(0, 1000) else 'orange' if elev in range(1000, 3000) else 'red')

## More on Rule-Based Styling ##
1. Extension

		def color(elev):
			if elev in range(0, 1000):
				col = 'green'
			elif elev in range(1000, 3000):
				col = 'orange'
			else:
				col='red'
			return col

			map.simple_marker(... marker_color = color(elev))

## Calculating the Map Center from Input Data ##
1. Find average of latitude and longitude values

		df = pandas.read_csv('volcanoes_USA.txt')
		df['LAT'].mean()
		df['LON'].mean()

		location = [df['LAT'].mean(), df['LON'].mean()]

		...

		def color(elev):
			minimun = int(min(df['ELEV'])))
			step = int((max(df['ELEV']) - minimum) / 3)
			if elev in range(minimum, minimum + step):
				...
			elif elev in range(minimum + step, minmum + step * 2)
				...
			else:
				...

## Adjusting the Code for the Latest Version of Folium ##

				
			