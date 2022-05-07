# How to Prepare for Technical Interviews, Part 1 - Coding #
1. What is the puropose of coding interviews?
	1. Beginner: 0-2 years - 70% of prep time for coding
	2. Mid Level: 3-5 years - 50% of prep time for coding
		1. Testing
			1. Coding speed
			2. Communication
			3. Fluency of language of choice
			4. Coding style and modularity
			5. Test driven nature of code
			6. Ability to solve complex problems with optimal solutions
		2. Strictest
	3. Experienced: 5+ years - 30% of prep time for coding
		1. They are minimum criteria filters
		2. To check if coding is roughly on par with other Engineers in the company
		3. Focus: Approach and thought process (as opposed to raw problem solving horse power)
2. How much time should I spend preparing for them?
	1. 3 months to 1 year - depends on our pace (do not rush)
3. Resources
	1. Books
		1. Grokking algorithms
		2. Introduction to Algorithms - Corman
	2. Courses
		1. Free
			1. Introduction to CS - MIT
			2. Programming abstractions - Standford
			3. Introduction to Algorithms - MIT
		2. Paid
			1. Educative
				1. Search: Interview
					1. Ace the coding interview series
					2. Front end back end, ...
	3. Online coding platform
		1. Leetcode
		2. AlgoExpert - quality over quantity
4. Effective prep strategy for coding interviews
	1. Step 1: Self assessment
		1. See if we can solve questions under 30 to 35 minutes
		2. If we get stuck - need more time
		3. Interview with a company you don't mind getting rejected
		4. Allocate time accordingly
		5. Mock interviews - interviewing.io, pramp.com
	2. Step 2: Review Data Structures & Algorithms
		1. Find easy questions for each topic and solve them (cover the topics)
	3. Step 3: Define a consistent system to track progress
		1. Table:
			1. Todo
				1. New problems that you have not yet worked on
			2. Repeat
				1. Problems that you have worked on but are still making some mistakes on (not confident)
			3. Done
				1. Problems that you have nailed and are confident about (fairly confident)
		2. Initially add all problems to Todo list, and as we progress we move them to Repeat list and then eventually to Done list
		3. Excel/Trello/Notion
		4. Selecting problems
			1. 100 to 200 problems (after that diminishing returns)
			2. Choose AlgoExpert - if we want curated list
			3. Choose LeetCode - Top questions
				1. Problems
				2. Click on a data structure
				3. Sort by solutions
				4. Pick top 4 medium, top 4 easy and top 2 hard questions
				5. Repeat the process for the following data structures
					1. Arrays
					2. Hash Maps
					3. Trees
					4. Stacks
					5. Binary Search Trees
					6. Strings
					7. Linked Lists
					8. Graphs
					9. Queues
					10. Heaps
				5. We can add and remove from the list
			4. Practice
				1. As if in a real interview
					1. Same as we do in real interviews
				2. Time ourself (under 30 minutes)
				3. If > 35 or 40 minutes, stop and look at the solution and learn the technique
				4. If > 5 minutes and completely stuck, take a sneak peak at the solution to get slight hint (to get hint)
			5. Clarifying questions
				1. Write test cases
					1. Ex: String has white spaces or special characters (try on Leetcode)
			6. Try to do 5 questions back to back (need this endurance in real interview)
				1. After the session, verify how well we did
				2. If not well, understand the approach and technique
			7. Scoring system
				1. 1 to 5 for the following criteria
					1. Did you need hints? (how many times)
					2. Did you finish within 30 minutes? (<15, <30, <40,...)
					3. Was the solutions optimal? (optimal, not optimal, off-track, completely stuck, ...)
					4. Were there any bugs? (1, 2, ... minor or major)
				2. Average the score for each to get final score (for each problem)
	4. Step 4: Practice using spaced repetition and pattern recognition
		1. Spaced repetition - To build up problem solving intuition and muscle memory
		2. Pattern recognition - Keep a keep eye on repeated patterns while we come across problems
		3. How to proceed:
			1. Pick any 5 random questions from Todo list
			2. Solve them
			3. Score them
			4. If score is close to 5, put them at the bottom of Repeat list
			5. If score is close to 1, put them at the top of Repeat list
				1. Problems we struggled most at the top and problems we struggled least at the bottom
			6. Next day, pick 4 problems from Todo list and pick top problem from Repeat list
			7. Solve them
			8. Score them
			9. Put them in Repeat list
			10. Repeat the process
			11. If at some point we are 100% confident on certain problems and feel that we have repeated enough, we put them in the Done list (they have become easy to solve)
	5. Step 5: Recognize common problem-solving patterns
		1. Hardest step to master
		2. Enables us to know when to use what data structure or algorithm to solve a problem
		3. List of common techniques
			1. Running pointers
			2. Linked list cycle or intersection detection
			3. Divide and conquer or decrease and conquer
			4. Recursive problems that can be memoized or solved tabularly
			5. Using FIFO and LIFO on onion layer problems
			6. Binary search variations: left == right, left < right, left < right by 1 or more
			7. Counting or bucket sort
			8. Using min or max heap to find k items
			9. Sliding, tumbling or fixed window
			10. Hashmaps for quick lookups or duplicate detection
			11. Greedy algorithms
			12. Dealing with intervals
			13. Dfs/Bfs serially or in parallel
			14. Permutation and combination (repetitions and ordering using backtracking, loops, or the choose vs. not choose strategy)
			15. Graph coloring
			16. Topological sort
			17. Shortest path variations
			18. Connected components
			19. Ad-hoc: basically everything else, no pattern, mathematical, etc.
		4. Review the above techniques and recognize them
			1. Learning association
			2. Study more about the techniques
				1. Google
		5. Discard Done list
		6. Now assign problems in repeat list to the techniques discussed
		7. Check those that got repeated low score (repeat offenders)
			1. Certain combinations can be problematic (ex: binary search on two dimensional arrays)
				1. Rucursion + memoization
				2. Graphs + connected components
		8. In round 2 we filter on those categories and adding 50 more problems from leetcode (specific to the categories)
		9. Move the repeat problems back to todo list and repeat the process
			1. This round will go much faster than first round (we recognize patterns and techniques)
			2. Speed and endurance will also increase (we can do more than 5)
		10. Third round might not be needed but a few might need
	6. Step 6: Evaluate readiness
		1. At least two rounds of spaced repetition
		2. Score is 5
		3. Don't worry about odd ball questions
		4. Interview with companies where we don't care to work for
		5. Do a few mock interviews and see how we perform
		6. We will never be 100% ready
		7. All companies will not accept
	7. Step 7: Metacognition
		1. Reflect on what went right and what went wrong after each interview
		2. Continue to do things that went right
		3. Work on the mistakes
		4. Identify what got you stuck
		5. Did they give hint that I didn't take?
		6. Did I just jump into solving the problem without asking clarifying questions?
		7. Did I forget edge cases?
		8. Was it complexity that needs more work?
		9. Bad day is okay
4. Adjust template accordingly
	1. If less time, solve more problems per day
	2. If applying to certain companies, pick problems asked by those companies
5. Apply this process consistently everyday

# How to Prepare for Technical Interviews, Part 2 - System Design #
1. What is the purpose of system design interviews?
	1. To test design and architectural acumen - applicable if few years of experience
	2. Mainly applicable for web based architectures and distributed systems
	3. It is more like discussion between engineers
		1. Solving problem
		2. Looking for trade offs
2. How much time should I spend preparing for them?
	1. Begins much before interview
	2. Give atleast one year
	3. Read books, blogs and articles long before the interviews
		1. For long term success
3. Resources
	1. Mid level
		1. Web Scalability for Startup Engineers
		2. System Design Interview
	2. Senior level
		1. Above
		2. Designing Data-Intensive Applications
		3. Building Microservices
		4. Specific technologies
			1. Cassandra
			2. Kafka
			3. Graph dbs
			4. Event driven architectures
		5. Free resources
			1. Confluent
			2. Neo4j
			3. Datastack
	3. Structure
		1. Educative
			1. Web Application & Software Architecture 101 (< 2 years)
			2. Grokking the System Design Interview (2 - 5 years)
			3. Grokking the Advanced System Design Interview ( > 5 years)
	4. Difference
		1. Senior engineers - talk about actual technologies
			1. More practical than theoretical
4. Spend atleast 6 months reading or going through
5. Strategy for interviews - 6 months
	1. Step 1: Understand how the interview should be structured (4 key sections)
		1. Come up with a reasonal starting point
		2. Sections:
			1. Section 1: Functional requirements (5 mins)
				1. Simplify the problem
					1. Friends
					2. Statuses - text only say
					3. Feed - friend's updates
					4. Skip the rest (games, ...)
				2. Simplified version is feasible to discuss in short amount of time
				3. Optionally come up with API signatures (to make it more concrete)
			2. Section 2: Non-functional requirements (5 mins)
				1. Ask questions for
					1. Traffic & usage assumptions
						1. Ex: Total users, geographically distriubted? activity pattern
							1. Consistency
							2. Bandwidth & throughput peaks
							3. Storage requirements
							4. Read/Write QPS
							5. ...
						2. Estimate using napkin math
						3. Senior Engineers are expected to assert the numbers
			3. Section 3: High-level design & key challenges (15 mins)
				1. Recognize and acknowledge main components (block diagram)
					1. Load balancers
					2. App servers
					3. Web servers
					4. Message queues
					5. Client device
					6. Databases
					7. ...
				2. Pick core technologies
					1. SQL or NoSQL
					2. Replication/Redundancy
					3. Simple Queue/Distributed Queue
					4. Load Balancing
					5. Rate Limiting is required?
						1. What kind of bucketing or window?
				3. Identify key pain points
					1. What factors make the problem a challenging one?
						1. Throughput?
						2. Bandwidth?
						3. Latency?
						4. Consistency?
						5. Fan-out model
							1. Pull model - pull all feeds
								1. What if there are lot of users we follow?
									1. Takes time
							2. Push model - push update to all followers
								1. What if a celebrity? Takes time
							3. Hybrid model
								1. Pull model for celebrities
								2. Push model for ordinary users
						6. Hotspots
							1. If a celebrity posts an upate, millions might like it
								1. DS will get really hot
									1. Split into multile counters?
									2. Sacrifice consistency?
									3. Special Datatypes - CRDTs?
				4. Evolve high level design into a detailed design
			4. Section 4: Deep dive (15 mins) - one or more components
				1. Play to strenghts
					1. If worked on data stores
						1. How to handle hotspots
					2. If worked on message queues
						1. Async
					3. If worked on middleware
						1. How to handle feeds
						2. How to fetch data
						3. Pagination
						4. Versioning
						5. Data compression
					4. If worked on mobile apps
						1. How to optimize for battery life
						2. For low bandwidth areas (3rd world countries)
	2. Step 2: Catalogue the interview questions
		1. 
	3. Step 3: Practice individual sections
	4. Step 4: Identify and invest on your strengths & interests
	5. Step 5: Build a few systems end-to-end
	6. Step 6: Practice under a timed setting