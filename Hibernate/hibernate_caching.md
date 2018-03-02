# Hibernate Caching #
## Caching ##
1. Cache - If multiple accesses to data is required, instead of hitting database each time, we can cache the data
2. Client -Request-> App Server -Request (Select * from Student)-> Database Server -Data-> App Server
	1. In same session if request for same records is sent - First level cache stores them (default given by hibernate)
	2. If session is changed, different first level cache will be used
		1. If same query is sent with second session, the second first level cache has no data so database will be hit
3. Second level cache: All the sessions can share this cache
	1. Needs to be configured
		1. Third party provider
			1. Ehcache (preferred)
				1. Configuration
					1. pom.xml
						1. hibernate-ehcache - integration of eh and hibernate (?)
					3. hibernate.cfg.xml
					4. Change entity
						1. `@Cachable` - Says entity is eligible for caching
						2. `@Cache` - To specify strategies
			2. OS
			3. Swarm

## Caching Level 1 ##
1. Example:

		session1.begingTransaction();
		o = (Alien) session1.get(Alien.class, 101);
		o = (Alien) session1.get(Alien.class, 101); // Hibernate fires a query only once here and return
		session1.getTransaction().commit();

2. Example: New session

		Session session2 = sf.openSession();
		session2.beginTransaction();

		a = (Alien) session2.get(Alien.class, 101);
		System.out.println(o); // Hibernate fires the query for the second time

## Caching Level 2 ##
1. Steps:
	1. Add dependency for ehcache
		1. `net.sf.ehcache:ehcache`
		2. `org.hibernate:hibernate-ehcache` (4.1.6 - or same as hibernate version)
	2. hibernate.cfg.xml

			<property name="hibernate.cache.use_second_level_cache">true</property>
			<property name="hibernate.cache.region.factory_class">org.hibernate.cache.ehcache.EhCacheRegionFactory</property> <!-- copy from dependency -->

	3. Alien.java (only annotated classes are cached)

			@Cacheable
			@Cache(usage=CacheConcurrencyStrategy.READ_ONLY) // specifies strategy
			public class Alien {
			...
	4. src/main/resources/ehcache.xml

			<?xml version="1.0" encoding="UTF-8"?>
			<ehcache xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xsi:noNamespaceSchemaLocation="ehcache.xsd" updateCheck="true"
				monitoring="autodetect" dynamicConfig="true">

				<diskStore path="java.io.tmpdir/ehcache" />

				<defaultCache maxEntriesLocalHeap="10000" eternal="false"
					timeToIdleSeconds="120" timeToLiveSeconds="120" diskSpoolBufferSizeMB="30"
					maxEntriesLocalDisk="10000000" diskExpiryThreadIntervalSeconds="120"
					memoryStoreEvictionPolicy="LRU" statistics="true">
					<persistence strategy="localTempSwap" />
				</defaultCache>

				<cache name="employee" maxEntriesLocalHeap="10000" eternal="false"
					timeToIdleSeconds="5" timeToLiveSeconds="10">
					<persistence strategy="localTempSwap" />
				</cache>

				<cache name="org.hibernate.cache.internal.StandardQueryCache"
					maxEntriesLocalHeap="5" eternal="false" timeToLiveSeconds="120">
					<persistence strategy="localTempSwap" />
				</cache>

				<cache name="org.hibernate.cache.spi.UpdateTimestampsCache"
					maxEntriesLocalHeap="5000" eternal="true">
					<persistence strategy="localTempSwap" />
				</cache>
			</ehcache>

## Caching Level 2 with Query ##
1. Caching for own query (HQL)

		Query q1 = session1.createQuery("from Alien where aid=101");

		session1.beginTransaction();
		a = (Alien) q1.uniqueResult();
		...
		session2.beginTransaction();
		a = (Alien) q2.uniqueResult();
		...

2. Configuration:
	1. hibernate.cfg.xml

			<property name="hibernate.cache.use_query_cache">true</property>

	2. Queries

			q1.setCacheable(true);	// for storing in cache
			...
			q2.setCacheable(true);	// for fetching from cache