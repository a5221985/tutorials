# DNS #
1. Internet works on IP addresses only
2. DNS: Gigantic address book
3. Working principle:
	1. There is a server hierarchy
		1. 380 root servers worldwide divided into 13 groups
		2. Root servers know other DNS servers that can let you know other Top Level Domain (TLD) names
			1. Root knows all the servers responsible for .com domains, .net domains, ...
		3. TLD servers
			1. Each group of servers for a domain
			2. TLD will give a list of IP addresses responsible for `example.net` and it's subdomains
		4. Server will give IP address
4. Scenario
	1. Browser tries to load http://example.net/
	2. Needs to know at which IP address the web server for example.net can be reached
5. Steps:
	1. Computer will hand off the DNS lookup to Local DNS server (Usually locaated at your ISP) - DNS client
	2. DNS client will contact a root server (it has a pre-equipped list of root servers)
		1. Client picks a root server at random and start looking for domain name
			1. Query: example.net.

					example.net: the domain to look up
					IN: the DNS class (internet)
					A: The record type (address)
					
			2. Response:

					Authority section
					net.	172800 IN NS m.gtld-servers.net.
					net.	172800 IN NS l.gtld-servers.net.
					net.	172800 IN NS k.gtld-servers.net.
					net.	172800 IN NS j.gtld-servers.net.
					
					Additional section
					m.gtld-servers.net.	172800 IN A 192.55.83.30 (avoids loop)
					...
					
				1. 172800 - how long the information is valid (seconds)
				2. IN - DNS class
				3. NS - Name server (record type) - go ask this
				4. domain names
			