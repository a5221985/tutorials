# REST API Design, Development & Management #
## Setting the Stage ##
### Introduction to the Author and the Course ###
1. ACME Travel - Case Study
	1. Fititious company that sells vacation packages
2. Tools
3. Sections:
	1. REST API Concepts
		1. Evolution of REST/JSON API
		2. RESTful Architectural Constraints (6 in the desertation papers)
		3. Richardson Maturity Model
	2. Designing REST API
		1. Resources
		2. Associations
		3. URI schemes
		2. CRUD implementation
		3. Error Handling
		4. Caching
		3. Change Management
		4. Versioning
		4. Partial Responses
		5. Pagination
	3. Securing the API
		1. Basic Authentication
		2. JWT (benefits)
		3. API Key/Secret
		4. OAuth 2.0
			1. Spotify API
		5. Functional attacks
			1. SQL Injection attack
	4. Contract First: Swagger (collaborative process for development)
		1. Collaborative specs development (process used for development)
		2. Swagger 2.0/OAI Specs
			1. API Standard
			2. Swagger specs using RAML
			3. Tools, Benefits
	5. API Management
		1. API Management Models: Proxy, Agents
			1. Scope, Infra
		2. Policies application to control: Security, Traffic, ...
		3. Dev Portal, Monetization
			1. Build or buy
			2. Monetization
				1. What it takes to build APIs that can be monetized
4. Popular API Providers and how they designed their API
	1. facebook
	2. Linked in
	3. UBER
	4. Walmart Open API
	5. twilio
	6. twitter
	7. stripe
	8. BBC
	9. GitHub
	10. Pinterest
	11. digg api
5. Implementation using Node JS and Mongo DB
6. API Management providers
	1. apigee
	2. MuleSoft
	3. IBM API Connect

### Summary Decks Download Link for the Course ###
1. Summary decks: [http://acloudfan.com/download-files](http://acloudfan.com/download-files)
2. Resources: [Link for download](http://acloudfan.com/download-files)

### ACME Travels - Case Study ###
1. Business problem
	1. Almost all business is supposedly conducted over phone
	2. They supposedly have a website built in 2000
	3. They have supposedly released mobile app last year
		1. No right data
		2. Bad reviews
2. Acme is supposedly losing business to competition
3. Competition is supposedly taking away customers with cool apps
4. Compeition is supposedly stealing ACME partners with affiliation deals
5. Solution: Need to invest in technology
	1. ACME needed a CTO
		1. Vision:
			1. A fully automated vacation ecosystem driven by ACME APIs
				1. Architecture
	2. Web talks to web backend using HTTP/XML
	3. Mobile talks to mobile backend using HTTP/JSON
	4. Data is stored in MySQL

### Tools for Design, Development, Testing and Management of REST API ###
### Crash Course on MongoLabs ###

## Evolution of RESTful Services ##
### What is an API ###
### Evolution of REST/JSON API ###
### Introduction to RESTful API ###
### Private, Public and Partner API ###

## REST API Architectural Constraints ##
### Introduction to REST Architecture Constraints ###
### REST API Architectural Constraint - Client Server ###
### REST API Architectural Constraint - Uniform Interface ###
### REST API Architectural Constraint - Statelessness ###
### REST API Architectural Constraint - Caching ###
### REST API Architectural Constraint - Layered System ###
### REST API Architectural Constraint - Code On Demand ###
### Richardson Maturity Model for REST API ###

## Designing REST API ##
### API Value Chain ###
### Practices for Resource Names, Actions & Associations ###
### Implementing REST API CRUD Operations ###
### Walkthrough: Creation of a Vacations API in Node JS ###
### REST API Error Handling Practices ###
### Walkthrough: Implementation of Error Handling for POST API ###
### Handling Changes to API ###
### Versioning the API ###
### API Caching (1 of 2) Concepts & Design Decisions ###
### API Caching (2 of 2) Cache Controle Directive ###
### Demo - API Caching Using Cache-Control Directives ###
### Building Support for Partial Responses ###
### Building Support for Pagination ###

## REST API Security ##
### REST API Security - Introduction ###
### Securing API with Basic Authentication ###
### Securing API with Tokens & JWT ###
### Securing API with API Key & Secret ###
### API Authorization using OAuth 2.0 ###
### API Security - Functional Attach ###

## REST API Specifications using Swagger 2.0/OAI ##
### Requirements Analysis Process & Intro to REST Specifications ###
### Swagger/OAI Specifictions Walkthrough ###
### Swagger/OAI Specifications, Part 1 of 3 ###
### Swagger/OAI Specifications, Part 2 of 3 ###
### Swagger/OAI Specifications, Part 3 of 3 ###

## API Management ##
### Introduction to API Management ###
### API Lifecycle & Developer Productivity ###
### API Developer Portal ###
### API Security Management ###
### API Traffic Management ###
### API Analysis ###
### API Product and API Monetization ###

## Good Bye & All the Best ##
### Good Bye ###