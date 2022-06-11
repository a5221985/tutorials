# How to Monitor Elasticsearch Performance #
## What is Elasticsearch? ##
### The Elements of Elasticsearch ###
### How Elasticsearch Organizes Data ###
## Key Elasticsearch Performance Metrics to Monitor ##
1. Issues with ES:
	1. Unreliable Nodes
	2. Out-of-Memory Errors
	3. Long Garbage Collection Times
2. Areas to monitor
	1. Search and Indexing performance
	2. Memory and garbage collection
	3. Host-level system and network metrics
	4. Cluster health and node availability
	5. Resource saturation and errors
3. [Monitoring 101 Series](https://www.datadoghq.com/blog/monitoring-101-collecting-data/) - For metrics terminology
	1. A framework for metric collection and alerting
4. **All the metrics [identified] are accessible via ES API** + **ES Marvel (single purpose monitoring tool)** + Datadog (Monitoring service)
	1. [Part 2 to find out how to collect the metrics](https://www.datadoghq.com/blog/collect-elasticsearch-metrics/)

### Search Performance Metrics ###
1. ES provides following metrics that correspond to two phases of search process
	1. Query
	2. Fetch
2. Path of search from start to finish:
	1. Step 1 (Query phase): Client sends a request to a Node (Data Node or Master Node)
		1. The node automatically becomes the coordinating node (any node can act as coordinating node)
	2. Step 2 (Query phase): The node sends query to **a copy** of **every shard** in the **index**
		1. copy - Primary shard or Replica shard
	3. Step 3 (Query phase): Each shard runs query locally (against local Lucene engine) and delivers results to the coordinating node
		1. The coordinating node sorts + compiles the results into a **global priority queue**
	4. Step 4 (Fetch phase): Coordinating node finds out which docuements must be fetched, then sends multi GET request to relevant shards
	5. Step 5 (Fetch phase): Each shard loads documents and return the documents to the coordinating node
	6. Step 6 (Fetch phase): Coordinating node delivers search results to the client
3. **Monitor for query latency and take action if it surpasses a threshold**
	1. Minitor relevant metrics related to **query** and **fetch** to determine how **searches are performing over time**
4. Metrics to monitor:
	1. Total number of queries: `indices.search.query_total` (Metric type: Throughput)
	2. Total time spent on queries: `indices.search.query_time_in_millis` (Metric type: Performance)
	3. Number of queries currently in progress: `indices.search.query_current` (Metric type: Throughput)
	4. Total number of fetches: `indices.search.fetch_total` (Metric type: Throughput)
	5. Total time spent on fetches: `indices.search.fetch_time_in_millis` (Metric type: Performance)
	6. Number of fetches currently in progress: `indices.search.fetch_current` (Metric type: Throughput)

#### Search Performance Metrics to Watch ####
1. **Query Load**: Monitor **number of queries currently in progress**
	1. Tells **how many requests cluster is dealing with** at particular moment in time
		1. Can alert **unusual spikes** or **dips** that **might point to underlying problems**
	2. Monitor **size** of **search thread pool queue**
2. **Query latency**: ES does not explicitly provide this metric
	1. Use monitoring tools to **calculate average query latency**
		1. Done by **sampling** total number of queries & total elapsed time at regular intervals
			1. Can set alert if latency exceeds threshold
				1. If alert fires, look for **potential resource bottlenecks**
				2. Check if we can [optimize queries](https://www.datadoghq.com/blog/elasticsearch-performance-scaling-problems/)
3. **Fetch Latency**: Must typically take **less time than query phase**
	1. If this metric is consistently increasing, **problem might be with slow disks**
		1. [enriching of documents](https://www.elastic.co/guide/en/elasticsearch/guide/current/highlighting-intro.html) - **highlighting relevant text in search results**
		2. [requesting too many results](https://www.elastic.co/guide/en/elasticsearch/guide/current/pagination.html)

### Indexing Performance Metrics ###
1. If ES workload is **write-heavy**
	1. Monitor and analyze how **effectively we are able to update indices** with **new info**
2. If new info is added to an index or existing info is updated or deleted, **each shard** in index is updated via two processes:
	1. refresh
	2. flush
3. **Index refresh**
	1. Step 1: Documents are indexed in in-memory buffer (and wait from index refresh)
	2. Step 2: Index refresh occurs (once per second by default)
		1. Refresh process **constructs new in-memory segment** (in file-system cache) from **contents of in-memory buffer**
			1. This makes newly indexed docs **searchable**
	3. Step 3: Refresh process empties the buffer
	
### A Special Segment on Segments ###
1. Shards on index are composed of multiple **segments**
	1. Segment: A change set for index (core data structure of Lucene)
		1. Constructed with each **refresh**
		2. Merged together over time (in background)
			1. Done to ensure efficient use of resources
				1. **Each segment uses**
					1. **File handle**
					2. **Memory**
					3. **CPU**
		3. They are **mini** **inverted indices**
			1. Map of terms to documents that contain those terms
		4. If index is searched, primary OR replica of each shard is searched by in-turn searching **every segment** in a **shard**
		5. It is immutable
			1. How is a document updated?
				1. Writes info to new segment (during refresh process)
				2. Mark old info as deleted
				3. Delete info when outdated segment is merged with another segment

### Index Flush ###
1. When newly indexed documents are added to in-memory buffer, they are appended to shard's [translog](https://www.elastic.co/guide/en/elasticsearch/reference/current/index-modules-translog.html)
	1. Translog: A persistent, write-ahead transaction log of operations
		1. If 30 minutes or max size (512MB by default) is reached, **flush** is triggered
			1. **flush**: 
				1. Documents in in-memory buffer are refreshed (stored on new segments)
				2. All in-memory segments are committed to disk
				3. Translog is cleared
		2. **It prevents data loss if a node fails**
			1. It is designed to help shard recover operations that may have been lost **between** flushes
		3. **log is committed to disk every 5 seconds** or **upon each successful index, delete, update, or bulk request** (whichever occurs first) (CUD OR Bulk)
			1. Segments created and are merged within file-system cache (over time)
2. Metrics provided by ES to assess indexing performance & optimize the way we update indices
	1. Total number of documents indexed: `indices.indexing.index_total` (Metric type: Throughput)
	2. Total time spend indexing documents: `indices.indexing.index_time_in_millis` (Metric type: Performance)
	3. Number of documents currently being indexed: `indices.indexing.index_current` (Metric type: Throughput)
	4. Total number of index refreshes: `indices.refresh.total` (Metric type: Throughput)
	5. Total time spent refreshing indices: `indices.refresh.total_time_in_millis` (Metric type: performance)
	6. Total number of index flushes to disk: `indices.flush.total` (Metric type: Throughput)
	7. Total time spent on flushing indices to disk: `indices.flush.total_time_in_millis` (Metric type: performance)

## Indexing Performance Metrics to Watch ##
1. **Indexing latency**: ES does not expose this metric directly
	1. Monitoring tools can be used to calculate average indexing latency from
		1. `index_total` &
		2. `index_time_in_millis`
	2. If latency is **increasing**, we might be indexing too many docs at one time
		1. Start with bulk indexig size of 5 to 15 MBs and increase slowly from there
			1. If we want **lot of docs to be indexed** and **info not immediately available for search**
				1. Optimize for indexing performance over search performance (decrease **refresh frequency until indexing is done**)
					1. [Index settings API](https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-update-settings.html) - used to temporarily disable refresh interval
					
							curl -XPUT <nameofhost>:9200/<name_of_index>/_settings -d '{
								"index": {
									"refresh_interval": "-1"
								}
							}'
							
						1. Revert after indexing
							1. Refer to [Part 4](https://www.datadoghq.com/blog/elasticsearch-performance-scaling-problems/)
2. **Flush latency**: If this increases steadily, it can indicate **problem with slow disks**
	1. It can escalate and prevent adding new info to index
		1. Experiment by lowering `index.translog.flush_threshold_size` (in index flush settings)
			1. **How large a translog size can get before flush is triggered**
				1. Use `iostat` or Datadog Agent to see [disk IO metrics](https://www.datadoghq.com/blog/monitor-elasticsearch-performance-metrics/#host-metrics-to-watch) over time
					1. **Can upgrade disks if needed**

### Memory Usage and Garbage Collection ###
1. ES & Lucene use **all available RAM** on nodes in two ways
	1. **JVM heap**
	2. **File system cache**
2. ES runs in JVM
	1. **JVM GC duration and frequency needs to be monitored**

#### JVM Heap: A Goldilocks Tale ####
1. ES stresses JVM heap size to be "just right"
	1. It must not be too big
	2. It must not be too small
2. Recommendation: **< 50% of RAM to JVM Heap** & [never higher than 32 GB](https://www.elastic.co/guide/en/elasticsearch/guide/current/_limiting_memory_usage.html)
3. If heap is less, then more RAM is available for Lucene
	1. **Lucene relies on file system cache**
		1. **To serve requests quickly**
4. If heap size is too less, out-of-memory errors or **reduced throughput** (constant short pauses from **frequent** GCs)
	1. [Guide](https://www.elastic.co/blog/a-heap-of-trouble) - ES core Engineers have written
		1. **Use the guide to determine the correct heap size**
5. ES default heap size - 1 GB
	1. Too small for many use cases
		1. How to set heap size:
		
				export ES_HEAP_SIZE=10g
				
			1. Restart ES
		2. Another option to set heap size:
		
				ES_HEAP_SIZE="10g" ./bin/elasticsearch
				
6. Check that heap size is successfully set:

		curl -XGET http://<nameofhost>:9200/_cat/nodes?h=heap.max

#### Garbage Collection ####
1. [Guide on JVM garbage collection](https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/cms.html)
2. GC uses **resources** to free up **resources**
	1. Monitor for **frequency of GC** and **duration of GC**
		1. Adjust heap size if required based on the above parameters
			1. If heap size is **too large** - **long GC times**
				1. **long pauses can cause cluster to register nodes as having dropped off**
3. Metrics available:
	1. Total count of young-generation garbage collections: `jvm.gc.collectors.young.collection_count`
	2. Total time spent on young-generation garbage collections: `jvm.gc.collectors.young.collection_time_in_millis`
	3. Total count of old-generation garbage collection: `jvm.gc.collectors.old.collection_count`
	4. Total time spent on old-generation garbage collection: `jvm.gc.collectors.old.collection_time_in_millis`
	5. Percent of JVM heap currently in use: `jvm.mem.heap_used_percent` (Metric type: Resource: Utilization)
	6. Amount of JVM heap committed: `jvm.mem.heap_committed_in_bytes` (Metric type: Resource: Utilization)

#### JVM Metrics to Watch ####
1. **JVM Heap in Use**: ES is setup to initiate GC whenever JVM **heap usage hits 75%** (say)
	1. Setup alerts to find out if any node is consistently using over 85% heap memory
		1. Why? Rate of GC may not be keeping up with rate of garbage creation
			1. Solutions:
				1. **Increase heap size** OR
				2. **Scale out cluster** by **adding more nodes**
2. **JVM Heap Used vs. JVM Heap Committed**:
	1. Committed memory: The amount of memory that is guaranteed to be available
		1. Heap memory **in use** will take on **sawtooth** pattern that **rises when garbage accumulates** and **dips when garbage is collected**
			1. If pattern is **skewing upward over time**
				1. **Rate of GC is not keeping up with rate of object creation**
					1. Slow GCs and eventually **OutOfMemoryErrors**
3. **Garbage Collection Duration and Frequency**:
	1. Young and old-generation GCs undergo "stop the world" phases (JVM halts execution of program to collect dead objects)
		1. During this phase, node cannot complete any tasks
			1. Primary node checks status of every other node **every 30 seconds**
				1. **If node's GC time exceeds 30s, it will lead primary to assume that node has failed**
	2. **Memory Usage**
		1. ES uses RAM **not allocated to JVM heap**
			1. ES relies on **OS file system cache** to serve requests quickly and reliably
		2. How to know if ES is successfully reading file system cache?
			1. **If segment file is recently written to disk by ES, it is in cache**
			2. **If**
				1. Node has been shut off and rebooted OR 
				2. First time a segment is queried
					1. info will likely have to be **read from disk**
						1. **Hence make sure cluster is stable** and **nodes do not crash**
		3. Monitor memory usage of nodes
			1. [Give ES as much RAM as possible](https://www.elastic.co/blog/found-elasticsearch-in-production#memory)
				1. Why? To leverage speed of file system cache (and doesn't run out of space)

4. Host-level Network metrics and system metrics
	1. Available disk space (Metric type: Utilization)
	2. I/O Utilization (Metric type: Utilization)
	3. CPU Usage (Metric type: Utilization)
	4. Network bytes sent/received (Metric type: Utilization)
	5. Open file descriptors (Metric type: Utilization)
5. ES provides application-specific metrics via API
6. Monitor host-level metrics from each node

#### Host Metrics to Alert On ####
##### Disk Space: #####
1. **Important if ES is write heavy**
	1. If we run out of disk space, we won't be able to insert or update anything and node will fail
		1. Use [Curator](https://github.com/elastic/curator) to **delete certain indices residing on node** that are **taking too much disk space**
			1. **Alternative solution**: **Add more nodes**
				1. Primary node will take care of automatically re-distributing shards across the new nodes (**additional work for a busy primary node**)
	2. Documents with analyzed fields (tokenized, punctuation removed, ...) take more disk space than docs with non-analyzed fields (exact values)

#### Host Metrics to Watch ####
1. **I/O Utilization**:
	1. When **segments** are **created**, **queried** and **merged** ES does a lot of **writing to and reading from disk**
		1. For **write-heavy** clusters with nodes experiencing **heavy I/O** activity
			1. ES recommends using **SSDs** to boost performance
2. **CPU Utilization on Nodes**
	1. We can visualize CPU usage in a [heat map](https://www.datadoghq.com/blog/timeseries-metric-graphs-101/#heat-maps) **for each node types**
		1. Three different graphs for each group of nodes in cluster
			1. Data nodes
			2. Primary-eligible nodes (Master-eligible nodes)
			3. Client nodes
		2. **Monitor if one node is overloaded with activity in comparison to another**
			1. Reason of increase in CPU usage:
				1. **heavy search** OR
				2. **heavy indexing**
	2. Setup **notification** to find out if **nodes' CPU usage is consistently increasing**
		1. Solution: **Add more nodes to redistribute load if needed**
3. **Network bytes sent/received**
	1. Nodes **commmunicate** with **each other**
		1. Required for **balanced cluster**
	2. **Monitor network for health**
		1. Network keeps up with **demands on cluster** (shards getting replicated, shards re-balanced across nodes)
		2. How to monitor?
			1. **ES transport metrics about cluster communication**
			2. **Rate of bytes sent or received**
				1. Tells how much traffic the network is receiving
4. **Open File Descriptors**
	1. **File descriptors** - used for 
		1. **node-to-node communication**
		2. **Client connections**
		3. **File operations**
	2. If the number of **open file descriptors** reaches system's max capacity:
		1. **New connections** and **file operations** are not possible until **old file descriptors** are closed
			1. **If > 80% of file descriptors are in used**
				1. **Increase system's max file descriptor count**
					1. Linux ships with only 1,024 file descriptors per process
						1. **For ES** [reset OS file descriptor count](http://docs.oracle.com/cd/E23389_01/doc.11116/e21036/perf002.htm) **to a number larger than** 64,000
	3. Metrics to consider:
		1. Number of HTTP connections currently open: `http.current_open` (Metric type: Resource: Utilization)
		2. Total number of HTTP connections opened over time: `http.total_opened` (Metric type: Resource: Utilization)
5. [If total number of opened HTTP connections is constantly increasing](https://www.elastic.co/guide/en/elasticsearch/guide/2.x/_monitoring_individual_nodes.html)
	1. **HTTP clients are not establishing** [persistent connections](https://www.elastic.co/blog/found-interfacing-elasticsearch-picking-client)
		1. Re-establishing connections adds extra milliseconds or seconds to response time
			1. **Configure clients to avoid negative impact on performance**
				1. Alternative: [Elasticsearch clients](https://www.elastic.co/guide/en/elasticsearch/client/index.html) (**it has properly configured HTTP connections**)

### Cluster Health and Node Availability ###
1. Health and Node availability metrics to consider:
	1. Cluster status (green, yellow, red): `cluster.health.status`
	2. Number of nodes: `cluster.health.number_of_nodes` (Metric type: Resource: Availability)
	3. Number of initializing shards: `cluster.health.initializing_shards` (Metric type: Resource: Availability)
	4. Number of unassigned shard: `cluster.health.unassigned_shards` (Metric type: Resource: Availability)
2. **Cluster Status**:
	1. **yellow**: at least one replica shard is un-allocated or missing
		1. Search works
			1. If we lose more shards, we may lose **data**
	2. **red**: at least one primary shard is missing
		1. **We are missing data**
			1. **Searches will return partial results only**
			2. **Indexing into the shard will be blocked**
	3. How to set alerts:
		1. [Set up alert](https://www.datadoghq.com/product/platform/alerts/) to trigger if
			1. status is yellow for > 5 min
			2. status is red for > 1 min
3. **Initializing and Unassigned Shards**:
	1. Initializing shards: (transitions to "started" state or "un-assigned" state)
		1. When index is **created**
		2. When node is **rebooted**
	2. **If shards are in initializing or unassigned state for long time**
		1. Warning that cluster is **unstable**

### Resource Saturation and Errors ###
1. ES nodes use thread pools to manage how threads consume memory and CPU
	1. Thread pool settings are **automatically** configured based on **number of processors**
2. Monitor for **queues** and **rejections**
	1. **Nodes are not able to keep up**
		1. **Add more nodes to handle concurrent requests**
3. Monitor for **Fielddata** and **Filter cache**
	1. Look for **evictions**
		1. Possibly due to **inefficient queries** and **memory pressure**

#### Thread Pool Queues and Rejections ####
1. **Each node** maintains main **thread pools**
	1. Which thread pool to monitor?
		1. **Depends on ES usage**
2. Most important **thread pools** to monitor:
	1. **search**
	2. **merge**
	3. **bulk** (**write** thread pool (depends on version))
		1. 6.3.x+ - bulk is known as write thread pool
			1. Used for the following operations for single doc or many docs
				1. **writes**
				2. **updates**
				3. **deletes**
3. Each thread pool's **queue** represents the **number of requests waiting** to be **served** (because node is at capacity)
	1. Node can eventually track and serve the requests in the queue
		1. **Thread pool rejections happen** when **thread pool's max queue size** is reached
4. Metrics to monitor:
	1. Number of queued threads in thread pool: (Metric type: Resource: Saturation)
		1. `thread_pool.search.queue`
		2. `thread_pool.merge.queue`
		3. `thread_pool.write.queue` (or `thread_pool.bulk.queue` prior to version 6.3.x)
		4. `thread_pool.index.queue` (prior to version 6.3.x)
	2. Number of rejected threads in a thread pool:
		1. `thread_pool.search.rejected`
		2. `thread_pool.merge.rejected`
		3. `thread_pool.write.rejected` (or `thread_pool.write.rejected` prior to version 6.3.x)
		4. `thread_pool.index.rejected*` (prior to version 6.3.x)
		
## Metrics to Watch ##
### Thread Pool Queues ###
1. **Problem with large queues**
	1. They use up resources
	2. They increase risk of losing requests
		1. How? If node goes down
2. **If number of queued & rejected threads increase steadily**
	1. **Slow down the rate of requests** (if possible)
	2. Alternative solution: **increase number processors on nodes**
	3. **Alternative solution**: **increase number of nodes in cluster**
3. **Query load spikes** can correlate with **spikes in search thread pool queue size**
	1. **Node attempts to keep up with rate of query requests**
	
### Bulk Rejections and Bulk Queues ###
1. **Bulk operations** - way to send many requests at one time
	1. Supports many actions at once:
		1. **creation of index**
		2. **add documents**
		3. **update documents**
		4. **delete documents**
	2. **Send requests in bulk** instead of as **individual requests**
2. **Bulk rejections** - usually when we try to index too many docs in one **bulk request**
	1. [Elasticsearch's docuementation](https://www.elastic.co/guide/en/elasticsearch/guide/current/_monitoring_individual_nodes.html) - Not to worry about
		1. But **try to implement linear or exponential backoff strategy** to efficiently deal with bulk rejections (?)

### Cache Usage Metrics ###
1. Each **query** request is sent to **every shard** in the index
	1. The query hits **every segment** of **each shard** in the index
		1. **ES caches queries on per-segment basis to speed up response time** (?)
			1. Problem: **If caches hot too much heap, cache may slow down instead of speeding up**
2. In ES, each field can be stored in one of two forms:
	1. Exact value (stored exactly the way it was indexed - format of data query may not change say from 1/1/16 to "January 1st, 2016") OR
		1. Timestamp
		2. Year
	2. Full text
		1. The field is analyzed
			1. **Broken down into tokens**
			2. **Punctuation and stop words like "is", or "the" are removed** (depends on analyzer)
			3. **Field is converted to normalized format**
				1. To match wide range of queries
		2. Example: Consider that an index has type called `location`
			1. Each doc of type `location` might contain field `city`
				1. If it is stored as analyzed string:
					1. If two docs has "St. Louis" and "St. Paul"
						1. Each string is lowercased
						2. Each string is transformed into tokens
						3. Punctuations are removed
				2. Terms are stored in inverted index as follows:
				
						Term	Doc 1	Doc 2
						st		x		x
						louis	x
						paul			x
						
					1. If we search for "st", we should get Doc 1 and Doc 2 in the result
3. ES uses **two types of caches** to serve **search requests** quickly
	1. **fielddata** cache
	2. **filter** cache

## Fielddata Cache ##
1. Used when **sorting** or **aggregating** on a field
	1. How is it done?
		1. **Uninvert** the inverted index
			1. Constructs an array of every field value per field (in document order)
				1. Example: To find unique terms in any document that contained "st"
					1. Scan inverted index to see which docs contain that term (both Doc 1 and Doc 2)
					2. For each doc found go through every term in the index to collect tokens from that doc
					
							Doc		Terms
							Doc 1	st, louis
							Doc 2	st, paul
							
					3. Compile unique tokesn from each of the docs as follows:
						1. st, lous, paul
			2. This process consumes **a lot of heap memory** (especially with large number of docs and terms)
				1. **All field values are loaded into memory**
2. ES has added fielddata **circuit breaker** that is triggered if query tries to load fielddata that would require over **60% of heap**

## Filter Cache ##
1. These caches also use JVM heap
	1. Used to store **filtered queries**
	2. ES optimizes filter cache
		1. Using frequency & segment size
			1. Caching occurs on segments if it has fewer than 10000 docs or < 3% of total docs in the index
2. Example:
	1. Filter query: return values in `year` field that fall in the range 2000-2005
		1. For the first time, ES constructs a bitset
			1. If a doc matches, bit is set to 1 or else 0
		2. Subsequent executions of queries with same filter will resuse the info
		3. If new docs are added or updated, bitset is updated
3. Metrics to look at:
	1. Size of fielddata cache (bytes): `indices.fielddata.memory_size_in_bytes` (Metric type: Resource: Utilization)
	2. Number of evictions from the fielddata cache: `indices.fielddata.evictions` (Metric type: Resource: Saturation)
	3. Size of filter cache (bytes) (only pre-version 2.x): `indices.filter_cache.memory_size_in_bytes` (Metric type: Resource: Utilization)
	4. Number of evictions from the filter cache (only pre-version 2.x): `indices.filter_cache.evictions` (Metric type: Resource: Saturation)

## Cache Metrics to Watch ##
1. **Fielddata cache evictions**:
	1. Fielddata evictions are **I/O intensive**
		1. If we are seeing **log of evictions** and we **cannot increase memory**
			1. **Limit fielddata cache to 20% of heap**
				1. In `config/elasticsearch.yml`
				2. If fielddata cache reaches 20% of heap, it will evict **least recently used** fielddata
					1. New fielddata can be loaded into the cache (after eviction)
	2. [doc values](https://www.elastic.co/guide/en/elasticsearch/guide/current/_deep_dive_on_doc_values.html) - These serve same purpose as fielddata
		1. **They are stored on disk** however
			1. **They do not rely on JVM heap**
		2. They **cannot be used for analyzed string fields**
		3. If ES version >= 2.0, doc values are built at document index time
			1. **Reduced fielddata/heap usage**
2. **Filter Cache Evictions**:
	1. Only if ES version < 2.0
	2. Each segment has it's own filter cache
		1. **Evictions are costlier on large segments as opposed to small segments** (difficult to assess the seriousness of evictions)
			1. Problem: If we see evictions occurring **more frequently**, this might be because we are not using **filters** to our advantage
				1. Defeats purpose of using a cache
					1. Solution: [using a bool query instead of and and/or/not filter](https://www.elastic.co/blog/all-about-elasticsearch-filter-bitsets)
3. Metrics to look at:
	1. Number of pending tasks: `pending_task_total` (Metric type: Resource: Saturation)
	2. Number of urgent pending tasks: `pending_tasks_priority_urgent` (Metric type: Resource: Saturation)
	3. Number of high-priority pending tasks: `pending_tasks_priority_high` (Metric type: Resource: Saturation)
4. **Pending tasks are only handled by primary nodes**
	1. **Creation of indices**
	2. **Assigning shards to nodes**
5. **Pending tasks are processed in priority order**
	1. **Urgent first**
	2. **High priority**
6. **Why do pending tasks accumulate?**
	1. **Number of changes occur more quickly than primary can process them**
		1. **Monitor if this metric increases**
			1. If primary node is very busy and pending tasks do not subside, it can cause unstable cluster

### Unsuccessful GET Requests ###
1. Metrics to consider:
	1. Total number of GET requests where document was missing: `indices.get.missing_total` (Metric type: Work: Error)
	2. Total time spent on GET requests where document was missing: `indices.get.missing_time_in_millis` (Metric type: Work: Error)
2. GET retrieves docs based on ID (unlike search)
	1. Unsuccessful GET requests => document ID was not found
3. This is a rare problem
	1. **Monitor for unsuccessful GET requests**

## Conclusion ##
1. Important areas to monitor:
	1. Search and indexing performance
	2. Memory and GC
	3. Host-level system and network metrics
	4. Cluster health and node availability
	5. Resource saturation and errors
2. Monitor
	1. ES Metrics
	2. Node-level system metrics
3. [Part 2](https://www.datadoghq.com/blog/collect-elasticsearch-metrics/) - how to collect and visualize ES metrics
4. [Part 3](https://www.datadoghq.com/blog/monitor-elasticsearch-datadog/) - how to monitor 
	1. ES metrics
	2. Request traces
	3. Logs
5. [Part 4](https://www.datadoghq.com/blog/elasticsearch-performance-scaling-problems/) - How to solve 5 common ES performance and scaling problems

## How to Collect and Visualize ES Metrics ##
1. Tools for metrics collection:
	1. Cluster health and performance APIs
	2. cat API for tabular data
	3. Dedicated monitoring tools (ElasticHQ, Kopf, Marvel)

### Elasticsearch RESTful API + JSON ###
1. RESTful API is used for:
	1. Indexing documents
	2. Updating cluster settings
	3. Submitting queries on the fly
	4. Getting snapshot of how cluster is performing (through certain data points)
2. ES API by default is exposed on port 9200
	1. JSON response is returned by default
3. There are 5 main HTTP APIs used to monitor ES:
	1. Node Stats API
	2. Cluster Stats API
	3. Index Stats API
	4. Cluster Health API
	5. Pending Tasks API
4. Certain metrics are exposed at multiple levels (index-level, node-level, ...)
5. Metrics category:
	1. Search performance metrics - Node stats API, Index stats API
	2. Indexing performance metrics - Node stats API, Index stats API
	3. Memory and garbage collection - Node stats API, Cluster stats API
	4. Network metrics - Node stats API
	5. Cluster health and node availability - Cluster health API
	6. Resource saturation and errors - Node-stats API, Index stats API, Cluster stats API, Pending tasks API

#### Node Stats API ####
1. Provides access to almost all metrics (except Cluster health, pending tasks)
2. Query:

		curl localhost:9200/_nodes/stats
		
	1. Output:
		1. Detailed info about every node running in cluster
	2. We can query **specific node**
		1. Specify ID, address, name or attribute of node
		2. Example: Querying two nodes by name:
		
				curl localhost:9200/_nodes/node1,node2/stats
				
			1. Name is in `node.name` in node's config file
3. Each node's metrics are divided into many sections:
	1. Largest section is: `indices`
		1. Contains detailed statistics gathered across **all indices stored on node**
	2. Key metrics:
		1. Query and Fetch Performance Metrics - `indices.search.*` metrics
		2. Indexing Performance Metrics - `indices.indexing.*`, `indices.refresh.*`, `indices.flush.*`
		3. Fielddata cache metrics (cache size and evictions)
	3. Other sections:
		1. `os`: OS resource usage (CPU, Memory, ...)
		2. `process`: ES JVM process resource usage (CPU, Memory, open file descriptors, ...)
		3. `jvm`: JVM metrics
			1. Heap currently in use
			2. Amount of JVM heap committed
			3. Total count and time spent on young- and old-generation GCs
				1. Cumulative - longer the node has been running, higher the number is
		3. `thread_pool`: Number of active, queued, and rejected threads for each thread pool
			1. `bulk` (renamed `write` in v6.3.x+)
			2. `merge`
			3. `search`
		4. `fs`: File system info (available disk space, disk I/O stats)
		5. `transport`: stats about cluster communication (bytes sent and received)
		6. `http`: Number of HTTP connections currently open and total number of HTTP connections opened over time
		7. `breakers`: (>= v1.4) Info about circuit breakers
			1. `fielddata` section (important)
				1. Tells **max size a query can be before tripping the circuit breaker**
				2. Tells **how many times, circuit breaker was tripped**
					1. Hight the number, more we want to [optimize queries](https://www.datadoghq.com/blog/elasticsearch-performance-scaling-problems/) OR upgrade memory
4. Limiting query:

		curl localhost:9200/_nodes/datanode1/stats/jvm,http

#### Cluster Stats API ####
1. Provides cluster wide info
	1. Adds all stats from each node in cluster
	2. **Does not provide level of detail that Node stats API offers**
		1. But useful to get general idea of how cluster is doing
2. Query:

		curl localhost:9200/_cluster/stats
		
	1. High level info:
		1. Cluster status
		2. Basic metrics about indices
			1. Number of indices
			2. Shard and document count
			3. Fielddata cache usage

#### Index Stats API ####
1. This is for one particular index
2. Query:

		curl localhost:9200/index_name/_stats?pretty=true
		
	1. `pretty=true` - formats JSON output
	2. Returns metrics about:
		1. search performance
		2. merging activity
		3. segment count
		4. size of fielddata cache
		5. Number of evictions from fielddata cache
	3. Metrics are provided at two levels:
		1. Aggregated across all shards in index
		2. Limited to just index's primary shards
3. **Useful if we know that certain indices might be receiving more index or search requests**

#### Cluster Health HTTP API ####
1. Exposes key info about health of cluster in JSON:

		curl localhost:9200/_cluster/health?pretty=true
		
	1. Output has:
		1. Overview of shard status (number of active, initializing, and unassigned shards)
		2. Number of nodes
		3. Cluster status

#### Pending Tasks API ####
1. Quick way to look at **pending tasks in cluster**
	1. **These tasks can only be performed by master**
		1. **creation of new indices**
		2. **re-distributing shards around cluster**
2. **If master node is unable to keep up with rate of requests, pending tasks will queue and the number will rise**
3. Query:

		curl localhost:9200/_cluster/pending_tasks
		
	1. Can return info about:
		1. Pending task's priority
		2. How long it has been waiting in queue
		3. What action it represents

### Cat API ###
1. Cat is another way to view the same metrics
2. Cat API returns data in tabular form instead of JSON
3. Commands available:

		curl http://localhost:9200/_cat
		...
		/_cat/allocation
		/_cat/shards
		/_cat/shards/{index}
		/_cat/master
		/_cat/nodes
		/_cat/indices
		/_cat/indices/{index}
		/_cat/segments
		/_cat/segments/{index}
		/_cat/count
		/_cat/count/{index}
		/_cat/recovery
		/_cat/recovery/{index}
		/_cat/health
		/_cat/pendingtasks
		/_cat/aliases
		/_cat/aliases/{alias}
		/_cat/threadpool
		/_cat/plugins
		/_cat/fielddata
		/_cat/fielddata/{fields}
		/_cat/nodeattrs
		/_cat/repositories
		/_cat/snapshots/{repository}
		
	1. To query specific metrics from cat nodes API
		1. Find out names of available metrics
		
				curl localhost:9200/_cat/nodes?help
				
			1. Names of metrics along with descriptions are returned
		2. Use the metric names returned to form a query
			1. Example: 
				1. heap used - `heapCurrent`
				2. number of segments - `segmentsCount`
				3. number of completed merges - `mergesTotal`
			2. Query:
			
					curl 'localhost:9200/_cat/nodes?v&h=heapPercent,segmentsCount,mergesTotal'
					
				1. `?v` returns column headers
		3. The output should match Node stats API's output of
			1. `jvm.mem.heap_used_percent`
			2. `segments.count`
			3. `merges.total`

### Dedicated Monitoring Tools ###
1. Drawback of HTTP APIs
	1. Only tell at a particular moment in time
	2. More the nodes, longer to get the output
	3. Difficult to sift through JSON and identify problematic nodes and sopt troubling trends
2. Solution: Tools that can aggregate resulting metrics into meaningful representation of state of cluster

#### ElasticHQ ####
1. [ElasticHQ](http://www.elastichq.org/index.html) - Open source monitoring tool available as hosted solution, plugin, download
	1. Provides metrics about
		1. Clusters
		2. Nodes
		3. Indices
	2. Provides info related to **queries** and **mappings**
2. [Full list of metrics](http://www.elastichq.org/feature_list.html)
	1. Run the following to install the plugin:
	
			./plugin install royrusso/elasticsearch-HQ
			
		1. Open browser and navigate to: `localhost:9200/_plugin/hq/`
		2. Select name of the cluster

#### Kopf ####
#### Elastic's Monitoring Tool: Marvel ####
### See the Whole Picture with Datadog ###