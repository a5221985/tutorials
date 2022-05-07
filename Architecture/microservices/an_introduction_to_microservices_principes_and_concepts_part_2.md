## Domain-Driven Design & Bounded Contexts ##
1. What is Domain-Driven Design?
2. How do bounded contexts fit into the definition?

### Bounded Context and Strategic Design ###
1. Macro architecture - divides domains into coarse-grained modules
2. Micro architecture - each module can be divided further into sub-modules
3. Example:
	1. E-Commerce system
		1. Customer Registration
		2. Order Process
			1. Data Validation
			2. Freight Charge Calculation
		3. Payment
		4. Shipping
4. Internal architecture of Order Process is hidden from outside
	1. It can be altered without affecting other modules
5. Modular software development - gives the flexibility to change one module without influencing the other modules

#### An Example for a Domain Architecture ####
1. Each module has its own domain model
	1. Search - for successful search, data (descriptions, images, prices, ...) must be stored for the products
		1. Important customer data - can include recommendations that can be determined based on past orders
	2. Order - To process orders, contents of shopping cart need to be tracked
		1. Only name and price is required for products
		2. Not much data w.r.t customer is necessary
		3. Shopping cart - most important component of the domain model of this module
			1. It is turned into an order - The order is handed over to other bounded contexts to be processed
	3. Payment - Payment-related info such as credit card numbers need to be kept for each customer
	4. Shipping - Delivery address is required info about the customer. Size and weight are necessary info about the product
2. The above modules indicate that they require different domain models
	1. Not just data but model and logic also differ

### Domain-Driven Design: Definition ###
1. Domain-Driven Design (DDD) - It offers a collection of patterns for domain model of a system
	1. Microservices - Patterns in the area of strategic design are most interesting
		1. They describe how the domain can be subdivided
2. Books for DDD
	1. Patterns to facilitate model of individual modules
		1. [DDD Book](https://www.amazon.com/Domain-Driven-Design-Tackling-Complexity-Software/dp/0321125215) - Introduction to DDD and comprehension discussion about DDD
	2. [Domain Driven Design Distilled](https://www.amazon.com/Domain-Driven-Design-Distilled-Vaughn-Vernon/dp/0134434420) - Compact book.
		1. Focus - design, bounded context, domain events
	3. [Domain-Driven Design Reference](https://domainlanguage.com/ddd/reference/) - Contains all DDD patterns but without additional explanation or examples

### Bounded Context: Definition ###
1. DDD speaks about bounded context
	1. Each domain model is valid only in a bounded context
		1. Examples:
			1. Search
			2. Order process
			3. Payment
			4. Shipping
		2. Each bounded context has its own domain model

#### Multiple Bounded Contexts ####
1. Is is possible to implement a domain model that comprises of multiple bounded contexts
	1. It is not the easiest solution
		1. Example: Price change affects search
			1. This should not result in price change for orders that have already been processed in payment
				1. It would be easier to store current price of product in the bounded context search
				2. It would be easier to store price of product of each order in payment
					1. It can also have rebates and other complex logic
2. Simplest design consists of multiple specialized domain models that are valid in certain context
	1. Each domain model has its own model for business objects
		1. Example for customers and products

### Domain Events Between Bounded Contexts ###
1. For communication between bounded contexts, we can use domain events
	1. Events are useful for integrating bounded contexts
	2. Events are part of domain model
		1. They represent something that happened in the domain
			1. These events are also relevant to domain experts
#### Example ####
	1. Ordering shopping cart can be modeled as an event
		1. The event is triggered by the bounded context - order process
		2. The event is received by the bounded contexts - shipping (for initializing shipping) and payment (for initializing invoicing of the order)

### Bounded Contexts and Microservices ###
1. Bounded contexts - divide system by domains (may not be microservices)
	1. They can also be implemented as modules in deployment monolith
2. If bounded contexts are implemented as microservices, this results in modules that are independent at domain and technical level (?)
	1. It is sensible to combine concepts of microservices and bounded contexts
3. Dependencies of bounded contexts (as part of strategic design) limits this independence
	1. Since microservices are part of a larger system, dependencies between modules cannot be avoided

### Evolution ###
1. Reasons for creation of new bounded contexts and new microservices
	1. New functionalities might justify new bounded contexts
	2. A bounded context might have to be split into two (it might become apparent)
		1. If new logic is added to the bounded context
		2. Of the team understands the bounded context better later on
	3. New microservices might be constructed by dividing current ones due to technical reasons
		1. To make scalability easier (say)
			1. Resulting microservices will be smaller and easier to scale
				1. This can lead to a large number of microservices

## Strategic Design & Common Patterns ##
1. Introduction to Strategic Design
2. Important Strategic Design Patterns

### Strategic Design ###
1. Division of system into different bounded contexts is part of strategic design
	1. This belongs to the practices of DDD
2. Strategic design describes integration of bounded contexts

		||Domain ||                  ||Domain||
		|| Model ||Up-stream         || Model||
		| Bounded |----------------->| Bounded|
		| Context |      Down-stream | Context|
		
3. Diagram shows fundamental terms of strategic design
	1. Bounded Context - Context in which a specific domain model is valid
		1. Bounded contexts depend on each other
		2. Each bounded context is usually implemented by one team
	2. Upstream team can influence the success of the downstream team
		1. The downstream team cannot influence the success of the upstream team
			1. Example: Success of team responsible for payment depends on the order process team
			2. If data (prices, credit card numers) are not part of order, it is impossible to do payment
			3. The order process does not depend on payment to be successful
			4. Hence, order processing is upstream
				1. It can make payment fail
			5. Payment is downstream since it cannot make the order process fail
4. DDD describes (using patterns) how communication takes place
	1. The patterns describe architecture and cooperation within the organization

### The Customer/ Supplier Pattern ###
1. In this pattern:
	1. Supplier - upstream
	2. Customer - downstream
		1. Customer can factor their priorities into planning of upstream project
		
#### Example ####
	1. Payment uses model of Order Process
		1. But Payment defines requirements for the Order Process
	2. Payment can be done successfully, only if the Order Process provides the required data
	3. Hence:
		1. Payment - Customer of Order Process
		2. Order Process - Supplier of the Payment Process
	4. Therefore, Customer's requirements can be included in the planning of Order Process
	
			Order   (Up-stream)       
			Process ----------------> Payment
			   ^                         |
			   |------Requirements-------|

### The Conformist Pattern ###
1. **Confirmist**: Means, a bounded context simply uses a domain model from another bounded context

#### Example ####
1. Bounded Contexts:
	1. Statistics, Order Process - both use the same domain model
		1. Statistics are part of data warehouse
		2. They use the domain-model of Order Process (bounded context)
			1. The domain-model is used to extract some information relevant to store in data warehouse
		3. But with conformist pattern, data warehouse team **does not have a say** in case of changes to the bounded context
			1. Data warehouse team cannot demand additional info from other bounded context
				1. Data warehouse team will not get a more powerful role
				
	2. Confirmist: Domain Model Usd in Other Bounded Context
	
			||  Domain ||                  ||  Domain ||
			||  Model1 ||Up-stream         ||  Model1 ||
			|   Order   |----------------->| Statistics|
			|  Process  |      Down-stream |           |

### The Anti-Corruption Layer ###
1. ACL - Anti-Corruption Layer pattern
	1. Bounded Context does not directly use domain model of other bounded context
		1. It contains a layer for decoupling its own domain model from the model of the other bounded context
	2. It can be used in conjunction with conformist pattern
		1. One can generate a separate model decoupled from other model

#### Example ####
1. Bounded Contexts:
	1. Shipping - uses an ACL at the interface to bounded context Legacy
		1. Both bounded contexts have their own independent models
			1. This ensures that model in legacy system does not affect bounded context Shipping
		2. Shipping can implement a clean model in its bounded context
		
				||  Domain ||                  | Anti   ||  Domain ||
				||  Model1 ||Up-stream         | Corrup-||  Model1 ||
				|   Order   |----------------->| tion   | Statistics|
				|  Process  |      Down-stream | Layer  |           |

### The Separate Ways Pattern ###
1. Separate Ways Pattern:
	1. Bounded contexts are not related at the software level
		1. But a relation would be conceivable

#### Example ####
1. E-Commerce Scenario
	1. Suppose new bounded context Purchasing has been added
		1. Purchasing could collect data for listing products
			1. But it could be implemented differently
		2. The Purchasing would be different from remaining system
			1. When good are delivered, user would use another bounded context like Listing to enter necessary data and list products
	2. Purchasing cases Shipping
	3. Shipping triggers Delivery
	4. Delivery triggers user to list product with different bounded context
	
			purchasing -> shipping -> delivery -> list product
			
		1. In real world, shipping of products is one event
		2. In software systems, they are separate
2. The systems are independent and can be evolved completely independently

		||  Domain ||                  ||  Domain ||
		||  Model1 ||                  ||  Model2 ||
		|  Purchase |                  |  Listing  |
		|  Process  |                  |           |

### The Shared Kernel Pattern ###
1. Shared Kernel Pattern - common core that is shared by multiple bounded contexts

#### Example ####
### The Open Host Service Pattern ###
### The Published Language Model ###
#### Example ####
### Selecting Patterns ###
#### Example ####
##### Tradeoffs to Consider #####
