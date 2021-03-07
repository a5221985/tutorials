## Getting Started with Elasticsearch ##
### Course Objectives ###
1. Tools for building robust client side search app
2. Objectives
	1. Elasticsearch and client-side app - in browser app for search
	2. Install and configure elasticsearch
	3. Building client-side search app
		1. Data ingestion - data structures
		2. Query syntax - well structures
		3. Client side search UI
		4. Implementing results
		5. Adding filters
		6. Autocomplete and snippet highlighting
	4. Relevancy tuning
		1. Field boosting
		2. Scoring functions
	5. Deployment and application security
		1. Lock down API

### Getting Started ###
1. Overview of Elasticsearch
	1. It is built on lucene search engine
	2. It can index structured and un-structured data
		1. Un-structured data
			1. Text
				1. Book chapters
		2. Structured data
			1. JSON
			2. ISPNs
	3. Does not require schema
		1. Categorizes based on content
		2. Real-time searching
			1. Search as soon as they are indexed
	4. Elasticsearch can be used to build robust, distributed database that can scale
		1. Each cluster can contain multiple indexes split across nodes and replicas
		2. Automatic rebalancing on adding nodes
	5. Simple and clean API
2. Client-side app
	1. For powerful UI using minimum resources
	2. JS App is downloaded from server
		1. JS App can directly query db
	3. Advantages
		1. Smaller server requirements
		2. Fast and responsive interface
3. Combine the two

### Installing and Configuring Elasticsearch ###
1. Topics
	1. Installing Elasticsearch
		1. Download Elasticsearch zip
			1. bin - execs
			2. config
				1. elasticsearch.yml (can be renamed to json)
					1. path.data: app_data
					2. path.logs: app_logs 
				2. logging.yml
			3. data
				1. holds indexes
			4. lib
				1. jars
			5. logs
				1. useful info for debugging and analysis
			6. plugins
		2. Run

				bin/elasticsearch

			1. JDK 1.7 is required
		3. Open in browser
			1. `http://localhost:9200`
				1. cluster is automatically creaded called `elasticseach`
				2. Master node is `new_master`
			2. elasticsearch.yml
				1. `cluster.name: booksearch`
				2. Individual nodes get random names
					1. Any node can be master node (unless explicitly configured)
		4. Marvel plugin
			1. `bin/plugin -i elasticsearch/marvel/latest`
			2. Restart elasticsearch
			3. Open marvel in browser
				1. `http://localhost:9200/_plugin/marvel`
			4. Spin up another node
				1. `bin/elasticsearch`
					1. Joins the same cluster
	2. Default cluster settings and cluster configuration
		1. `index.number_of_shards: 5` - 5 shards each with a backup shard (10 shards in total)
		2. `index.number_of_replicas: 1` - 1 replica per shard
			1. If one shard goes down, the other is available
				1. replica shard cannot be used for indexing
					1. Increase number of shards to increase indexing throughput
			2. Number of shards can be defined only when index is created
				1. Number of replicas is adjustable any time
		3. Memory: Default is enough
			1. Increase memory
	3. Introduction to Marvel

## Data Ingestion ##
### Ingesting the Initial Document ###
1. Adding real data
2. Topics
	1. Indexing our first document 
	2. Field types
		1. How elasticsearch classifies a given field
	3. Text analysis
		1. How field is broken down into searchable tokens
	4. Routing
		1. How elasticsearch determines which shard to put the document in
	5. Bulk indexing
		1. Batching large lists of updates with single command
3. Injesting data
	1. JSON: format used to communicate with elasticsearch for adding documents and also query DSL
		1. types
			1. Example: 

					{
						"title": "Building Machine Learning Systems with Python", 
						"publish_date": "July 2013", 
						"price": 49.99, 
						"language": "english", 
						"paperback": "290 ...", 
						"ISBN": "12423323213", 
						"ISBN 13": 24132132323, 
						"authors" [
							"Willi Richert",
							"Luis Pedro Coelho"
						],
						...
						"description": "..."
					}
	

		2. Injesting document
			1. `http://localhost:9200/_plugin/marvel/sense/index.html`
				1. `PUT /library/books/1`
					1. `library`: index name
					2. `books`: document type
						1. Category of index
							1. `movies`
							2. `music`
					3. `1`: id
				2. `version`: 1 - first time
				3. If id is not specified, unique hash is used
			2. Querying
				1.`GET /library/_search/?q=49.99`
					1. `_source`: all the document field values are returned

### Assigning Field Types ###
1. How elasticsearch is interpreting the data (behind the scenes)
	1. Field types
		1. Elasticsearch determines the best type for the given document
	2. Automatic mapping versus manual mapping
2. Mapping:
	1. Assigning type to field is called mapping
		1. Default mappings are good starting points for clean data sources
	2. Default mapping:
		1. `GET /library/books/_mapping` - gives types of each field
			1. Mapping is created when first instance of the field is indexed
			2. If we change the type and update, an error is thrown (double to string with letters)
				1. `"$9.99"` - error
				2. `"9.99"` - converted to number
	3. types:
		1. string: short to long text
		2. numbers: bytes, integers, longs, floats, doubles (similar to java)
		3. date: commonly recognized date formats
		4. boolean
		5. Other types
			1. Binary files encoded in Base64
			3. Special type for shapes and points
			4. IP addresses
			5. Token values
			6. Null value
	4. If mapping needs to be changed
		1. Override for specific fields
		2. This can be done before we index a document
			1. Only backwards compatible changes can be made to the index
		3. How to do it?

				PUT /library/books/_mapping

				{
					"properties": {
						...
						"publish_date": {
							"type": "date"
						},
						...
					}
				}

				PUT /library/books/1
		
				{
					...
					"publish_date": "201307",
					...
				}

			1. Delete the current index

					DELETE /libary/books

			2. Pass the mapping

					PUT /library/books/_mapping

					{
						...
					}

			3. Re-injest the document
			4. set `index.mapping.dynamic` property to `false` - fields that elasticsearch does not recognize are ignored

### Advanced Ingestion Topics ###
1. If content is not indexed correctly
	1. Search does not return data
2. We can change that by defining how to search and analyze data
	1. Text analyzers
		1. analyzers are used to extract searchable terms (tokens) from the text
			1. Example:
				1. `GET /library/_analyze?text=Example+teXt`
				2. `GET /library/_analyze?text=Example+teXt&analyzer=whitespace` - returns original capitalized tokens
					1. Setting field specific analyzer
					
							PUT /library/books/_mapping

							{
								"properties": {
									"title": {
										"type": "string",
										"analyzer": "whitespace"
									}
								}
							}

					2. Analyzers available
						1. `standard`
						2. `simple`
						3. `whitespace`
						4. `stop`
						5. `keyword`
						6. `header`
						7. `...`
						8. `snowball`
	2. Stemming
		1. Related to analysis
		2. Process of breaking the words down into their base root
			1. `interpret` can return fields matching `interpreting` and `interpretation` ...
		3. If not set, there are problems
			1. `GET /library/_search?q=title:machines` (instead of machine)
				1. `machines` and `machine` do not resolve to the same token
			2. Fix:

					"description": {
						"type": "string",
						"analyzer": "english"
					}
					...
					"title": {
						"type": "string",
						"analyzer": "english"
					},
					...

				1. To set field specific analyzer for the entire text
					1. To normalize latin based text, lowercase the entire string and split up the term based on whitespace
			3. Separate analyzers can be configured for text during injestion and for query operation

	3. Multi-fields
		1. Boosting higher based on the original text match?
		2. Solution:
			1. The field can be injested several times using different settings

					"title": {
						"type": "string",
						"analyzer": "english",
						"fields": {
							"basic": {
								"type": "string",
								"analyzer": "standard",
								"boost": "1.5"
							}
						}
					}

	4. Document routing
		1. Determines how docs are stored in available shards
		2. Default: Routing is based on hash of document id
			1. Evenly distributed over all of the shards (broadcasted to all shards)
				1. Problem: All shards must be queried to return any given document
				2. Solution: Distribute documents by a logical structure
					1. Scoped queries can be sent to individual shards instead of broadcasting to all shards

							POST /library/books/1?routing=2

					2. Two ways to implement custom routing scheme
						1. Determine the route based on document field	
						2. Explicitly pass routing number with the document
					3. The approach is good if a single field is not a good predictor of how a document should be stored
					4. Marginally faster because hash does not have to be parsed			
	5. Batch injestion
		1. Load many documents using builk API
		
				POST /library/books/_bulk
				{"index": {"_id":"1"}} - meta data line for update method and indexing path
				{...document...}

		2. `GET /library/_stats`

## Querying Elasticsearch ##
### Basic Query Types ###
1. Topics
	1. Basic Query types
		1. Terms
		2. Match
		3. Range
		4. Filters (for faster performance)
	2. Specialized query types
	3. Combining queries
		1. compound queries
2. Structure of query objects
3. How queries work
4. How to implement one of them
5. Types of queries
	1. Query DSL:

			_search?q=:web+design&analyzer=english&default_operator=AND&fields=titel^5,description

			
			{
				"simple_query_string": {
					"query": "web design",
					"analyzer": "english",
					"fields": ["title^5", "description"],
					"default_operator": "AND"
				}
			}

		1. Each query can be specified as a JSON object (instead of passing each parameter in one long contatenated string)
		2. Advantages:
			1. Much cleaner
			2. Easier to understand
			3. More readable
	2. Clients:
		1. Java
		2. Go
		3. ...
	4. Test matching queries
		1. term
			1. Used for direct text matching
			2. There is a query type for single term and another for multi-term (array of terms can be passed)
			3. No analysis is done on query string
				1. Returns documents that are identical matches of given terms

						GET /library/books/_search

						{
							"query": {
								"term": {
									"title": "JAVA" // case sensitive
								}
							}
						}

		2. match
			1. Uses the same analyzing chain of the field being searched
			2. Case insensitive

					GET /library/books/_search

					{
						"query": {
							"match": {
								"title": "JAVA" // case sensitive
								"operator": "and"
							}
						}
					}

				1. Doesn't work if specific field is not targetted
				2. Boolean logic is used (OR is default)
				3. Minimum match setting (to get more words from query to match a given document)
				4. `multi_match`: for matching multiple fields to search over

						{
							"query": {
								"multi_match": {
									"fields" ["title"],
									"query": "JAVA",
									"operator": "and"
								}
							}

				5. Phrases and prefixes can also be matched (phrase matches need keywords to occur next to each other)
					1. Slot setting: how far the words can be

							{
								"query": {
									"match_phrase": {
										"title": "Web Application"
									} 
								}
							}

					2. Span query types - more control over slots
				6. Prefix matches: documents that match with query keywords
					1. Useful to generate results before the full string has been entered (Autocomplete)

							{
								"query": {
									"match_phrase_prefix": {
										"title": "Ajax Appl"
									}
								}
							}

				7. Range queries: Return documents that match within a span of accepted matches (example: numbers)

						{
							"query": {
								"range": {
									"FIELD": {
										"gte": 10,
										"lte": 20,
										"boost": 1.2
									}
								}
							}
						}

					1. Ranges also work with dates
						1. Greater than
						2. Greater than or equals
						3. Less than
						4. Less than or equals
				8. Filters: They are unlike full queries
					1. They do not assign score to the returned documents
					2. Extremely fast and computationally efficient
					3. They are binary - document is in the set or it isn't
					4. Normal query can be combined with filtered query
					5. Filters are heavily cached - other queries can take advantage of them

							{
								"query": {
									"filtered": {
										"query": {
											"match": {
												"title": "web"
											}
										},
										"filter": {
											"range": {
												"price_gbp": {
													"gt": 30	
												}
											}
										}
									}
								}
							}

					6. Uses:
						1. Used to check if document exists or missing
						2. If it has parents
						3. What type it is
						4. Whether it falls within the geographic shape among others
						5. Filters can contain sub-queries
						6. Very good choice for un-ranked list of documents
		3. fuzzy
		4. more like this
		5. common terms

### Specialized Query Types ###
1. Special
	1. fuzzy
		1. looks for terms similar to provided text (several deviations away from the original)
			1. Used for names

					{
						"query": {
							"fuzzy": {
								"title": "pithon"
							}
						}
					}

				1. It is computationally heavy

	2. mlt (more like this)
		1. Takes a string of text or an example field and returns documents that are similar
			1. Used to pass a larger chunk of text such as a book description
		2. Used to suggest similar documents
		3. Can be combined to get "fuzzy like this" logic

				"query": {
					"mlt": {
						"fields": [
							"detailed description"
						],
						"like_text": "Python is a dynamic programming language, used in a wide range of domains by programmers who find it simple, yet powerful. From the earliest version 15 yours ago to the current one, it has constantly evolved with productivity and code readability in mind.",
						"min_term_freq": 1,
						"max_query_terms": 12
					}
				}
	
	3. common terms

			"query": {
				"common": {
					"detailed description": {
						"query": "programming with python",
						"cutoff_frequency": 0.001
					}
				}
			}

		1. groups query keywords into two categories
			1. low freqency
			2. high frequency
		2. high frequency words like and, about are not unique so low freqency words are factored in
			1. common terms is a solution
				1. threshold or cut off freqency for low and high values
	4. Ids
		1. look up by ids
		2. Good for returning known document for detailed view
			
				"query": {
					"ids": {
						"type": "books",
						"values": ["99"]
					}
				}
				
	5. Prefix
		1. match values beginning with query string
		2. For autocomplete

				"query": {
					"prefix": {
						"title": {
							"value": "javasc"
						}
					}
				}

	6. regexp
		1. Wildcard search - match on incomplete strings
		2. ?, *

				"query": {
					"wildcard": {
						"title": {
							"value": "java*"
						}
					}
				}

		3. `regexp` - regular expression pattern

				"query": {
					"regexp": {
						"title": "[0-9]"
					}
				}

			1. Uses more computational resources
				1. Keep it simple
			2. Consider using filters to narrow down the document set to much smaller starting point
			
	7. query_string
		1. Gives access to underlying lucene query parser
		2. Useful if using lucene queries or switched from solr
			1. For complex and robust lucene syntax

					"query": {
						"query_string": {
							"default_field": "detailed description",
							"query": "(Drupal AND \"Content Management\") NOT price_gbp:30"
						}
					}

			2. End users should have easier handler
			
	8. dis_max
		1. How documents are scored
		2. Uses highest scoring or field of a given document rather than adding scores together

				"query": {
					"dis_max": {
						"tie_breaker": 0.7,
						"boost": 1.2,
						"queries": [
							{"term": {"price_gbp": 30}},
							{"term": {"price_gbp": 34}}
						]
					}
				}

	9. Constant_score
		1. Takes the enclosed query gives the same score to the documents returned
		2. It can be used with filters

				"query": {
					"constant_score": {
						"filter": {
							"term": {
								"authors": "jordan"
							}
						},
						"boost": 1.2
					}
				}

### Combining Queries ###
1. Topics
	1. Bool queries or filters
	2. Boosting
	3. Query validation
2. Combining complex queries
	1. Score and results can be controlled from each sub-query
3. Boolean query:

		"query": {
			"bool": {
				"must" [
					{"term": {
						"title": {
							"value": "drupal"
						}
					}}
				],
				"must_not": [
					{"term": {
						"title": {
							"value": "flash"
						}
					}}
				]
			}
		}

	1. combines using boolean logic
	2. Another is `should` match
		1. matching results are scored higher but all results may not match

4. Boosting query:

		"query": {
			"boosting": {
				"positive": [
					{"term": {
						"title": {
							"value": "drupal"
						}
					}}
				],
				"negative": [
					{"term": {
						"title": {
							"value": "flash"
						}
					}}
				],
				"negative_boost": 0.2
			}
		}

	1. negative boosting is given to documents matching negative sub-queries
5. Validation

		GET _validate/query?explain
		{
			"query": {
				"boosting": {
					"positive": [
						{"term": {
							"title": {
								"value": "drupal"
							}
						}}
					],
					"negative": [
						{"term": {
							"title": {
								"value": "flash"
							}
						}}
					],
					"negative_boost": 0.2
				}
			}
		}

## Connecting Elasticsearch to Our Application ##
### Application Structure ###
1. Building app functionality
	1. Search input
	2. Results
	3. Pagination
	4. Sort controls
	5. Aggregations
2. Structure

		elasticsearch_course_code
			css
				app.css
				normalize.css
			data
			js
				vendor
					angular-sanitize.min.ms
					angular.js
					angular.min.js
					elasticsearch.angular.js // connector that elastic search provides giving us an easy way for searching and indexing etc...
				search-app.js
			.gitignore
			search.html

					<body ng-app="searchApp">

					</body>

3. search-app.js

		var searchApp = angular.module('searchApp', ['elasticsearch']);

		searchApp.controller('SearchResultsList', ['$scope', function () {
			$scope.hello = "Hello World!";
			
		}]);

4. search.html

		<body ... ng-controller="SearchResultsList">
			{{hello}}
		</body>

### Displaying Results ###
1. HTML template for results and search fields
2. search.html

		<div class="search-form">
			<form ng-submit="search()">
				<input type="text" placeholder="Search for boks" class="search-input">
				<input type="submit" value="Search" class="search-submit">
			</form>

			<section>
				<h1 class="search-title">
					Results
				</h1>

				<ul>
					<li ng-repeat="book in results.documents">
						<strong>{{book.title}}</strong>
						<p>{{book['detailded descriptoin']}}</p>
					</li>
				</ul>
			</section>	
		</div>

3. search-app.js

		$scope.results = {
			documents: ["Hello ..."]
		};

		searchSearvice.search().then(function(es_return) {
			$scope.results.documents = searchService.foratResults(es_return.hits.hits);
		})
		...
		searchApp.controller(..., 'searchService', function($scope, ...)
		...

		searchApp.service('searchService', ['$q', 'esFactory', function($q, esFactory)]) {
			var esClient = esFactory({
				location: 'localhost:9200'
			});

			this.search = function () {
				var deferred = $q.defer();

				esCleint.search({
					index: 'library',
					body: {
						query: {
							match_all: {}
						}
					}
				}).then(function(es_return) {
					deferred.resolve(es_return);
				}, function(error) {
					deferred.reject(error);
				});

				return deferred.promise;
			};

			this.formatResults = function (documents) {
				var formattedResults = [];

				documents.forEach(function (document) {
					formattedResulsts.push(document._source);
				});	

				return formattedResults;
			};
		}]);

### Searching ###
1. Searching for specific keywords with the app
2. search.html

		<input type="text" ng-model="searchTerms" ...>

3. search-app.js

		$scope.searchTerms = null;
		$scope.noResults = false;
		$scope.isSearching = false;
		$scope.resultsPage = 0;

		$scope.results = {
			searchTerms: null,
			documentCount: null,
			documents: [];
		}

		$scope.search = function () {

			resetResults();
			var searchTerms = $scope.searchTerms;

			if (searchTerms) {
				$scope.results.searchTerms = searchTerms;
			} else {
				return;
			}

			getResults();
		};

		// Results
		var resetResults = function () {
			$scope.results.documents = [];
			$scope.results.documentCount = null;

			$scope.resultsPage = 0;
			
			$scope.noResults = false;
		}
		
		$scope.getNextPage = function () {
			$scope.resultsPage++;
			getResults(); // we don't have to reset results
		}
		
		$scope.$watchGroup(['results', 'noResults', 'isSearching'], function () {
			var documentCount = $scope.results.documentCount;
			
			if (!documentCount || documentCount <= $scope.results.documents.length || $scope.noResults || $scope.isSearching) {
				$scope.canGetNextPage = false;
			} else {
				$scope.canGetNextPage = true;
			}
		}); // to observe multiple state properties in return of value whenever they are changed

		var getResults = function () {
			$scope.isSearching = true;

			searchService.search($scope.results.searchTerms, $scope.resultsPage).then(function (es_return) {
				var total_hits = es_return.hits.total;

				if (totalHits > 0) {
					//setTimeout(function() {
						$scope.results.documentCount = totalHits;
						$scope.results.documents.push.apply($scope.results.documents, searchService.formatResults(es_return.hits.hits));
					//}, 300);
				} else {
					$scope.noResults = true;
				}					

				$scope.isSearching = false;
			},
			function (error) {
				console.log('Error: ', error.message);
				$scope.isSearching = false;
			});
		}
		...
		this.search = function (searchTerms, resultsPage) {
			...
			esClient.search([
				index: 'library',
				body: {
					query: {
						match: {
							_all: searchTerms
						}
					}
				},
				from: resultsPage * 10
			]);
		}

		...

		<section class="results">
			<h1 class="search-title">
				Results for <strong>{{results.searchTerms}} ({{results.documentCount}})</strong>
			</h1>

			<p ng-if="noResults" class="no-results">No results were found for your search.</p>
		
			...
		
			<button ng-click="getNextPage()" ng-if="canGetNextPage" class="load-next">Load More Results</button>
		
			<div class="throbber" ng-if="isSearching">
				SEARCHING &hellip;
			</div>


## The Advanced Search Functionality ##
### Highlighting ###
1. In this section, we are going to take a look at...
	1. Adding highlighted snippets to our results
	2. Sorting the results by changing the field for the same
	3. Grouping results into aggregations
2. 

### Sorting ###
### Aggregations ###

## Adding the Autocomplete Functionality ##
### Term Suggestions ###
### Phrase Suggestions ###
### Autocomplete with Results ###

## Finishing Up ##
### Relevancy Tuning ###
### Deployment ###
### Security ###
