# MIT 6.042J Mathematics for Computer Science, Spring 2015 #
## Quick Summary ##
1. Fundamental concepts of discrete mathematics (sets, relations, proof methods, ...)
	1. Computer scientists are dealing with abstract functions on data types and functions of functions
2. Discrete mathematical structures (numbers (packaged with operations, +, -, exp), graphs, trees, counting (methods)...)
	1. Counting: applied to other structures
		1. Example: how big is search space of passwords
			1. Better be large
3. Discrete Probability Theory
	1. Version of probability theory
	2. Getting by sums instead of integrals

## Vocabulary ##
1. What does "discrete" mean?
	1. individually separate and distinct.

## Proofs ##
1. Rudimentary proofs
2. The ability to distinguish between a plossible argument that may not be right to a proof that is totally right
3. Mathematically unarguable v/s what is likely
4. Theoreticians and mathematicians argue that you don't really understand the subject until you know to prove the basic facts
5. Pragmatically: memorization can get lost, proving can be used in such situations

## Pythogean theorem ##
1. a^2 + b^2 = c^2
	1. Familiar? yes
	2. Obvious? No
2. A cool proof
	1. 4 papers - 3 rectangles and 1 (b - a) square
	2. Elegant and correct - proof by picture
		1. Worrisome in general
			1. How do they form a right angle?
			2. How do they form straight lines?
		2. Hidden assumptions
3. Getting righ by diagram - bogus proof
	1. 11 x 10 rectangle
	2. Mark down 1 and left 1
	3. Move the right piece up and left piece down
	4. A small piece gets generated!!!
	5. Problem: the small pieces are not right triangles
		1. Top and bottom lines are not straight
4. Another bogus proof:
	1. Theorem: Every polynomial, ax^2 + bx + c has two roots over C (complex numbers).
	2. Proof (by calculation). The roots are:

			r1 ::= (-b + sqrt(b^2 - 4ac))/2a
			r2 ::= (-b - sqrt(b^2 - 4ac))/2a

		1. We have not proved it. (proof by calculation)
		2. Problems:
			1. Counter examples:
				
					0x^2 + 0x + 1 has 0 roots
					0x^2 + 1x + 1 has 1 root (x = -1)
		3. What caused this?
			1. Divide by 0 error
			2. a != 0 fixes it
			3. Another problem:
			
					1x^2 + 0x + 0

				1. It has only one root (x = 0)
				2. What happened?
					1. bug: r1 = r2
					2. Fix: D != 0, where D = b^2 - 4ac (discriminent)
		4. Another problem:
			1. What if D < 0?
			
					x^2 + 1 has roots i, -i
				
				1. Ambiguity which is r1 and which is r2?
				2. Problem with ambiguity?
					1. 1 = -1?
						1. 1 = sqrt(1) = sqrt(-1 * -1) = sqrt(-1)*sqrt(-1) = sqrt(-1)^2 = -1

5. Moral:
	1. Be sure rules are properly applied
	2. Thoughtless calculation no substitute for understanding.
		1. Risky
		2. Understanding is important
6. Consequences of 1 = -1
	
		1 = -1
		1/2 = -1/2 (multiply by 1/2)
		2 = 1 (add 3/2)

	1. "Since I and the Pope are clearly 2, we conclude that I and the Pope are 1 that is, I am the Pope." -- Bertrand Russell (Nobel price winner)

## Proof by Contradiction ##
1. Proof technique
	1. Example: Is cube_root(1332) <= 11?
		1. Let us assume that the statement is true
		2. Cube both sides: 1332 <= 11^3
			1. 11^3 = 1331
			2. That's not true, so it is a contradiction
			3. This proves that cube_root(1332) > 11
2. Statement:
	1. If an assertion implies something false, then the assertion itself must be false!
		1. If a step is true, the next step must be true
			1. Each step must be true until the end
	2. If we started with an assumption and each step following the assumption is true and final conclusion is false, then the initial assumption that we started off with is false
3. Theorem: sqrt(2) is irrational
	1. Suppose sqrt(2) was rational
	2. So have n, d integers without common prime factors such that

			sqrt(2) = n / d

		1. We will show that n & d are both even. This contradicts no common factor


				2d^2 = n^2
	
			1. So n is even
				1. n = 2k for some number k
				2. n^2 = 4k^2
				3. 2d^2 = 4k^2
				4. d^2 = 2k^2
				5. so d is even
	3. This contradicts our initial assumption
	4. Assumption: if n^2 is even, then n is even.
		1. Why is this true?
			1. Let is try to prove this:
				1. if n is odd, then n^2 is odd
				
						n = 2k + 1
						n^2 = (2k + 1)^2 = 4k^2 + 4k + 1 = 2(2k^2 + 2k) + 1
							= 2p + 1

					1. n^2 is odd
			2. n has prime factors

## Proof by Cases ##
1. Prove by breaking it up into pieces that are easy to prove but put together cover all the possibilities
2. Example:

		if ((x > 0) || (x <= 0 && y > 100))

	1. x are floats or integers

			if ((x > 0) || y > 100) // more efficient

	2. Case 1: x > 0
		1. if (true || xxx) => true
		2. if (true || ...) => true
	3. Case 2: x <= 0
		1. if (false || (true && y > 100))
			1. if (y > 100)
		2. if (false || (y > 100))
			1. if (y > 100)
3. So both still the same
4. The above are the only cases

### Definition ###
1. Reasoning by cases breaks a complicated problem into easier subproblems.
	1. Some philosophers (intuitionists) think reasoning this way is worrisome
		1. Example: $1, 000, 000 Question - open problems
			1. Is P = NP?
				1. P: Polynomial time
				2. NP: Not deterministic polynomial time

### The Well Ordering Principle ###
1. Used already
2. Statement:
	1. Every nonempty set of nonnegative integers has a least element.
		1. Familiar? Yes
		2. Obvious? Yes
		3. Trivial? Yes. But watch out.
	2. Every nonempty set of nonnegative rationals has a least element.
		1. Answer: No!
			1. There is a set of infinite numbers
	3. Every nonempty set of integers has a least element.
		1. No!
			1. There is a set of infinite numbers
3. Other problems:
	1. Youngest age of MIT graduate?
	2. Smallest # of neurons in any animal?
		1. We may not know what it is but there surely is a smallest number of neurons because they are all non-negative integers
	3. Smallest # of coins = $117?
4. N ::= non-negative integers
	1. For rest of this talk "number" means non-negative integer
	2. Example: root(2) proof used well ordering principle
		1. Proof: suppost root(2) = m/n
			1. We can always find such m, n > 0 without common factors...
				1. Why always?
		2. Example: Let us find smallest number m s.t.
			1. root(2) = m / n. if m, n had a common factor, c > 1, then
				1. root(2) = (m/c)/(n/c) and m/c < m (contradiction)
				2. This contradition implies m, n have no common factors.

### Well Ordering Principle ###
1. Theorem: Every integer > 1 is a product of primes
	1. Proof by induction and ordering principle:
		1. Base case: the least integer > 1 is 2
			1. 2 is prime because the only integers that divide 2 is 1 and itself
		2. Assumption: Let us assume that all non-negative integers in the set [1, k] are product of primes
		3. Induction: Let us consider k + 1.
			1. There are two possibilities
				1. Case 1: k + 1 is prime
					1. If k + 1 is prime, then it is divisible by either 1 or itself (k + 1), and since the only factor of k + 1 is itself and since the factor is prime, therefore, k + 1 is a product of primes
				2. Case 2: k + 1 is composite
					1. If k + 1 is composite, then it has atleast two factors. Each factor is > 1
					2. Let us assume that

							k + 1 = f1*f2*f3*...*fn

						1. Proof by contradition: Let us assume that there is a factor fi that is not prime
							1. Since every factor fp > 1, then f1 < k + 1, f2 < k + 1, ... fn < k + 1
								1. => f1 <= k, f2 <= k, ..., fn <= k (since the maximum possible integer < k + 1 is k)
							2. => 1 < fi <= k
							3. Since we assumed that all numbers [1, k] are product of primes => fi is a product of primes
							4. This is true for each fp where 1 <= p <= n
							5. Therefore, any composite factor can be decomposed into prime factors and hence k + 1 is a product of primes
							6. By induction, any number n > 1 is a product of prime factors  
		4. Contradiction proves that there is no counter example that can satisfy the assumption
2. Well ordered postage
	1. 5c, 3c stamps available
	2. n is postal if can (n + 8)c postage from 3c and 5c stamps
	3. Theorem: Every number is postal
		1. Proof: Using WOP. Suppost there is a number that is not postal
			1. Let m be least counterexample (since set is not empty)
			2. Since m is not postal, any number < m is postal
			3. 0 is postal: 0 + 8c
				1. m != 0
				2. m != 1
				3. m >= 3
			4. Now m - 3 is a number < m, so is postal
				1. (m - 3) + 8c is postal
			5. m is postal because by adding 3c we can make it postal => m + 8c
				1. This is a contradition
			6. Every number is postal
3. Geometric sums:
	
		1 + r + r^2 + r^3 + ... + r^n = (r^(n+1) - 1)/(r - 1)

	1. Proof: Using well ordering principle
	2. Let m be the smallest n with not equal to the rhs
		1. If n = 0, lhs = rhs (1 = 1)
		2. Therefore, m > 0,
			1. => for m - 1, the equality holds

					1 + r + r^2 + r^3 + ... + r^(m - 1) = (r^((m - 1) + 1) - 1) / (r - 1) = (r^m - 1)/(r - 1)

				1. Add r^m to both sides
					1. RHS:
							
							(r^m - 1)/(r - 1) + r^m
							(r^m - 1)/(r - 1) + (r^(m + 1) - r^m)/(r - 1)
							(r^m - 1 + r^(m + 1) - r^m)/(r - 1)
							(r^(m + 1) - 1)/(r - 1)

						1. So this identity holds at m as well, contradicting not equals.
						2. Hence there is no counter example

### Generalization of Well Ordering Principle ###
1. To prove for all n belonging to N, P(n) holds using WOP:
	1. Step 1: Define a set of counterexamples
	
			C ::= {n belongs to N | NOT P(n)}

		1. Assume C is not empty. By WOP, it has minimum element m belonging to C
		2. Reach a contradiction somehow...
			1. This is by reasoning
			2. No simple recipe
			3. Principle of P(n)
			4. Usually:
				1. Finding c belonging to C with c < m (assumption that m is smallest)
				2. Proving P(m) holds which contradicts the assumption that m belongs to C

## Propositions & Logical Operations ##
1. A proposition is either True or False (definition)
	1. There are 5 regular solids
		1. True
	2. To place 100 fixed position satellites in a uniform way
		1. Cant do it
			1. There is no 100 vertex regular solid
			2. The biggest one is 20 vertices
	3. There are 6 regular solids
		1. False
2. Non-examples?
	1. Wake up! - True or False doesn't apply
	2. Where am I? - Question. True or False doesn't apply
	3. It's 3PM - It can be True or False at a given point in time
		1. Depends on Time
3. Proposition must be fixed (True for ever or not True for ever)
4. Why this?
	1. Ordinary language tends to be ambiguous
		1. Example: G implies (S or J)
			1. G -> (S v J)
				1. True even if a Greek carries both a sword and a Javalin
					1. Inclusive or
	2. Greeks carry Bronze or Copper swords
		1. Bronze or copper but not both
			1. We here mean exactly one
				1. G implies (B xor C)
					1. G -> (B circle_with_plus C)
						1. Adding two numbers mod 2

## Binary Addition Circuit ##
1. 1 + 1 + 1 = XOR(1, XOR(1, 1))
2. OR(OR(AND(1, 1), AND(1,1), AND(1,1))
	1. ((a_0 xor b_0) xor c_0)
	2. a_0 and b_0 or a_0 and c_0 or b_0 and c_0
3. Full adder: has carry
	1. d ::= a XOR b (just definition)
	2. c ::= a AND b
4. Half adder: no carry
	1. Two half adders:
		1. s = a + b
		2. d = cin + s
		3. cout = (cin and s) or (a and b)
	2. General case:
		1. si ::= ai xor bi
		2. di ::= ci-1 xor si
		3. ci ::= (ci-1 and si) or (ai and bi)

## Truth Tables Equivalence Validity ##
1. A truth assignment assigns a value T or F to each propositional variable.
	1. Environment: Computer scientists call assignment of value to variables an environment
		1. If we know the environment, we can find the value of a propositional formula
	2. Example: Suppose environment, v, assigns
		1. v(P) = T, v(Q) = T, v(R) = F
		2. Truth value of

				(NOT(P AND Q)) OR (R XOR NOT(Q))
					 T     T       F	  F  T
				  F		T			  F
							   F

			1. Implementation is recursive top down
2. Equivalence:
	1. Two propositional formulas are equivalent iff they have the same truth value in all environments
		1. No matter what the values of p, q and r are
	2. Example: DeMorgan's Law - NOT(P OR Q) = NOT(P) AND NOT(Q)
		1. Truth table - has 4 possible environments, one per row
		
				P Q NOT(P OR Q) NOT(P) AND NOT(Q)
				T T	F			F
				T F F			F	
				F T F			F
				F F T	  		T

			1. Same final column, so equivalent
				1. -- proof by Truth Table
	3. Definition of IFF
		1. The value of (P IFF Q) is T iff P and Q have the same truth value
				
				P Q P IFF Q
				T T T
				T F F
				F T F
				F F T

## Satisfiability & Validity ##
1. A formula is satisfiable iff it is true in some environment
	1. Example: P, NOT(P)
		1. T if P is T
		2. T if P is F
	2. Example: Not satisfiable formula
		1. (P AND NOT(P))
2. A formula is valid iff it is true in all environments
	1. P OR NOT(P): Always true
3. G and H are equivalent:
	1. (G iff H) is valid
		1. If G is T and H is T and there for the statement is T
		2. If G is F and H is F and there for the statement is T
		3. Hence (G iff H) is valid 

### Checking if a formula is valid, satisfiable ###
1. Truth table approach
	1. Truth table size doubles with each additional variable
		1. Exponential growth
			1. 100s of variables cannot be written in a truth table
2. Fast Test for SAT?
	1. The P = NP? question is equivalent to asking if there is an "efficient" (polynomial rather than exponential time) procedure to check satisfiability (SAT)
3. To check that G is valid,
	1. check that NOT(G) is not satisfiable
	2. So checking for one is equally difficult (or easy) as checking for the other

## Predicate Logic, I ##
1. Quatifiers (for all), (exists)
2. Predicates:
	1. P(x, y) ::= [x + 2 = y]
		1. x = 1 and y = 3, P(1, 3) is true
		2. x = 1 and y = 4, P(1, 4) is false
			1. NOT(P(1, 4)) is true
	2. For all is like AND
		1. Let s range over 6.042 staff
		2. P(s) ::= [s is Pumped about 6.042]
			1. For all s. P(s)
				1. Same as
					1. P(Drew) AND P(Peter) AND P(Keshav) AND ... AND P(Michaela)
	3. There exists is like OR
		1. Let t range over 6.042 staff B(t) ::= [t took 6.042 Before]
			1. there exists t. B(t) same as
			2. B(Drew) OR B(Peter) OR B(Keshav) OR ... OR B(Michaela)

### Existential Quantifier ###
1. Let x, y range over N
	1. Q(y) ::= there exists x, x < y
		1. Q(3) is T ([x < 3] is T for x = 1)
		2. Q(1) is T ([x < 1] is T for x = 0)
		3. Q(0) is F ([x < 0] is F for any x in N)

### Universal Quantifier ###
1. x, y range over N
	1. R(y) ::= for all x, x < y
		1. R(1) is F ([x < 1] is F for x = 5)
		2. R(8) is F ([x < 8] is F for x = 12)
		3. R(10^100) is F ([x < 10^100] is F for x = 10^100)
	
### Virus attack, I: for all there exists ###
1. Predicate: for all v belongs to virus. there exists d belonging to defense
	1. d protects against v
2. For every visus, I have a defense
	1. against MYDOOM, use Defender
	2. against ILOVEYOU, use Norton
	3. against BABLAS, use Zonealarm...
3. This is expensive:
	1. for all there exists is expensive! (too expensive for all softwares)
4. Predicate: there exists a defense for all v belonging to virus.
	1. d protects against v
5. I have a defense good against every attack
	1. Example: d is MITvirusscan, protects against all viruses
	2. This is what we want (lot cheaper)

### Alternating Quantifiers ###
1. G ::= for all x, there exits y. x < y
	1. x, y range over Domain of Discourse
		1. Domain: N, G is T
			1. There is no need of recipe (some integer exists)
		2. ints < 0, G is F for x = -1
		3. reals < 0, G is T (if x is negative, y = x/2 satisfies it)
2. H ::= there exists a y for all x such that x < y
	1. Domain: N, H is F (there is no biggest non-negative integer)
	2. Domain: Z-, H is F (there is no biggest negative integer)
	3. Domain: R-, H is F (there is no biggest negative real)
	4. In general: Any y cannot be bigger than itself
		1. Cannot find biggest y which is bigger than itself
3. H ::= there exists a y for all x such that x <= y
	1. Domain: N, H is F
	2. Domain: Z-, H is T (x = -1)
	3. Domain: R-, H is F

## Predicate Logic, II ##
1. Validity & Satisfiability:
	1. Propositional validity
		1. True for all truth-values (all possible combinations)

				(P IMPLIES Q) OR (Q IMPLIES P)
				
			1. This is always true
	2. Predicate Calculus validity
		1. True for all domains and predicates. (It should be true for all possible domains of discourse the that variables range over)
			1. The formula comes out to be true no matter what the predicate means

					for all z.[P(z) AND Q(z)] IMPLIES [for all x.P(x) AND for all y.Q(y)]
					
				1. This means: Everything in the domain has property P and property Q this implies that everything in the domain has property P and everything in the domain has property Q 
					1. This is fundamental logical fact that does not depend on what P and what Q actually mean
						1. This follows from the definition of for all, and and implies
					2. Hence this is valid
		2. How to prove validity?
			1. Proof strategy: assume left side is T, then
				1. Then prove right side is T
			2. Example:

					for all z[Q(z) ^ P(z)] -> [for all x.Q(x) ^ for all y.P(y)]
					
				1. Proof: Assume left hand side. That is, for all values of z in the domain, Q(z) and P(z) is true
					1. Suppose val(z) = c, an element in the domain. Then
						1. => Q(c) AND P(x) holds, and so Q(c) by itself holds
							1. But c could have been any element of the domain.
								1. So we conclude for all x.Q(x) (by Universal Generalization)
							2. Similarly conclude for all y.P(y). Therefor for all x.Q(x) AND for all y.P(y) QED
				2. This implies that universal quantification distributes over AND
					1. It is itself fundamental but translating it to english (not really a proof)
						1. It can be thought of as an axiom
		3. Unviersal Generalization (UG)

					  P(c)
				--------------
				for all x.P(x)
				
			1. If we have proved the one above the bar, then we have proved the one below the bar
				1. Provided c does not occur in any other part in predicate P
		4. Proving something is not valid:
		
				for all z.[P(z) OR Q(z)] IMPLIES [for all x.P(x) OR for all y.Q(y)]
				
			1. Saying that: Every thing has the property P or property Q, then everything has property P or everything has property Q
			2. Proof: Give counter-model, where left size of IMPLIES is T, but right side is F
				1. Namely, let domain ::= {1, 2}
				2. Let Q(z) ::= [z = 1], P(z) ::= [z = 2]
					1. Is left hand side true? Yes for both z = 1, and z = 2
					2. RHS: If z = 1, P(z) is false, If z = 2, Q(z) is false
						1. => P(z) is not true for all z in domain
						2. => Q(z) is not true for all z in domain
						3. => False or False is False (RHS is false)
		5. DeMorgan's Law for Quantifiers:
			1. Another valid formula:
				1. ~(P OR Q) iff ~P AND !Q
				2. NOT(for all x.P(x)) IFF there exists y.NOT(P(y))
					1. If it is not the case that for all x, property P holds true, then there exists some y such that P does not hold to be true

## Predicate Logic III ##
1. for all, there exists (English is ambiguous)
	1. Two meta-theorems
		1. Mathematics of mathematical logic
	2. Poet: "All that glitters is not gold"
		1. Literal translation: for all x[G(x) IMPLIES NOT(Au(x))]
			1. NOT(for x.[G(x) IMPLIES Au(x)])
				1. It is not true that all that glitters is gold
	3. Literal translation may be non-sense
		1. Machine translation from Natural language to precise formal language is problematic
2. Example: There is a season to every purpose under heaven:
	1. Literal translation
		1. There exists s in Season for all p in Purpose.s is for p (there exists a season that is for every purpose)
		2. Actual: for all p in Purpose there exists s in Season.s is for p 
			1. For every purpose, there exists a season such that the season is for the purpose
3. Two profound theorems about Mathematical Logic
	1. Power & Limits of Logic (They are meta-theorems - theorems about theorems - theorems about systems for proving theorems)
		1. Meta - means going up above a level
	2. Theorem 1: Good News theorem: Only need to know a few axioms & rules to prove all valid formulas
		1. In theory; in practice need lots of rules
