# Java Concepts #

## What is API Gateway? ##
1. Urls
	1. `/home`, `/products` - doesn't need authentication
	2. `/my-cart/get`, `/my-cart/add` - needs authentication
	3. `/product/add`, `/product/delete` - needs authorization
2. SSL Certificate - for https
	1. Change certificate every 30 or 60 days
3. The above components can be implemented in API gateway
	1. It is an entry point for API
		1. First request goes to API gateway
		2. API gateway ensures https, authentication and authorization
	2. It is a guard for any requests
4. Features
	1. Feature #1: Separate out cross cutting concerns
		1. Authentication
		2. Authorization
		3. SSL Termination
		4. DDoS protection/ Throttling
	2. Feature #2: Suppose we use microservices as follows which are consilidated into single component
		1. service 1: `/home`, `/my-cart`
		2. service 2: `/product`
	3. Feature #3: Replacing multiple client calls with single API call, also has features of reverse proxy (serving static content, caching responses)
		1. An adapter (in gateway) can make the following calls
			1. Static files (HTML, JS, CSS) - A component can exist in the gateway for this (instead of having a service) called Static Content
			2. Personalized Recommendations
			3. Trending Products - This does not change so frequently so this can be cached in Cache of the API gateway (we can give threshold time for the Cache)
			4. Discount Offers
	4. Feature #4: Routing based on headers, paths and params etc, load balancing, A/B testing, canary release
		1. Router: 
			1. If one service give low quality video (for mobile) this is chosen for mobile which is fast
			2. If another service gives high quality video (for desktop/laptop) this is chosen for other computers which is slow
		2. Load Balancer:
			1. If a service is in multiple copies (because the load is high) - round robin can be used (or some algorithm like consistent hashing)
	5. 

## Service Mesh ##
1. What is service mesh?
	1. Concept in microservices
	2. 