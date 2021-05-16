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
4. YAML Use Cases
	1. Ansible
	2. Prometheus
	3. Kubernetes
	4. ...
5. Syntax
	1. key-value pairs

			app: user-authentication
			port: 9000
			version: 1.7
			
		1. Data-types
			1. string - no quotes or quotes (double or single)
				1. If special characters are used: enclose the string in quotes

						app: "user-authentication \n"
						
	2. Comments:

			# comment here
			
	3. Objects:

			microservice:
				app: user-authentication
				port: 9000
				version: 1.7
				
		1. Use YAML validator to validate the file before use
			1. [onlineyamltools.com/edit-yaml](onlineyamltools.com/edit-yaml)
			2. Install YAML plugin/extension on IDE
		2. [https://support.asg.com/mob/mvw/10_0/mv_ag/using_quotes_with_yaml_special_characters.htm](https://support.asg.com/mob/mvw/10_0/mv_ag/using_quotes_with_yaml_special_characters.htm)
			1. Use quotes if value includes special characters
				1. Example: {, }, [, ], ,, &, :, *, #, ?, |, -, <, >, =, !, %, @, \
			2. No quotes required for single special characters
				1. Example: *

						Hello * Bla
					
			3. Use quotes if special character is part of longer string
				1. Example: 

						*/5 * * * * 
						must be written as
						"*/5 * * * *"
						
			4. Single quotes allow almost any character in string
				1. Escape quotes will not be parsed

						'\n' is returned as \n
						
			5. Double quotes allow parsing of escape codes

						"\n" is returned as line feed character
						
			6. "Yes" and "No" - must be enclosed in single or double quotes
				1. Else they will be interpreted as `TrueClass` and `FalseClass` values
		3. Lists

				microservices:
					- app: user-authentication
					  port: 9000
					  version: 1.7
					  
			1. List of objects
		4. Boolean values:

				microservices:
					- app: user-authentication
					  port: 9000
					  version: 1.7
					  deployed: yes # or `no` or `true` or `false` or `on` or `off`
					  
		5. More items in the list (list of objects)

				microservices:
					- app: user-authentication
					  port: 9000
					  version: 1.7
					- app: shopping-cart
					  port: 9002
					  version: 1.9 
					  
		6. List of simple values

				microservices:
					- user-authentication
					- shopping-cart

		7. Nested lists

				microservices:
					- app: shopping-cart
					  port: 9002
					  versions:
					  	- 1.9
					  	- 2.0
					  	- 2.1

			1. List items can be indented to align with the parent

					microservices:
					- app: user-authentication
					  port: 9000
					  version: 1.7
					- app: shopping-cart
					  port: 9002
					  version: 1.9
					  
				1. But we need to align list items among themselves
			2. List of primitive items different syntax

					microservices:
						- app: shopping-cart
						  port: 9002
						  versions: [1.9, 2.0, 2.1]
						  
				1. We can have mixed types

						  versions: ["1.9", 2.0, 2.1]
						  
	2. Kubernetes example:

			apiVersion: v1
			kind: Pod
			metadata: # object
				name: nginx
				labels: # object
					app: nginx
			spec:
				containers:
					- name: nginx-container
					  image: nginx
					  ports:
					  	- containerPort: 80
					  volumeMounts:
					  	- name: nginx-vol
					  	  mountPath: /usr/nginx/html
					- name: sidecar-container
					  image: curlimages/curl
					  args: ["-c", "echo Hello from the sidecar container; sleep 300"]
					  
	3. Multi-line strings

			multilineString: |
				this is a multiline string
				and this is the next line
				next line

			multilineString: > # interpret as single line
				this is a single line string, 
				that should be all on one line.
				some other stuff
				
		1. Kubernetes config:

				apiVersion: v1
				kind: ConfigMap
				metadata:
					name: mosquitto-config-file
				data:
					mosquitto.conf: |
						log_dest stdout
						log_type all
						log_timestamp true
						listener 9001
						
		2. Kubernetes config:

				command:
					- sh
					- -c
					- |
					  #!/usr/bin/env bash -e
					  http() {
					  	local path="${1}"
					  	set -- -XGET -s --fall
					  	# some more stuff here
					  	curl -k "$@" "http://localhost:5601${path}"
					  }
					  http "/app/kibana"
					  
			1. Shell script as multiline text
	4. Environment variables

			# readiness probe
			command:
				- /bin/sh
				- -ec
				- >-
				  mysql -h 127.0.0.1 -u root -p$MYSQL_ROOT_PASSWORD -e 'SELECT 1'
					  
		1. `$MYSQL_ROOT_PASSWORD`
	5. Placeholders
		1. Example: Helm

				apiVersion: v1
				kind: Service
				metadata:
					name: {{ .Values.service.name }}
				spec:
					selector:
						app: {{ .Values.service.app }}
					ports:
						- protocol: TCP
						  port: {{ .Values.service.port }}
						  targetPort: {{ .Values.service.targetPort }}
						  
			1. The value gets replaced using template generator
			2. It is Jinja2 syntax to reference variables
				1. Example:
					1. Define simple variable using standard YAML syntax

							remote_install_path: /opt/my_app_config
							
					2. Reference simple variable (Jinja2 syntax - `{{...}}`)

							ansible.builtin.template:
								src: foo.cfg.j2
								dest: '{{ remote_install_path }}/foo.cfg'
			
			3. Multiple YAML documents (separated by `---`)

					apiVersion: v1
						...
						
					---
					apiVersion: v1
						...
						
				1. Kubernetes: Multiple components can be grouped into single yaml file
	6. Kubernetes - YAML or JSON can be used
7. Yaml Official Documentation:
	1. [https://yaml.org/spec/1.2/spec.html](https://yaml.org/spec/1.2/spec.html)