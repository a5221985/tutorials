# Important commands #
1. `python --version` **(M)**
2. `apt-cache policy <package>` **(M)**: Check if package is installed or not
	1. `policy`: used to debug issues relating to preferences file
		1. Prints information about priority selection of `<package>`
3. `apt-cache search <regex>` **(M)**: searches for `<regex>` in package names and descriptions