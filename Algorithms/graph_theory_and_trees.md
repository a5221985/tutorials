## Graph Theory Introduction and Basics ##
### Graph Theory Introduction ###
### Problems in Graph Theory ###
### Depth First Search Algorithm ###
### Breadth First Search Algorithm ###
### Breadth First Search Algorithm ###

## Graph Theory and Trees ##
### Introduction to Trees ###
### Beninner Tree Algorithms ###
### Rooting a Tree ###
### Finding Tree Center(s) ###
### Identifying Isomorphic Trees ###
1. Equality
2. Graph isomorphism:
	1. The question of asking whether two graphs G1 and G2 are isomorphic is asking whether they are structurally the same.
	2. Even though G1 and G2 are labelled differently and may appear different they are structurally the same graph.
	3. We can also define the notion of a graph isomorphism more rigorously:

			G1(V1, E1) and G2(V2, E2) are isomorphic if there exists a bijection phi between the sets V1 -> V2 such that:
			
			for all u, v in V1, (u, v) in E1 <=> (phi(u), phi(v)) in E2
			
		1. In simple terms, for an isomorphism to exist there needs to be a function phi which can map all the nodes/ edges in G1 to G2 and vice-versa
		2. Determining if two graphs are isomorphic is not only not obious to the human eye, but also a difficult problem for computers.
		3. It is still an open question as to whether the graph isomorphism problem is NP complete. However, many polynomial time isomorphism algorithms exist for graph subclasses such as trees.

### Identifying Isomorphic Trees Source Code ###

## Classic Graph Theory Algorithms ##
### Topological Sort Algorithm ###
### Shortest/ Longest Path on a Directed Acyclic Graph (DAG) ###
### Dijkstra's Shortest Path Algorithm ###
### Dijkstra's Shortest Path Algorithm | Source Code ###
### Bellman-Ford Algorithm ###
### Floyd-Warshall All Pairs Shortest Path Algorithm ###
### Floyd-Warshall All Pairs Shortest Path Algorithm | Source Code ###
### Bridges & Articulation Points ###
### Bridges & Articulation Points | Source Code ###
### Tarjan's Strongly Connected Components Algorithm (UPDATED) ###
### Tarjan's Strongly Connected Components Algorithm | Source Code ###
### Travelling Salesman Problem ###
### Travelling Salesman Problem | Source Code ###
### Existence of Eurlerian Path and Circuits ###
### Eulerian Path Algorithm ###
### Eulerian Path Source Code ###

## Network Flow ##
### Max Flow Ford Fulkerson | Network Flow ###
### Max Flow Ford Fulkerson | Source Code ###
### Unweighted Bipartite Matching | Network Flow ###
### Bipartite Matching | The Mice and Owls Problem | Network Flow ###
### Bipartite Matching | The Elementary Math Problem | Network Flow ###
### Edmonds Karp | Network Flow ###
### Edmonds Karp | Network Flow | Source Code ###
### Capacity Scaling | Network Flow ###
### Capacity Scaling | Network Flow | Source Code ###
### Dinic's Algorithm | Network Flow ###
### Dinic's Algorithm | Network Flow | Source Code ###

## Bonus Topics ##
### Union Find Data Structure ###
### Kruskal's Minimum Spanning Tree Algorithm ###
### Prim's Minimum Spanning Tree (Lazy Version) ###
### Prim's Minimum Spanning Tree (Eager Version) ###
### Prim's Minimum Spanning Tree Source Code ###
### The Sparse Table Data Structure ###
### Sparse Table Source Code ###
### Lowest Common Ancestor (LCA) Problem ###