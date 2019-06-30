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
4. Don't have both HTTP and HTTPS version
	1. Redirect HTTP to HTTPS

### HTTP or HTTPS, Not Both ###
1. Consider: http://fishyfats.com and https://fishyfats.com
	1. Both work and pages load
	2. Both show the same content
2. Google treats these two as separate websites
	1. Links into site will help with search engine rankings
		1. Link to one of them helps one that and not the other (http version may get more and does not help https version)
3. Solution:
	1. Consolidate to one form only, and make sure the other form is not available, unless there is specific reason
	2. Redirect all HTTP versions of the URL to HTTPS version
		1. Also diverts links in outside sites
		2. Google understands redirection

### Which Web Host? ###
1. Which cover cPanel
	1. cPanel feature rich
2. Web hosts:
	1. StableHost (Why? discussed later)
		1. $4.95 per month
	2. Which has AutoSSL
		1. Alternative is also discussed

### Before You Begin: Backup Your Site ###
1. Step 1: Backup the entire Wordpress site
	1. Just in case
	2. Use UpdraftPlus Wordpress plugin: Used to backup files, database, uploads in automated manner
		1. Also send backups to cloud based storage like Dropbox
		2. Free version exists: Enough for the course

## CloudFlare Account ##
### Why CloudFlare? ###
1. It is a CDN (Content Delivery Network)
	1. Free to use and integrated into web hosting
	2. Speeds up web page load times
2. CloudFlare can act as a proxy between visitors and website server
	1. Can filter out malicious visitors
3. Reasons for using CloudFlare (cached version is served and from server close to the visitor)
	1. No downtime observed
		1. Nearly 100% uptime
		2. Lesser response time
	2. Can secure website (like a proxy - filtering of visitors and stop wastage of bandwidth)
	3. Particular reasons
		1. Protection	
		2. Save Bandwidth (on server)
		3. Faster Page Loading and less downtime (faster loading)
		4. It's free

### How CloudFlare Works ###
1. If site is part of CDN (CloudFlare), it is more secure and loads faster
	1. Traffic to website is routed through Cloudflare's global network which optimizes delivery of content to every visitor (load times are low)
	2. Blocks threats and limits abusive bots & crawlers to protect site and prevent wasted bandwidth and server resources
2. Types of visitors:
	1. Visitors
		1. Allowed
	2. Crawlers & Bots
		1. Filters out unwanted crawlers and bots
	3. Hackers
		1. Filtered out
3. CloudFlare gives free certificates
4. Sites in cloudflare
	1. See significant performance increase
	2. Less likely to come under spam attacks
	3. Free SSL certificates for migration to HTTPS connection
5. Setup:
	1. Can be set up on site
		1. Free
		2. Easy and fast
		3. Easy to remove

### Creation of a CloudFlare Account ###
1. [https://www.cloudflare.com](https://www.cloudflare.com) or From cPanel
	1. Sign Up
		1. email
		2. password
		3. I agree

### Add Your Site ###
1. Log in
	1. Add Site
		1. domain name
		2. Begin Scan
		3. Continue Setup
			1. www and domain should have orange cloud
		4. Continue
			1. Free website
				1. Continue
				2. Click DNS
					1. Overview
						1. Advanced > Delete website (for cPanel)
2. cPanel
	1. Domains
		1. Provision Domain with Full Zone Setup (use cloud flare domain name servers)

### Special Case: When Hosting Includes CloudFlare ###
1. Login to cPanel
	1. Check Cloudflare is included in hosting
		1. Click
	2. Sign in here
		1. Select domain

### Change DNS at Registrar ###
1. Change domain name to CloudFlare instead of host
	1. Go to domain name registrar (GoDaddy)
		1. Manage
			1. Copy the name servers corresponding to CloudFlare and paste them
	2. cPanel: Recheck
2. Cloudflare:
	1. Crypto
		1. Edge Certificates:
			1. Needs refresh

### Types of SSL in Cloudflare ###
1. Flexible SSL
	1. User to cloudflare to server
		1. Connection between user and cloudflare has certificate
		2. No certificate between cloudflare and server (not required)
	2. Not recommended for secure information
2. Full SSL:
	1. Secure connection between user and cloudflare
	2. Secure connection between cloudflare and server
		1. Problem:
			1. Certificate not authenticated (when user accesses website)
3. Full SSL (Strict)
	1. Secure connection between user and cloudflare
		1. Provided by cloudflare
	2. Secure connection between cloudflare and server (provided by AutoSSL) - Origin certificate
		1. Verified and authenticated

### Example Showing SSL Certificates ###
1. Full SSL requires
	1. Edge certificate
	2. Origin certificate (no authentication even if certificate expired)
2. Full SSL (Strict)
3. Setup:
	1. Flexible SSL
		1. Cloudflare:
			1. Crypto:
				1. SSL
					1. Flexible
	2. Full SSL
		1. Cloudflare
			1. Crypto:
				1. SSL
					1. Full (origin can expire but must exist)
	3. Full SSL (Strict)
		1. Cloudflare
			1. Crypto:
				1. SSL
					1. Full (strict) - error 526 because origin certificate expired

## Setting up the Origin Certificate? ##
1. Full SSL (Strict): Two certificates required
	1. Edge certificate: Done
		1. Auto-renews through cloud flare
	2. Origin certificate: Sits on server
		1. Which origin certificate?
			1. Do you have AutoSSL or a certificate already assigned?
				1. If yes, use it (but has short renewal period and problems with auto-renewing - set a reminder for expiry date to check it has renewed OK)
					1. If auto-renewal is not preferred, go with Cloudflare "origin certificate
						1. Auto-renewal doesn't work may be due to redirects in HDAccess File
				2. If no, then go with a Cloudflare "origin" certificate (15 years) - recommended

### Choose Which Origin Certificate You Want ###
1. cPanel
	1. SECURITY
		1. SSL/TLS
			1. Manage SSL Sites
				1. www.<domain-name>
					1. Remove those in bold (make a list)
		2. SSL/TLS Status
			1. Exclude from AutoSSL

### Exclude Your Domain From AutoSLL ###
1. cPanel
	1. SECURITY
		1. SSL/TLS Status
			1. Exclude from AutoSSL

### Uninstall cPanel Generated Certificates ###
1. Deleting certificate already on server
	1. Manage Installed SSL Websites
		1. Uninstall
			1. Proceed

### Generate an Origin Certificate ###
1. For Full SSL (Strict)
	1. Log in to Cloudflare
		1. Crypto
			1. Origin Certificate
				1. Create Certificate
					1. Next

### Installing the Origin Certificate ###
1. cPanel
	1. SECURITY
		1. SSL/TLS
			1. Private Keys (KEY)
				1. Generate, view, upload or delete ...
					1. Upload a New Private Key
						1. Copy everything from Cloudflare
						2. Paste it
						3. Description: Name of website
			2. Certificates (CRT)
				1. Generate, view, upload or delete ...
					1. Upload a New Certificate
						1. Copy everythin from Cloudflare
						2. Paste it
							1. Information is show
						3. Save certificate
			3. Install and Manage SSL for you Site
				1. Install an SSL Website
					1. Domain
						1. Select the domain
							1. Autofill by Domain
						2. Certificate Authority Bundle: (CABUNDLE)
							1. Go to: [https://support.cloudflare.com/hc/en-us/articles/218689638-What-are-the-root-certificate-authorities-CAs-used-with-Cloudflare-Origin-CA-](https://support.cloudflare.com/hc/en-us/articles/218689638-What-are-the-root-certificate-authorities-CAs-used-with-Cloudflare-Origin-CA-)
								1. The following URL contains the bundle you need to insert when installing the certificate.  Below the URL, I have also included the entire Cloudflare Origin CA - RSA Root, that you can copy and paste if you prefer.

										Actual certificate below:

										-----BEGIN CERTIFICATE-----
										MIID/DCCAuagAwIBAgIID+rOSdTGfGcwCwYJKoZIhvcNAQELMIGLMQswCQYDVQQG
										EwJVUzEZMBcGA1UEChMQQ2xvdWRGbGFyZSwgSW5jLjE0MDIGA1UECxMrQ2xvdWRG
										bGFyZSBPcmlnaW4gU1NMIENlcnRpZmljYXRlIEF1dGhvcml0eTEWMBQGA1UEBxMN
										U2FuIEZyYW5jaXNjbzETMBEGA1UECBMKQ2FsaWZvcm5pYTAeFw0xNDExMTMyMDM4
										NTBaFw0xOTExMTQwMTQzNTBaMIGLMQswCQYDVQQGEwJVUzEZMBcGA1UEChMQQ2xv
										dWRGbGFyZSwgSW5jLjE0MDIGA1UECxMrQ2xvdWRGbGFyZSBPcmlnaW4gU1NMIENl
										cnRpZmljYXRlIEF1dGhvcml0eTEWMBQGA1UEBxMNU2FuIEZyYW5jaXNjbzETMBEG
										A1UECBMKQ2FsaWZvcm5pYTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
										AMBIlWf1KEKR5hbB75OYrAcUXobpD/AxvSYRXr91mbRu+lqE7YbyyRUShQh15lem
										ef+umeEtPZoLFLhcLyczJxOhI+siLGDQm/a/UDkWvAXYa5DZ+pHU5ct5nZ8pGzqJ
										p8G1Hy5RMVYDXZT9F6EaHjMG0OOffH6Ih25TtgfyyrjXycwDH0u6GXt+G/rywcqz
										/9W4Aki3XNQMUHNQAtBLEEIYHMkyTYJxuL2tXO6ID5cCsoWw8meHufTeZW2DyUpl
										yP3AHt4149RQSyWZMJ6AyntL9d8Xhfpxd9rJkh9Kge2iV9rQTFuE1rRT5s7OSJcK
										xUsklgHcGHYMcNfNMilNHb8CAwEAAaNmMGQwDgYDVR0PAQH/BAQDAgAGMBIGA1Ud
										EwEB/wQIMAYBAf8CAQIwHQYDVR0OBBYEFCToU1ddfDRAh6nrlNu64RZ4/CmkMB8G
										A1UdIwQYMBaAFCToU1ddfDRAh6nrlNu64RZ4/CmkMAsGCSqGSIb3DQEBCwOCAQEA
										cQDBVAoRrhhsGegsSFsv1w8v27zzHKaJNv6ffLGIRvXK8VKKK0gKXh2zQtN9SnaD
										gYNe7Pr4C3I8ooYKRJJWLsmEHdGdnYYmj0OJfGrfQf6MLIc/11bQhLepZTxdhFYh
										QGgDl6gRmb8aDwk7Q92BPvek5nMzaWlP82ixavvYI+okoSY8pwdcVKobx6rWzMWz
										ZEC9M6H3F0dDYE23XcCFIdgNSAmmGyXPBstOe0aAJXwJTxOEPn36VWr0PKIQJy5Y
										4o1wpMpqCOIwWc8J9REV/REzN6Z1LXImdUgXIXOwrz56gKUJzPejtBQyIGj0mveX
										Fu6q54beR89jDc+oABmOgg==
										-----END CERTIFICATE-----
	
									1. Cloudflare Origin CA - RSA Root (copy)
									2. Paste
									3. Install Certificate
									4. Clear cookies and cache in browser
									5. Check in cPanel if certificate is installed

## HTTP to HTTPS ##
### Secure the Dashboard ###
1. cPanel
	1. Wordpress (recommended) - optional
		1. wp-config.php
			1. Edit
			
					define('FORCE_SSL_ADMIN', true); // forces admin logins as SSL
					/* That's all, stop editing! Happy blogging. */
2. Wordpress:
	1. Settings:
		1. General
			1. WordPress Address (URL): http://anyjwilliams.co.uk
				1. Make it https
			2. Site Address (URL): http://andyjwilliams.co.uk (public see this)
				1. Make it https
		2. Save Changes
			1. Log out and log in

### Redirect HTTP to HTTPS ###
1. Goto Wordpress dashboard
	1. Plugin
		1. LiteSpeed Cache Purge All
		2. Deactivate
1. cPanel:
	1. Website folder:
		1. .htaccess

				RewriteEngine On

				RewriteCond %{HTTPS} off
				RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]

		2. Delete cached .htaccess_* files
	2. Re-activate the cache

### If the Dashboard Locks You Out? ###
1. Add the following to function.php in cPanel > FileManager > <domain> > wp-content > themes > heuman-pro > functions.php

		<?php
		
		update_option( 'siteurl', 'http://andywilliams.co.uk' );
		update_option( 'home', 'http://andywilliams.co.uk' );

	1. [https://codex.wordpress.org/Changing_The_Site_URL](https://codex.wordpress.org/Changing_The_Site_URL)
	2. Settings > Site Address (URL) and WordPress Address (URL) changed to the above urls
	3. Save changes
	4. Remove the above changes from functions.php

### Wp Fastest Cache Problem ###
1. http://<domain> is redirected to https://<domain>/wp-content/cache/all/index.html
	1. Because of wb fastest cache
2. Solution:
	1. Activat cache
	2. Clear the cache
	3. De-activate cache (if above doesn't work)
	4. Activate it again

### Check Your SSL ###
1. Google: check ssl
	1. ssllabs.com
	2. sslshopper.com
		1. Type the URL (remove https)
		2. Remove https again
		3. submit
			1. Shows ticks
			2. Shows all certificates
	3. jitbit.com/sslcheck
		1. Tweet to gain access
		2. type url (include https)
			1. spiders the url and checks for ssl errors
				1. Grade A should appear in all rows
			2. Come back and crawl a few times, fixing issues after each crawl until you get a clean bill of health
				1. Shows pages with insecure content (might be mixed content)

### What is Mixed Content and How do We Fix It? ###
1. Mixed content: If a secure page retrieves content using http connection
	1. Parts are secure and parts are not secure
2. Install a plugin in chrome (shows how many links are insecure in a page)
	1. https mixed content locator
	2. Click on list
	3. Edit html
		1. Search for http:
			1. If images, css, js don't support https, either remove them or host them on own secure domain
		2. Run jitbit.com/sslcheck again and fix the rest urls
3. If there is a link to another site not support https (if it doesn't downloading resources from those sites)

### Example - Finding & Fixing Mixed Content ###
1. Check if every page is secure
	1. [https://www.jitbit.com/sslcheck](https://www.jitbit.com/sslcheck)
		1. Paste domain name
		2. Check for SSL Errors
	2. HTTPS Mixed Content Locator (chrome plugin)
		1. Open each URL in a new page
			1. Plugin may show items not secure
				1. Edit and open each item in new page
	3. Cloudflare
		1. Caching
			1. Purge everything

### Fixing the "Unfixable" Mixed Content ###
1. If a plugin is providing mixed content (like fonts)
2. Last resort:
	1. Install a plugin in wordpress
		1. Dashboard
		2. Plugins
		3. ssl secure content fixer
			1.SSL Insecure Content Fixer
				1. Activate
	2. Purge the page from Cache
	3. Reload the page
	4. Settings
		1. SSL Insecure Content Fixer Settings
			1. Fix insecure content
				1. Content
	5. Purge the page from Cache
	6. Reload the page

### If you Use a Robots.txt File ###
1. If you have rotots.txt file
	1. If you included link to sitemap in that file
	2. Update that link to use HTTPS URL for the sitemap

### If You've Used the Disavow Tool ###
1. If you have Disavow tool on URLs pointing to HTTP site
	1. re-upload the disavow file for HTTPS version of the site

### Hard-coded Links? ###
1. Check in robots.txt file
2. If the text link does not transfer anything insecurely, the page can show secure padlock
	1. Redirect in htaccess file can take care of this
3. Good practice:
	1. Change these to https as well

### If You Are Using Google Analytics ###
1. Log into Google Analytics
	1. Admin
		1. Property
			1. Property Settings
				1. Change to https
		2. View
			1. View Settings
				1. Change to https

### If You Are Using Google Search Console ###
1. Goto Google Search Console
	1. Click on Add Property
		1. https://<domain>
		2. Add
	2. Alternate methods
		1. HTTP file upload
			1. this HTML verification file
	3. Upload the file to server
		1. Website root folder
		2. Upload
		3. Select File
	4. Goto Google Search Console
		1. Verify
2. Search Console
	1. Click on URL
		1. Crawl
			1. Sitemaps
				1. Add/Test Sitemap
					1. Paste the url with page
	2. Leave http an https version
		1. http may drop off in the future (number of pages index may go down)

## A Complete Run-Through ##
### Fishy Fats Website ###
1. Steps:
	1. Add the Site to Cloudflare
	2. Change DNS at registrar and wait to propogate (when you see the Edge Certificate you can move on).
	3. Generate and install the origin certificate if you need to (for Fishy Fats, I will leave the AutoSSL certificate in place, instead).
	4. Secure the Dashboard.
	5. HTACCESS file redirects.
	6. Check SSL and fix mixed content.
	7. Google Analytics.
	8. Search Console.
2. Implementation:
	1. Add Fishyfats.com and Begin Scan
	2. Continue Setup
	3. Continue
	4. Free website
	5. Copy Domain name services
		1. Goto host site
			1. Change DNS
	6. Recheck service
		1. Edge certificate is given
	7. Goto Cloudflare
		1. Full Strict
	8. Browser: (Firefox)
		1. View certificate
	9. Goto wordpress dashboard
		1. https should work 
	10. Origin certificate
		1. generate one or use existing for the domain (autossl is fine)
	11. Securing dashboard
		1. open site fishyfats with https
		2. Go to C-panel
			1. File manager
				1. log into area where website is installed
				2. wp-config.php - edit
					1. Paste the following

							define("FORCE_SSL_ADMIN", true);

							/* That's all, ... */

			2. Dashboard
				1. Settings
				2. General
					1. WordPress Address (URL) - https://fishyfats.com
					2. Site Address (URL) - https://fishyfats.com
				3. Save changes
	12. Setup HTTPs redirects
		1. LiteSpeed Cache - deactivate
	13. Go to C-Panel
		1. Login to where the site is and open .htaccess
			1. Edit
				
					RewriteCond %{HTTPS} off
					RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]

				1. Save it
		2. Activate cache again
			1. LiteSpeed Cache - activate
	14. Fix mixed content
		1. search check ssl spider
			1. Paste url
				1. RSS Feed
					1. Change RSS url to https
						1. Save and publish
	15. Change the site url to https in google analytics
	16. Go to search console
		1. copy http version
		2. Add property
		3. https url
		4. Add
		5. Download verification file
		6. Upload to C-Panel
			1. upload to the folder
			2. Drag and drop the file
		7. Verify
		8. Continue
		9. Crawl - sitemaps
			1. Paste sitemap_index.xml
				1. Test
			2. Submit
			3. Refresh the page

### "Upgrade" from AutoSSL ###
1. It sometimes struggles to review
	1. Emails - AutoSSL could not renew
		1. Put reminder
2. Upgrading
	1. Use the Cloudflare Origin certificate that is free (15 years)
	2. If your host supports it, try the "Lets Encrypt SSL" option
		1. https://letsencrypt.org/ for more details on that
			1. Free and automated
			2. AutoRenews every few months (but can have problems)
3. In C-Panel
	1. Security
		1. Lets Encrypt SSL (15 years)
			1. Issue
		2. SSL Status
			1. Validated
			2. View certificate
				1. Don't have to exclude from auto ssl
		3. Click on issue
			1. two
				1. domain name
				2. www version of domain name
	2. New certificate overwrites the old one
		1. Let's encrypt will try to auto reniew
4. Origin certificate (15 years certificate)
	1. C-Panel
	2. Security
		1. SSL TLS
			1. Install and Manage SSL for your site
				1. Certificate details
					1. (cPanel issued)
						1. Don't uninstall
						2. Update certificate
							1. Certificate
							2. Private key
							3. Certificate authority bundle (usually not required)
		2. Cloud flare
			1. Generate origin certificate (and install in stablehost)
				1. copy certificate
				2. paste into certificate box
				3. copy private key
				4. paste into private key box

### BONUS Lecture :: Resources ###
1. [https://www.facebool.com/groups/409924023087181/](https://www.facebool.com/groups/409924023087181/)
2. 40% off on stablehost [http://ezseonews.com/stablehost](http://ezseonews.com/stablehost)
3. [Namecheap here](http://ezseonews.com/namecheap)
4. [Cloudflare](https://www.cloudflare.com/)
5. [Chrome Insecure content extension](https://chrome.google.com/webstore/detail/https-mixed-content-locat/pbljfomgollbampmcmalflifheichabj)
	1. To find mixed content in pages
6. [https://www.jitbit.com/sslcheck](https://www.jitbit.com/sslcheck/)
7. [https://www.ssllabs.com/ssltest/](https://www.ssllabs.com/ssltest/)
8. [https://www.sslshopper.com/ssl-checker.html](https://www.sslshopper.com/ssl-checker.html)

#### Coupons ####
1. [Installing Wordpress](https://www.udemy.com/installing-wordpress-domain-registrars-and-web-hosting/?couponCode=SSLSTUDENTS)
2. [Wordpress Backup & Restore](https://www.udemy.com/wordpress-backup-restore/?couponCode=SSLSTUDENTS)