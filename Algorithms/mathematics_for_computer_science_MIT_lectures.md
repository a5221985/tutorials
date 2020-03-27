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
			1. Therefore: gcd(rem(b, a), a) <= gcd(b, a)
		3. If rem(b, a) = 0 => bq - a = 0 or bq = a
	4. Theorem: gcd(a, b) is a linear combination of a and b
		1. Proof by induction: Invariant - P(n) = If Euclid's algorithm reaches the gcd(x, y) after n steps, then both x and y are linear combinations of a and b, gcd(a, b) = gcd(x, y)
			1. Base case: P(0) is true
			2. Inductive step: Assume P(n), Notice that there exists a q such that rem(y, x) = y - qx.
				1. Since y and x are linear combinations of a and b (by inductive hypothesis), y - qx is also a linear combination of a and b => P(n + 1)
	5. Theorem: gcd(a, b) is the smallest positive linear combination of a and b
		1. Combine the three arguments and prove this

## Lec 5 ##
1. Encryption:
	1. Cryptology - art of hiding information
	2. Beforehand: "keys" are exchanged
	3. Encryption: m' = E_keys(m)
	4. Decryption: m = D_keys(m') (Only works if keys exist)
2. Man in the middle - If I don't have keys, I cannot find m' from m or m from m'
3. Turing's code V1:

		m = 22 09 03 20 15 18 25 13
		
	1. Change to a prime number P(m)
	2. Beforehand: Exchange secret prime - k
	3. Enc: m' = m.k (both are prime)
	4. Dec: m = m'/ k
4. Hard to factor a product of two large primes
5. How to break it?
	1. m1' = m1 . k
	2. m2' = m2 . k
	3. gcd(m1', m2') = k - key is revealed
6. Turing code V2:
	1. Beforehand: exchange a public prime p, a secret prime k
	2. Encryption: message - a number m in {0, 1, ..., p - 1}
	3. Compute encryption as: m' = rem(mk, p)
	4. Decryption: ?
7. Property: a, b are relatively prime iff gcd(a, b) = 1 iff there exists s, t such that sa + tb = 1
	1. Congruency:
		1. Definition: x is congruent to y modulo n : x = y (mod n) (three bars) iff n | (x - y)
			1. Ex: 31 = 16 (mod 5)
		2. Definition: The multiplicative inverse of x modulo n is a number x^-1 in {0, 1, ..., n - 1} such that x.x^-1 = 1 (mod n)
			1. Ex: 2.3 = 1 (mod 5)
				1. 2 = 3^-1 (mod 5)
				2. 3 = 2^-1 (mod 5)
			2. Ex: 5.5 = 1 (mod 6)
				1. 5 = 5^-1 (mod 6)
8. rem(mk, p) = mk (mod p)
	1. m' = mk (mod p)
	2. If k.k^-1 = 1 (mod p) - (not always possible), then m'k^-1 = m.k.k^ = m (mod p)
		1. Since m' = mk (mod p) => p | (m' - mk) => p | (m'k^-1 - mk.k^-1) => m'k^-1 = mk.k^-1 (mod p) (m is in {0, 1, ..., p - 1})
			1. m = rem(m'k^-1, p) - Decryption
	3. Attack: Known-plaintext attack
		1. Know message m and encryption m' = rem(mk, p)
			1. Proof:
				1. m'k^-1 = m (mod p) => p | (m'k^-1 - m) => m'k^-1 - m = ip (for some i) => m = -ip + m'k^-1 = rem(mk^-1, p)
		2. Know message m and encryption m' = rem(mk, p)
			1. m' = mk (mod p)
			2. gcd(m, p) = 1
			3. Compute m' such that m.m' = 1 (mod p)
				1. m'm^-1 = k.m.m^-1 = k (mod p)
					1. Compute k^-1 (mod p)
9. Definition: Euler's Totient Function: Phi(n) denotes the number of integers in {1, 2, ..., n - 1} that are relatively prime to n
	1. 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
		1. Phi(12) = 4 (number of integers relatively prime)
		2. n = 15: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14: 1, 2, 4, 7, 8, 11, 13, 14 => Phi(15) = 8
10. Euler's theorem: if gcd(n, k) = 1 => k^Phi(n) = 1 (mod n)
	1. Lemma: If gcd(n, k) = 1, then ak = bk (mod n) => a = b (mod n)
		1. Proof: 
	2. gcd(n, k) = 1 iff k has a multiplicative inverse
		1. Proof: gcd(n, k) = 1 <=> there exists s, t . ns + kt = 1 <=> there exists t n | (kt - 1) <=> kt = 1 (mod n) (t is the multiplicative inverse)
11. Lemma: Suppose that gcd(n, k) = 1, Let k1,...,kr in {1, 2, 3, ..., n - 1} denote the integers relatively prime to n (r = Phi(n)), Then {rem(k1.k, n), ..., rem(kr.k, n)} = {k1, ..., kr}
	1. Step 1: The set has r elements
		1. Proof: To prove that rem(ki.k, n) = rem(kj.k, n) happens only if ki = kj
			1. ki.k = kj.k (mod n) (ki.k = pn + rem(ki.k, n) and kj.k = sn + rem(kj.k, n) => (ki.k - kj.k) = (p - s)n => n | (ki.k - kj.k))
			2. ki.k = kj.k (mod n) => ki = kj (mod n) => n | (ki - kj) => (ki - kj) = 0 (since both ki and kj are in the range {0, 1, ..., n - 1}) => ki = kj
	2. Step 2: The set is a subset of the set
		1. gcd(n, rem(ki.k, n)) = gcd(n, ki.k) (gcd property - Euclid's theorem)
		2. gcd(n, k) = gcd(n, ki) = 1 => gcd(n, k.ki) = 1 => gcd(n, rem(ki.k, n) = 1 => rem(ki.k, n) must be part of the second set. Thus the first set is a subset of the second
12. Proof: Euler's theorem
	1. k1.k2....kr = rem(k1.k, n)....rem(kr.k, n) = k.k.k2.k....kr.k (mod n) = k1.k2...kr. k^r (mod n) => 1 = k^r (mod n) where r = Phi(n) (since ak C= bk (mod n) => a C= b (mod n)
13. Fermat (little) theorem: Suppose p is prime and k is in {1, 2, ..., p - 1} Then k^(p - 1) C= 1 (mod n)
	1. Proof: 1, 2, ..., p - 1 are relatively prime to p (since p is prime)
		1. k^Phi(p) C= 1 (mod p) => k^(p - 1) C= 1 (mod p) (since Phi(p) = p - 1 because all numbers upto p (not included) are relatively prime to p)
3. k.k^(p - 2) C= 1 (mod p) => k^(p - 2) is a multiplicative inverse of k
4. **RSA**: Beforehand - receiver constructs a public key and a secret key (public key is published)
	1. Generate two distinct primes p and q (we can generate and test for primality efficiently)
	2. Let n = pq (it is hard to factor a multiple of two primes)
	3. Select e such that gcd(2, (p - 1)(q - 1)) = 1
		1. public key is the pair (e, n)
	4. Compute d such that d.e C= 1 (mod (p - 1)(q - 1)) (d is a multiplicative inverse of e)
		1. Secret key is the pair (d, n)
	5. Encryption: m' = rem(m^e, n)
	6. Decryption: m = rem(m'^d, n)
5. Proof:
	1. m' = rem(m^e, n) C= m^e (mod n) => (m')^d C= m^(ed) (mod n) (?)
	2. There exists r such that ed = 1 + r.(p - 1)(q - 1) (ed C= 1 (mod (p - 1)(q - 1)))
	3. So, (m')d C= m^(ed) C= m.m^(r(p - 1)(q - 1)) (mod n)
		1. n = pq
		2. If m !C= 0 (mod p) then m^(p - 1) C= 1 (mod p)
		3. If m !C= 0 (mod q) then m^(q - 1) C= 1 (mod q)
		4. So m'^d C= m (mod p) => p | ((m')^d - m)
		5. And m'^d C= m (mod q) => q | ((m')^d - m)
			1. Possible if pq | ((m')^d - m) => (m')^d C= m (mod pq)
			2. => (m')^d C= m (mod n) (m is in {0, ..., n - 1})
				1. => m = rem((m')^d, n)
6. FHE over the integers
	1. Arithmetic operations can be performed on encrypted text?

## Lec 6 ##
1. Graphs:
	1. Applications - scheduling, optimization, communications, design-and-analysis of algorithms, industry
2. Claim: (U Chicago): on average, men have 74% more opposite gender partners than women.
	1. ABC news: Average man has 20 partners and average woman has 6 (233%)
3. Graph: It is dots (nodes) connected by lines (edges). Nodes are sometimes labelled
	1. Formal definition: A graph G is a pair of sets s (V, E) where V is a non-empty set of items called vertices or nodes and E is a set of 2-item subsets of V called edges.
		1. Ex: V = {X1, X2, X3, ..., X7} and E = {{X1, X2}, {X1, X3}, ..., {X5, X7}}
		2. Another notation: X1 --- X2 (edges)
		3. non-empty vertices - to prove certain theorems (which could be false otherwise)
		4. Ex: G = (V, E), V = {X1, X2, X3}, E = Phi
	2. Definition: Two nodes Xi and Xj are adjacent if {Xi, Xj} is in E
	3. Definition: An edge e = {Xi, Xj} is incident to Xi and Xj (e is label)
	4. Definition: The number of edges incident to a node is the degree of the node
		1. Ex: deg(X5) = 3
	5. Definition: A graph is simple if it has no loops or multiple edges
		1. Loop: connects to only one node
		2. Multi-edge: Two edges connect to two nodes
4. Partners:
	1. Tom ----- Nicole
	2. Ben ----- Penelope
	3. Jude ---- Katie
	4. Keith --- ...
	5. |V| ~ 300 m, |Vm| = 147.6m, |Vn| = 152.4m, |E| = ??
	6. Definition: 
		1. Am = average # of opposite gender partners for men
		2. Aw = average ,, ,, for women
		3. What is Am/Aw = 1.74, 3.33 (according to survey and news)
		4. Am = sigma_x_in_Vm deg(x) / |Vm| = |E| / |Vm|
		5. Aw = sigma_x_in_Vw deg(x) / |Vw| = |E| / |Vw|
		6. Am / Aw = (|E| / |Vm|)/(|E| / |Vw|) = |Vw| / |Vm| ~ 1.0325 (nothing to do with promiscuity of men or women?)
5. Scheduling exams: edge means they cannot be together
	1. Example: Pairs of classes with overlapping student enrollment
		1. Slots:
			1. Wed - 5-7 PM
			2. ,,  - 7-9 PM
			3. ,,  - 9-11 PM
			4. ,,  - 11-1 AM
			5. ,,  - 1-3 AM
		2. Goal: Assign slots to nodes  (as fewer as possible) without overlap (no edge between them)
			1. Graph coloring problem: Given a graph G and K colors, assign a color to each node so that adjacent nodes get different colors.
			2. Definition: The minimum value of k for which such a coloring exists is the chromatic number of the graph. (Chi(G))
			3. Example: Time slot is the color
				1. C1, C2, ..., C5
6. Chi(G) = 3 example
	1. No one knows a fast algorithm for coloring a graph
		1. It is easy to check that colors are different
		2. It takes exponential time to color a graph
	2. Even 3 coloring problem is exponential problem
		1. NP-Complete problem
			1. It is easy to check validity (polynomial)
			2. Figuring out is hard (exponential)
				1. We don't know if we can solve these problems simply
7. Basic Coloring Algorithm for G = (V, E) (Greedy algorithm)
	1. Order the nodes v1, v2, ..., vn
	2. Order the colors C1, C2, ...
	3. For i = 1, 2, ..., n:
		1. Assign the lowest legal color to vi
8. Greedy algorithm:
	1. Go one step at a time (simple)
	2. Take the best at each step
	3. Never go back and make it better
	4. Never do hill climbing
9. Theorem: If every node in G has degree <= d, then Basic Algorithm uses at most d + 1 colors
	1. If graph has 100s of nodes but max degree is 3, then 4 colors max
	2. In graphs put n for nodes. If it does not work, put n for edges
		1. If every node in an n-node graph G has degree <= d, then Basic Algorithm uses at-most d + 1 colors
			1. Base case: n = 1 => 0 edges (no loops) => d = 0, 1 color = d + 1 (0 + 1)
			2. Inductive step: Assume P(n) is true for induction. Let G = (V, E) be any n + 1 node graph, Let d be the largest degree in G, Order the nodes V1, V2, ..., Vn, Vn+1. Remove Vn+1 (and all edges connecting Vn+1) from G to construct G' = (V', E'). G' has max degree <= d & n nodes So P(n) says Basic Algorithm uses <= d + 1 colors for V1, V2, ..., Vn
			3. Vn+1 has <= d neighbors => There exists atleast one color in the set of d + 1 colors not used by any neighbor. Give Vn+1 that color => Basic algorithm uses <= d + 1 colors on G => P(n + 1).
	3. Kn = n-node complete graph (Clique - clique of friends - everyone likes everybody)
		1. d = n - 1
		2. Chi(Kn) = n = d + 1
	3. Induction in graphs is similar to this one
	4. Chi(G) is way off of d
		1. Bipartite graph: degree = n / 2, Chi(G) = 2
		2. Star graph: d = n - 1, Chi(G) = 2
			1. Basic algorithm: 2 colors no matter the order
	5. Bipartite graph with all edges except edges straight across
		1. Bad ordering:

				V1			V2
				V3			V4
				...
				Vn-1		Vn
					
			1. V1 - C1
			2. V2 - C1
			3. V3 - C2
			4. V4 - C3
			5. ...
	6. Definition: A graph G = (V, E) is bipartite if V can be split into VL, VR so that all the edges connect a node in VL connect to a node in VR
		1. Bipartite: We can do it with 2 colors
	7. Example: Akamai servers
		1. 75000 servers
		2. Software release every week
		3. Need to deploy efficiently
			1. If servers are brought down, there is downtime
			2. If we do one server at a time, it is extremely time consuming
		4. 75000 servers is a gigantic graph coloring problem
			1. If there are edges between pairs of servers, then they cannot be taken down at the same time
			2. Graph coloring algorithms: 8 colors
				1. 8 waves of installs - 8 times installation
	8. Assigning every variable to a register:
		1. We cannot have two variables active at the same time associated with the same register (minimize the number of registers)
			1. Colors - registers
	9. Map coloring problem
		1. 4 colors
	10. Assign frequencies to radio stations or cell towers
		1. If two towers have overlapping area, they cannot be given the same frequency (collision)
			1. Frequencies are very expensive (Govt needs to be paid)

## Lec 7 ##
1. Marriage - Matching problem
	1. Online dating agencies
	2. Assignment problems
		1. Matching interns to hospitals
	3. Resource allocation
		1. Load balancing traffic on the internet
	4. Graph:
		1. Edges represent compatibility
		2. Definition: Given a graph G = (V, E), a matching is a subgraph of G where every node has degree 1
2. Definition: A matching is perfect if it has size |V|/2

## Lec 8 ##
1. Walks & Paths
	1. Definition: Walk - A walk is a sequence of vertices connected by edges:
		1. vo (start) - v1 - v2 - ... - vk (end) - length k
	2. Definition: A path is a walk where all vertices vi's are different
	3. Lemma: If there exists a walk from u to v, then there exists a path from u to v
		1. Proof: There exists a walk from u to v, By well ordering principle; walk of minial length.

				u = v0 - v1 - v2 - ... - vk = v
				
			1. Case: k = 0 (right)
			2. Case: k = 1 (u - v)
			3. Case: k >= 2 (suppose walk is not a path). There exists i != j such that vi = vj
			
					u = v0 - v1 ... - ... vi = vj - ... - vk = v
					
				1. This is a shorter walk and this contradicts our assumption of minimality. Therefore shortest walk is a path
2. Connectivity:
	1. Definition: u and v are connected if there is a path from u to v
	2. Definition: A graph is connected when every pair of vertices are connected
3. Cycles & Closed Walks
	1. Definition: A closed walk is a walk which starts and ends at the same vertex v0 - v1 - ... - vk = v0. If k >= 3 and v0, v1, ..., vk-1 are different, then it is called cycle
4. Trees:
	1. Definition: A connected and acyclic graph is acalled a tree
	2. Definition: A leaf is a node with degree 1 in a tree
	3. Lemma: Any connected subgraph of a tree is a tree
		1. Proof: By contradiction. Suppose the connected subgraph is not a tree: has a cycle => whole graph has this cycle. But the whole graph is a tree (so no cycle). It is a contradiction
	4. Lemma: A tree with n vertices has n - 1 edges
		1. Proof: By induction on n.
			1. P(n): There are n - 1 edges in any n vertex tree
			2. Base case: P(1): There are 0 edges in any 1 vertex tree. This is true
			3. Inductive step: Suppose P(n) (is true)
				1. Let T be a tree that has n + 1 vertices (We need to remove a vertex such that the result is still a tree - remove leaf (only one edge is connected))
				2. Let v be a leaf of the tree. 
					1. Delete v: This leaves a connected subgraph and by the lemma this is a tree
				3. By P(n): it has n - 1 edges
			4. Re-attach v: T has (n - 1) + 1 = n edges => P(n + 1)
5. Definition: A spanning tree (ST) of a connected graph is a subgraph that is a tree with the same vertices as the graph
	1. Theorem: Every connected graph has a spanning tree.
		1. Proof by contradiction: Assume - a connected graph G that has no spanning tree. Let T be a connected subgraph of G with the same vertices as G and with the smallest number of edges possible. T is not a ST, so it must have a cycle. 
			1. Case 1: x is connect to y and does not contain e. If e is removed, x and y are still connected
			2. Case 2: All vertices in G are still connected after removing e from T.
			3. We have constructed a sub-graph with the same number of vertices as G but with fewer edges. This is a contradiction to our original assumption that T is a connected subgraph with smallest number of edges
6. Weight of ST: 19, can be reduced to 17
7. Definition: The MST of an edge weighted graph G is the ST of G with the smallest possible sum of edge weights.
8. Algorithm: Grow a subgrah one edge at a time, at each step:
	1. Add the minimum weight edge that keeps the subgraph acyclic
9. Lemma: Let S consist of the first m edges selected. By the algorithm. Then there exists an MST T = (V, E) for G such that S is a subset E.
10. Theorem: For any connected weighted graph G, the algorithm produced a MST
	1. Proof: |V| = n. 
		1. If < n - 1 edges are picked, then there exists an edge in E - S that can be added without adding a cycle. (The algorithm does not select an edge that adds a cycle and E - S does not have any edges that can add a cycle)
		2. Once m = n - 1, we know S is an MST (since S is a subset of E  and S has n - 1 edges and E has n - 1 edges => S = E)
11. Proof of Lemma:
	1. P(m) = for all G and for all S consisting of the first m selected edges, there exists an MST T = (V, E) of G such that S is a subset of E
		1. Base case: m = 0 => S = {}, S is a subset of E for any MST T = (V, E)
			1. For all G there exists a spanning tree by previous theorem
		2. Inductive step: Assume that P(m) holds.
			1. Let e denote the edge added in (m + 1)th step and let S denote the first m selected edges.
			2. By P(m): Let T* = (V, E\*) be a MST such that S is a subset of E\*
				1. Case 1: If e belongs to E*: S U {e} is a subset of E\* => P(m + 1)
				2. Case 2: If e is not in E*: Algorithm => S U {e} has no cycle. T\* is a tree => (V, E\* U {e}) has a cycle
					1. This cycle must have an edge e' in E* - S
					2. Algorithm could have selected e or e' => weight of e is at most the weight of e'
					3. Swap e and e' in T: Let T** = (V, E\*). E** = E* - {e}
					4. T** is acyclic because removed e' from the only cycle in E* U {e}
					5. T** is connected since e' was on a cycle
					6. T** contains all vertices in G
					7. The above statements prove that T** is a spanning tree
					8. Weight T** <= Weight T* and we know T* is an MST => T** is an MST

## Lec 9 ##
1. Communication networks:
	1. Highly structured networks (not internet)
		1. Parallel computing
		2. Telephone networks
	2. Table:

			NXN Network | Diameter | Switch-Size | #Switces | Congestion
			Binary Tree | 2(1+logN)| 3x3         | 2xN - 1  | N
			2D Array    | 2N       | 2x2         | N^2      | 2
			Butterfly   | 2 + logN | 2x2         | N(1+logN)| rt(N)/rt(N/2) 
			Benes       | 1 + 2logN| 2x2         | 2NlogN   | 1
			
		1. Complete binary tree: 

						 o
					   ()
				  	  o	  
				 	 ()   
					/  \  
				  []   []	  
					 
				1. o = switch
				2. direct packets through network (fixed size - 4096 bytes say)
				3. [] = Terminal (computer say. Source & destination of data)
				
		2. Latency:
			1. It is the time required for a packet to travel from an input to an output.
		3. Diameter: Of a network is the length of the shortest path between the input and the output that are furthest apart (worst case time between input and output)
			1. Travels through root in this case
				1. Diameter = 6
				2. Internal switches are 3 x 3
					1. For ternary trees, switch size increases but path size decreases
			2. Monster switch: All inputs to one node and to all outputs
				1. But we want to use small switches and do routing (conceals the actual problem - how do we route inside the switch?)
		2. Conjestion: Everything has to go through root and if it fails, then two disjoint subtrees cannot communicate
			1. A permutation: It is a function pi {0, ..., n - 1} -> {0, ..., n - 1} such that no two numbers are mapped to the same value
				1. pi(i) = pi(j) iff i = j
				2. Example: pi(i) = N - 1 - i, pi(i) = i
			2. Permutation Routing problem for:
				1. For each i, direct the packet at Input i to Output pi(i)
			3. Path taken is denoted by P_i.pi(i)
			4. Conjestion of paths P0.pi(0),...,PN-1,pi(N-1) is equal to the largest number of paths that pass through a single switch
				1. P(i) = N - i - 1 (congestion is N)
				2. P(i) = i (congestion is 1)
			5. Max congestion = max min(solutions of all paths) congestion P0,pi(0)...PN-1,pi(N-1)
2. All inputs are connected using 2-D array

		In0 -> [] -> o -> o ...
					   |	
					   o ...
					   |
					   o ...
					   |
					   [] ...
					   Out0
					   
	1. Theorem: The congestion of N input array is 2
		1. Proof: Let pi be a permutation. P.i,pi(i) = path from Ini rightward to column pi(i) and downward to output pi(i)
			1. Switch in row i and column pi(i) transmits <= 2 packets
				1. If Pi(0) = 0, Pi(N-1) = N - 1 => Conjestion of 2 (specific example)
3. Butterfly network:

		In0 [] -> o -> o -> ... -> o -> [] Out0
		          ^    ^
	             |  x |
	             v    v  
		... [] -> o -> o -> ... -> o -> [] Out1     

	1. Labeling switches: Columns - level 0, 1, 2, ..., Rows: 000, 001, 010, 011, 100, 101, 110, 111 (binary)
	2. Switch is uniquely identified by it's row and column

			(b1,...,b_log N, l) (l is level) routes to (b1, ..., ~b_l+1,..., b_logN, l+1) or to (b1, ..., b_l+1,..., b_logN, l+1)
			
		1. (X1, ..., X_logN, 0) all the way to (Y1, ..., Y_logN, logN)

				(X1,...,X_logN, 0) -> (Y1, ..., X_logN, 1) -> (Y1, Y2, ..., X_logN, 2) -> .... -> (Y1, Y2, ..., Y_logN, logN)
				
			1. Diameter: ~ logN (actual 2 + logN)
			2. Switches: 2x2
			3. Number of switches: N(1 + logN)
			4. Congestion: sqrt(N) (if N is even) or sqrt(N/2) (if N is odd)
	3. Benes Network: Butterfly back to back (with second half reversed)

		1. ![benes_network](benes_network.jpg)
		2. It has recursive nature
			1. Two sub-networks are banes networks
		3. Theorem: The congestion of the N-input Benes network is 1, when N = 2^a for some a >= 1
			1. Proof: By induction on a: P(a) = "The theorem is true for a"
				1. Base Case: P(1): N = 2, 

						In1 [] -> o -> o -> [] Ou1
						          | x  |
						In2 [] -> o -> o -> [] Ou2
						
					1. pi(0) = 0, pi(1) = 1 (congestion is 1)
					2. pi(0) = 1, pi(1) = 0 (congestion is 1)
				2. Inductive Step: Assume P(a)
					1. If two packets must pass through different subnetworks, then there is an edge between them

							0 --- 4
							1 --- 5
							2 --- 6
							3 --- 7
							0 - - 1
							3 - - 4
							5 - - 7
							2 - - 6
							
						1. Constraint: The packet destined for Out_0 (pi(6) = 0) and the packet for Out_4 (pi(2) = 4) cannot pass through the same subnetwork.
						2. Key insight: A 2-coloring of the constraint graph (leads to best solution of the routing problem)
						3. Routing process:
							1. If a node is colored red, then direct it to the red sub-net
							2. All packets from input to output can be routed such that the entire network sees one packet at a time
							3. Proof: Recitation

## Lec 10 ##
1. Topics
	1. Euler Tours
	2. Directed graphs
		1. Definitions
		2. No of walks
		3. Strong connectivity
		4. DAGs (communication networks)
	3. Tournament Graphs
2. Euler Tours
	1. Definition: An euler tour is a walk that traverses every edge exactly once. (Un-directed graph) and starts + finishes at the same vertex
	2. Theorem: A connected graph has an Euler tour iff every vertex has even degree
		1. Proof:
			1. Two directions proof:
				1. If =>
					1. Assume G = (V, E) has an Euler tour;

							v0 - v1 - ... - vk-1 - vk = v0
							
						1. Walk where all edges are covered and covered only once
						2. Since every edge in E is traversed once
					2. Let u be a vertex that exists in the walk
						1. deg(u) = number of times u appears in the tour v0 to vk times 2 => deg(u) is even
				2. <=
					1. For G = (V, E), assume deg(v) is even for all v in V: Let W : v0 - v1 - ... - vk be the longest walk that traverses no edge more than once
					2. If vk - u not in W: 

							vo - v1 - ... - vk - u
							
						1. It is a longer walk and hence a contradiction => every edge is covered by the walk
						2. All edges incident to vk are used in W
					3. vk = v0?
						1. Proof: Proof by contradiction
							1. vk has odd degree in W (vk is in W)
							2. By 1, vk has odd degree in G. This is a contradiction to initial assumption
					4. Suppose W is not an Euler tour:
						1. We know that G is connected: so there exists an edge in E not used in W but incident to some vertex used in W. Let u - vi be this edge
							1. Let us start from u

									u - vi - ... - v0 = vk - ... - vi
									
								1. This is a longer walk which is a contradiction to the initial assumption that W is the longest walk
2. Directed graph: (digraph)
	1. ![digraph_example.png](digraph_example.png)
	2. Edge

			v2 -> v3
			tail	head
			
		1. indegree(v2) = 2
		2. outdegree(v2) = 1
	3. Theorem: Let G = (V, E) be an n-node graph with V = {v1, ..., vn}. Let A = {aij} denote the adjacency matrix for G. That is

			aij = { 1 if vi -> vj is an edge
			      { 0 if otherwise
			      
		1. Let pij^k = number of directed walks of length k from vi to vj. Then A^k = {pij^k}
			1. Example:

						v1	v2	v3
					v1	1	1	1
					v2	0	0	1	= A
					v3	0	1	0
					
				1. A^2 =

						1	2	2
						0	1	0
						0	0	1
						
				2. A^3 =

						1	3	3
						0	0	1
						0	1	0
						
			2. Proof: By induction:
				1. Let aij^k deonte the (i, j) th entry in A^k
				2. P(K): Theorem is true for k
					1. P(k) = for all i, j ai,j^k = Pi,j^k
				3. Base Case: k = 1, 
					1. Edge vi -> vj : Pij^(1) = 1 = aij^(1). This is true because there is a walk between vi and vj of length 1.
					2. No edge vi -> vj: Pij^(1) = 0 = aij^(1). This is true because there is no walk of length 1 between vi and vj
				4. Inductive Step: Assume P^(k)

						Pij^(k+1) = sigmal_j:vh->vj is edge in G Pih^(k) = sigma_h=1 to n Pih^(k) . ahj = sigma_h=1 to n aij^(k) . ahj = sigma_h=1 to n aij^(k+1) (matrix multiplication). []
						
3. Definition: A digraph G = (V, E) is strongly connected if for all vertices u, v in V, there exists a directed path from u to v in G.
4. Definition: A directed graph is called a directed acyclic graph (DAG) if it does not contain any directed cycles
	1. Scheduling
	2. Optimization
	3. Partial orderings
5. Tournament graph: Vertex - team, directed edge - who wins against whom

		E -> A
		A -> B
		C -> B
		D -> C
		C -> E
		B -> E
		E -> C
		A -> D
		B -> D
		C -> A
		
	1. Either u beats v : u -> v
	2. or v beats u : v -> u
6. Example: A -> B -> D -> E -> C (but C beats A!)
	1. It is not clear who is the best player (If one is at left)
	2. Example: C -> A -> B -> D -> E
7. Hamiltonian path: Path that goes around the graph and covers each vertex exactly once
	1. Definition: A directed hamiltonian path is a directed walk that visits every vertex exactly once.
	2. Theorem: Every tournament graph contains a directed Hamiltonian path
		1. Proof: By induction on n where P(n) = "Every tournament graph on n nodes contains a directed Hamiltonian path"
			1. Base case: n = 1 => single node is a directed Hamiltonian path
			2. Inductive step: Assume P(n)
				1. Consider a tournament graph on n + 1 nodes.
				2. Take out one node v. This gives a tournament graph on n nodes
				3. By P(n): v1 -> v2 -> ... -> vn be a Hamiltonian path
					1. Case 1: if v -> v1, then we have a Hamiltonian path
					2. Case 2: if v1 -> v, smallest i such that v -> vi where i > 1
						1. v1 -> ... -> v(i - 1) -> vi -> ... -> vn
							1. If v -> v(i - 1) then it is a contradiction
								1. v(i - 1) -> v
						2. Another way: Use largest i such that vi -> v
8. Either chicken u pecks chicken v: u -> v or we have a chicken v that pecks chicken u: v -> u. 
	1. u virtually pecks v if
		1. u -> v or
		2. there exists w such that u -> w -> v
9. A chicken that virtually pecks every other chicken, is called a king chicken
	1. Theorem: The chicken with highest outdegree is definitely a king
		1. Proof: By contradiction. Let u have highest outdegree. Suppose u is not king.
			1. There exists v such that v -> u and for all w, w -> u or v -> w
				1. if u -> w then v -> w
					1. outdegree(v) >= outdegree(u) + 1. This is a contradiction (v has higher degree in this case)

## Lec 11 ##
1. Reading: Chapter 7
2. Topics
	1. Relations
		1. Properties
	2. Equivalence relations
	3. Partial Orders
		1. Hasse diagram
		2. Total order
		3. Topological sort
	4. Parallel Task scheduling
		1. Dilworth's lemma
3. Relations:
	1. A relation from a set A to a set B is a subset R in A x B
		1. Ex: R = {(a, b) : student a is taking class b}
			1. (a, b) is in R
			2. a R b (another notation)
			3. a ~_R b (sub-script R)
	2. A relation on A is a subset R in A x A
		1. Ex: A = Z : x R y iff x C y (mod 5)
		2. Ex: A = N : x R y iff x | y
		3. Ex: A = N : x R y iff x <= y
4. Set A together with R is a directed graph:
	1. G = (V, E), where V = A, E = R

			Julie ->	Bill
			Bill -> Bill
			Rob <-> Julie
			
		1. -> : likes relationship
	2. Properties: A relation R on A is:
		1. Reflexive if x R x for all x in A
		2. Symmetric: if x R y => y R x for all x, y in A
		3. Anti-symmetrix: if x R y and y R x => x = y for x in A
		4. Transitivity: if x R y and y R z => x R z (it is transitive)
	3. Example: 
		1. x C y (mod 5) : reflextive, symmetric, not anti-symmetric (7 C 2 (mod 5), transitive (equivalence relations)
		2. x | y : reflexive, not symmetric, anti-symmetrix, transitive (partial orders)
		3. x <= y : reflexive, not symmatric, anti-symmatrix, transitive
5. Equivalence relation: An equivalence relation is reflexive, symmatric and transitive
	1. Ex: quality (=) itself, x C y (mod n)
	2. Equivalence class of x in A is the set of all elements in A related to x by R: denoted by [x]
		1. Ex: x C y (mod 5)
			1. [7] = {..., -3, 2, 7, 12, 17, 22, ...}
			2. [7] = [12] = [17] = ...
6. A partition of A is a collection of disjoint non-empty sets A1, ..., An (which are subsets of A), whose union is A
	1. Ex: {..., -5, 0, 5, 10, ...}
	2. Ex: {..., -4, 1, 6, 11, ...} (x C 1 (mod 5))
	3. Ex: {..., -3, 2, 7, 17, ...}
	4. Ex: {..., -2, 3, 8, 13, ...}
	5. Ex: {..., -1, 4, 9, 14, ...} (if you add 1 to each element, we get the first equivalence class)
	6. The equivalence classes are partition of Integers
7. Theorem: The equivalence class of an equivalence relation on a set A form a partition of A
8. A relation is a (weak) partial order if it is reflexive, anti-symmetric and transitive
	1. strong - ir-reflexivity
9. A partial order relation is denoted with <= instead of R (we can give ranking to elements)
	1. Ex: (A, <=) is called a partially ordered set or poset
	2. A poset is a directed graph with vertex set A and edge set <= (<= is a set of tuples (pairs))
	3. Example:
	
			underwear -> pants
			shirt -> pants -> belt -> Jacket
			pants -> right shoe
			pants -> left shoe
			shirt -> tie -> jacket
			right sock -> right shoe
			left sock -> left shoe
			
		1. Hasse Diagram
			1. Or else due to transitivity, there are edges from previous to next item (which are ignored in Hasse diagram)
			
					uderwear -> belt
					...
			
			2. A Hasse diagram for a poset (A, <=) is a directed graph in which vertex set A and edge set <= minus
				1. all self loops
				2. all edges implied by transitivity
		2. Theorem: A poset has no directed cycles other than self loops
			1. Proof: By contradiction:
				1. Suppose there exists n >= 2 distinct elements a1, ..., an such that
				
						a1 <= a2 <= a3 <= ... <= an <= a1
						
					1. Since a1 <= a2 <= a3 => a1 <= a3
					2. Since a3 <= a4 => a1 <= a4
						1. Use induction to prove: a1 <= an
						2. But an <= a1 but a1 != an. This is a contradiction
		3. So deleting self loops from a poset, makes a directed acyclic graph (DAG)
		4. Why is it called as partial order? Since certain elements cannot be compared to the others
			1. Right sock cannot be compared to shirt
		5. Definition: a and b are incomparable if neither a <= b nor b <= a.
		6. Definition: a and b are comparable if a <= b or b <= a.
		7. Definition: 
			1. Total order: A total order is a partial order in which every pair of elements is comparable
				1. It is a straight line graph
					1. Finite line or
					2. Infinite line (or semi infinite line)
10. A total order is consistent with a partial order, it is called a topological sort.
	1. A topological sort of a poset (A, <=) is a total order (A, <=_T) (subscript) such that <= is a subset of <=_T (if x <= y then x <=_T y)
		1. Theorem: Every finite poset has a topological sort
		2. Definition: x in A is minimal if it is not true that there exists a y in A, y != x, such that y <= x
		3. Definition: x in A is maximal if it is not true that there exists a y in A, y != x, such that x <= y
		4. If it is infinite poset (Z, <=) there does not exist a minimal element (because we can always find a smaller element)
11. Lemma: Every finite poset has a minimal element:
	1. Definition: A chain is a sequence of distinct elements such that a1 <= a2 <= a3 <= ... <= at (t is the length)
	2. Proof: let a1 <= a2 <= ... <= an be a maximum length chain (how? well ordering principle can be used to prove this)
		1. Case 1: a is not in {a1, a2, ..., an}: if a <= a1, then we get a longer chain which is a contradiction => a is not <= a1
		2. Case 2: a is in {a1, a2, ..., an}: if a <= a1, then we have a cycle which is a contradiction => a is not <= a1
		3. Therefore a1 is minimal

## Lec 12 ##
1. Loan: student, home
	1. Annuity - financial instrument
		1. That pays a fixed amount of money every year for some number of years (there is a value associated with it)
		2. student loan: it is the value the bank gave you
			1. Every month or year we pay back
	2. We want to know whether we will get back money for the money we pay every month for certain number of years in the future
2. Definition: An n-year \$m-payment annuity pays \$m at the start of each year for n years (m can be finite or infinite)
3. Assumption: Fixed increase rate p
	1. \$1 today = \$(1 + p) in 1 year
	2. ,, = \$(1 + p)^2 in 2 years
	3. ...
4. \$(1/(1 + p)) = \$1 in a year
5. \$(1/(1 + p)^2) = \$1 in 2 years
6. Current value vs Payments
	1. \$m	= \$m
	2. \$(m/(1 + p)) = \$m in 1 year
	3. \$(m/(1 + p)^2) = \$m in 2 years
	4. ...
	5. \$(m/(1 + p)^(n - 1)) = \$m in n - 1 years
7. V = sigma_i=0 to n - 1 of m/(i + p)^i = Total current value

		V = m sigma_i=0 to n - 1 of x^i = m (1 - x^n)/(1 - x)
		
	1. Theorem: for all n >=1, x != 1, sigma_i = 0 to n - 1 of x^i = (1 - x^n)/(1 - x)
8. Perturbation method:
	1. S = 1 + x + x^2 + ... + x^(n - 1)
	2. Perturb
		1. xS = x + x^2 + ... + x^(n - 1) + x^n
	3. Subtract:

			(1 - x)S = 1 - x^n
			S = (1 - x^n)/(1 - x)
			
9. V = m (1 - x^n)/(1 - x)

		V = m (1 - (1/(1 + p))^n)/(1 - (1/(1 + p)))
		  = m (1 + p - (1/(1 + p)^(n - 1))/p
		  
	1. For m = $50k, n = 20, p = 0.6
	2. V = $607,906 (bigger p gets, the lesser it is worth)
10. Claim: If n = infinity, then V = m(1 + p)/p
	1. Proof:

			lim n -> infinity of m(1 + p - 1/(1 + p)^(n - 1))/p = m(1 + p)/p
			
		1. For m = \$50, n = 20, p = 0.6, V = \$833,333
10. Corollary: If |x| < 1, sigma_i = 0 to infinity x^i = 1/(1 - x)
	1. Proof: lim_x -> infinity of (1 - x^n)/(1 - x) (x^n = 0 if x < 1)
		1. 1/(1 - x)
	2. This is Geometric series
		1. Usually be close to the largest term
11. Complex sums: Perturbation method
	1. sigma_i = 1 to n of ix^i = x + 2x^2 + 3x^3 + ... + nx^n
	
			S = x + 2x^2 + 3x^3 + ... + nx^n
			xS =     x^2 + 2x^3 + .... + (n - 1)x^n + nx^(n+1)
			(1 - x)s = x + x^2 + x^3 + ... + x^n - nx^(n + 1)
			(1 - x)s = (1 - x^(n + 1))/(1 - x) - 1 - nx^(n + 1) = (x - (n + 1)x^(n + 1) + nx^(n + 2))/(1 - x)^2
12. Complex sums: Derivative method
	1. For x != 1, sigma_i = 0 to n x^i = (1 - x^(n + 1))/(1 - x)
	2. sigma_i = 0 to n of ix^(i - 1) = (1 - (n + 1)x^n + nx^(n + 1))/(1 - x)^2
	3. simga_i = 0 to n of ix^i = (x - (n + 1)x^(n + 1) + nx^(n + 2))/(1 - x)^2
	4. Theorem: If |x| < 1, sigma_i = 0 to infinity of ix^i = x/(1 - x)^2
		1. Value of a company grows my \$m (\$m gets added to profit every year)
			1. Ex: An annuity that pays $im at the end of year i (i = 1, 2, 3, ...) is worth

					m(1/(1 + p))/(1 - (1/(1 + p))^2 = m(1 + p)/p (sigma_i = 1 to infinity im (1/(1 + p)^i)
					
				1. m = \$50k, p = 0.06, V = \$14,722,222
				2. Geometric decrease diminishes linear growth
13. sigma_i = 1 to infinity i2^(-i) = 1/2 + 1/4 + 3/8 + 4/16 + ... = 1/2(1 - 1/2)^2 = 2
14. Arithmetic sums:
	1. sigma_i = 0 to n i = n(n + 1)/2
	2. sigma_i = 0 to n i^2 = n(n + 1)(2n + 1)/6
		1. Derivation: Guess that the sum is a cubic polynomial
			1. Guess: for all n, sigma_i = 1 to n i^2 = an^3 + bn^2 + cn + d
				1. Plugin: n = 0 => S = 0 = d
				2. Plugin: n = 1 => S = 1 = a + b + c + d
				3. Plugin: n = 2 => S = 5 = 8a + 4b + 2c + d
				4. Plugin: n = 3 => S = 14 = 27a + 9b + 3c + d
			2. Solve the system of equations:
				1. a = 1/3, b = 1/2, c = 1/6, d = 0
		2. To ensure the guess is right, use induction to prove it
15. Sum first n square roots: No closed form expression
	1. sigma_i = 1 to n of sqrt(i)
	2. Method: Using integration bounds
		1. for increasing series:
			1. sigma_i = 1 to n of f(i) when f is a positive increasing function.
				1. sigma_i = 1 to n of f(i) >= f(1) + integral_1 to n of f(x)dx
				2. sigma_i = 1 to n of f(i) <= f(n) + integral_1 to n of f(x)dx
					1. Slide area left by 1 unit - the area does not change (same integral)
						1. integral_x = 0 to n - 1 of f(x + 1)dx
	3. 

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