# Build a RESTful API in Go using AWS Lambda #
## Introduction ##
1. To design, build and deploy RESTful API in Go using AWS Lambda

## What is AWS Lambda? ##
1. AWS Lambda:
	1. Serverless compute service
	2. Runs code in response to events and automatically manages underlying compute resources for us
	3. Can be used to extend other services using custom logic
	4. Back-end services can be defined that operate at AWS scale, performance, security
	5. It can run code in response to multiple events
		1. HTTP requests (via Amazon API Gateway)
		2. Modifications to objects (in Amazon S3 buckets)
		3. Table updates (in Amazon DynamoDB)
		4. State transitions (in AWS Step functions)
	6. Runs custom code in
		1. High-avialability compute infrastructure
	7. Performs all administration of compute resources
		1. Server and OS system maintenance
		2. Capacity provisioning
		3. Automatic scaling
		4. Code and security patch deployment
		5. Code monitoring and logging
2. Our job: Supply code
3. Problem: API to help local movie rental shop to manage available movies

## API Architecture ##
1. Architecture:

	![http://www.javacodegeeks.com/wp-content/uploads/2018/11/image1.png](http://www.javacodegeeks.com/wp-content/uploads/2018/11/image1.png)

2. Empowers microservice development
	1. Each endpoint triggers a different Lambda function
	2. Functions are independent of each other and can be written in different languages
		1. Scalability at function level
		2. Easier unit testing
		3. Loose coupling
3. Requests from clients first go through API gateway
	1. API gateway routes incoming request to right Lambda function
4. Single Lambda function can handle multiple HTTP methods (GET, POST, PUT, DELETE, ...)
	1. One lambda function per functionality for exploiting the power of microservices

## Endpoints Design ##
1. `net/http` Go package for status codes
	1. `http.StatusOK`
	2. `http.StatusCreated`
	3. `http.StatusBadRequest`
	4. `http.StatusInternalServerError`
	5. ...

## The GET Method ##
1. Feature: List movies
2. Steps:
	1. Step 1: Lambda function to register `findAll` handler
		1. Handler transforms list of movies to string and returns string wrapped in `APIGatewayProxyResponse` variable along with `200` HTTP status code.
			1. Handles errors when conversion failure occurs

					package main
		
					import (
						"encoding/json"
						
					)

## The GET Method with Parameters ##
## The POST Method ##
