# Software Construction #
## Readings ##
### Static Checking ###
#### Types ####
#### Static Checking vs Dynamic Checking ####
#### Arrays and Collections ####
#### Iterating ####
#### Methods ####
#### Mutating Variables vs Reassigning Variables ####
#### Documenting Assumptions ####

### Basic Java ###
#### Snapshot Diagrams ####
#### Java Collections ####
#### Java API Documentation ####

### Testing ###
1. Safe from bugs
	1. correct today and in unknown future
2. Easy to understand
	1. Communication clearly with future programmers (including future you)
3. Ready for change

#### Validation ####
#### Test-first Programming ####
#### Choosing Test Cases by Partitioning ####
#### Blackbox and Whitebox Testing ####
#### Documenting Testing Strategies ####
#### Coverage ####
#### Unit Testing and Stubs ####
#### Automated Testing and Regression Testing ####

### Code Review ###
#### Don't Repeat Yourself ####
#### Comments Where Needed ####
#### Fail Fast ####
#### Avoid Magic Numbers ####
#### One Purpose for Each Variable ####
#### Use Good Names ####
#### Use Whitespace to Help the Reader ####
#### Don't Use Global Variables ####
#### Methods Should Return Results, Not Print Them ####

### Version Control ###
#### Inventing Version Control ####
#### Git: Copy, Commit, Pull, Push, Merge ####

### Specifications ###
#### Why Specifications? ####
#### Behavioral Equivalence ####
#### Specification Structure ####
#### Null References ####
#### What a Specification May Talk About ####
#### Testing and Specifications ####
#### Specifications for Mutating Methods ####
#### Exceptions for SIgnaling Bugs ####
#### Exceptions for Special Results ####
#### Checked and Unchecked Exceptions ####
#### Throwable Hierarchy ####
#### Exception Design Considerations ####
#### Abuse of Exceptions ####

### Designing Specifications ###
#### Deterministic vs Undetermined Specs ####
#### Declarative vs Operational Specs ####
#### Stronger vs Weaker Specs ####
#### Diagramming Specifications ####
#### Designing Good Specifications ####
#### Precondition or Postcondition? ####
#### About Access Control ####
#### About Static vs Instance Methods ####

### Avoiding Debugging ###
#### First Defense: Making Bugs Impossible ####
#### Second Defense: Localizing Bugs ####
#### Assertions ####
#### What to Assert ####
#### What Not to Assert ####
#### Incremental Development ####
#### Modularity and Encapsulation ####

### Mutability & Immutability ###
#### Mutability ####
#### Risks of Mutation ####
#### Aliasing is What Makes Mutation Risky ####
#### Specifications for Mutating Methods ####
#### Iterating Over Arrays and Lists ####
#### Mutation Undermines an Iterator ####
#### Mutation and Contracts ####
#### Useful Implementation Types ####

### Recursion ###
#### Choosing the Right Decomposition For a Program ####
#### Structure of Recursive Implementations ####
#### Helper Methods ####
#### Choosing the Right Recursive Subproblem ####
#### Recursive Problem vs Recursive Data ####
#### Reentrant Code ####
#### When to Use Recursion Rather Than Iteration ####
#### Common Mistakes in Recursive Implementations ####

### Debugging ###
#### Reproduce the Bug ####
#### Understand the Location and Cause of the Bug ####
#### Fix the Bug ####

### Abstract Data Types ###
#### What Abstraction Means ####
#### Classifying Types and Operations ####
#### Designing Abstract Type ####
#### Representation Independence ####
#### Realizing ADT Concepts in Java ####
#### Testing and Abstract Data Type ####

### Abstraction Functions & Rep Invariants ###
#### Invariants ####
#### Rep Invariant and Abstraction Function ####
#### Documenting the AF, RI, and Safety from Rep Exposure ####
#### ADT Invariants Replace Preconditions ####

### Interfaces ###
#### Interfaces ####
#### Subtypes ####
#### Example: MyString ####
#### Example: Set ####
#### Generic Interfaces ####
#### Why Interfaces? ####
#### Realizing ADT Concepts in Java, Part II ####

### Equality ###
#### Three Ways to Regard Equality ####
#### == vs. equals() ####
#### Equality of Immutable Types ####
#### The Object Contract ####
#### Equality of Mutable Types ####
#### The Final Rule For Equals() and hashCode() ####

### Recursive Data Types ###
#### Recursive Functions ####
#### Immutable Lists ####
#### Recursive Datatype Definitions ####
#### Functions Over Recursive Datatypes ####
#### Tuning the Rep ####
#### Null vs Empty ####
#### Declared Types vs Actual Type ####
#### Example: Boolean Formulas ####
#### Writing a Program with ADTs ####
#### Recipes for Programming with ADTs ####
#### Example: Matrix Multiplication ####

### Regular Expressions and Grammars ###
#### Grammars ####
#### Regular Expressions ####

### Parser Generators ###
#### Parser Generators ####
#### An Antlr Grammar ####
#### Generating the Parser ####
#### Calling the Parser ####
#### Traversing the Parse Tree ####
#### Constructing and Abstract Syntax Tree ####
#### Handling Errors ####

### Concurrency ###
#### Two Models for Concurrent Programming ####
#### Processes, Threads, Time-Slicing ####
#### Example: Shared Memory ####
#### Interleaving ####
#### Race Condition ####
#### Tweaking the Code Won't Help ####
#### Reordering ####
#### Example: Message Passing ####
#### Concurrency is Hard to Test and Debug ####

### Thread Safety ###
#### What Threadsafe Means ####
#### Strategy 1: Confinement ####
#### Strategy 2: Immutability ####
#### Strategy 3: Using Threadsafe Data Types ####
#### How to Make A Safety Argument ####

### Sockets & Networking ###
#### Client/ Server Design Pattern ####
#### Network Sockets ####
#### I/O ####
#### Blocking ####
#### Using Network Sockets ####
#### Wire Protocols ####
#### Testing Client/ Server Code ####

### Queues & Message-Passing ###
#### Two Models for Concurrency ####
#### Message Passing with Threads ####
#### Implementing Message Passing with Queues ####
#### Stopping ####
#### Thread Safety Arguments with Message Passing ####

### Locks & Synchronization ###
#### Synchronization ####
#### Deadlock ####
#### Developing a ThreadSafe Abstract Data Type ####
#### Locking ####
#### Monitor Pattern ####
#### Thread Safety Argument with Synchronization ####
#### Atomic Operations ####
#### Designing a Data Type for Concurrency ####
#### Deadlock Rears its Ugly Head ####
#### Goals of Concurrent Program Design ####
#### Concurrency in Practice ####

### Graphical User Interfaces ###
#### View Tree ####
#### How th View Tree is Used ####
#### Input Handling ####
#### Separating Frontend from Backend ####
#### Background Processing in Graphical User Interfaces ####

### Map, Filter, Reduce ###
#### Abstracting Out Control Flow ####
#### Map ####
#### Functions ####

### Little Languages ###
### Team Version Control ###

## General ##
### General Information ###
### Collaboration and Public Sharing ###
### Code Reviewing ###
### Nanoquiz Grading and Makeups ###

## Getting Started ##
### Getting Started: Java, Eclipse & Git ###
### Getting Started: Java ###
### Getting Started: Eclipse FAQ ###

## Problem Sets ##
### Turtle Graphics ###
### Tweet Tweet ###
### Poetic Walks ###
### Expressivo ###
### Multiplayer Minesweeper ###

## Project ##
### ABC Music Player ###

## Quizzes ##
### Quiz 1 and Quiz 1 solutions ###
### Quiz 2 and Quiz 2 solutions ###
### Quiz Archive ###