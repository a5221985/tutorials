# Perl #
## Perl - Home ##
1. Designed for text processing.
2. Perl: Practical Extraction and Reporting Language

### Audience ###
1. Basic to advanced concepts in Perl Scripting language

### Prerequisites ###
1. C programming
2. Unix Shell

### Execute Perl Online ###
1. Click try it option to execute script online

## Perl - Introduction ##
1. General purpose programming language developed for 
	1. text manipulation
	2. System administration
	3. Web development
	4. Network programming
	5. GUI development
	6. ...

### What is Perl? ###
1. Stable, cross platform programming language
2. Practical Extraction and Reporting Language
3. Used for mission critical projects (in public and private sectors)
4. Perl is open source software
5. Perl is atleast 5.16.2 now

### Perl Features ###
1. Takes best features from C, awk, sed, sh, BASIC, ...
2. Perl's DBI (Database Integration Interface) supports third-party databases like Oracle, Sybase, Postgres, MySQL, ...
3. Perl works with HTML, XML (markup languages) (?)
4. Perl supports Unicode
5. Perl is Y2K compliant
6. Perl supports procedural and object oriented programming
7. Perl interfaces with external C/C++ libraries through XS or SWIG
8. Perl is extensible. (third party modules available from CPAN (Comprehensive Perl Archive Network))
9. Perl interpreter can be embedded into other systems

### Perl and the Web ###
1. Was most popular web programming language
	1. Has text manipulation capabilities
	2. Rapid development cycle.
2. Perl can handle encrypted web data
3. Perl can be embedded into web servers to speed up processing
4. `mod_perl` **(M)** allows Apache web server to embed Perl interpreter
5. DBI makes web-database integration easy

### Perl is Interpreted ###
1. Perl runs as is without compilation stage.
2. Perl is first compiled to a bytecode which is converted (as program runs) into machine instructions
	1. It is not strictly interpreted (as Shell, Tcl)

## Perl - Environment ##
1. Setting up Perl environment
2. To check if perl is installed
	1. `perl -v` **(M)**

### Getting Perl Installed ###
1. Goto [https://www.perl.org](https://www.perl.org) - has source code, binaries, documentation, news, ...
2. Goto [https://perldoc.perl.org](https://perldoc.perl.org/) - official documentation

### Install Perl ###
1. Download binary code for the platform and install
2. Installing from source code:
	1. Use C compiler
	2. We have choice of features

### Unix and Linux Installation ###
1. Goto [https://www.perl.org/get.html](https://www.perl.org/get.html)
2. Download zipped source code (perl-5.x.y.tar.gz)
3. Install as follows:

		tar -xzf perl-5.x.y.tar.gz
		cd perl-5.x.y
		./Configure -de
		make
		make test
		make install

4. Installs perl in `/usr/local/bin` **(M)**
	1. Libraries are in `/usr/local/lib/perlXX` where `XX` is version of perl

### Windows Installation ###
### Macintosh Installation ###
1. Pre-requisite: make (`make -v`)
	1. It is part of Apple's develepor tools
2. Steps:
	1. Open web browser and go to `https://www.perl.org/get.html`
	2. Download zipped source code `perl-5.x.y.tar.gz`
	3. Install as follows:

			tar -xvf perl-5.x.y.tar.gz
			cd perl-5.x.y
			./Configure -de
			make
			make test
			make install

### Running Perl ###
#### Interactive Interpreter ####
1. `perl -e <perl code>`
2. Options:
	1. `-d[:debugger]` - Runs program under debugger
	2. `-Idirectory` - Specifies `@INC` / `#include` directory
	3. `-T` - enables tainting checks (?)
		1. Perl takes special precautions called taint checks prevent obvious and subtle traps
			1. Verifying path directories aren't writable by others
			2. Set-id Perl program runs more securely than its corresponding C program
				1. Detects if program is running with differing real and effective user or group id.
	4. `-t` - enables tainting warnings
	5. `-U` - allows unsafe operations
	6. `-w` - enables useful warnings
	7. `-W` - enables all warnings
	8. `-X` - disables all warnings
	9. `-e program` - Runs perl script sent in as program
	10. `file` - Runs perl program from a file

#### Script from the Command-line ####
1. `perl script.pl`

#### Integrated Development Environment ####
1. `padre` - Perl IDE
	1. Install mac ports [https://www.macports.org/install.php](https://www.macports.org/install.php)
	2. `sudo port -f selfupdate`
	3. Add `export PATH=/opt/local/bin:/opt/local/sbin:$PATH` to `~/.bash_profile` and run `source ~/.bash_profile`
	4. `sudo port install perl5 +threads`
	5. `sudo /opt/local/bin/cpan`
	6. `install Padre`
	7. `padre`

2. Eclipse Plugin `EPIC - Perl Editor and IDE for Eclipse`

## Perl - Syntax Overview ##
1. Perl program has a sequence of statements and they run from top to bottom
	1. Loops, subroutines, control structures are exceptions
2. Every simple statement must end with `;`
3. Formatting and indenting is flexible
	1. White space separates tokens

### First Perl Program ###
#### Interactive Mode Programming ####
1. `-e` option: allows executing perl statements from commandline
2. Example:
		
		perl -e 'print "Hello World\n"'

#### Script Mode Programming ####
1. `hello.pl`

		#!/usr/bin/perl

		# This will print "Hello, World"
		print "Hello, world\n";

	1. `/usr/bin/perl` - perl interpreter binary.
	2. Change mode of script file by giving it execute permissions
	
			chmod 0755 hello.ph
			./hello.pl

2. Functions can have parantheses around arguments or can be omitted (can be used when there is ambiguity in precedence).

		print("Hello, world\n");

#### Perl File Extension ####
1. `.pl` or `.PL` (convention)
2. Filenames: can have numbers, symbols, letters but not space (use `_` in place of space)

#### Commends in Perl ####
1. Comments are skipped by interpreter
2. Comments start with `#` and run till the end of the line

		# This is a comment in perl

3. Lines starting with `=` indicate start of a section of embedded documentation (pod)
	1. Subsequent lines are ignored by compiler until `=cut`
4. Example:

		#!/usr/bin/perl

		# This is a single line comment
		print "Hello, world\n";

		=begin comment
		This is all part of multiline comment.
		You can use as many lines as you like
		These comments will be ignored by the
		compiler until the next =cut is encountered.
		=cut

#### Whitespaces in Perl ####
1. Perl program does not care about whitespaces.
2. Example:
		
		#!/usr/bin/perl
		
		print		"Hello, world\n";

3. Example: If spaces are inside quoted strings, they are printed as is.

		#!/usr/bin/perl
		
		# This would print with a line break in the middle
		print "Hello
				world\n"

4. Blank line: line with space and possibly with a comment (ignored by compiler)

#### Single and Double Quotes in Perl ####
1. Single or double quotes:

		#!/usr/local/perl

		print "Hello, world\n";
		print 'Hello, world\n'; # prints Hello, world\n

2. Differences: Only double quotes interpolate variables and special characters `\n` etc...
	1. Example:

			#!/usr/bin/perl

			$a = 10;
			print "Value of a = $a\n";
			print 'Value of a = $a\n?';

#### "Here" Documents ####
1. Used to store multiine text.
	1. We can also use variables inside "here" document.
2. Syntax:

		$<var> = <<"<identifier>"; # variables will be interpolated
		<any text except EOF>
		EOF

3. Example:

		#!/usr/bin/perl

		$a = 10;
		$var = <<"EOF";
		This is the syntax for here document and it will continue
		until it encounters a EOF in the first line.
		This is case of double quote so variable value will be
		interpolated. For example value of a = $a
		EOF
		print "$var\n";

		$var = <<'EOF';
		This is case of single quote so variable value will not be
		interpolated. For example value of a = $a
		EOF
		print "$var\n";

#### Escaping Characters ####
1. Use `\` to escape characters which interfere with code.
2. Example: print double quotes and `$` sign

		#!/usr/bin/perl

		$result = "This is \"number\"";
		print "$result\n";
		print "\$result\n";

#### Perl Identifiers ####
1. Name that identifies a variable, function, class, module, ...
2. Syntax: Starts with `$`, `@` or `%` followed by letters, underscores and digits
	1. No `@`, `$` or `%` within identifiers
3. Perl is a case sensitive programming language
	1. `$Manpower` is not `$manpower`

## Perl - Data Types ##
1. No type needs to be specified. (type is chosen based on context)
2. Three basic data types:
	1. Scalars:
		1. simple variables
		2. Preceded by `$` sign
		3. It is number, string or reference (address of a variable)

	2. Arrays of scalars
		1. Ordered lists of scalars (accessed using numeric index starting from 0)
		2. Preceded by `@` sign

	3. Hashes of scalars
		1. Un ordered sets of key/value pairs
		2. Preceded by `%` sign

### Numeric literals ###
1. Numbers internally are stored as
	1. signed integers
	2. double-precision floating-point values
2. Literals:
	1. Integer: 1234
	2. Negative integer: -100
	3. Floating point: 2000
	4. Scientific notation: 16.12E14
	5. Hexadecimal: 0xffff
	6. Octal: 0577

### String literals ###
1. String: sequence of characters.
2. Alphanumeric values delimited by `'` or `"`
	1. Single quoted strings and double quoted strings are allowed
	2. Double quoted string literals allow interpolation of variables
3. Characters with special meaning:
	1. `\\`: backslash
	2. `\'`: single quote
	3. `\"`: double quote
	4. `\a`: alert or bell
	5. `\b`: backspace
	6. `\f`: form feed (next page, or page break)
	7. `\n`: new line
	8. `\r`: carriage return (return to beginning of the same line without advancing to next line)
	9. `\t`: tab
	10. `\v`: vertical tab
	11. `\0nn`: Octal formatted numbers
	12. `\xnn`: Hexadecimal formatted numbers
	13. `\cX`: controls characters (X may be any character)
	14. `\u` **(M)**: forces next character to be uppercase
	15. `\l` **(M)**: forces next character to be lowercase
	16. `\U` **(M)**: forces all following characters to be uppercase
	17. `\L` **(M)**: forces all following characters to be lowercase
	18. `\Q` **(M)**: backslash all following non-alphanumeric characters
	19. `\E` **(M)**: end `\U`, `\L` or `\Q`

#### Example ####

		$str = "\QWelcome to tutorialspoint's family";
		print "$str\n";

## Perl - Veriables ##
1. Based on datatype, interpreter allocates memory
2. There are three types of variables:
	1. Scalar variables: `$<var>`
	2. Array variables: `@<var>`
	3. Hash variable: `%<var>`
3. Perl allows same name for different variable types (`$a`, `@a`, `%a`) because they are stored in different namespaces

### Creation of variables ###
1. Declaration happens when value is assigned to it
2. If `use strict` is used, it is mandatory to declare a variable before it is used
	1. `use strict;`: `strict` pragma that restricts unsafe constructs
		1. Certain perl expressions are disabled because they could behave unexpectedly or are difficult to debug and **are turned into errors**
		2. Effect is limited to current file or scope block
		3. Example:

				use strict 'vars';

			1. Variables must be declared using either of:
				1. `my`: declares list of variables to be local to enclosing block/file/eval
				2. `our`: makes **alias** to package (lexically) variable (global variable) of same name in current package to be used within current lexical scope

						package Foo;
						use strict;

						$Foo::foo = 23;

						{
							our $foo; # alias to $Foo::foo
							print $foo; # prints 23
						}

						print $Foo::foo # prints 23
	
				3. `state`: declares lexically scoped variable, (like `my`) but variables will never be reinitialized
					1. In contrast to lexical variables which are reinitialized each time their enclosing block is entered.
				4. `use vars`
			2. `local`: just modifies variable(s) to be local to enclosing block/file/eval

		4. [strict refs, strict vars, strict subs](http://perldoc.perl.org/strict.html)
3. Examples:
	
		$age = 25;
		$name = "John Paul";
		$salary = 1445.50;

### Scalar Variables ###
1. Scalar: single unit of data.
	1. Integer
	2. Floating point
	3. Character
	4. String
	5. Paragraph
	6. Web page
2. Example:

		#!/usr/bin/perl

		$age = 25;
		$name = "John Paul";
		$salary = 1445.50;

		print "Age = $age\n";
		print "Name = $name\n";
		print "Salary = $salary\n";

### Array Variables ###
1. Array: stores ordered list of array values.
2. Syntax: `@<var>`
3. Use `$` to refer to single element of an array.
	1. `$<var>[<index>]`
4. Examples:

		#!/usr/bin/perl

		@ages = (25, 30, 40);
		@names = ("X", "Y", "Z");

		print "\$ages[0] = $ages[0]\n";
		print "\$ages[1] = $ages[1]\n";
		print "\$ages[2] = $ages[2]\n";
		print "\$names[0] = $names[0]\n";
		print "\$names[1] = $names[1]\n";
		print "\$names[2] = $names[2]\n";

### Hash Variables ###
1. Hash: set of key value pairs.
2. Syntax: `%<var>`
	1. Reference to a single value: `$<var>{'<key>'}`
3. Example:

		#!/usr/bin/perl

		%data = ('John Paul', 45, 'List', 30, 'Kumar', 40);

		print "\$data{'John Paul'} = $data{'John Paul'}\n";
		print "\$data{'Lisa'} = $data{'Lisa'}\n";
		print "\$data{'Kumar'} = $data{'Kumar'}\n";

### Variable Context ###
1. Same variable is treated differently based on context

		#!/usr/bin/perl

		@names = ('John Paul', 'Lisa', 'Kumar');

		@copy = @names;
		$size = @names;

		print "Given names are : @copy\n";
		print "Number of names are : $size\n";

2. Various contexts:
	1. Scalar: assignment to scalar evaluates rhs in scalar context
	2. List: assignment to an array or hash evaluates rhs in list context
	3. Boolean: is evaluation of an expression is true or false
	4. Void (?): Does not care about return value and does not want a return value
	5. Interpolative: Only inside quotes (or those that take place of quotes)

## Perl - Scalars ##
1. Single unit of data:
2. Example:

		#!/usr/bin/perl

		$age = 25;
		$name = "John Paul";
		$salary = 1445.50;

		print "Age = $age\n";
		print "Name = $name\n";
		print "Salary = $salary\n";

### Numeric Scalars ###
1. Example:

		#!/usr/bin/perl

		$integer = 200;
		$negative = -300;
		$floating = 200.340;
		$bigfloat = -1.2E-23;

		# 377 octal, same as 255 decimal
		$octal = 0377;

		# FF hex, also 255 decimal
		$hexa = 0xff;

		print "integer = $integer\n";
		print "negative = $negative\n";
		print "floating = $floating\n";
		print "bigfloat = $bigfloat\n";
		print "octal = $octal\n";
		print "hexa = $hexa\n";

### String Scalars ###
1. Single quoted strings vs double quoted strings

		#!/usr/bin/perl

		$var = "This is string scalar!";
		$quote = 'I m inside single quote - $var';
		$double = "This is inside double quote - $var";
		$escape = "This example of escape - \tHello, World!";

		print "var = $var\n";
		print "quote = $quote\n";
		print "double = $double\n";
		print "escape = $escape\n";

### Scalar Operations ###
1. Example:

		#!/usr/bin/perl

		$str = "hello" . "world"; # concatenates strings
		$num = 5 + 10;
		$mul = 4 * 5;
		$mix = $str . $num;

### Multiline Strings ###
1. Use single quotes:

		#!/usr/bin/perl

		$string = 'This is
		a multiline
		string';

		print "$string\n";

2. Using "here" doc:

		#!/usr/bin/perl

		print <<EOF;
		This is
		a multiline
		string
		EOF

### V-Strings ###
1. `v.1.20.300.400` is parsed as string with characters specified by ordinals.
	1. More readbable than `\x{1}\x{14}\x{12c}\x{fa0}`
2. Syntax: `v.<ordinal1>.<ordinal1>.<ordinal3>...`
3. Example:

		#!/usr/bin/perl

		$smile = v9786;
		$foo = v102.111.111;
		$martin = v77.97.114.116.105.110;

		print "smile = $smile\n";
		print "foo = $foo\n";
		print "martin = $martin\n";

### Special Literals ###
1. Three special literals:
	1. `__FILE__` **(M)**: current filename
	2. `__LINE__` **(M)**: current line number
	3. `__PACKAGE__` **(M)**: current package
2. Must be used as separate tokens and will not be interpolated
3. Example:

		#!/usr/bin/perl

		print "File name " . __FILE__ . "\n";
		print "Line number " . __LINE__ . "\n";
		print "Package " . __PACKAGE__ . "\n";

		# they can not be interpolated
		print "__FILE__ __LINE__ __PACKAGE__\n"; 

## Perl - Arrays ##
### Array Cration ###
1. `qw` operator:

		@array = (1, 2, 'Hello');
		@array = qw/This is an array/;

	1. `qw//` **(M)** returns a list of strings.
		1. Delimiter is whitespace
	2. We can use multiple lines:
			
			@days = qw/Monday
			Tuesday
			...
			Sunday/;

2. Individual assignment:

		$array[0] = 'Monday';
		...
		$array[6] = 'Sunday';

### Acessing Array Elements ###
1. Prefix array with `$` sign and append `[<index>]` to the array name
2. Example:

		#!/usr/bin/perl

		@days = qw/Mon Tue Wed Thu Fri Sat Sun/;

		print "$days[0]\n";
		print "$days[1]\n";
		print "$days[2]\n";
		print "$days[3]\n";
		print "$days[-1]\n"; # selects last element
		print "$days[-7]\n"; # selects 7 th element from last

### Sequential Number Arrays ###
1. Range operator: `..`

		#!/usr/bin/perl

		@var_10 = (1..10);
		@var_20 = (10..20);
		@var_abc = (a..z);

		print "@var_10\n";
		print "@var_20\n";
		print "@var_abc\n";

### Array Size ###
1. Obtain using scalar context of the array
2. Example:
	
		@array = (1, 2, 3);
		print "Size: ", scalar @array, "\n";

3. Size vs max index:
	1. Max index: `$#array` **(M)**
	2. Size: `scalar @array` **(M)**
4. Example:

		#!/usr/bin/perl

		@array = (1, 2, 3);
		$array[50] = 4;

		$size = @array;
		$max_index = $#array;

		print "Size: $size\n";
		print "Max Index: $max_index\n";

### Adding and Removing Elements in Array ###
1. There are functions (subroutines) to add and remove elements in an array.
2. Functions:
	1. `push @ARRAY, LIST` **(M)**: Pushes values of list into end of array
	2. `pop @ARRAY` **(M)**: Pops off and returns last value of the array
	3. `shift @ARRAY` **(M)**: shifts first value off and returns it and shortens the array by 1 and moves everything down
	4. `unshift @ARRAY, LIST` **(M)**: prepends list to front of an array and returns number of elements in new array
3. Example:

		#!/usr/bin/perl

		# creation of a simple array
		@coins = ("Quarter", "Dime", "Nickel");
		print "1. \@coins = @coins\n";

		# add one element at the end of the array
		push(@coins, "Penny");
		print "2. \@coins = @coins\n";

		# add one element at the beginning of the array
		unshift(@coins, "Dollar");
		print "3. \@coins = @coins\n";

		# remove one element from the last of the array
		pop(@coins);
		print "4. \@coins = @coins\n";

		# remove one element from the begenning of the array
		shift(@coins);
		print "5. \@coins = @coins\n";

### Slicing Array Elements ###
1. Slicing: an array that contains multiple elements from another array
2. Example:

		#!/usr/bin/perl

		@days = qw/Mon Tue Wed Thu Fri Sat Sun/;
	
		@weekdays = @days[3, 4, 5];

		print "@weekdays\n";

	1. Syntax: slice must have list of valid indices (+ve and -ve are allowed)
3. Example: Using range operator `..`

		#!/usr/bin/perl

		@days = qw/Mon Tue Wed Thu Fri Sat Sun/;

		@weekdays = @days[3..5];

		print "@weekdays\n";

### Replacing Array Elements ###
1. `splice()` **(M)**
	1. Syntax: `splice @ARRAY, OFFSET [ , LENGTH [ , LIST ] ]`
		1. `@ARRAY`: Source array
		2. `OFFSET`: from the index
		3. `LIST`: List which replaces the existing elements
	2. Replaces certain elements with LIST if specified and returns the replaced elements
2. Example:

		#!/usr/bin/perl

		@nums = (1..20);
		print "Before - @nums\n";

		splice(@nums, 5, 5, 21..25);
		print "After - @nums\n";

### Transform Strings to Arrays ###
1. `split()` **(M)**: `split [ PATTERN [ , EXPR [, LIMIT ]]]`
	1. Splits a string into array of strings and returns it
	2. `LIMIT`: splits into atmost the number of fileds
	3. `PATTERN`: if omitted, splits on whitespace
	4. `EXPR`: Expression to split
2. Example:

		#!/usr/bin/perl

		# define Strings
		$var_string = "Rain-Drops-On-Roses-And-Whiskers-On-Kittens";
		$var_names = "Larry,David,Roger,Ken,Michael,Tom";

		# transform above strings into arrays.
		@string = split('-', $var_string);
		@names = split(',', $var_names);

		print "$string[3]\n";
		print "$names[4]\n";

### Transform Arrays to Strings ###
1. `join()` **(M)**: Joins separate strings of LIST into single string with fields separated by `EXPR`
	1. Syntax: `join EXPR, LIST`
		1. `EXPR`: field separater
2. Example:

		#!/usr/bin/perl

		# define Strings
		$var_string = "Rain-Drops-On-Roses-And-Wiskers-On-Kittens";
		$var_names = "Larry,David,Roger,Ken,Michael,Tom";

		# transform above settings into arrays.
		@string = split('-', $var_string);
		@names = split(',', $var_names);

		$string1 = join('-', @string);
		$string2 = join(',', @names);

		print "$string1\n";
		print "$string2\n";

### Sorting Arrays ###
1. `sort()` **(M)**: sorts according to ASCII numeric standards.
	1. `sort [ SUBROUTINE ] LIST`
		1. `LIST`: list to sort
		2. `SUBROUTINE`: specified logic in it is applied while sorting the elements
2. Example:

		#!/usr/bin/perl

		# define an array
		@foods = qw(pizza steak chicken burgers); # qw - quote word
		print "Before: @foods\n";

		# sort this array
		@foods = sort(@foods);
		print "After: @foods\n";

	1. Tip: transform every element into lowercase and then sort

### The `$[` Special Variable ###
1. Special variables exist:
	1. Example: `$[` - contains first index of all arrays
		1. It usually contains 0 but if set to 1, arrays will use 1-based indexing
2. Example:

		#!/usr/bin/perl

		# define an array
		@foods = qw(pizza steak chicken burgers);
		print "Foods: @foods\n";

		# Let's reset first index of all the arrays.
		$[ = 1;

		print "Food at \$foods[1]: $foods[1]\n";
		print "Food at \$foods[2]: $foods[2]\n";

### Merging Arrays ###
1. Arrays can be combined:
2. Example:

		#!/usr/bin/perl

		@numbers = (1, 3, (4, 5, 6));

		print "numbers = @numbers\n";

3. Example 2: Combining two arrays

		#!/usr/bin/perl

		@odd = (1, 3, 5);
		@even = (2, 4, 6);

		@numbers = (@odd, @even);

		print "numbers = @numbers\n";

### Selecting Elements from Lists ###
1. List notation is identical to arrays.
2. Extract element by appending square brackets to list and giving indices
3. Example:

		#!/usr/bin/perl

		$var = (5, 4, 3, 2, 1)[4];

		print "value of var = $var\n";

4. Example: Producing slices:

		#!/usr/bin/perl

		@list = (5, 4, 3, 2, 1)[1..3];

		print "Value of list = @list\n";

## Perl - Hashes ##
### Creation of Hashes ###
1. Creation in two ways.
	1. Assign value to named key one-by-one
	
			$data{'John Paul'} = 45;
			$data{'Lisa'} = 30;
			$data{'Kumar'} = 40;

	2. Use list (individual pairs are read from the list)

			%data = ('John Paul', 45, 'Lisa', 30, 'Kumar', 40);

		1. `=>` is alias for `,`

				%data = ('John Paul' => 45, 'Lisa' => 30, 'Kumar' => 40);

2. Using keys with `-` (quotes are not required)

		%data = (-JohnPaul => 45, -Lisa => 30, -Kumar => 40);

	1. Accessing keys: using only `-` notation

			$val = $data{-JohnPaul}
			$val = $data{-Lisa}

### Accessing Hash Elements ###
1. Example:

		#!/usr/bin/perl

		%data = ('John Paul' => 45, 'Lisa' => 30, 'Kumar' => 40);

		print "$data{'John Paul'}\n";
		print "$data{'Lisa'}\n";
		print "$data{'Kumar'}\n";

### Extracting Slices ###
1. Similar to extracting slices from an array.
	1. `@` prefix is used because the result is a list of values
2. Example:

		#!/usr/bin/perl

		%data = (-JohnPaul => 45, -Lisa => 30, -Kumar => 40);

		@array = @data{-JohnPaul, -Lisa};

		print "Array: @array\n";

### Extracting Keys and Values ###
1. `keys()` **(M)**: returns list of all keys
	1. `keys %HASH`
	2. Example:

			#!/usr/bin/perl

			%data = ('John Paul' => 45, 'Lisa' => 30, 'Kumar' => 40);

			@names = keys %data;

			print "$names[0]\n";
			print "$names[1]\n";
			print "$names[2]\n";

2. `values()` **(M)**: returns list of all values
	1. `values %HASH`
	2. Example:

			#!/usr/bin/perl

			%data = ('John Paul' => 45, 'Lisa' => 30, 'Kumar' => 40);

			@ages = values %data;

			print "$ages[0]\n";
			print "$ages[1]\n";
			print "$ages[2]\n";

### Checking for Existence ###
1. Accessing a non-existant key/value pair gives `undefined` value
	1. Solution: use `exists()` **(M)**
		1. Returns true if key exists irrespective of value
2. Example:

		#!/usr/bin/perl

		%data = ('John Paul' => 45, 'Lisa' => 30, 'Kumar' => 40);

		if( exists($data{'Lisa'} )) {
			print "Lisa is $data{'Lisa'} years old\n";
		} else {
			print "I don't know age of Lisa\n";
		}

### Getting Hash Size ###
1. Use scalar context on either keys or values
2. Example:

		#!/usr/bin/perl

		%data = ('John Paul' => 45, 'Lisa' => 30, 'Kumar' => 40);

		@keys = keys %data;
		$size = @keys;
		print "1 - Hash size: is $size\n";

		@values = values %data;
		$size = @values;
		print "2 - Hash size: is $size\n";

### Add and Remove Elements in Hashes ###
1. `delete()` **(M)**: used to remove an element in hash
2. Example:

		#!/usr/bin/perl

		%data = ('John Paul' => 45, 'Lisa' => 30, 'Kumar' => 40);
		@keys = keys %data;
		$size = @keys;
		print "1 - Hash size: is $size\n";

		# adding an element to the hash;
		$data{'Ali'} = 55;
		@keys = keys %data;
		$size = @keys;
		print "2 - Hash size: is $size\n";

		# delete the same element from the hash;
		delete $data{'Ali'};
		@keys = keys %data;
		$size = @keys;
		print "3 - Hash size: is $size\n";

## Perl - IF...ELSE ##
1. `0`, '0', "", empty list (), undef are false in boolean context
	1. All other values are true
2. Negation: `!` or `not` **(M)**
3. Conditional statements:
	1. `if statement`
	2. `if...else statement`
	3. `if...elsif...else statement`
	4. `unless statement` **(M)**
	5. `unless...else statement`
	6. `unless...elsif...else statement`
	7. `switch statement`

### The ?: Operator ###
1. `Exp1 ? Exp2: Exp3;`
2. Example:

		#!/usr/local/bin/perl

		$name = "Ali";
		$age = 10;

		$status = ($age > 60)? "A senior citizen" : "Not a senior citizen";

		print "$name is - $status\n";

## Perl - Loops ##
1. Types of loops:
	1. `while loop`
	2. `until loop` **(M)**
	3. `for loop`

			#!/usr/bin/perl

			for ($a = 10; $a < 20; $a = $a + 1) {
				print "value of a: $a\n";
			}

	4. `foreach loop` **(M)**: iterates over a list and sets var to each element of the list in turn

			foreach var (list) {

			}

			foreach $a (@list) {
				print "value of a: $a\n";
			}

	5. `do...while loop`

			do {
				statement(s)
			} while (condition);

	6. nested loops

### Loop Control Statements ###
1. `next [LABEL]`

		#!/usr/local/bin/perl

		$a = 10;
		while($a < 20) {
			if( $a == 15) {
				# skip the iteration.
				$a = $a + 1;
				next;
			}
			print "value of a: $a\n";
			$a = $a + 1;
		}

		OUTER: while( $a < 4 ) {
			$b = 0;
			print "value of a: $a\n";
			INNER: while($b < 4) {
				if($a == 2) {
					$a = $a + 1;
					# jump to outer loop
					next OUTER;
				}
				$b = $b + 1;
				print "Value of b : $b\n";
			}
			print "\n";
			$a = $a + 1;
		}

2. `last [LABEL];`: Loop is terminated and control resumes at next statement following the loop.
	1. `LABEL`: Label for loop
		1. If not specified, `last` applies to the nearest loop
	2. `continue` block of loop is skipped.
3. `continue`: executed just before conditional is evaluated again (can be used with while, foreach, alone as a block)

		while(condition) {
			statement(s);
		} continue {
			statement(s);
		}

		#!/usr/local/bin/perl

		$a = 0;
		while($a < 3) {
			print "Value of a = $a\n";
		} continue {
			$a = $a + 1;
		}

4. `redo [LABEL]`: restarts loop block without evaluating the conditional statement.
	1. `LABEL`: Lavel for loop
		1. If not specified, `redo` is applicable to the nearest loop
	2. `continue` block will be skipped if there is one
	3. Example:

			#!/usr/local/bin/perl

			$a = 0;
			while($a < 10) {
				if($a == 5) {
					$a = $a + 1;
					redo;
				}
				print "Value of a = $a\n";
			} continue {
				$a = $a + 1;
			}

5. `goto LABEL`, `goto EXPR`, `goto &NAME`
	1. `LABEL`: jumps to statement with `LABEL`
	2. `EXPR`: expression which returns a LABEL name and jumps to the LABEL
	3. `&NAME`: substitutes call to named subroutine for currently running subroutine

### The Infinite Loop ###
1. leave conditional expression empty:

		#!/usr/local/bin/perl

		for(;;) {
			print "This loop will run forever.\n";
		}

## Perl - Operators ##
### Perl Arithmetic Operators ###
1. `**`: Exponent operator
	1. `$a ** $b`

### Perl Equality Operators ###
1. `<=>` - less than (returns -1), equal to (returns 0) or greater than (returns 1)
2. String equality operators:
	1. `lt`: true if left argument is stringwise less than right argument
	2. `gt`: true if left argument is stringwise greater than right argument
	3. `le`: true if left argument is stringwise less than or equal to right argument
	4. `ge`
	5. `eq`
	6. `ne`
	7. `cmp` less than (returns -1), equal to (returns 0), greater than (returns 1)

### Perl Assignment Operators ###
1. `+=`
2. `-=`
3. `*=`
4. `/=`
5. `%=`
6. `**=`

### Perl Bitwise Operators ###
1. `$a | $b`
2. `$a & $b`
3. `$a ^ $b`
4. `~$a`: 1s complement of `$a`
5. `$a << 2`: left shift by 2 bits
6. `$a >> 2`: right shift by 2 bits

### Perl Logical Operators ###
1. `$a and $b` same as `&&`
2. `$a or $b` same as `||`
3. `not $a` not

### Quote-line Operators ###
1. `q{}`: enclose string in single quotes
2. `qq{}`: enclose string in double quotes
3. `qx{}`: enclose in back ticks

### Miscellaneous Operators ###
1. `.`: concatenates strings
2. `x` repetition operator
	1. `'-' x 3`
3. `..`: range operator
4. `++`: auto increment
5. `--`: auto decrement
6. `->`: dereferencing operator
	1. `$obj->$a`: access variable `$a` from object `$obj`

### Perl Operators Precedence ###

## Perl - Date & Time ##
### Current Date and Time ###
1. `localtime()`: returns current date and time (if no arguments)
	1. a list of 9 values is returned
2. Example: 

		($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
		print "$mday $months[$mon] $days[$wday]\n";

### GMT Time ###
### Format Date & Time ###
1. `printf()`: similar to C printf

### Epoch time ###
### POSIX Function `strftime()` ###

## Perl - Subroutines ##
### Define and Call a Subroutine ###
1. Syntax:

		sub subroutine_name {
			body of the subroutine
		}

	1. Calling: `subroutine_name( list of arguments );`
		1. `&subroutine_name( list of arguments )` if Perl < 5.0

2. Example:

		#!/usr/bin/perl

		# Function definition
		sub Hello {
			print "Hello, World!\n";
		}

		# Function call
		Hello();

### Passing Arguments to a Subroutine ###
1. `@_`: array that contains arguments passed to subroutine
	1. `$_[0]`: first argument
	2. `$_[1]`: second argument

2. Example: subroutine that takes a list of numbers and prints their average

		#!/usr/bin/perl

		# Function definition
		sub Average {
			# get total number of arguments passed.
			$n = @_;
		
			$sum = 0;

			foreach $num (@_) {
				$sum += $num;
			}

			$average = $sum / $n;
	
			print "Average for the given numbers: $average\n";
		}

		# Function call
		Average(10, 20, 30);

### Passing Lists to Subroutine ###
1. Make list as last argument (or else it will be difficult to extract values)
2. Example:

		#!/usr/bin/perl

		# Function definition
		sub printList {
			my @list = @_;
			print "Given list if @list\n";
		}
		$a = 10;
		@b = (1, 2, 3, 4);

		# Function call with list parameter
		printList($a, @b);

### Passing Hashes to Subroutine ###
1. When hash is passed, it is automatically translated into list of key/value pairs
2. Example:

		#!/usr/bin/perl

		# Function definition
		sub PrintHash {
			my (%hash) = @_;

			foreach $key (keys %hash) {
				my $value = $hash{$key};
				print "$key: $value\n";
			}
		}
		%hash = ('name' => 'Tom', 'age' => 19);

		# Function call with hash parameter
		PrintHash(%hash);

### Returning Value from a Subroutine ###
1. If no value is returned, the return value is automatically the value of last calculation in the sub routine (like in Ruby)
2. Arrays and hashes can be returned
	1. Returning multiple arrays/hashes will cause them lose their identity
3. Example:

		#!/usr/bin/perl

		# Function definition
		sub Average {
			# get total number of arguments passed.
			$n = @_;
			$sum = 0;

			foreach $num (@_) {
				$sum += $num;
			}
			$average = $sum / $n;

			return $average;
		}

		# Function call
		$num = Average(10, 20, 30);
		print "Average for the given numbers: $num\n";

### Private Variables in a Subroutine ###
1. `my`: is used for creation of private variables (all variables in Perl by default are global variables)
	1. Confines to a region (scope) of code in which it can be accessed.
2. lexical scope: block of code surrounded by braces.
3. Example:

		sub somefunc {
			my $variable; # $variable is invisible outside somefunc()
			my ($another, @an_array, %a_hash); # declaring many variables at once
		}

4. Example:

		#!/usr/bin/perl

		# Global variable
		$string = "Hello, World!";

		# Function definition
		sub PrintHello {
			# Private variable for PrintHello function
			my $string;
			$string = "Hello, Perl!";
			print "Inside the function $string\n";
		}

		# Function call
		PrintHello();
		print "Outside the function $string\n";

### Temporary Values via `local()` ###
1. `local` used if we want current value to to visible in called subroutines.
	1. It gives temporary values to global (package) variables (dynamic scoping)
	2. Stores current values in argument list in hidden stack and then restores the values upon exiting the block/subroutine/eval
2. Example:

		#!/usr/bin/perl

		# Global variable
		$string = "Hello, World!";

		sub PrintHello {
			# Private variable for PrintHello function
			local $string
			$string = "Hello, Perl!";
			PrintMe();
			print "Inside the function PrintHello $string\n";
		}

		sub PrintMe {
			print "Inside the function PrintMe $string\n";
		}

		# Function call
		PrintHello();
		print "Outside the function $string\n";

### State Variables via `state()` ###
1. lexical variables that maintain state and do not get re-initialized on each call to sub-routine
2. Example:

		#!/usr/bin/perl

		use feature 'state';

		sub PrintCount {
			state $count = 0; # initial value

			print "Value of counter is $count\n";
			$count++;
		}

		for (1..5) {
			PrintCount();
		}

3. Example: Prior to Perl 5.10

		{
			my $count = 0; # initial value

			sub PrintCount {
				print "Value of counter is $count\n";
				$count++;
			}
		}

### Subroutine Call Context ###
1. Context of subroutine:
	1. type of return value that is expected. (Single function can return different values based on what user is expecting to receive)
2. Example:
	
		my $datastring = localtime(time); # returns string in scalar context
		($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time); # individual variables contain values

## Perl - References ##
1. Reference - scalar data type that holds location of another value (scalar, arrays, hashes)
	1. Used for building nested data structures
		1. List can have references to other lists, each can contain references to hashes, ...

### Creation of Reference ###
1. Prefix with `\`
2. Examples:

		$scalarref = \$foo;
		$arrayref = \@ARGV;
		$hashref = \%ENV;
		$coderef = \&handler;
		$globref = \*foo;

3. Reference to I/O handle cannot be created
4. References to anonymous arrays:

		$arrayref = [1, 2, ['a', 'b', 'c']];

5. References to anonymous hashes:

		$hashref = {
			'Adam' => 'Eve',
			'Clyde' => 'Bonnie',
		};

6. Reference to anonymous subroutine:

		$coderef = sub { print "Boink!\n" };

### Dereferencing ###
1. Returns value from a reference to location.
	1. Use `$`, `@` or `%` for scalar, array or hash references
2. Example:

		#!/usr/bin/perl

		$var = 10;

		# Now $r has reference to $var scalar.
		$r = \$var;

		# Print value available at the location stored in $r.
		print "Value of $var is: ", $$r, "\n";

		@var = (1, 2, 3);
		# Now $r has reference to @var array.
		$r = \@var;
		# Print values available at the location stored in $r.
		print "Values of @var is: ", @$r, "\n";

		%var = ('key1' => 10, 'key2' => 20);
		# Now $r has reference to %var hash.
		$r = \%var;
		# Print values available at the location stored in $r.
		print "Value of %var is: ", %$r, "\n";

3. To know variable type: `ref()` **(M)**
	1. Returns one of the following strings: SCALAR, ARRAY, HASH, CODE, GLOB, REF, false (if variable is not a reference)
	2. Example:

			#!/usr/bin/perl

			$var = 10;
			$r = \$var;
			print "Reference type in r: ", ref($r), "\n";

			@var = (1, 2, 3);
			$r = \@var;
			print "Reference type in r: ", ref($r), "\n";

			%var = ('key1' => 10, 'key2' => 20);
			$r = \%var;
			print "Reference type in r: ", ref($r), "\n";

### Circular References ###
1. When two references contain reference to each other

		#!/usr/bin/perl

		my $foo = 100;
		$foo = \$foo;

		print "Value of foo is: ", $$foo, "\n";

### Reference to Functions ###
1. `\&<function-name>` **(M)**
2. `&$<function-ref>` **(M)**
3. Example:

		#!/usr/bin/perl

		# Function definition
		sub PrintHash {
			my (%hash) = @_;

			foreach $item (%hash) {
				print "Item: $item\n";
			}
		}

		%hash = ('name' => 'Tom', 'age' => 19);

		# Creation of reference to above function
		$cref = \&PrintHash;

		# Function call using reference
		&$cref(%hash);

## Perl - Formats ##
1. format: A writing template
	1. Define a format.
	2. Write formatted data

### Define a Format ###
### Using the Format ###
### Define a Report Header ###
### Define a Pagination ###
### Number of Lines on a Page ###
### Define a Report Footer ### 

## Perl - File I/O ##
### Opening and Closing Files ###
### Open Function ###
1. `open FILEHANDLE, EXPR`
	1. FILEHANDLE: file handle returned by `open`
	2. EXPR: expression having file name and mode of opening
	3. Example: `<` open in read mode, `>` open in write mode, `+<` open for updating without truncating it, `>>` append, `+>>` read and/or append 

			#!/usr/bin/perl

			open(DATA, "<file.txt") or die "Couldn't open file file.txt, $!";

			while(<DATA>) {
				print "$_";
			}

2. `open FILEHANDLE`
3. `sysopen FILEHANDLE, FILENAME, MODE, PERMS`
4. `sysopen FILEHANDLE, FILENAME, MODE`

### Sysopen Function ###
### Close Function ###
1. `close FILEHANDLE`: fulshes filehandle's buffers and closes system's file descriptor
2. Example:

		close(DATA) || die "Couldn't close file properly";

### Reading and Writing Files ###
### The <FILEHANDL> Operator ###
1. `<FILEHANDLE>` returns
	1. single line in scalar context
		1. Example:

				#!/usr/bin/perl

				print "What is your name?\n";
				$name = <STDIN>;
				print "Hello $name\n";

	2. list of lines in list context
		1. Example:

				#!/usr/bin/perl

				open(DATA, "<import.txt") or die "Can't open data";
				@lines = <DATA>;
				close(DATA);

### getc Function ###
1. `getc FILEHANDLE`: reads single character from FILEHANDLE
2. `getc`

### read Function ###
1. `read()`: reads a block of information from buffered filehandle
	1. `read FILEHANDLE, SCALAR, LENGTH, OFFSET`
		1. `LENGTH`: length of data read
		2. `SCALAR`: data is placed here at start if no `OFFSET` is specified
			1. `OFFSET`: if specified, data is placed after `OFFSET` bytes in `SCALAR`
	2. `read FILEHANDLE, SCALAR, LENGTH`

### print Function ###
1. `print FILEHANDLE LIST` **(M)**: Prints evaluated value of LIST to FILEHANDLE or to STDOUT (default)

### Copying Files ###
### Renaming a file ###
### Deleting an Existing File ###
### Positioning inside a File ###
### File Information ###
1. Operators: (many defined for bash)
	1. `-e $file`
	2. `-f $file`

## Perl - Directories ##
1. Functions:
	1. `opendir DIRHANDLE, EXPR` # To open a directory
	2. `readdir DIRHANDLE` # To read a directory
	3. `rewinddir DIRHANDLE` # Positioning pointer to the begining
	4. `telldir DIRHANDLE` # Returns current position of the dir
	5. `seekdir DIRHANDLE, POS` # Pointing pointer to POS inside dir
	6. `closedir DIRHANDLE` # Closing a directory

## Perl - Error Handling ##
### The if statement ###
### The unless Function ###
### The ternary Operator ###
### The warn Function ###
### The die Function ###
### Errors within Modules ###
### The carp Function ###
### The cluck Function ###
### The croak Function ###
### The confess Function ###

## Perl - Special Variables ##
## Perl - Coding Standard ##

## Perl - Regular Expressions ##
1. `=~`: test and assignment operator, `!~`
2. Three regular expression operators:
	1. Match Regular expression: `m//`
		1. `m{}`, `m()`, `m><`, ... are all valid
	2. Substitute Regular expression: `s///`
	3. Transliterate Regular expression: `tr///`
3. Example:

		$bar = "This is foo and again foo";
		if ($bar =~ /foo/) {
			print "First time is matching\n";
		} else {
			print "First time is not matching\n";
		}

		$bar = "foo";
		if ($bar =~ /foo/) {
			print "Second time is matching\n";
		} else {
			print "Second time is not matching\n";
		}

4. Returning contents of grouped `(...)` expression in list context:

		my ($hours, $minutes, $seconds) = ($time =~ m/(\d+):(\d+):(\d+)/);

### The Match Operator ###
1. Modifiers:
	1. `i`: case insensitive
	2. `g`: globally finds all matches

### Match Operator Modifiers ###
### Matching Only Once ###
### Regular Expression Variables ###
### The Substitution Operator ###
1. `$string =~ s/cat/dog/`; - replaces all occurrances of `cat` with `dog`

### Substitution Operator Modifiers ###
### The Translation Operator ###
1. `$string =~ tr/a-z/A-Z/;` - converts lowercase letters to uppercase letters

### Translation Operator Modifiers ###
### More Complex Regular Expressions ###
1. `\d`: equivalent to `[0-9]`
2. `\s`: matches whitespace
3. `\w`: matches word characters

### Matching Boundaries ###
### Selecting Alternatives ###
### Grouping Matching ###
### The \G Assertion ###
### Regular-expression Examples ###
#### Literal Characters ####
#### Character Classes ####
#### Special Character Classes ####
#### Repetition Cases ####
#### Nongreedy Repetition ####
#### Grouping with Parantheses ####
#### Backreferences ####
#### Alternatives ####
#### Anchors ####
#### Special Syntax with Parantheses ####

## Perl - Sending Email ##

# Perl Advanced #
## Perl - Socket Programming ##
## Perl - Object Oriented ##
## Perl - Database Access ##
## Perl - CGI Programming ##
## Perl - Packages & Modules ##


## Perl - Process Management ##
## Perl - Embedded Documentation ##
## Perl - Functions Reference ##
