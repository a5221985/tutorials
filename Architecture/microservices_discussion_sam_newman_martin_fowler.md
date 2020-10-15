# Microservices Discussion - Sam Newman, Martin Fowler #
1. Our industry tends to focus on tech insted of the outcome. Onr should use microservices as a means to obtain a desired outcome rather than for the sake of using a new technology.
2. Microservices shouldn't be the default option. If you think a service architecture could help, try it with one of the modules from a very simple monolith topology and let it evolve from there.
3. The top 3 reasons for using microservices are:
	1. Zero-downtime independent deployability
	2. Isolation of data and of processing around that data
	3. Use microservices to reflect the organizational structure
4. You could avoid a distributed monolith by:
	1. Constructing a deployment mechanism
	2. Looking for patterns and deciding how to deal with them
	3. Be aware! People don't know what information hiding really means
5. You should strive for independent deployment because:
	1. It's easier to limit the impact of each release when using microservices.
	2. As the team size increases it gets exponentially harder to coordinate a deployment.
6. We tend to violate monolith architecture by not respecting the modules. Breaking them into services makes it harder to do so.
7. A lot of the complexity of breaking complex systems lies in the data. After extracting the microservice you need to understand what part of the old database this system uses.
8. There has to be a willingness to change as an organization if you want to make the most out of using microservices.