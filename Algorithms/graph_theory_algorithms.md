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
7. Identifying Isomorphic Trees
	1. We can directly serialize unrooted tree, but in practice serializing a rooted tree is typically easier code wise
	2. However, one caveat to watch out for if we're going to root our two trees T1 and T2 to check if they're isomorphic is to ensure that the same root node is selected in both trees before serializing/ encoding the trees.
		1. This can be done by finding center of a tree
8. Procedure:
	1. Find the center(s) of the original tree. We'll see how to handle the case where either tree can have more than 1 center shortly.
	2. Root the tree at the centre nodes
	3. Generate the encoding for each tree and compare the serialized trees for equality
		1. The tree encoding is simply a sequence of left '(' and right ')' brackets. However, you can also think of them as 1's and 0's (i.e a large number) if you prefer
		2. It should also be possible to reconstruct the tree solely from the encoding. This is left as an exercise to the reader...
9. The AHU (Aho, Hopcroft, Ullman) algorithm is a clever serialization technique for representing a tree as a unique string.
	1. Unlike many tree isomorphism invariants and heuristics, AHU is able to capture a complete history of a tree's degree spectrum and structure ensuring a deterministic method of checking for tree isomorphisms.
	2. Let's have a closer look...
10. Tree encoding:
	1. Start by assigning all leaf nodes Knuth tuples: '()'
	2. Process all nodes with grayed out children and combine the labels of their children nodes and wrap them in brackets.

									0
			(()())		2			1	(())	3
				6		7	4		5 (())		8
				()		()	()		9			()
							()
							
		1. Notice that the labels get **sorted** when combined, this is important (larger child label first)
	3. (((())())(()())(()))
11. Tree Encoding Summary
	1. In summary of what we did for AHU:
		1. Leaf nodes are assigned Knuth tuples '()' to begin with
		2. Every time you move up a layer the labels of the previous subtrees get sorted lexicographically and wrapped in brackets.
		3. You cannot process a node until you have processed all its children
12. Unrooted tree encoding pseudocode

		# Returns whether two trees are isomorphic.
		# Parameters tree1 and tree2 are undirected trees
		# stored as adjacency lists.
		function treesAreIsomorphic(tree1, tree2):
			tree1_centers = treeCenters(tree1)
			tree2_centers = treeCenters(tree2)
			
			tree1_rooted = rootTree(tree1, tree1_centers[0])
			tree1_encoded = encode(tree1_rooted)
			
			for center in tree2_centers:
				tree2_rooted = rootTree(tree2, center)
				tree2_encoded = encode(tree2_rooted)
				# Two trees are isomorphic if their encoded
				# canocinal forms are equal.
				if tree1_encoded == tree2_encoded:
					return True
			return False
			
13. Rooted trees are sorted recursively in TreeNode objects: (To keep tree data structure organised)

		# TreeNode object structure.
		class TreeNode:
			# Unique integer id to identify this node.
			int id;
			
			# Pointer to parent TreeNode reference. Only the
			# root node has a null parent TreeNode reference.
			TreeNode parent;
			
			# List of pointers to child TreeNodes.
			TreeNode[] children;
			
14. Unrooted tree encoding pseudocode

		function encode(node):
			if node == null:
				return "" # enables leaf nodes to have ()
				
			labels = []
			for child in node.children():
				labels.add(encode(child))
				
			# Regular lexicographic sort
			sort(labels)
			
			result = ""
			for label in labels:
				results += label
				
			return "(" + result + ")"

### Identifying Isomorphic Trees Source Code ###
1. github.com/williamfiset/algorithms

## Classic Graph Theory Algorithms ##
### Topological Sort Algorithm ###
1. What is top sort? Where is it used? How to find topological ordering?
2. Many real world situations can be modelled as a graph with directed edges where some events must occur before others
	1. School class prerequisites
	2. Program dependencies
	3. Event scheduling
	4. Assembly instructions
	5. Etc...
3. Example: Suppose you are a student at university X and you want to take class H, then you must take classes A, B, D and E as prerequisites. In this sense there is an ordering on the nodes of the graph.
	1. We can use topological sort to come up with an order in which we can take courses such that we don't take a class for which we have not satisfied the pre-requisites.
4. Example: Another canocial example where an ordering on the nodes of the graph matters is for program build dependencies. A program cannot be built unless its dependencies are first built.
5. A topological ordering is an ordering of the nodes in a directed graph where for each directed edge from node A to node B, node A appears before node B in the ordering.
6. The topological sort algorithm can find a topological ordering in O(V + E) time!
	1. In a topological ordering, all edges point to the right
7. NOTE: Topological orderings are NOT unique
8. Directed Acyclic Graphs (DAG)
	1. Not every graph can have a topological ordering. A graph which contains a **cycle** cannot have a valid ordering
9. The only type of graph which has a valid topological ordering is a Directed Acyclic Graph (DAG). These are graphs with directed edges and no cycles.
	1. How do I verify that my graph does not contain a directed cycle?
	2. Answer: One method is to use Tarjan's strongly connected component algorithm which can be used to find these cycles.
10. By definition, all rooted trees have a topological ordering since they do not contain any cycles
	1. One way to topologically sort:
		1. Pick out leaf nodes (in any order)
		2. Then their parents
		3. Repeat until no more nodes are left
11. **Topological sort algorithm (general DAG)**
	1. Pick an unvisited node
	2. Beginning with the selected node, do a Depth First Search (DFS) exploring only unvisited nodes.
	3. On the recursive callback of the DFS, add the current node to the topological ordering in reverse order

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