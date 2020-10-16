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
1. Verification:

		@Test
		void findByIdBddTest() {
			// Given
			Speciality speciality = new Speciality();
		given(specialityRepository.findById(1L)).willReturn(Optional.of(speciality));
			
			// When
			Speciality foundSpeciality = service.findById(1L);
			
			// Then
			assertNotNull(foundSpeciality);
			then(specialityRepository).should(times(1)).findById(anyLong());
			// then(specialityRepository).shouldHaveNoMoreInteractions();
		}

### Refactoring Speciality Service to BDD ###
1. Test

		@Test
		void findByIdTest() {
			//given
			Speciality speciality = new Speciality();
			
			//when
			service.delete(speciality);
			
			//then
			then(specialityRepository).should().delete(any(Speciality.class));
		}
		
	1. Given-when-then style improves quality of testing

### Assignment - BDD Visit Service ###
1. Convert test `VisitSDJpaServiceTest` to BDD
2. Add given-when-then comments
3. User Mockito BDD methods - `given` and `then`

### Assignment Review ###
### Conclusion ###
1. Could be a preference

## Spring Framework Testing Context ##
### Introduction ###
### Yanny or Laurel? ###
### Yanny or Laurel Service Beans ###
### JUnit4 Laurel Test ###
### Assignent Construct Yanny JUnit 4 Test with Spring Context ###
### Assignment Review Construct Yanny JUnit 4 Test with Spring Context ###
### JUnit 5 Laurel Test ###
### Assignment Construct Yanny JUnit 5 Test with Spring Context ###
### Assignment Review Construct Yanny JUnit 5 Test with Spring Context ###
### Using Inner Class Configuration ###
### Using Component Scans ###
### Setting Active Profiles for Tests ###
### Spring Test Properties ###
### Assignment - Construct Profile for Properties ###
### Assignment Review ###
### Conclusion ###