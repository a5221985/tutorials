# Testing Spring Boot: Beginner to Guru #
## Behavior Driven Mockito ##
### Introduction ###
1. It is syntax change
	1. Behavior driven model
	2. API change

### Introduction to Behavior Driven Development ###
1. BDD
	1. 2004 by Dan North
	2. BDD was established to help people learn TDD
	3. BDD is a different way of looking at testing
	4. BDD focuses on behavior vs "tests"
		1. Just conceptually different
	5. "Unit tests" are referred to as specification - ie specifications of behaviors
		1. Each test case is a specification of behavior
	6. Test method names should be sentences - ie saveValidID
2. Given-When-Then
	1. BDD Tests are often written in a given-when-then context
	2. This approach often helps you organize your thoughts when writing the test
		1. Helps us think what we need to provide in the text context
			1. Setting up mocks etc...
	3. **Given** - Setup of the test
	4. **When** - Action of the test - ie when method is called
	5. **Then** - Verification of expected results
3. Mockito and BDD
	1. Mockito has added BDD support in class BDDMockito
	2. static method `given` allows you to configure mocks
	3. static method `then` allows you to verify mock interactions

### BDD Mockito ###
1. New test:

		@Test
		void findByIdBddTest() {
			Speciality speciality = new Speciality();
			
			given(specialityRepository.findById(1L)).willReturn(Optional.of(speciality));
			
			Speciality foundSpeciality = service.findById(1L);
			
		}

### BDD Verification in Mockito ###
1. 

### Refactoring Speciality Service to BDD ###
### Assignment - BDD Visit Service ###
### Assignment Review ###
### Conclusion ###