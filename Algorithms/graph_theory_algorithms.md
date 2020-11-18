# Graph Theory Algorithms #
## Graph Theory Introduction and Basics ##
### Graph Theory Introduction ###
### Problems in Graph Theory ###
### Depth First Search Algorithm ###
### Breadth First Search Algorithm ###
### Breadth First Search Grid Shortest Path ###

## Graph Theory and Trees ##
### Introduction to Trees ###
### Beginner Tree Algorithms ###
### Rooting a Tree ###
### Finding Tree Center(s) ###
### Identifying Isomorphic Trees ###
1. It is a question of tree equality and what that means
2. Graph Isomorphism
	1. The question of asking whether two graphs G1 and G2 are isomorphic is asking whether they are structurally the same.
	2. Even though G1 and G2 are labelled differently and may appear different they are structurally the same graph
3. Graph Isomorphism (definition)
	1. We can also define the notion of a graph isomorphism more rigorously:
	2. G1(V1, E1) and G2(V2, E2) are isomorphic if there exists a bijection phi between the sets V1 -> V2 such that:
		1. For all u, v in V1, (u, v) is in E1 <=> (phi(u), phi(v)) is in E2
	3. In simple terms, for an isomorphism to exist there needs to be a function phi which can map all the nodes/ edges in G1 to G2 and vice-versa
4. Determining if two graphs are isomorphic is not only not obvious to the human eye, but also a difficult problem for computers.
5. It is still an open question as to whether the graph isomorphism problem is NP complete. However, many polynomial time isomorphism algorithms exist for graph subclasses such as trees
6. Isomorphic Trees:
	1. Identifying Isomorphic Trees
		1. There are several very quick probabilistic (usually hash or heuristic based) algorithms for identifying isomorphic trees. These tend to be fast, but also error prone due to hash collisions in a limited integer space.
			1. Good for competitive programming or a lot of trees
		2. The method we'll be looking at today involves serializing a tree into a unique encoding. This unique encoding is simply a unique string that represents a tree, if another tree has the same encoding then they are isomorphic.

### Identifying Isomorphic Trees Source Code ###

## Classic Graph Theory Algorithms ##
### Topological Sort Algorithm ###
### Shortest/Longest Path on a Directed Acyclic Graph (DAG) ###
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
### Existence of Eulerian Path and Circuit ###
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