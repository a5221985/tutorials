# Cyclomatic Complexity #
1. Software metric
2. Used to indicate complexity of a program
3. It is quantitative measure of number of linearly independent paths (maximum number) through a program's source code
4. Steps:
	1. Generate a control flow graph
		1. Node: Indivisible group of commands
		2. Directed edge: Connects two nodes if second group immediately follows the first group
		3. Connected components: Each graph is a single connected component
5. Example:

		o
		|
		v
		o
		|\
		| o
		v/
		o
		|
		v
		o
		|\
		| o
		v/
		o
		|
		v
		o
		
	1. Edges (E): 9
	2. Nodes (N): 8
	3. Connected components (C): 1
	4. Cyclomatic Complexity = E - N + 2 x C
		1. = 9 - 8 + 2 * 1 = 3
6. Example:

		if (c1())
			f1();
		else
			f2();
		if (c2())
			f3();
		else
			f4();
			
			o
		  /  \
		 o    o
		  \  /
			o
		  /  \
		 o    o
		  \  /
			o
		   
	1. Cyclomatic complexity = 8 - 7 + 2 * 1 = 3