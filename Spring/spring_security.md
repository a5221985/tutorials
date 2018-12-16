# Spring Security #
## Advanced Microservices Security With Spring and OAuth2 ##
1. Microservices
	1. OAuth2 authentication server
	2. Eureka discovery service (behind Zuul gateway)
2. Gateway
	1. API gateway (entry point into system)
		1. `@EnableOAuth2Sso` added to module main class
		2. forwards OAuth2 access tokens downstream to services it is proxying
		3. Sets form based protection for resources (all requests redirected to login page if user is not authenticated)

				<!DOCTYPE html>
				<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
					<head>
						<title>Login page</title>
						<meta charset="utf-8" />
					</head>
					<body>
						<h1>Login page</h1>
						<p>Example user: user / password</p>
						<p th:if="${loginError}" class="error">Wrong user or password</p>
						<form th:action="@{/login}" method="post">
							<label for="username">Username</label>:
							<input type="text" id="username" name="username" autofocus="autofocus" /><br />
							<label for="password">Password</label>:
							<input type="password" id="password" name="password" /><br />
							<input type="submit" value="Log in" />
						</form>
						<p><a href="/index" th:href="@{/index}">Back to home page</a></p>
					</body>
				</html>s

## Simple Attribute-Based Access Control With Spring Security ##
## Example of Multiple Login Pages With Spring Security ##
## Secure REST Services and Web Applications With Spring Boot Security Starter ##
## Spring Security: Basic Authentication Example ##
## DZone's Guide to Proactive Security: Apps, Environments, and Messaging ##
## Refcard #248, Java Application Vulnerabilities: What They Are and How to Fix Them ##
