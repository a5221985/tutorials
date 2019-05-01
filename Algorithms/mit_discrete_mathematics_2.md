## Definitions ##
1. The value of (P OR Q) is T iff P is T, or Q is T, or both are T.
	1. Truth table for OR

			P Q P or Q
			T T T
			T F T
			F T T
			F F F
			
2. The value of (P XOR Q) is T iff exactly one of P and Q is T.
	1. Truth table for XOR
	
			P Q P XOR Q
			T T F
			T F T
			F T T
			F F F
			
3. The value of (P AND Q) is T iff both P and Q are T.
	1. Truth table for AND

			P Q P AND Q
			T T T
			T F F
			F T F
			F F F
			
4. The value of NOT(P) is T iff the value of P is F
	1. Truth table for NOT

			P NOT P
			T F
			F T
			
## Other Applications ##
1. Java logical expressions

		if ((x > 0) || (x <= 0 && y > 100))
			...
			
2. Digital logic

		bar_over(X) ::= NOT(X)
		1 := T (high voltage)
		0 := F (low voltage)
		. ::= AND
		+ ::= OR

## Binary ##
1. 39 is 100111
2. 28 is 011100

		 100111
		 011100
		 ------
		1000011
		
## Digital Logic ##
1. Ripple carry
	1. Adder:
		1. Each module returns result and carry
		2. Carry is input to the next module