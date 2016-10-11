## Learning Chef

### Chapters
1. Configuration Management and Chef
	1. What is Configuration Management
	2. Why You Need a Configuration Management Tool to Automate IT
	3. What is Chef?
	4. Why Chef Might Be a Good Tool for Your Enterprise?
	5. Where Do We Go From Here?
2. Configure Your Chef Development Environment
	1. Install a Programmer's Text Editor
	2. Chef Development Tools
	3. Install the Chef Development Tools on Linux
		1. Verify the Chef Development Kit/Chef Client Install on Linux
		2. Install Test Kitchen on Linux (Chef Client Only)
		3. Verify the Test Kitchen Installation on Linux (Chef Client Only)
	4. Install the Chef Development Tools on Mac OS X
		1. Verify the Chef Development Kit/Chef Client Installation on Mac OS X
		2. Install Test Kitchen on Mac OS X (Chef Client Only)
		3. Verify the Test Kitchen Installation on Mac OS X (Chef Client Only)
	5. Install the Chef Development Tools on Windows
		1. Verify the Chef Development Kit/ Chef Client Installer in Windows
		2. Install Test Kitchen in Windows (Chef Client Only)
		3. Verify the Test Kitchen Installer in Windows (Chef Client Only)
		4. Install Unix Tools for Windows
		5. Install ConEmu (Optional)
	6. Summary
3. Ruby and Chef Syntax
	1. Overview of Ruby
	2. Ruby Syntax and Examples
		1. Comments
		2. Variables
		3. Mathematical Operations
		4. Strings
		5. Heredoc Notation
		6. True and False
		7. Arrays
		8. Hashes
		9. Regular Expressions
		10. Conditionals and Flow
		11. Methods, Classes and Modules
	3. Chef Syntax and Examples
4. Write Your First Chef Recipe
	1. Creation of Directory Structure for Your Code
	2. Write Your First Chef Recipe
	3. Verify You First Chef Recipe
	4. Examine hello.rb
	5. Recipes Specify Desired Configuration
	6. To Uninstall, Specify What Not to Do
	7. Summary
5. Manage Sandbox Environments with Test Kitchen
	1. Installing Vagrant and VirtualBox
	2. Host versus Guest
	3. Introduction Test Kitchen
	4. Spinning Up Your First Virtual Machine
	5. YAML Overview
	6. Test Kitchen Configuration with .kitchen.yml
	7. Summary
6. Manage Nodes with Chef Client
	1. What is a Node?
	2. Create a New Sandbox Environment for a Node
	3. Installing Chef Client with Test Kitchen
	4. Your First Chef-Client Run
	5. Chef Client Modes
	6. Ohai
	7. Accessing Node Information
7. Cookbook Authoring and Use
	1. Your First Cookbook: Message of the Day
	2. Your First Cookbook: Message of the Day (Chef Development Kit)
	3. Introduction to Cookbook_file Resource
	4. Your First Cookbook: Message of the Day (Chef Client)
	5. Introducing the Cookbook_file Resource
	6. Performing Your First Converge
	7. Validate Your Results
	8. Anatomy of a Chef Run
	9. Cookbook Structure
	10. The Four Resources Your Need to Know
	11. Apache Cookbook: A Step-By-Step Primer for Creation of a Cookbook
		1. Define Prerequisites
		2. Generate the Cookbook Skeleton
		3. Edit the README.md File
		4. Update Metadata.rb
		5. Introducing the Package Resource
		6. Introducing the Service Resource
		7. Verify Success Criteria Are Met
	12. Summary
8. Attributes
	1. Motd-Attributes Cookbook
	2. Setting Attributes
	3. Basic Attribute Priority
	4. Include_Recipe
	5. Attribute Precedence
	6. Debugging Attributes
	7. Summary
9. Manage Multiple Nodes at Once with Chef Server
	1. How to Install Enterprise Chef Server Manually
	2. Install Enterprise Chef Server
	3. Introducing Idempotence
	4. Configure Enterprise Chef Server
	5. Testing the Connection
	6. Bootstrapping a Node
		1. Creation of a Node in a Sandbox Environment
		2. Bootstrap the Node with Knife
		3. Bootstrap Chef Server with Chef Solo
		4. Summary
10. Community and the Chef-Client Cookbook
	1. Using Community Cookbooks
	2. Chef-Client Cookbook
	3. Knife Cookbook Site Plugin
	4. Search for Community Cookbooks Using Knife Cookbook Site
	5. Manage Chef Supermarket Cookbooks on Your Chef Server Using Knife
		1. Cookbook Site
	6. Chef-Client Recipes
	7. Configure Knife to Use a Production SSL Setup
	8. Configure Chef-Client to Use a Production SSL Setup
	9. Summary
11. Chef Zero
	1. Test Kitchen and Chef Zero
	2. Running Chef-Zero on Your Host Using Chef-Playgound
	3. Summary
12. Search
	1. Search from the Command Line
	2. Search from the Command Line with Knife
	3. Search in a Recipe Using Test Kitchen
13. Data Bags
	1. Basic Command Line Data Bag Usage with Knife
	2. Creation of Local Users Based on Data Bag Items in a Recipe
	3. Verify Users
	4. Encrypted Data Bags
	5. chef-vault
	6. Summary
14. Roles
	1. Create a Web Server Role
	2. Attributes and Roles
	3. Roles and Search
	4. Role Cookbook
	5. Summary
15. Enviornments
	1. Creation of Dev Environment
	2. Attributes and Environments
	3. Putting All the Pieces Together
		1. Simulate a Production Environment
		2. Simulate a Development Environment
	4. Summary
16. Testing
	1. Testing Rationale
	2. Revisting the Apache Cookbook
	3. Test Automation with Serverspec
		1. Write Your First Serverspec Test
		2. RSpec DSL Syntax
		3. More Serverspec Resources
	4. Test Automation with Foodcritic
	5. Test Automation with ChefSpec
		1. Write Your First ChefSpec Test
		2. Lazy Evaulation with Let
		3. Generate a Coverage Report
		4. Share Test Code with spec_helper.rb
	6. Summary