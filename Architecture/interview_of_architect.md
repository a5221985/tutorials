# Interview of Architect #
1. Common terms concepts and questions used in interview
	1. Dividing skills into buckets
	2. Software Macro and Micro Patterns and Design
	3. Construction and Erosion
	4. Knowledge References
2. References: Why references matter?
	1. Code complete
	2. GoF
	3. Data Access Patterns
	4. Service Design Patterns
	5. Patterns of Enterprise Architecture
	6. Architecture Application for the Enterprise
	7. Applied Architecture Patterns
	8. A Pattern language
	9. The Natural House
	10. Wikipedia

## Strategy and Emphasis ##
1. Many do not know
	1. Fundamental reference in the book "Design Patterns" (GoF)
	2. "A Pattern Language" by C. Alexander
	3. A Pattern Language references F. Wright designs and other architects to explain essential patterns
		1. How they pattern buildings and choices in assembly
	4. Design Patterns and A Pattern Language are quoted in later texts (conceptual scaffolding)
2. "Building Architect" - F. Wright might architect as follows:
	1. Envision - Examine stakeholder goals combined with architect's expertise
	2. Model - View the 'lay of the land' to construct a model and set expectations
	3. Blueprint - Specify construction details and constraints
	4. Inspect - Verify construction implementation
	5. Term Nomenclature - Communicate in terms understandable to listeners
3. Point: We can use and we should use - 'Classical' building architecture to define the scope and emphasis of what a software architect should know

## Bridging Architectural Concepts ##
1. Envision - Software Architecture
2. Model - Design Patterns
3. Blueprint - Construction and Design Principles
4. Inspect - Construction Patterns
5. Nomenclature - Terms to communicate intent

### Software Architecture ###
1. Web Server - A pipeline Architecture
2. SOA - A component Architecture
3. Client/ Server - A layered Architecture
4. Single Tier - A monolithic Architecture
5. Cloud - A tier network Architecture

### Design Patterns ###
1. Creational, Structural and Behavioral
2. Event Driven - Observer
3. Plug-ins - Abstract Factory
4. Domain/ Active Record/ Table Module - Layer patterns
5. Algorithm - Strategy

### Design Principles ###
1. Abstraction
2. Encapsulation
3. Cohesion
4. Coupling
5. Complexity

### Construction Patterns ###
1. Inheritance Design
2. Component Design
3. Layered Design
4. Tier Design
5. Delivery Methodology
6. Software Architecture erosion and decay

## Titles for Architects ##
1. Who should be able to explain architecture?
	1. **Application Architect** - Know all core areas, strong in Construction patterns
	2. **Solution Architect** - Know all core areas, strong in Design Pattens and Principles
	3. **Enterprise Architect** - Know all core areas, strong in Architecture Patterns & Construction
	4. **Cloud Architect** - Know all core areas, strong in Architecture, Construction & Tiers
	5. **Infrastructure Architect** - Construction Patterns
	6. **System Architect** - Same as Solution Architect
2. Relationship of solution architect to enterprise architect in FEA

		|Level|Scope|Detail|Impact|Audience|
		|Enterprise Architecture|Agency/Organization|Low|Strategic Outcomes|All Stakeholders
		|Segment Architecture|Line of Business|Medium|Business Outcomes|Business Owners|
		|Solution Architecture|Function/ Process|High|Operational Outcomes|Users and Developers|
		
	1. The differences in architects is not the core skills but who the audience is, scope addressed in particular scenario

## Reading Into an Interview Response ##
1. Evaluating a candidate
	1. 'it depends' is also a valid answer
	2. Most replies should be specific, opinionated but softly spoken -  candidates should have opinion and state it as such but recognize that other factors may influence outcomes
	3. Replies should use standard architecturally known terms in response - Use of non-standard terms or not providing references (known examples) indicates lack of knowledge
	4. Replies can illustrate standard response vs minority response
		1. Candidates should clearly state standard response to a design question
			1. Thin client: browser is standard response
				1. Firefox browser is not a standard response
		2. Candidates may reply with a minority held position to further support an opinion
		3. Interviewers should capture responses for review and follow-up ambiguous replies may be the fault of interviewer
		4. Materials Vs. Exotic Materials selection - Candidate should elaborate why selection of technologies could be knowledge/ complexity/ cost prohibitive.
			1. Technology selection and exotic technology selection 
		5. Plasticity/ Continuity (Blending solution modules implies flexibility of design) - Candidate resplies should have undertone of flexibility/ simplicity in design
			1. Each piece should be designed and working as it should

## The Right Questions to Ask ##
1. Software Architecture
	1. Please explain Web Server Architecture?
		1. Pipeline architectures
	2. Please explain Cloud Architecture?
		1. N-tier design architectures
	3. Please explain SOA Architecture?
		1. Component architectures
2. Design Patterns
	1. Please explain Creational, Structural and Behavioral Design Patterns?
		1. Sections of the book from GoF that outline fundamental patterns used in the software design
		2. Creational:
			1. Factory
			2. Abstract Factory
			3. Builder
			4. Prototype
			5. Facade
			6. Flyweight
			7. Prototype
		3. Behavioral:
			1. Template
			2. Strategy
			3. Observer
	2. Please explain Plug-ins?
		1. Type of factory pattern implemented for inversion of control in a particular object
	3. Please explain Middle tier layering of application code?
		1. 
	4. Looking at the code structure, how might you implement an Algorithm?
3. Design Principles
	1. Please tell me how a cell phone is an example of Abstraction?
	2. How does Encapsulation benefit code reuse?
	3. What effect does Cohesion have on module and layer implementation?
	4. How does coupling effect scaling?
	5. What the deal with Complexity?
4. Construction Principles
	1. Please contrast inheritance and Component Design
	2. Describe a Data Layer and its attributes?
	3. Describe a Data Tier and its attributes?
	4. What Development Methodology do you prefer and why?
	5. What are you going to do to hold-off architecture erosion?