# Problem Solving #
## John Somnez Approach ##
1. Solve for x = 1 or x = 0 (simplest case)
2. Increase complexity to x = 2, x = 3, ...
3. Generalize the approach
4. Think about how to break the application
	1. Edge cases

### Examples ###
1. Reverse a string that is in an array
	1. step 1: single letter array - reverse is the same
	2. step 2: 
		1. two letter array - swap the two
		2. three letter array - swap the last and first
		3. four letter array - swap first and last, swap second and last but one
		4. n letter array - swap first and last, swap second and last but one, swap third and last but two
			1. swap k and (n - 1) - k elements until (n - 1) - k <= k

### How to Solve Programming Problems ###
#### Introduction ####
1. Tools to solving programming problems (algorithm type problems specially)

#### Common Mistakes ####
1. Improper allocation of time
	1. "Measure twice and cut once"
		1. Make sure something is done right before diving in
			1. Do not write code as soon as you get problem
		2. Understand the problem completely first
2. Oversolving the problem in first iteration
	1. Keep it simple (don't get fancy)

#### A Simple Set of Steps ####
1. Simple steps:
	1. Read the problem completely twice
	2. Solve the problem manually with 3 sets of sample data
	3. Optimize the manual steps
	4. Write the manual steps as comments or pseudo-code
	5. Replace the comments or pseudo-code with real-code
	6. Optimize the real code
2. Spend upto 70% of time in steps 1-3

#### Read the Problem Completely Twice ####
1. May read 3 - 4 times - Most important step
	1. Can you explain the problem to someone else?
2. Makes it easier to solve the problem
3. Work through examples (if given with the problem)
	1. Understand why answers are correct for each one

#### Solve the Problem Manually ####
1. Simple secret in programming: "Nothing can be automated that cannot be done manually"
	1. Programming is automation
2. Manual process is foundation for program logic
	1. Lets us know what needs to be automated
3. Solve problem with atleast three different inputs
	1. Ensure solution works for multiple cases
	2. Try to use mathematical induction approach
		1. solve for 1
		2. solve for 2
		3. solve for n
4. Look for edge cases
	1. Find and do some examples
5. Try to write out what brain is doing
	1. Be conscious of each step (do not gloss over them)
6. Example: Reversing a string
	1. Write "Zebra"
	2. Start new word with only "a" as first letter (after reversing)
	3. Put "r" as second letter
	4. Put "b" as third letter
	5. ...

#### Optimize the Manual Solution ####
1. It is easier to rearranage or reconstruct an idea or algorithm in head than in code
	1. Try to optimize in the head in the initial stages
2. Example:
	1. Use loop (instead of writing out each step because they are similar) with different data
	2. Steps:
		1. Write "Zebra"
		2. Start at last letter in the word and build a new empty word
		3. Append the current letter to new word
		4. If there is a previous letter, make previous letter the current letter and start back at 3

#### Write Pseudo-Code or Comments ####
1. Can be skipped if we have a good handle on the problem and previous steps are detailed enough (coding should be one to one translation or else use this step)
2. Capture all steps and put them as comments or as pseudo-code (which can be translated to real code)
	1. Makes filling in actual code easier
3. Example:

		// NewWord = ""
		// Loop backwards through word to reverse
		// NewWorld += CurrentLetter
		// return NewWord

	1. It also outlines the structure of the code

#### Replace Comments with Real Code ####
1. This step should not have problem solving
2. Just take each comment or line of pseudo-code into actual code
3. Example:

		String newWord = "";
		for (int index = oldWord.Length - 1; index <= 0; index--)
			newWord += oldWord[index];
		return newWord;

4. If I struggle here?
	1. Didn't break down problem into small enough steps
		1. Go back to second step and be meticulous
			1. Write each and every single step
	2. Not familiar with programming language well enough
		1. [or technology or framework]
		2. Brush up basic constructs
			1. Know the following: (must!)
				1. Build a list
				2. Sort a list or array
				3. Build a map or dictionary
				4. Loop through a list, or dictionary
				5. Parse strings
				6. Convert from string to int, int to string, etc

#### Optimize the Real Code ####
1. Optional
2. Figure out if we can remove a few lines or simplify it
3. Check if variable names are long and meaningful
	1. Helps others evaluate the code
4. Important optimization
	1. Simplify code
	2. Remove duplication

#### A Few Final Tips ####
1. Build confidence by practicing the process
2. [TopCoder](https://simpleprogrammer.com/2010/04/02/so-you-want-to-become-a-better-programmer-topcoder/)
3. [Codility.com](http://codility.com/)
4. Complexity:
	1. If problem involves multiple large steps or is very complicated
		1. Cut the problem in half (divide and conquer)
			1. Where to break?
				1. Think what part of problem already given makes solving the rest easy (?)
		2. Follow the process for each half