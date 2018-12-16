## Behavior Driven Development for Java
### Behavior Driven Development
1. What is BDD?
	1. Emerged from TDD
	2. TDD + Domain Driven Design
		1. What is Domain Driven Design?
			1. What is domain?
				1. sphere of knowledge
				2. sphere of influence
				3. sphere of activity
				4. subject area to which user applied a particular software
					1. Example: Banking domain
					2. Railway Reservation
					3. Residential building
			2. What is Ubiquitous Language?
				1. Common language shared between developers and business which must be in business terminology
	3. We use simple Domain-Specific-Language (DSL) formed from natural language constructs to express behavior and expected outcomes
		1. What is DSL?
			1. Computer language specialized to an application domain
				1. Example: For web pages, we use HTML
				2. Example: Emacs Lisp for GNU Emacs and XEmacs
2. How is BDD related to TDD?
	1. TDD:
		1. For each unit of software,
			1. define test set for the unit
			2. implement the unit
			3. verify that implementation of unit makes the test succeed
	2. BDD:
		1. Test of a unit should be specified in terms of desired behavior of the unit
			1. Desired behavior: business requirements (which has business value)
		2. It is an outside-in activity
3. What is the purpose of BDD?
	1. It is used to tie business requirements that add business value to the unit tests and the units tests are ultimately tied to the software implementation
4. How to specify BDD?
	1. Who should work on this?
		1. Business analysts and Developers
	2. Behavior should be specified in terms of user stories
	3. Structure:
		
			Title: Clear explicit title.
			Narrative
				Introduction which should contain
					* who (business/project role) is the driver/ primary stake holder of story (actor who derives business benefit from story)
					* what effect stakeholder wants the story to have
					* what business value does stake holder derive from this
			Acceptance criteria/ scenarios
				description of each case of narrative. A scenario should have the structure
					* Specifies initial condition assumed to be true. (Single clause/ several clauses)
					* Event that triggers the start of the scenario
					* States expected outcome
		
	4. How to write stories is not defined
	5. Dan North template
	
			Story: Returns go to stock
			
			In order to keep track of stock
			As a store owner
			I want to add items back to stock when they're returned
			
			Scenario 1: Refunded items should be returned to stock
			Given that a customer previously bought a black sweater from me
			And I have three black sweaters in stock.
			When he returns the black sweater for refund
			Then I should have four black sweaters in stock.
			
			Scenario 2: Replaced items should be returned to stock
			Given that a customer previosly brought a blue garment from me
			And I have two blue garments in stock
			And three black garments in stock.
			When he returns the blue garment for a replacement in black
			Then I should have three blue garments in stock
			And two black garments in stock.
					
5. What is Ubiquitous Language and how is it related to BDD?
	1. It is a semi-formal language shared by all members of software development team (technical and non-technical team members)
	2. It is used to write user stories to identify
		1. stakeholder
		2. business effect
		3. business value
	3. It is used to describe different scenarios with preconditions, trigger, expected outcomes
6. Give an example of BDD implementation for Java Software?
	1. Processing by tool in general
		1. Reads specification
		2. Formal parts of ubiquitous language are interpreted (Given, When, Then) and breaks scenario into clauses
		3. Clause is transformed into parameter for test of user story
		4. Test is executed for each scenario by using parameters from the scenario
	2. JBehave (Developed by Dan North)
		1. Input Document for JBehave
		
				Given a 5 by 5 game
				When I toggle the cell at (3, 2)
				Then the grid should look like
				.....
				.....
				.....
				..X..
				.....
				When I toggle the cell at (3, 1)
				Then the grid should look like
				.....
				.....
				.....
				..X..
				..X..
				When I toggle the cell at (3, 2)
				Then the grid should look like
				.....
				.....
				.....
				.....
				..X..
				
			1. Given: defines start of a scenario
			2. When: Trigger
			3. Then: Outcome of action following trigger
		2. JBehave parses text file and sets up clauses
		3. Code to write by developers
		
				private Game game;
				private StringRenderer renderer;
				@Given("a $width by $height game")
				public void theGameIsRunning(int width, int height) {
					game = new Game(width, height);
					renderer = new StringRenderer();
					game.setObserver(renderer);
				}
				
				@When("I toggle the cell at ($column, $row)")
				public void iToggleTheCellAt(int column, int row) {
					game.toggleCellAt(column, row);
				}
				
				@Then("the grid should look like $grid")
				public void theGridShouldLookLike(String grid) {
					assertThat(renderer.asString(), equalTo(grid));
				}
				
		4. JBehave can pick terms from templates and pass them to methods in test code
7. How is a specification different from Story?
	1. Specification:
		1. Example: RSpec
			
				describe Hash do
					let(:hash) { Hash[:hello, 'world']}
					
					it { expect(Hash.new).to eq{}}
					
					it "hashes the correct information in a key"
					do
						expect(hash[:hello]).to eq('world')
					end
					
					it "includes key" do
						hash.key.include?(:hello).should be true
					end
				end
		
		2. use of functional specification (technical in nature)
		3. Defines specific behavior of component being tested
		4. Can be implemented at lower level