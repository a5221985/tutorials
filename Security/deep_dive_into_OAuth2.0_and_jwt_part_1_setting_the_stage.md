# Deep Dive Into OAuth2.0 and JWT (Part 1 Setting the Stage) #
## Introduction ##
1. **Security**
	1. Understanding what data/info can be presented to whom
	2. Time
	3. Validation
	4. re-validation
2. All security concerns can be broken down into
	1. Authentication
	2. Authorization

## Authentication ##
1. Does user/ website/ app is what it claims to be?
	1. Are they providing valid credentials pertaining to the user/ website/ app?
		1. Methods:
			1. Username and password + optionally other info (known only to user)
				1. Info is called factors
2. Based on number of factors, authentication can be any of 3:
	1. Single-Factor Authentication (0 other info)
		1. Only username and password (website that needs only username and password)
	2. Two-Factor Authentication (1 other info)
		1. username + password + 1 piece of confidential info (eg banking website that requires PIN known only to user)
	3. Multi-Factor Authentication (MFA):
		1. Two or more security factors from independent categories (eg hospital system that requires username, password, security code on user's smartphone, fingerprint)