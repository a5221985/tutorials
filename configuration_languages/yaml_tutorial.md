# YAML #
## Topics ##
1. Why learn YAML?
2. What is YAML used for?
3. What is YAML?
4. YAML Syntax
	1. key-value pairs
	2. comments
	3. objects
	4. lists
	5. booleans
	6. multi line strings
	7. env variables
5. YAML is popular
	1. Configuration files written in YAML
	2. Widely used format for different DevOps tools and applications

## What is YAML? ##
1. YAML is a data serialization language
	1. Like XML, JSON
	2. What is serialization langauge?
		1. It is a standard format to transfer data between applications written in different languages using different data structures
	3. YAML - YAML Ain't Markup Language
2. Extensions
	1. .yaml
	2. .yml
3. YAML format compared to others
	1. Human readable and intiutive
		1. Great fit for writing configuration files for recent DevOps tools
	2. Comparison

			microservices:
				- app: user-authentication
				  port: 9000
				  version: 1.0
				  
			<microservices>
				<microservice>
					<app>user-authentication</app>
					<port>9000</port>
					<version>1.0</version>
				</microservice>
			</microservices>
			
			{
				microservices: {
					{
						app: "user-authentication",
						port: 9000,
						version: "1.0"
					}
				}
			}
			
		1. YAML - doesn't have special characters like `<>` or `{}` but data structures are defined using line separations and indentations and 