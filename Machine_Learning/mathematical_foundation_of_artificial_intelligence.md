# Mathematical Foundation for Artificial Intelligence #
## Introduction ##
### Introduction ###
1. Neural networks are used to solve or supplement wide variety of problems
	1. Computer vision
	2. Autonomous driving
	3. Patient diagnosis
	4. Healthcare
	5. Education
2. Algorithms are predicated on challenging mathematical topics
	1. Essential to build and solve complex tasks
3. Course covers mathematical foundation for deep neural networks
4. Topics
	1. Linear Algebra
		1. notation
		2. operations
		3. concepts (for understanding neural networks that drive field of machine learning)
		4. Scalars, vectors, matrices, tensors
		5. Matrix norms
		6. Special matrices, vectors
		7. Eigenvalues, eigenvectors (for decomposition)
		8. Used to define weights and structure of different machine learning algorithms
	2. Multivariate calculus
		1. Derivatives
		2. Integrals
		3. Gradients
		4. Differential Operators
		5. Convex Optimization
		6. Calculus is utilized by neural networks to learn from examples, update parameters, and improve performance
			1. It is the learning in mahine learning
	3. Probability theory - It is used to make assumptions about the underlying data
		1. It is the mathematical study of uncertainty, probability theory, is used in machine learning to make probabilistic assumptions about the data when desinging algorithms
		2. Elements of probability
		3. Random variables
		4. Distributions
		5. Veriance and Expectation
		6. Special Random Variables
4. Units
	1. Class structure
		1. Three units
		2. Lectures
		3. Projects in Python and R
		4. Quizzes

## Linear Algebra ##
### Scalars, Vectors, Matrices, and Tensors ###
1. Strong foundation is required in this (Deep learning)
	1. Inputs are passed to algos as vectors or matrices
	2. Outputs are scalars, vectors, matrices or tensors
2. Dimensionality
3. The basics:
	1. Scalar - (x) a single number or value
		1. Ex: 6
	2. Vector - (**x**) an array of number, either in a row or in a column, identified by an index
		1. Differences in comp science and math
		2. Ex: [2 3 4] or 

				[1]
				[5]
				[4]
				[6]
			
	3. Matrix - (**X**) a 2-D array of numbers, where each element is identified by two indeces.

			[1 2 3]
			[4 5 6]

		1. Comp science - start index is 0 (Math - 1)
			1. X(0,0) - 0th row and 0th column
			2. X(1,0) - 1st row and 0th column
		2. m and n can be very very large in machine learning
	4. Dimensionality - Vectors - 1 dimensional
		1. Matrices - 2 dimensional
			1. (rows, columns)
				1. dimensions = (2,3) (2 by 3)
	5. Matrix Operations:
		1. Matrix operations, such as addition, subtraction, multiplication are frequently used in machine learning
			1. Addition
				1. An entry wise sum - addition of matrix **A** with matrix **B** is the matrix **C**
					1. Rules:
						1. **A** and **B** must have same dimensions
						2. **C** will have the same dimensions as **A** and **B**
				2. [a(i,j)] + [b(i,j)] = [c(i,j)]
			2. Subraction
				1. Performed elementwise, just like addition
				2. Matrix dimensions must agree

						[a(i,j)] - [b(i,j)] = [c(i,j)]

			3. Multiplication
				1. Product of **A** and **B** is third matric **C**
					1. **A** must have same number of columns as **B** has rows

							C(i,j) = sigma(k) A(i,k) B(k,j)

						1. Example:

								[a00 a01] [b00 b01] = [a00b00+a01b10 ...]
								[a10 a11] [b10 b11]   [a10b00+a11b10 ...] 

				2. Properties:
					1. Matrix multiplication is distributive
						1. **A**(**B** + **C**) = **A****B** + **A****C**
					2. It is associative
						1. **A**(**B****C**) = (**A****B**)**C**
			4. Transpose
				1. Transpose of a matrix is an operator which flips a matrix over it's main diagonal (runs top-left to bottom-right)
				2. Indices of rows and columns are switched
				3. (3,2) matrix transpose is a (2,3) matrix
				4. Row vector gets transposed to column vector and vice versa
				5. Data can be changed to the format that we need to input into algos (pre-processing)
	6. Tensors:
		1. We will sometimes need more than two axes
			1. An array of numbers with variable number of axes is knows as a tensor
			2. A 3-D tensor would have indices (i,j,k)

### Vector and Matrix Norms ###
1. The way they are used in machine learning
2. First way:
	1. Norms:
		1. The magnitude of a vector can be measured using a function called a norm (loss function, distance between predicted and actual points, regularization term (to encourage small weights))
			1. SVM uses - L2 norm (calculate distance between determinant and each support vector)
		2. Norms map vetors to non-negative values
			1. Norm of a vector **x** is the distance from origin to the point **x**
		3. L(pow p) norm

				||**x**||sub p = (sigma(i) |x(i)| pow p)pow 1/p

			1. Euclidean Norm (L pow 2) norm
				1. P = 2

						||**x**||sub 2 = (sigma(i) |x(i)|pow 2) pow 1/2

					1. Example:
					
							**x** = (-1, 2)
							||**x**||sub 2 = sqrt(-1 pow 2 + 2 pow 2) = sqrt(1 + 4) = sqrt(5)

						1. Referred to as ||**x**||

### Vectors, Matrices, and Tensors in Python ###
### Special Matrices and Vectors ###
### Eigenvalues and Eigenvectors ###
### Norms and Eigendecomposition ###

## Multivariate Calculus ##
### Introduction to Derivatives ###
### Basics of Integration ###
### Gradients ###
### Gradient Visualization ###
### Optimization ###

## Probability Theory ##
### Intro to Probability Theory ###
### Probability Distributions ###
### Expectation, Variance, and Covariance ###
### Graphing Probability Distributions in R ###
### Covariance Matrices in R ###

## Probability Theory ##
### Special Random Variables ###
### Bonus Lecture: More Interesting Stuff, Offers and Discounts ###