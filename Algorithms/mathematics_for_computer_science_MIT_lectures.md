# Mathematics for Computer Science - MIT #
## Lec 1 ##
1. Mathematical proofs
2. Proof:
	1. Method for assertaining a truth
		1. Assertaining - establishing truth, verifying truth
			1. Experimentation and observation
			2. Sampling and counter examples
			3. Judge or jury
			4. Word of GOD (belief)
			5. Word of Boss or Customer or Professor
			6. Conviction (transfering the burden of proof to others)
	2. Mathematical proof:
		1. A verification of a proposition by a chain of logical deductions from a set of axioms
			1. Proposition: Is a statement that is either True or False
				1. Ex: 2 + 3 = 5 (True proposition)
				2. For all n in N, n^2 + n + 41 is a prime number (this is a predicate)
					1. Predicate: It is a proposition whose truth depends on the value of variable(s) - fails at 40
				3. a^4 + b^4 + c^4 = d^4 has no positive integers - false
					1. a = 95800, b = 217519, ...
				4. 313(x^3 + y^3) = d^3
					1. Eliptic curve - factoring large integers technique
						1. Can be used to break cryptosystems
				5. The regions in any map can be colored in 4 colors so that adjacent regions have different colors - 4 color theorem
					1. Proof by picture can be convincing but may be wrong
				6. Every even integer but 2 is the sum of 2 primes - no one knows - Christian Golbach conjecture - Globe article - unsolved mystery
				7. Riemann Hypothesis
				8. Poincare conjecture
				9. for all n in Z, n >= 2 => n^2 >= 4 (symbols are many)
			2. Logical deductions
			3. Axioms
3. Definition: An implication p => q is true if p is false or q is true

		p q p => q
		T T T
		T F F
		F T T
		F F T
		
4. For all n in Z, n >= 2 iff n^2 >= 4 - False
	1. Implication both ways
		1. True if both are True or both are False
5. Axioms:
	1. Definition: An axiom is a proposition that is assumed to be true (no proof) - think worthy (Greek)
		1. Identify what the assumptions are (other people has to agree)
			1. if a = b and b = c, then a = c (axiom)
6. Euclidean Geometry: Given a line L and a point p not on L, there is exactly one line through p parallel to L.
7. Spherical Geometry: Give a line L and a point p not on L, there is no line through p parallel to L (on a sphere)
8. Hyperbolic Geometry: Give a line L and a point p not on L, there are infinitely many lines through p parallel to L
	1. They make sense based on context
9. Axioms guiding principles:
	1. Should be consistent
		1. A set of axioms is consistent if no proposition can be proved to be both true and false
	2. Should be complete
		1. A set of axioms is complete if it can be used to prove every proposition is either true or false
			1. You can solve every problem (you can use them to get to the end)
				1. Trying to find a set of axioms spent careers
					1. Proved that it is impossible to find such axioms
						1. May be Goldbach's conjecture is true but it is impossible to prove

## Lec 2 ##
1. Any axiom that is acceptible which is consistent
2. Direct proofs:
	1. Start with axioms
	2. Logical deductions
	3. Solution
3. Indirect proofs:
	1. Assume the opposite of what is stated
	2. Logical deductions
	3. Contradiction (we assumed wrong in the beginning)
4. Proof by contradiction:
	1. To prove P is true, we assume P is False (i.e. ~P is T), then use that hypothesis to derive a falsehood is True or contradiction
		1. If ~P => F is True
			1. ~P must be False in this case therefore P is True (Since ~P => F is T is same as ~(~P)vF is T i.e. PvF is T. i.e. P is T)
	2. sqrt(2) is irrational:
		1. Pf by contradiction:
			1. Assume for the purpose of contraditiction that sqrt(2) is rational
				1. ~P is T
					1. sqrt(2) = a/b (fraction in lowest terms)
					2. Squaring on both sides
						1. 2 = a^2 / b^2
						2. a^2 = 2b^2 => a is even (2 | a)
						3. a^2 => 4 | a
						4. b^2 => 4 | 2b^2 => 2 | b^2
						5. b is even
				2. Therefore a and b are not in lowest terms
					1. contradiction x
					2. Therefore ~P must be F => P is T
		2. Rational numbers can have finite length decimals repeating
			1. 1/7 = 0.142857142857142857...
5. Induction:
	1. Induction axiom:
		1. Let P(n) be a predicate. If P(0) is true and for all n in N (P(n) => P(n + 1)) is true, then for all n in N, P(n) is true
			1. If P(0), P(0) -> P(1), P(1) => P(2), ..., then P(0), P(1), P(2), ... are true
				1. Series of dominos - if P(0) is knocked down, all the others get knocked down one after the other
	2. Example: for all n >= 0, 1 + 2 + 3 + ... + n = n(n + 1)/2
		1. sigma_i=1_to_n i = n(n + 1)/2
		2. sigma_1_<=\_i\_<=_n i (on top or bottom)
			1. if n = 1, 1 + 2 + ... + n = 1
			2. if n <= 0, 1 + 2 + ... + n = 0
			3. if n = 4, 1 + 2 + ... 4 = 10 = 10
		3. Proof: By induction
			1. Let P(n) be the predicate that sigma_i_=_1_to_n i = n(n + 1) / 2
			2. Base case: P(0) is true?
				1. sigma_i=1_to_0 i = 0
				2. 0(0 + 1) / 2 = 0
			3. Inductive step: For n >= 0, show P(n) => P(n + 1) is true
				1. Assume P(n) is true for purposes of induction
				2. i.e, assume 1 + 2 + ... + n = n(n + 1)/2
				3. Need to show P(n + 1): 1 + 2 + ... + (n + 1) = (n + 1)(n + 2)/2
				
						1 + 2 + ... + n + (n + 1)
						n(n + 1)/2 + (n + 1)
						(n^2 + n + 2n + 2)/2
						(n + 1)(n + 2)/2
						
					1. Therefore `P(n) => P(n + 1)` for all `n >= 0`
6. Limitations with Induction:
	1. We don't know why the theorem is true sometimes
	2. We cannot figure out the answer using induction (n(n + 1)/2)
		1. There are a few instances when we can figure out the answer using induction
7. Theorem: for all n in N 3 | (n^3 - n)
	1. Proof by induction:
		1. P(n): 3 | (n^3 - n)
		2. Base case: P(0): 3 | (0 - 0)
		3. Inductive step: For n >= 0, show P(n) => P(n + 1) is T
			1. Assume P(n) is T, i.e. 3 | (n^3 - n)
			2. Examine: (n + 1)^3 - (n + 1) = n^3 +3n^2 + 3n + 1 -n - 1
				1. = n^3 + 3n^2 + 2n = n^3 - n +3n^2 + 3n = (n^3 - n) + 3(n^2 + n).
				2. 3 | (n^3 - n) by inductive hypothesis and 3 | 3k where k = (n^2 + n)
				3. Therefore, 3 | (n + 1)^3 - (n - 1)
8. Steps:
	1. Base Case: P(b) is true
	2. Inductive Step: for all n ≥ b P(n) => P(n + 1)
	3. Conclude: for all n ≥ b P(n) is true
9. False proof: All horses are of the same color:
	1. Pf: By Induction
		1. P(n): In any set of n ≥ 1 horses, the horses are all of same color
		2. Base case: P(1): True since, just one horse
		3. Inductive step: Assume P(n) to prove P(n + 1)
			1. Consider a set of n + 1 horses: H<sub>1</sub>, H<sub>2</sub>, H<sub>3</sub>, ..., H<sub>n+1</sub>
			2. Then H<sub>1</sub>, H<sub>2</sub>, ..., H<sub>n</sub> are of the same color and H2,H3,...,Hn+1
			3. Since color(H1) = color(H2, ..., Hn) = color(Hn + 1) => color(H1) = color(Hn + 1)
			4. => all n + 1 are of same color
	2. Problem when n = 2!
		1. Does P(1) => P(2)?
			1. color(H1) = color(empty set) is wrong!
	3. P(1) & P(2) => P(3), P(3) => P(4) .... for all n belongs to Z
		1. P(1) => P(2) is F
	4. P(2) be the base case?
		1. Base case is wrong - If any pair of horses are of same color (which is not true always)
10. To prove there is a solution to the problem and to find one
	1. Example: Courtyard - 2^n x 2^n
		1. Statue in the middle
		2. Use L shaped tiles
			1. Tile the courtyard using L shaped tiles (2 x 2) leaving one space for statue
		3. Theorem: for all n, there exists a way to tile a 2^n x 2^n region with a center square missing
			1. Proof by induction: P(n)
				1. Base Case: P(0) - one space for statue - done
				2. Inductive Step: For n >= 0, assume P(n) to verify the inductive hypothesis.
					1. So we need to show P(n + 1) is true
					2. Consider a 2^(n + 1) x 2^(n + 1) courtyard
					3. Divide the courtyard into 4 blocks
			2. Change inductive hypothesis: for all n, there exists a way to tile a 2^n x 2^n region with a corner stone missing
				1. Stronger P(n): for all n, there exists a way to tile a 2^n x 2^n with **any** square missing:
					1. P(n) has got more powerful so that there are more assumptions
						1. Try something harder (assume stronger)

## Lec 3 ##
1. Good proofs are:
	1. Correct
	2. Complete (all the details must be there, key steps)
	3. Clear (we must be able to understand)
	4. Brief (too much detail is not good, key details and crisp)
	5. Elegant (nice one)
		1. Mathematical beauty (crisp, clever, short to the point) - like an art
	6. Well organized
		1. Lemmas (like sub-routines)
	7. In order
		1. Not haphazhard (high school - backwards)
			1. 1 = 1 to A = B is better (not the otherway)
	8. They are like good code
		1. This technique can be used to prove that programs are doing what they are supposed to do
			1. A-300 - software controlled - automated takeoff and landing
				1. Software opened rear door accidentally and the plane crashed
			2. Radiation device: got into race condition - killed patient with too much radiation
			3. American airlines: grounded entire fleet
			4. Akamai: MIT - Content delivery (software bugs may bring up all the sites)
		2. In a few years, our life depends on code written by people
			1. We need rock solid arguments to overcome these situations
	9. Problems:
		1. We are lazy and don't write all details (it is clear, let us move on)
		2. Top 10 proof techniques we should not use:
			1. Proof by example
			2. Proof by vigorous hand waving
			3. Proof by cumbursome notation
			4. Proof by exhaustion
			5. Proof by ommission (reader needs to fill in details)
			6. Proof is trivial
			7. Proof by picture
			8. Proof by vehement assertion
			9. Proof by appeal to intuition
			10. Proof by reference to eminent authority
				1. Fermat's theorem

						for all n > 2 there does not exist x, y, z in N
						x^n + y^n = z^n
						
					1. It is finally proved by someone else
2. Puzzles:
	1. Find a sequence of moves to go from one configuration to another
		1. Legal move - slide a letter to adjacent blank square (row or a column)
		2. Theorem: There is no sequence of legal moves to invert G & H and return all the other letters to their original order or position
			1. Invariant: It holds at initial state and it is preserved for any state reached from initial state (so it does not hold for the special state)
			2. Moves: Row move
				1. Ex: G =>
					1. Relative order of items did not change
						1. Natural order:

								1 2 3
								4 5 6
								7 9 9
								
				2. Lemma 1: A row move does not change the order of the items
					1. Proof: In a row move, we move an item from cell i into an adjacent cell i - 1 or i + 1. Nothing else moves. Hence the order of the items is preserved
						1. Everything is upto i - 2 and i + 1 onwards or upto i - 1 and i + 2 onwards 
				3. Lemma 3: During a move, the # of inversions can only increase by 2 or decrease by 2 or stay same.
					1. Proof: Row move - no changes (by Lemma 1)
						1. Colum move - 2 pairs change order (by Lemma 2)
							1. Case A: both pairs were in order (originally)
								1. Goes up by 2
							2. Case B: both pairs were inverted
								1. Decreases by 2
							3. Case C: One pair was inverted
								1. Stays the same
				4. Corollary 1: During a move, the parity (even/odd) of the # of inversions does not change
					1. If G goes up => GH changes order and GE changes order
					2. Proof: Adding or subtracting 2 does not change the parity
				3. Lemma 4: In every state reachable from start state, the parity of the number of inversions is odd
					1. Proof: (By induction - veriant proofs are always by induction)
						1. P(n): After any sequence of n moves from start state the parity is always odd (n is number of moves usually)
						2. Base Case: P(0) -> no moves
							1. Number of inversions is 1 => parity is odd
							2. Hence P(0) is true
						3. Inductive Step: For n >= 0, show P(n) => P(n + 1)
							1. Consider a sequence of n + 1 moves m1, ..., m_n+1
							2. Pairity of inversions after n moves is odd by P(n)
								1. By I.H, we know that parity after m1,...,m2 is odd
								2. By corrolary 1, we know that parity of # of inversions does not change during m_n+1 => the parity after m1,m2, ..., m_n+1 moves is odd => P(n + 1)
3. Corollary - simple consequence of something else
	1. Usually short proof
4. Lemma - used as a tool to prove a bigger thing
5. Theorem: 
	1. Proof: The parity of the # of inversions in the desired target state is even (0). By lemma 4, the desired state cannot be reached from the start state (the parity of # of inversions is odd)
6. Idea: Find invariant that is preserved in every step and that is not preserved in the target state
7. Practical example:
	1. Nuclear reactor software: From a given state, any sequence of moves does not rach the meltdown state
		1. Use invariant
	2. Aircraft software: from a given state to crash state
	3. Radiation device: ...
8. Strong induction: Easier to use for certain problems
	1. Strong Induction Axiom:
		1. Let P(n) be any predicate. If P(0) is true and for all n (P(0) ^ P(1) ^ ... ^ P(n)) => P(n + 1) is true, then for all n P(n) is true
			1. Assume P(0), ... P(n) is true to prove P(n + 1)
				1. Any proof that can be done with strong induction can be done with ordinary induction (it is a little harder)
	2. Example: Unstacking game

			8 -> 5, 3 (5 * 3 = 15 points)
			5 -> 4, 1 (4 * 1 = 4 points)
			...
			1 (1 point)
			
		1. Add the points for final score
	3. Theorem: All strategies for the n-block game produce the same score. S(n) = n(n - 1)/2 (stronger hypothesis)
		1. Ex: S(8) = 28
		2. Proof by strong induction:
			1. P(n): The theorem
				1. Base case: P(1). S(1) = 0 (1(1 - 1)/2 = 0)
				2. Inductive step: Assume P(1), P(2), ... P(n) to prove P(n + 1)
					1. Look at n + 1 blocks

							n + 1 -> k, n + 1 - k
							
						1. Score = k * (n + 1 - k) + P(k) + P(n + 1 - k)
							1. P(k) = k(k - 1)/2
							2. P(n + 1 - k) = (n + 1 - k)(n - k)/2
							3. score = n(n + 1)/2 => S(n + 1)

## Lec 4 ##
1. Number theory
	1. Study of the integers: 0, 1, 2, 3, ...
		1. Used in cryptography
			1. Study and practive of hiding numbers
				1. Medical data
	2. Definition: m | a (m divides a)
		1. Iff there exists an integer k such that a = k.m
			1. If a = 0, then 0.m = 0 and m | 0
2. Suppose a-gallon jub (a = 3 say), b-gallon jub (b = 5 say) and assume a <= b
	1. Theorem: If m | a and m | b, then m | any result
		1. State machine:
			1. States: pairs (x, y), where x = # gallons in the a-jug, y = # of gallons in b-jug
	2. Start-State: (0, 0)
	3. Transitions:
		1. Emptying: (x, y) -> (0, y) or (x, y) -> (x, 0)
		2. Filling: (x, y) -> (a, y) or (x, y) -> (x, b)
3. Pouring:
	
		(x, y) -> (0, x + y), x + y <= b
		(x, y) -> (x - (b - y), b) = (x + y - b, b), x + y >= b
		
	1. By symmetry

			(x, y) -> (x + y, 0), x + y <= a
			(x, y) -> (a, y + x - a), x + y >= a
			
4. Example: a = 3, b = 5: (0, 0) -> (0, 5) -> (3, 2) -> (0, 2) -> (2, 0) -> (2, 5) -> (3, 4)
	1. By induction: Assume m | a and m | b
		1. Invariant: P(n) = "If (x, y) is the state after n transitions, then m | x and m | y"
		2. Base case: (0, 0). m | 0 => P(0)
		3. Inductive step: Assume P(n)
			1. Suppose (x, y) is the state after n transitions. m | x and m | y (Assuming P(n) is true)
			2. After another transition, each of the jugs are filled with either 0, a, b, x, y, x + y, x + y - a, x + y - b gallons
				1. m | a, m | b, m | x, m | y => m divides any of the above => P(n + 1)
5. Definition: gcd(a, b) = the gratest common divisor of a and b
	1. gcd(52, 44) = 4
	2. Definition: a and b are relatively prime if gcd(a, b) = 1
6. Definition: a and b are relatively prime if gcd(a, b) = 1
	1. Corrolary: gcd(a, b) | any result
7. Theorem: Any linear combination L = sa + tb, of a and b with 0 <= L <= b can be reached (s and t can be negative or positive)
	1. Ex: 4 = (-2)3 + 2(5) = (-2)3 + 2(5) + 5.3 - 3.5 = (3)3 + (-1)5 (s > 0)
	2. We want s to be positive
	3. Proof: Notice L = sa + tb = (s + mb)a + (t - ma)b (where s + mb > 0)
		1. There exists s', t' L = s'a + t'b with s' > 0
		2. Assume 0 < L < b
		3. Algorithm: To obtain L gallons, repeat s' times the following:
			1. Fill the a-jug
			2. Pour into b-jug
			3. When if b-jug becomes full, empty it out
			4. Countinue the above process until a-jug is empty
		4. Example:
			1. First loop: (0, 0) -> (3, 0) -> (0, 3)
			2. Second loop: (0, 3) -> (3, 3) -> (1, 5) -> (1, 0) -> (0, 1)
			3. Third loop: (0, 1) -> (3, 1) -> (0, 4)
		5. Filled the 'a-jug' s' times
		6. Suppose that b jug emptied u times
		7. Let r be the remainder in the b-jug (0 <= r <= b) (assumption 0 < L < b)
		
				r = s'a - ub (entire system has this much)
				L = s'a + t'b
				
			1. We want to show r = L

					r = s'a + t'b - u.b - t'b = L - (t' + u)b
				
				1. If we subtract or add any posible multiple of b then L jumps out of given range. Therefore t' + u = 0
					1. if t' + u != 0, [r < 0 v r > b] -> contradiction
					2. t' + u = 0 => u = -t' => r = L
8. Why s' is positive? We want to repeat the algorithm s' times and if s' is nagative, we cannot repeat s' times
9. Example: 1 = 2.3 - 1.5 => we can reach any multiple of 1
10. Euclid's algorithm: Pulvurizer
	1. There exists a unique q (quotient) and r (remainder) such that b = qa + r with the property 0 <= r < a (assumed for now) - assumed for now
		1. r = rem(b, a)
	2. Lemma: gcd(a, b) = gcd(rem(b, a), a):
		1. Example: gcd(105, 224) = gcd(rem(224, 105), 105) = gcd(14, 105) = gcd(rem(105, 14), 14) = gcd(7, 14) = gcd(rem(14, 7), 7) = gcd(0, 7) = 7
	3. Proof: [m | a ^ m | b] => [m | b - qa = rem(b, a) ^ m | a]
		1. We have proved that gcd(rem(b, a), a) >= m (gcd(b, a) | gcd(rem(b, a), a))
		2. If rem(b, a) != 0 then [m | rem(b, a) = b - qa ^ m | a] => [m | a ^ m | b] (linear combination)

## Lec 5 ##
## Lec 6 ##
## Lec 7 ##
## Lec 8 ##
## Lec 9 ##
## Lec 10 ##
## Lec 11 ##
## Lec 12 ##
## Lec 13 ##
## Lec 14 ##
## Lec 15 ##
## Lec 16 ##
## Lec 17 ##
## Lec 18 ##
## Lec 19 ##
## Lec 20 ##
## Lec 21 ##
## Lec 22 ##
## Lec 23 ##
## Lec 24 ##
## Lec 25 ##