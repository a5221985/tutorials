# HTTPS Secure Website SSL Certificate #
## Introduction ##
### Introductions ###
1. Why convert your HTTP site to HTTPS?
	1. Search Engines?
		1. Ranking boost (Google) - not very strong reason
	2. Web Browsers?
		1. Padlock - confidence to visitors - good reason
			1. Especially for forms
	3. Visitors! - main reason
		1. Gives confidence
		2. They feel secure
2. Should you Switch?
	1. Information only sites?
		1. Not collecting iformation - not required
		2. But do it for Google
	2. New v Established Sites?
		1. Google sees the secured site (even though old site) as a new site
		2. Redirection (Google comes to know so that ranking is not affected usually)
	3. Potential Problems?
		1. No guarantees rank will be maintained
3. Course Curriculum
	1. What is SSL and should you switch?
	2. AutoSSL? - Use it or remove it. - used a lot
	3. CloudFlare - What it is, why I use it and why you should too.
		1. Speeds up and more secure
		2. Free way of adding SSL certificates
	4. Add a website to Cloudflare.
	5. Generate & Install an SSL certificate
	6. Understanding and fixing mixed content
		1. Free tools exist
	7. Securing your Wordpress Dashboard
	8. Redirecting the HTTP pages to HTTPS pages
	9. Testing your SSL
		1. To check if site is 100% secure

### What is SSL and Why Switch? ###
1. SSL: Secure Socket Layer - standard security technology for establishing an encrypted link between a web server and a browser. The link ensures that all data passed between web server and browsers remain private and integral
2. TLS: Transport Layer Security - it is new stronger encryption protocol (also referred to as SSL because it deos the same thing)
	1. SSL is predecessor of TLS
3. What is SSL?
	1. After secure connection is made to web page, session key is used to encrypt all data that is transmitted between visitor and web server
	2. When browser connects to server, it requests server identity
	3. Server identifies iteself by sending SSL certificate, including server's public key
4. Why use SSL?
	1. Consider credit card details sent to another computer
		1. This information must not reach hackers
	2. Padlock in address bar of a browser
		1. Gives confidence to visitors
5. Marking non-secure in chrome
	1. Mark non-secure origins as non-secure: Always mark HTTP as actively dangerous
6. HTTPS is a Google ranking factor (not a strong one at the moment)
7. Course content:
	1. Install free SSL certificates to convert site into HTTPS website
	2. Buy certificate if it is an eCommerce site

### cPanel & AutoSSL ###
1. cPanel & AutoSSL
	1. cPanel and WHM version 58 introduced a new feature called AutoSSL
	2. AutoSSL can automatically request and install Domain Validated Comodo-Signed SSL for your site, and auto-renew the certificate. This is free to cPanel admins, so you should not be charged for it
		1. Web hosting provider should offer AutoSSL
		2. Web hosting provider admin has this option
		3. Can be updated to newer version of cPanel
	3. AutoSSL works with Let's Encrypt (certificate authority) who offer free certificates
	4. Check your cPanel version and ask your host about it

### How HTTPS Works ###
1. HTTPS: HTTP Secure
2. Secure:
	1. Connection requires certificate
	2. Data is encrypted with a key
	3. Identification - Browser will tell you if the certificate is wrong or missing
3. If host has setup AutoSSL on your site, they will have requested the certificate for you, and installed it already on your server
4. Steps:
	1. Web browser checks certificate against certificate authority (that issued it)

### Check if HTTPS is Already Enabled ###
1. Pad lock + https://domain
2. Pad lock (with warning sign)
	1. Parts of the page are not secure (mixed content)
		1. More information (AutoSSL should auto renew)
3. Goto cPanel
	1. SSL/TLS
		1. Certificate list - auto generated certs may expire

### HTTP or HTTPS, Not Both ###
### Which Web Host? ###
### Before You Begin: Backup Your Site ###

## CloudFlare Account ##
### Why CloudFlare? ###
### How CloudFlare Works ###
### Creation of a CloudFlare Account ###
### Change DNS at Registrar ###
### Types of SSL in Cloudflare ###
### Example Showing SSL Certificates ###

## Setting up the Origin Certificate? ##
### Choose Which Origin Certificate You Want ###
### Exclude Your Domain From AutoSLL ###
### Uninstall cPanel Generated Certificates ###
### Generate an Origin Certificate ###
### Installing the Origin Certificate ###

## HTTP to HTTPS ##
### Secure the Dashboard ###
### Redirect HTTP to HTTPS ###
### If the Dashboard Locks You Out? ###
### Wp Fastest Cache Problem ###
### Check Your SSL ###
### What is Mixed Content and How do We Fix It? ###
### Example - Finding & Fixing Mixed Content ###
### Fixing the "Unfixable" Mixed Content ###
### If you Use a Robots.txt File ###
### If You've Used the Disavow Tool ###
### Hard-coded Links? ###
### If You Are Using Google Analytics ###
### If You Are Using Google Search Console ###

## A Complete Run-Through ##
### Fishy Fats Website ###
### "Upgrade" from AutoSSL ###
### BONUS Lecture :: Resources ###