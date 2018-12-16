# Introduction to XMLUnit #
## Overview ##
1. [XMLUnit 2.x](http://www.xmlunit.org/)
	1. Used to test and verify XML content
	2. Good tool if we know exacly what the XML should contain
2. Usually used in unit tests
	1. To check if xml is valid
	2. To check if it contains certain information
	3. To check if it confirms to a style document
4. We can also control what kinds of difference is important to us
5. Which part of style can be compared with which part of XML
6. Hamcrest matchers can be used for assertions
	1. [Hamcrest](https://www.baeldung.com/java-junit-hamcrest-guide)

## XMLUnit Maven Setup ##
1. Add the following dependencies

		<dependency>
			<groupId>org.xmlunit</groupId>
			<artifactId>xmlunit-core</artifactId>
			<version>2.2.1</version>
		</dependency>

	1. [xmlunit-core latest version](https://search.maven.org/classic/#search%7Cga%7C1%7Ca%3A%22xmlunit-core%22)
2. matchers

		<dependency>
			<groupId>org.xmlunit</groupId>
			<artifactId>xmlunit-matchers</artifactId>
			<version>2.2.1</version>
		</dependency>

	1. [xmlunit-matchers latest version](https://search.maven.org/classic/#search%7Cga%7C1%7Ca%3A%22xmlunit-matchers%22)

## Comparing XML ##
### Simple Difference Examples ###
1. Identical definition:
	1. Content is same
	2. Sequence of nodes is same
2. Example:

		@Test
		public void given2XMLS_whenIdentical_thenCorrect() {
			String controlXml = "<struct><int>3</int><boolean>false</boolean></struct>";
			String testXml = "<struct><int>3</int><boolean>false</boolean></struct>";
			assertThat(testXml, CompareMatcher.isIdenticalTo(controlXml));
		}

3. Example: Two pieces of XML are similar but not identical if nodes occur in a different sequence

		@Test
		public void given2XMLSWithSimilarNodesButDifferentSequence_whenNotIdentical_thenCorrect() {
			String controlXml = "<struct><int>3</int><boolean>false</boolean></struct>";
			String testXml = "<struct><boolean>false</boolean><int>3</int></struct>";
			assertThat(testXml, assertThat(testXml, not(isIdenticalTo(controlXml)));
		}

### Detailed Difference Example ###
1. Differences are detected by the Difference Engine
	1. By default (for efficiency) stops the comparison process as soon as first difference is found
2. To get all differences, use `Diff` class

		@Test
		public void given2XMLS_whenGeneratesDifferences_thenCorrect() {
			String controlXml = "<struct><int>3</int><boolean>false</boolean></struct>";
			String testXml = "<struct><boolean>false</boolean><int>3</int></struct>";
			Diff myDiff = DiffBuilder.compare(controlXml).withTest(testXml).build();

			Iterator<Difference> iter = myDiff.getDifferences().iterator();
			int size = 0;
			while (iter.hasNext()) {
				iter.next().toString();
				size++;
			}
			assertThat(size, greaterThan(1));
		}

	1. Each difference describes the type of difference found between a control node and test node and detail of the nodes (with XPath location of each node)
	2. To stop difference engine after the first difference is found and not proceed to enumerate further differences, we need to supply a `ComparisonController`

			@Test
			public void given2XMLS_whenGeneratesOneDifference_thenCorrect() {
				String myControlXML = "<struct><int>3</int><boolean>false</boolean></struct>";
				String myTestXML = "<struct><boolean>false</boolean><int>3</int></struct>";

				Diff myDiff = DiffBuilder
								.compare(myControlXML)
								.withTest(myTestXML)
								.withComparisonController(ComparisonControllers.StopWithDifferent)
								.build();

				Iterator<Difference> iter = myDiff.getDifferences().iterator();
				int size = 0;
				while (iter.hasNext()) {
					iter.next().toString();
					size++;
				}
				assertThat(size, equalTo(1));
			}

		1. Difference message will be simpler

## Input Sources ##
1. XML data can be picked up from many sources
	1. Use `Input` class with many static methods
2. Example: Pick from XML file

		@Test
		public void givenFileSource_whenAbleToInput_thenCorrect() {
			ClassLoader classLoader = getClass().getClassLoader();
			String testPath = classLoader.getResource("test.xml").getPath();
			String controlPath = classLoader.getResource("control.xml").getPath();
			
			assertThat(Input.fromFile(testPath), isSimilarTo(Input.fromFile(controlPath)));
		}

3. Example: From XML string

		@Test
		public void givenStringSource_whenAbleToInput_thenCorrect() {
			String controlXml = "<struct><int>3</int><boolean>false</boolean></struct>";
			String testXml = "<struct><int>3</int><boolean>false</boolean></struct>";

			assertThat(Input.fromString(testXml), isSimilar(Input.fromString(controlXml)));
		}

4. Example: Stream as input

		@Test
		public void givenStreamAsSource_whenAbleToInput_thenCorrect() {
			assertThat(Input.fromStream(XMLUnitTests.class.getResourceAsStream("/test.xml")),
				isSimilarTo(
					Input.fromStream(XMLUnitTests.class.getResourceAsStream("/control.xml"))));
		}

5. `Input.from(Object)` - can pass a valid source that can be resolved by XMLUnit

		@Test
		public void givenFileSourceAsObject_whenAbleToInput_thenCorrect() {
			ClassLoader classLoader = getClass().getClassLoader();

			asserThat(Input.from(new File(classLoader.getResource("test.xml").getFile())), isSimilarTo(Input.from(new File(classLoader.getResource("control.xml").getFile()))));
		}

		@Test
		public void givenStringSourceAsObject_whenAbleToInput_thenCorrect() {
			assertThat(
				Input.from("<struct><int>3</int><boolean>false</boolean></struct>"), isSimilarTo(Input.from("<struct><int>3</int><boolean>false</boolean></struct>")));
			)
		}

		@Test
		public void givenStreamAsObject_whenAbleToInput_thenCorrect() {
			assertThat(
				Input.from(XMLUnitTest.class.getResourceAsStream("/test.xml")), isSimilarTo(Input.from(XMLUnitTest.class.getResourceAsStream("/control.xml"))));
			);
		}

## Comparing Specific Nodes ##
1. Similar XMLs:

		@Test
		public void given2XMLS_whenSimilar_thenCorrect() {
			String controlXml = "<struct><int>3</int><boolean>false</boolean></struct>";
			String testXml = "<struct><boolean>false</boolean><int>3</int></struct>";

			assertThat(testXml, isSimilarTo(controlXml));
		}

	1. Test fails because XMLUnit compares control and test nodes at the same depth relative to the root node
2. Can be changed using `DefaultNodeMatcher` and `ElementSelector` classes of XMLUnit
	1. `DefaultNodeMatcher` is used by XMLUnit at comparison stage
		1. Loops over nodes of `controlXml` to determine which XML node from `testXml` to compare with current XML node it encounters in `controlXml`

## Custom *DifferenceEvaluator* ##
## Validation ##
## XPath ##
## Conclusion ##
