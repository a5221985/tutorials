# Tensorflow for Beginners #
## Introduction ##
1. Teaches how to use tensorflow for own project
2. Topics
	1. Tensorflow foundations
	2. ML lifecycle
	3. CNN
	4. Logistic regression
	5. Deep learning
	6. Final project with many concepts covered

## Tensorflow Foundations ##
### Tensor flow Foundations Part 1 ###
1. Contents
	1. Why TensorFlow
		1. Instead of others
	2. Tensors & Tensor Operations
		1. Smaller building blocks
	3. TensorFlow Main Building Blocks
		1. Overall structure and function
	4. Installation
	5. Running Our First Example
2. Why tensorflow?
	1. Widely used and well documented
		1. Popular
		2. Forums for bugs and documentation
	2. Easily deployable to production
		1. Actual programs running tensor flow models
		2. App can use this
	3. Updated often
		1. Google updates quite often
			1. New research
			2. New techniques
	4. Seamless transition to cloud/ distributed computing
		1. Difficult with other libraries
	5. Easier to get up and running than theano
		1. For CPU and GPU
			1. Theano is headache to get it up and running
	6. No compilation time (unlike theano)
		1. No wait time
	7. TensorBoard
		1. Visualizing graph
		2. How it is training
		3. Overall performance
			1. Before
			2. After
3. Tensor
	1. Basics
		1. N-dimensional arrays
		2. Measured by "rank"
			1. Dimensionality
				1. Rank 0: Scalar
				2. Rank 1: Vector
				3. Rank 2: 2D matrix
				4. Rank 3: Stack 2D matrices
		3. All elements same datatype
			1. Unlike Panda
4. Tensor operations
	1. Common ops
		1. Addition & Subtraction
			1. Element wise
		2. Multiplication & Division
			1. Element wise
		3. Matrix Multiplication
			1. M & M(transpose)
		4. Dot Product
		5. Transpose
			1. Flipping columns and rows
5. TensorFlow building blocks
	1. Lower level (tedious to deal with)
		1. Tensors
		2. Operations
		3. Graphs & Sessions
			1. Graphs: all of the components of the model put together on the backend
				1. tensorflow and how everything connects
			2. Sessions: Where program runs
	2. Higher level (easier to use)
		1. Loss functions
			1. Differentiable functions that measure differences/error between true and predicted values.
				1. Common types:
					1. MSE: for regression problems usually
					2. Log Loss
						1. Similar to cross entropy
					3. Cosine Distance
						1. If output from a model is multiple values, then it is a vector
							1. Predicted vector and actual vector are treated as points in multidimensional space
								1. Measures the distances between those
									1. Smaller the better
					4. Cross Entropy
						1. Binary cross entropy
							1. For binary classification problems
								1. Between two values
						2. Catagorical cross entropy
							1. For more than two classes (accounts for number for classes)
						3. ...
		2. Optimizers: Built-in optimizers inherit from the Optimizer class.
			1. Common types:
				1. Gradient Descent (basic)
					1. Takes derivative of loss function against all parameters built up in the model
				2. Adam
				3. RMSProp
				4. Adagrad
				5. Momentum
					1. Other optimizers can use this
					2. Roll out of local minima to reach global mimimum
				6. Adadelta
			2. Other fancy optimizers are more efficient and can also help us reach global minimum
			3. Optimizers are algorithms that minimize the loss (or error) of a model
				1. Aim is to get to the global minimum
					1. Gradiant descendent: tries to move downhill which may end up in local minimum
					2. To get to a global minimum (lowest loss)
						1. gradient descent makes us move in the steepest direction at a given point
					3. Momentum is used to get us out of local minimum
						1. If we are at global minimum, it would be difficult to get out of it with the given momentum
		3. Layers
			1. What are they?
				1. Composed of tensors and operations forming the model
				2. Generally connected in series
				3. Pre-made functions for constructing layers in a model
					1. Provided by tensorflow (we need to build it from scratch)
			2. Common types
				1. Input:
					1. Layer where we feed data into the model
				2. Convolutional (1d, 2d, 3d)
					1. Usually used for CV tasks
						1. Object detection
						2. Localization
						3. Image recognition
						4. Classification
				3. Pooling
					1. Reduce size and complexity of the model by averaging outputs from the previous layer
						1. Reduces the number of parameters which makes the computation easier
				4. Dropout
					1. Regularization
						1. Helps to prevent overfitting a model
					2. Randomly disconnect certain outputs from the previous layer for each iteration as we train the model
				5. Dense
			3. Example:
				1. Input layer (feed of input model)
					1. Non functional
				2. Hidden layers
				3. Output layer
			4. inputs (x) -> a(wx + b) -> activation output
				1. Output feeds into the next layer
				2. b - bias
				3. a
					1. Activation function: Operates on wx + b and gives an output (fed into next layer)
						1. command ones:
							1. Softmax: Gives probabilities for outputs
								1. Outputs feed into optimizers
									1. Compare predicted values to true values 
		4. Estimators
			1. Higher level API of tensor flow
			2. They handle:
				1. Training (automated)
					1. Iterating over a lot of batches of the data
					2. Feeding them to network
					3. Connecting to optimizer and to loss function
					4. Using the outputs and loss to update the parameters of the model
				2. Evaluation
					1. Computing accuracy of the model
				3. Prediction
					1. Prediction methods are built in
				4. Build Graph
					1. on local machine or distributed computing divices is handled
6. Installation
	1. Mac/Linux
		1. Check if `pip[3]` installed
		2. terminal: `pip -v`
		3. Install if not
		4. `pip[3] install tensorflow`
		5. `pip[3] install tensoflow-gpu` (linux only: requires NVIDIA GPU + CUDA + cuDNN)
	2. Windows
		1. Check if `pip[3]` installed
			1. If not use `get-pip.py`
		2. `pip[3] install --upgrade tensorflow`
		3. `pip[3] install --upgrade tensorflow-gpu`
			1. Requires NVIDIA GPU + CUDA + cuDNN

### Tensor flow Foundations Part 2 ###
1. `python get-pip.py`
2. Jupyter notebook

		python3 -m pip install --upgrade pip
		python3 -m pip install jupyter
		jupyter notebook

## ML Lifecycle & TensorBoard ##
### The Machine Learning Lifecycle Part 1 ###
### The Machine Learning Lifecycle Part 2 ###

## The Machine Learning Lifecycle & Using TensorBoard ##
### Tensor Board - Part 1 ###
### Tensor Board - Part 2 ###

## Logistic Regression & NN Basics ##
### Part 1 ###
### Part 2 ###

## Single & Multiple Hidden Layer NNs ##
### Part 1 ###
### Part 2 ###
### Part 3 ###

## Convolutional NNs ##
### CNN - Part 1 ###
### CNN - Part 2 ###
### CNN - Part 3 ###

## Deep Learning ##
### Deep Learning - Part 1 ###
### Deep Learning - Part 2 ###

## Final Project ##
### Problem Statement ###
### Code Solution ###
### Bonus Lecture: More Interesting Stuff, Offers and Discounts ###