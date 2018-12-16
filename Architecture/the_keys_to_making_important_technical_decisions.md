# The Keys to Making Important Technical Decisions #
## When a Technical Decision (TD) become Important (ITD) ##
1. Some decisions are important but others are less important (not important does not exist)
2. Challenge: Identifying technical decisions that are important and shape success or failure of software product
	1. Characteristics to differentiate important technical decisions
		1. Effects in time are important
			1. ITD effects are viral - they propagate further in product without any effort
		2. If decision is good, it shapes product's personality and differentiates it from competition
		3. If decision is bad, may compromise other good ITDs and induces significant extra costs (time and money)
			1. May compromise product itself
		4. May be very costly and time-consuming to replace or revert it
		5. Usually ITD sticks with the product for the entire lifespan of the product
		6. It is close to product core and is heavily exploited in product
		7. It takes time to see (positive or negative) effects
			1. Long term vision is a must
3. Example of ITDs for a house:
	1. Decide if terrain under house and foundation can sustain weight of house
	2. Decide resistance structure of house
	3. Decide materials from which house will be built
	4. Decide needed tools to build house
4. Example: Not so important decisions:
	1. Square window or round window
5. ITDs usually are synergistic
	1. If one ITD goes wrong, then others may get compromised
6. Example: Software ITDs
	1. Right design
	2. Right architecture
		1. Monolith
		2. Micro-kernel
		3. Microservices
		4. ...
	3. Right database
	4. Proper data structure for storing
		1. Say 50 million records in memory

## Categories of ITDs ##
1. Most ITDs fall in following 4 categories
	1. Architecture
	2. Technologies
	3. Data Structures
	4. Algorithms

### Architectural Decisions ###
1. This is highest level of abstraction
	1. Point when we decide proper architecture of product
2. Important considerations
	1. Architecture must be capable to sustain product during its entire lifespan
	2. Example: Microservices against monolith
		1. May reach point when monolith might have to be migrated to microservices
	3. Non-functional requirements
		1. Quality attributes
		2. Quality of service
3. Example: For existing architecture
	1. Introducing a layer of abstraction between new code and legacy code

### Technological Decisions ###
1. After proper architecture is chosen, we need to choose the following
	1. Databases
	2. Frameworks
	3. Libraries
	4. Services
	5. ... (technology stack)
2. These decisions give life to the architecture
3. Important considerations:
	1. Chosen technologies must be capable to accompany product over time
	2. Choose such a way that product evolution is anticipated but avoid over engineering
		1. Lot of work and money is involved if issue is discovered later
4. For startups, evolving business model and application is challenging

### Data Structures Decisions ###
1. Data structures are building blocks (bricks) of the product
	1. They store in motion data
	2. They participate in solutions to certain problems
	3. They must be reliable and must outperform other choices for specific problems
2. Important considerations:
	1. Data structures must be reliable for a long time
	2. Data structures must be perfect fit for specific cases
	3. Data structures must provide best performance and robustness to product
3. Learn and use a lot of data-structures to know which on to choose for which problem scenario
	1. Try to be as close to data scientist as possible

### Algorithms Decisions ###
1. Algorithms and data-structures must make a perfect team
	1. Analogy: Needed tools to build the house
2. There are plenty of dedicated algorithms to solve our problems
	1. Strive for proven and fast algorithms
3. Important considerations:
	1. Prepare a list of know how and how to use the tools (to use them wisely)
		1. Innovate around proven algos if needed
		2. Don't try to daily play the role of compulter scientist
	2. Think innovatively but avoid experimenting with prod code as much as possible
		1. Needs continuous delivery environment for this
			1. Or any Risk-Fail Fast-Learn flow
4. Conclusions
	1. Architectural decisions should sustain the product
	2. Technological decisions should accompany the product
	3. Data structure decisions should be reliable and performant
	4. Algorithms decisions should be proven and fast

### Who Is Responsible for Making Important Technical Decisions? ###
1. ITD person qualities:
	1. Long-term vision
	2. Deep technical knowledge
	3. Common sense
2. ITD persons
	1. Small companies
		1. Team leader
	2. Medium/large software companies
		1. Chief architects
		2. VP
		3. Technical Product Managers
			1. Who defines technical solution for a particular feature
		4. IT consultants 

### Can a Bad Less Important Technical Decision Ruin A Good Important Technical Decision? ###
1. One decision may not but many less important technical/coding decisions can
2. Example: Hybernate is a great decision but need to be accompanied by dozens of less important decisions taken by developers (at code level)
	1. Hybernate is great ORM if used correctly or else
		1. Look/act slow
		2. Clumsy
		3. Heavy
	2. Developers must know best practices of hibernate and database (SQL)
3. Chosen technology does not give it's goodies for free but we need to unlock via skills and knowledge
4. Must:
	1. ITDs must have senior developers with high skills in chosen technologies
		1. Must be in [Plateau of Productivity](https://en.wikipedia.org/wiki/Hype_cycle) for tech stack
		2. Note: People taking ITDs must not do code reviews or sit behind developers
		3. Bad less important ITDs can show up as:
			1. bugs
			2. problems revealed in code review
			3. silent killers of ITD
5. Conclusion:
	1. Less important tech decisions can downgrade important tech decisions

## How To Make An ITD? ##
### Making Decisions Is Always About Balancing Trade-Offs ###
1. Criteria for choosing technology for a product
	1. Rely on **mature** technology (tested in battles, has comprehensive docs, strong communities (many newcomers libraries disappear before going to production)
	2. If not mature tech available, go with newcomers provided by serious vendors which is likely to maintain and evolve
	3. Avoid "anonymous", untested and unmaintained technologies
		1. If issues are found, difficult to obtian help or bug fixes
	4. Avoid obsolete frameworks and deprecated solutions
	5. Rely on **Versus Decisions Tables** (MySQL vs PostgreSQL)
		1. To decide between multiple technologies dedicated to same segment of activity
			1. Tables should have
				1. Head-to-head pros and cons
				2. Benchmarks
				3. Metrics
				4. Feedbacks
				5. ...
		2. Technology is defined by comparison with its competitors
			1. Look up in the internet
			
			![10681063-comparison](10681063-comparison.png)

		3. For large companies using Versus decision tables will be slow, so build Decision Support System (DSS)
			1. VP-Expert Technical Decision System:
				1. Knowledge bases must be effectively structured for expert-system design
				2. The system is used to nominate technologies (increases metrics drastically)
			
			![10681064-choose-a-nosql](10681064-choose-a-nosql.png)

		4. Dos:
			1. Strive for high-compatibility between technologies that should interact
			2. Strive for choosing technology that fits like a glove in product context
				1. Not most mighty or fancy one in market
			3. If evolution of product is unclear, rely on versatile technologies that cover a large range of features
				1. Example: Don't recommend Apache Kafka as messaging system for University Campus Chat (may not need streaming analysis capabilities and trillions of messages)
			4. Ask for second opinion if required
			5. Once set of technologies are nominated, use skills and knowledge of product to decide a proper one for the specific case
				1. Apply decremental granularity process
		5. Above points apply to all ITD categories like:
			1. Architecture
			2. Technologies
			3. Data structures
			4. Algorithms

## How To Express/Write an Important Technical Decision ##
1. Pass following check-in list or quality bar
	1. One
		1. Crystal Clear
		2. Concise
	2. Two
		1. Explain What
		2. Explain Why
	3. Three
		1. 100% Technical
	4. Four
		1. 100% Focused On Problem to Solve
	5. Not collide/compromise other ITD
2. Explanation:
	1. ITD should be **crystal clear** and **concise**
	2. ITD should explain **what** you decided and **why** you did it this way
	3. ITD should be **purely technical**
	4. ITD should be **100% focused on the problem** to solve
	5. ITD **should not collide** other ITDs
3. Can be written in either company specific format or generate using specific tools
 
## Are You Planning to Become An ITDs Maker? ##
1. Few things to keep in mind:
	1. Accept that sooner or later, we might make bad decisions and follow Deepak Chopra's advice: "Take responsibility for your last bad decision, and then let it go. Don't blame others or make excuses for yourself"
	2. ITDs may not produce effects or feedback immediately, objective vision should be highest skill (good for long term quality metric)
	3. Keep up-to date no matter how hard it is
		1. Read..., learn..., test...
			1. Don't think like "in my opinion..." - shows lack of knowledge and generally not proven
	4. Key to success: Perserverence
		1. Lack of perserverence is an impediment for success
	5. Don't forget how to code (even if not coding)
	6. Don't be fancy (stay classical)
		1. Don't start using functional or reactive just because you saw some YouTube talks about it
			1. Recommend only things from which real value can be harvested
	7. **Learn what and how to ask**: 
		1. Cloude Levi-Strauss: "The key to wisdom is knowing all the right questions"
			1. If key questions are not asked, we can fall into the trap of "wrong screwdriver" trap
	8. Love, seek and use feedback!
	9. Adaptation to changes is survival key
		1. Products are changed like socks (need to adapt quickly)
		2. Read between lines
		3. Isolate relevant things and do the job
	10. Don't lose self in details
		1. ITD cannot solve everything
	11. Think twice on each decision
	12. What you do is not art! It is just hard work and extremely hard!

## Things That You Should Never Do As An ITDs Maker ##
### Provide a Complex Codebase ###
1. Albert Einstein: "Everything should be made as simple as possible, but not simpler"
2. Possibly ITDs may have to write the base code of a product and dev team may have to evolve it
	1. ITDs person must not introduce overwhelming complexity at code level
		1. Base code must be simple to understand for developers and change with good quality

### Write "Clever" Code ###
1. "Write clear code, not clever code"
	1. If people constantly come and ask you "What does this code do?" then it is possibly clever code (not good)
		1. It is hard to understand or change

### Blame the Technology ###
1. "To inspire people, blaming is the last thing to do"
	1. Don't choose a technology and start blaming it in the future to avoid it
		1. Use [Gartner Hype Cycle](https://en.wikipedia.org/wiki/Hype_cycle) (don't give up at trough of disillusionment phase)

	![10692028-hype-cycle](10692028-hype-cycle.png)

## Wrong Screwdriver ##
1. Examples:
	1. Using No-SQL but environment needs heavy-transactional environment
	2. Design REST API but environment uses thousands of persistent connections (not thousands of request-response cycles)
	3. Using O(n2) algorithm instead of O(n) since it performs better for small set of data but data grows in the environment to thousands
2. These are bad ITDs
3. Causes:
	1. Two causes
		1. Lack of communication between ITDs and PCAs, CAs, Development team
		2. Asked wrong or incomplete questions and couldn't intuit the situation from answers (lack of communication)
	2. Solution:
		1. Choose questions wisely
			1. "Organizations which design systems... are constrained to produce designs which are copies of the communication structures of these organizations"

## Conclusion ##