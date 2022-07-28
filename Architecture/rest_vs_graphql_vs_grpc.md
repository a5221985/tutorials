# REST vs GraphQL vs gRPC #
## REST - The Most Popular Technology ##
### Benefits ###
1. CRUD operations can be implemented using HTTP methods
2. Many developers know how to use it (it has been there for a long time)
3. Supports **caching**
4. Scalable & provides separation between client and server
5. Can be integrated into multiple applications with ease

### Drawbacks ###
1. **Over-fetching & Under-fetching issues**
2. Can't maintain states
3. **Large payload sizes**
4. If application scales, number of endpoints drastically increase
5. Not easy to update DB schemas or data structures (?)

### When to Choose REST ###
1. If no specific requirements (new to development, shallow learning curve provided by REST)
2. If we want ease of finding solution to almost any problem, REST has large ecosystem
3. If we need to increase performance with **caching** (for **large number of requests** and **less bandwidth**)
4. If we don't mind using any API technology (since REST supports wide range of application types)

## GraphQL - A Client-Driven Standard ##
1. **Allows developers to fetch exact data they need**
2. Client can decide what data is needed, how to fetch the data, & format
3. Can interacts with data using:
	1. **Queries** - used to request data from server
	2. **Mutations** - used to modify server side data
	3. **Subscriptions** - used to get live updates when data gets updated

### Benefits of GraphQL ###
1. Flexible - delivers precisely **what client needs**
2. No **over-fetching** and **under-fetching**
3. Good support from multiple languages - JavaScript, Java, Python, Ruby, PHP
4. Allows customizing **structure of data**
5. Single query can contain **fields from multiple resources**

### Drawbacks of GraphQL ###
1. Complexity in Queries
2. Lacks **built-in caching support**
3. **Steaper learning curve** than REST
4. **Does not support file upload** (by default)

### Whent to Choose GraphQL ###
1. **Good for querying databases with many records**
2. If application performance needs to be improved via fetching only necessary data & in specific formats
3. If we need to aggregate data from **multiple resources**
4. **If we do not understand (beforehand) how client can use the API**
	1. **No strict contract upfront**
		1. We can gradually build up the API with client feedback

## gRPC - A Performance-Oriented Technology ##
1. **Max performance using min resources**
2. **Contract based approach to communication**
	1. Client & Server must have contracts before starting communication
		1. **Protobuf** (declarative language) - used for contract creation
			1. **Compatible code can be generated for client & server using a selected language**
3. **4 communication methods supported by gRPC**
	1. **Unary** - client makes single request to server and server sends single response
	2. **Client-Streaming** - Client streams series of requests to server & then a message (at the end) to inform that stream is over. Server then sends single response
	3. **Server-Streaming** - Client sends single request to server. Server sends stream of messages to client
	4. **Bidirectional Streaming** - Client & Server can send messages at any time after establishing initial connection (like web-socket)

### Benefits of gRPC ###
1. Open Source (Developers can modify it as needed)
2. Supports multiple languages - JavaScript, Java, C, C++, C#, Kotlin, Python, Go, PHP
3. Capable of **load balancing**
4. Uses **HTTP2 by default** (reduces latency compared to REST APIs)
5. Serializes data in **binary format**
6. Supports **full-duplex streaming**

### Drawbacks of gRPC ###
1. No browser support by default
2. No community support as compared to REST and GraphQL

### When to Choose gRPC ###
1. For devices with low resources (performance is optimized using minimum resources)
	1. IoT devices
	2. Smart devices
	3. Cameras
2. For communication between microservices
	1. Multiple languages supported and hence two microservices written in different languages can communicate