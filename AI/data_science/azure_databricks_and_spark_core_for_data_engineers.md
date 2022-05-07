# Azure Databricks & Spark Core for Data Engineers #
## Introduction ##
### Course Introduction ###
1. Azure Databricks
	1. Spark based
	2. Unified data analytics platform
	3. Optimized for Azure Cloud
2. Spak
	1. PySpark
	2. Spark SQL
3. Delta Lake
	1. Lakehouse architecture
4. Azure Data Lake Storage Gen2
	1. Data lake service
		1. For reading and writing to data lake 
5. Azure Data Factory
	1. For constructing, scheduling and monitoring data pipelines
		1. For data bricks notebooks
6. Azure Key Vault
7. PowerBI
	1. BI Reports
8. Formula1 Cloud Data Platform

		Ergast API -> ADLS Raw Layer - Ingest -> ADLS Ingested Layer - Transform -> ADLS Presentation Layer - Analyze (trends) -> Databricks
		- Report -> Power BI
		
	1. The process is scheduled and triggered by Azure Data Factory (ADF) Pipelines
	2. Insert ADLS (Azure Data Lake S)
	
			Ergast API -> ADLS Raw Layer (Data Lake) - Ingest -> ADLS Ingested Layer (Data Lake) - Transform -> ADLS Presentation Layer (Data Lake) - Analyze (trends) -> Databricks
			- Report -> Power BI
			
9. Who is this course for?
	1. University students
	2. IT Developers from other disciplines
	3. AWS/ GCP/ On-prem Data Engineers
	4. Data Architects
10. Who is this course not for?
	1. You are not interested in hands-on learning approach
	2. Your only focus is Azure Data Engineering Certification
		1. DP2 or DP3 - the course is not sufficient
	3. You want to learn Spark ML or Streaming - not here
	4. You want to Learn Scala or Java - not here but can be re-used
11. Pre-requisites
	1. All code and step-by-step instructions provided
	2. Basic Python programming knowledge required
	3. Basic SQL knowledge required
	4. Cloud fundamentals will be beneficial, but not mandatory
	5. Azure Account

### Course Structure ###
1. Overview
	1. Azure Portal
	2. Azure Databricks
	3. Project Overview
	4. Spark Overview
2. Topics
	1. Databricks
		1. Clusters
		2. Notebooks
		3. DBFS
		4. Jobs
	2. Spark (Python)
		1. Data Ingestion
		2. Data Ingestion 2
		3. Data Ingestion 3
		4. Transformation
		5. Aggregation
		6. Incremental Load
	3. Spark (SQL)
		1. Temp Views
		2. DDL
		3. DML
		4. Analysis
		5. Incremental Load
	4. Delta Lake
		1.Delta Lake (Lakers architecture)
	5. Orchestration
		1. Azure Data Factory
		2. Connecting Other Tools

### Course Materials Download ###
### Useful Links ###
1. [Azure Databricks Course Slide Deck](https://www.udemy.com/course/azure-databricks-spark-core-for-data-engineers/learn/lecture/27514578#overview)
2. Useful links:
	1. Azure Portal: [Azure Portal](https://portal.azure.com/)
	2. Ergast API Documentation: [Ergast API Documentation](http://ergast.com/mrd/)
	3. PySpark Documentation: [PySpark Documentation](https://spark.apache.org/docs/latest/api/python/index.html)
	4. PySpark API Reference: [PySpark API Reference](https://spark.apache.org/docs/latest/api/python/reference/index.html)
	5. Spark SQL Reference: [Spark SQL Reference](https://spark.apache.org/docs/latest/sql-ref.html)

## Azure Subscription (Optional) ##
### Constructing Azure Free Account ###
### Azure Portal Overview ###

## Azure Databricks Overview ##
### Introduction to Azure Databricks ###
1. Azure Databricks
	1. Core - Apache Spark - Distributed Compute Processing Engine
		1. For big data projects
	2. Databricks - provided by founders of Spark
		1. Provides necessary management layers to make to easier to work with Spark
	3. Microsoft makes Databricks available in it's cloud platform - first party service
2. Apache Spark
	1. Apache Spark is a lightning-fast unified analytics engine for big data processing and machine learning
		1. UC Berkeley
	2. Used by Netflix, Yahoo, Ebay, ...
	3. 100% Open source under Apache License
	4. Simple and easy to use APIs
	5. Built to address shortcomings of Hadoop
	6. In-memory processing engine - 100 times faster than hadoop
	7. Runs on Distributed computing platform
	8. Unified engine which supports SQL, streaming, ML and graph processing
		1. Increases productivity
		2. Combined for complex workflows
3. Apache Spark Architecture
	1. Spark Core (scheduling tasks, memory management, fault recovery, communication with storage, ...)
		1. Scala
		2. Python
		3. Java
		4. R
		5. Resilient Distributed Dataset (RDD) - Programming abstraction API
			1. Collection of items distributed across various compute nodes to be processed in parallel
	2. Spark provides APIs to construct and manipulate RDD collections
	3. To optimize work load, Spark SQL Engine was introduced
		1. Catalyst Optimizer - converts computational query to highly efficient execution plan
		2. Tungsten - memory management and CPU efficiency
	4. Components - To make it easy to develop applications
		1. Spark SQL
		2. Spark Streaming
		3. Spark ML
		4. Spark Graph
		5. DataFrame/ Dataset APIs (higher level APIs)
	5. Spark comes with Standalone resource manager
		1. We can choose
			1. Yarn
			2. Apache Mesos
			3. Kubernetes
	6. Spark provides unified platform for streaming, batch processing, ... using single execution engine and standard set of APIs
4. Databricks - makes it easier to work with Spark on the cloud
	1. Spin up clusters with few clicks
	2. Choose a runtime - ML libraries, support for GPU
	3. Choose Compute optimized, Memory optimized, or GPU enabled 
	4. Provides Jupiter Notebook style IDE with additional capabilities
		1. Collaboration
		2. Intgration with Git
		3. Admin controls - workspace, cluster, ...
	5. Optimized Spark (5x faster) - than venella
	6. Databases/Tables
	7. Delta Late (ACID)
	8. SQL Analytics
		1. Provides data analyst SQL based analytics environment
			1. Dashboard
				1. Schedule refresh
	9. Managed ML Flow
		1. Manage machine learning lifecycle
5. Azure's integration is deaper for Databricks
	1. Support requests are handled by Microsoft
	2. Unified Azure Portal + Unified Billing
	3. Azure Active Directory
	4. High speed connectors & seamless integration with
		1. Azure Data Lake
		2. Azure Blob Storage
		3. Azure Cosmos DB
		4. Azure SQL Database
		5. Azure Synapse
	5. Messaging Services
		1. Azure IoT Hub
		2. Azure Event Hub
	6. Power BI
	7. Azure ML
	8. Azure Data Factory
	9. Azure Dev Ops
		1. CI/CD

### Constructing Azure Databricks Service ###
1. Goto portal
2. Search for Azure Databricks
3. Click Create
4. Subscription: choose one
5. Resource Group: New
6. Region: Closest
7. Pricing Tier: Standard
8. Next
	1. Select No for both (take off public IP, Specify vNet)
9. Advanced
	1. Enable second level of encryption
10. No tags
11. Review and Select Create
12. Go to Resource
13. Pin the service onto dashboard
	1. Databricks Course Dashboard
14. Click **Launch Workspace**
15. Logs in using AAD
16. Home screen
	1. Common Tasks
		1. Notebooks
	2. Import
	3. Blank Notebook
17. Left side > Workspace

### Recent Changes to the Azure Databricks UI ###
### Azure Databricks Architecture Overview ###
### Project Solution Databricks Notebooks ###

## Databricks Clusters ##
### Section Overview ###
### Azure Databricks Cluster Types ###
### Azure Databricks Cluster Configuration ###
### Constructing Azure Databricks Cluster ###
### Azure Databricks Cluster Pool ###

## Databricks Notebooks ##
### Section Overview ###
### Azure Databricks Notebooks Introduction ###
### Magic Commands ###
### Databricks Utilities ###

## Mounting Data Lake Container to Databricks ##
### Section Overview ###
### Databricks File System (DBFS) ###
### Constructing Azure Overview ###
### Constructing Azure Data Lake Storage Gen2 ###
### Secret Scopes Overview ###
### Constructing Secret Scope and Secrets in Key Vault ###
### Mounting Data Lake Using Secrets ###

## Formula1 Project Overview ##
### Section Overview ###
### Formula1 Data Overview ###
### Upload Formula1 Data to Data Lake ###
### Project Requirement Overview ###
### Solution Architecture Overview ###

## Spark Introduction ##
### Spark Cluster Architecture ###
### Dataframe & Data Source API Overview ###

## Data Ingestion - CSV ##
### Data Ingestion Overview ###
### Circuits File - Requirements ###
### Circuits File - Dataframe Reader ###
### Circuits File - Specify Schema ###
### Circuits File - Select Columns ###
### Circuits File - WithColumnRenamed ###
### Circuits File - WithColumn ###
### Circuits File - Dataframe Write ###
### Races File - Requirements ###
### Races File - Spark Program (Asignment) ###
### Races File - Partitioning ###

## Data Ingestion - JSON ##
### Constructors File - Requirements ###
### Constructors File - Read Data ###
### Constructors File - Tranform & Write Data ###
### Drivers File - Requirements ###
### Drivers File - Spark Program ###
### Results File - Requirements ###
### Results File - Spark Program (Assignment) ###
### Pitstops File - Requirements ###
### Pitstops File - Spark Program ###

## Data Ingestion - Multiple Files ##
### Lap Times - Requirements ###
### Lap Times - Spark Program ###
### Qualifying - Reqiurements ###
### Qualifying - Spark Program (Assignment) ###

## Databricks Workflows ##
### Section Overview ###
### Including a Child Notebook ###
### Passing Parameters to Notebooks ###
### Notebook Workflows ###
### Databricks Jobs ###

## Filter & Join Transformations ##
### Section Overview ###
### Filter Transformation ###
### Join Transformation - Inner Join ###
### Join Transformation - Outer Join ###
### Join Transformation - Semi, Anti & Cross Joins ###
### Join Race Results - Requirement ###
### Set-up Presentation Layer (Assignment) ###
### Join Race Results - Solution (Assignment) ###

## Aggregations ##
### Section Overview ###
### Simple Aggregate Functions ###
### Group By ###
### Window Functions ###
### Driver Standings ###
### Constructor Standings (Assignment) ###

## Using SQL in Spark Applications ##
### Local Temp View ###
### Global Temp View ###

## Spark SQL - Databases/Tables/Views ##
### Spark SQL - Introduction ###
### Databases ###
### Managed Tables ###
### External Tables ###
### Views ###
### Formula1 Project SQL Requirement ###
### Construct Table - CSV Source ###
### Construct Table - JSON Source ###
### Construct Table - Multi Files Source ###
### Construct Table - Parquet Source (Processed Data) ###
### Construct Table - Parquet Source (Presentation Data) - Asignment ###

## Spark SQL - Filters/Joins/Aggregations ##
### Section Overview ###
### SQL DMS Basics ###
### SQL Simple Functions ###
### SQL Aggregates/ Window Functions ###
### SQL Joins ###

## Spark SQL - Analysis ##
### Introduction ###
### Create Race Results Table ###
### Dominant Drivers - Analysis ###
### Dominant Teams - Analysis ###
### Dominant Drivers - Visualisation ###
### Dominant Teams - Visualisation ###
### Construct Dashboards - Drivers ###
### Construct Dashboards - Teams ###

## Incremental Load ##
### Section Overview ###
### Data Loading Design Patterns ###
### Formula1 Project Scenario ###
### Formula1 Project Data Set-up ###
### Full Refresh Implementation ###
### Incremental Load - Method 1 ###
### Incremental Load - Method 2 ###
### Incremental Load Improvements - Assignment ###
### Incremental Load Improvements - Solution ###
### Incremental Load - Notebook Workflows ###
### Incremental Load - Race Results ###
### Incremental Load - Driver Standings ###
### Incremental Load - Constructor Standings (Assignment) ###

## Delta Lake ##
### Section Overview ###
### Pitfalls of Data Lakes. ###
### Data Lakehouse Architecture ###
### Read & Write to Delta Lake ###
### Updates and Deletes on Delta Lake ###
### Merge/Upsert to Delta Lake ###
### History, Time Travel, Vacuum ###
### Delta Lake Transaction Log ###
### Convert from Parquet to Delta ###
### Data Ingestion - Circuits File ###
### Data Ingestion - Results File ###
### Data Ingestion - Results File Improvements ###
### Data Ingestion - All Other Files (Assignment) ###
### Data Ingestion - Fix Duplicates In Results Data ###
### Data Transformation - All PySpark Notebooks ###
### Data Transformation - SQL Notebook ###

## Azure Data Factory ##
### Section Overview ###
### Azure Data Factory Overview ###
### Create Azure Data Factory Service ###
### Azure Data Factory Components ###
### Construct Pipeline - Circuits File Ingestion ###
### Debugging a Pipeline ###
### Update Pipeline - Ingest All Other Files ###
### Improve Pipeline - Handle Missing Files ###
### Construct Pipeline - Transformation Notebooks ###
### Construct ADF Trigger ###

## Connect to Other Services ##
### Power BI ###

## Next Steps ##
### Good Luck ###
### Bonus Lecture ###