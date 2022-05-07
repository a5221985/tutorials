# PySpark Documentation #
## Introduction ##
1. PySpark - interface for Apache Spark in Python
	1. Provides
		1. Python APIs
		2. PySpark shell - used for interactively analyzing data in distributed environment
	2. Supports
		1. Spark SQL
		2. DataFrame
		3. Streaming
		4. MLib (Machine Learning Library)
		5. Spark Core

## Spark SQL and DataFrame ##
1. Spark SQL - Spark module - for structured data processing
	1. Provides programming abstraction called DataFrame
	2. Also a distributed SQL query engine

## Streaming ##
1. Runs on top of Spark
2. The feature allows interactive and analytical applications across streaming and historical data (with Spark's ease of use and fault tolerance characteristics)

## MLib ##
1. Runs on top of Spark
2. Scalable machine learning library
3. Provides a set of APIs
	1. Helps creation and tuning of machine learning pipelines

## Spark Core ##
1. It is underlying general execution engine for Spark platform
2. All other functionality is built on top of Spark Core
3. Provides
	1. RDD - Resilient Distributed Dataset (?)
	2. In-memory computing capabilities
	
# Getting Started #
## Introduction ##
1. Basic steps to setup and get started
2. More:
	1. [Quick Start](https://spark.apache.org/docs/latest/quick-start.html)
	2. [Spark Documentation](https://spark.apache.org/docs/latest/index.html#where-to-go-from-here)

## Installation ##
### Python Version Supported ###
1. >= Python 3.6

### Using PyPI ###

	pip install pyspark
	
	1. Extra dependencies
	
		pip install pyspark[sql]

### Using Conda ###
### Manually Downloading ###
### Installing from Source ###
### Dependencies ###
## Quickstart ##
1. PySpark DataFrame API
	1. DataFrames are lazily evaluated
	2. DataFrames are implemented on top of RDDs
		1. RDD - Collection of elements partitioned across the nodes of the cluster that can be operated on in parallel
			1. Created by starting with a file in Hadoop file system (or other Hadoop supported file system) or Scala collection in driver program and transforming it.
	3. [transform](https://spark.apache.org/docs/latest/rdd-programming-guide.html#transformations) on data does not immediately get computed but is planned as to how to compute it later
		1. [action](https://spark.apache.org/docs/latest/rdd-programming-guide.html#actions) - `collect()` say explicitly starts the computation
	4. Basic usage of DataFrame
		1. [here](https://mybinder.org/v2/gh/apache/spark/master?filepath=python%2Fdocs%2Fsource%2Fgetting_started%2Fquickstart.ipynb)
2. [Spark SQL and DataFrames](https://spark.apache.org/docs/latest/sql-programming-guide.html)
3. [RDD Programming Guide](https://spark.apache.org/docs/latest/rdd-programming-guide.html)
4. [Structured Streaming Programming Guide](https://spark.apache.org/docs/latest/structured-streaming-programming-guide.html)
5. [Spark Streaming Programming Guide](https://spark.apache.org/docs/latest/streaming-programming-guide.html)
6. [Machine Learning Library (MLIB) Guide](https://spark.apache.org/docs/latest/ml-guide.html)
7. Application starts with initializing `SparkSession`
	1. `SparkSession` - it is entry point of PySpark
		1. To run in pyspark shell via pyspark executable
			1. Shell automatically instantates `spark` variable with the session
			
					from pyspark.sql import SparkSession
					spark = SparkSession.builder.getOrCreate()

### DataFrame Creation ###
1. 

### Viewing Data ###
### Selecting and Accessing Data ###
### Applying a Function ###
### Grouping Data ###
### Getting Data in/out ###
### Working with SQL ### 