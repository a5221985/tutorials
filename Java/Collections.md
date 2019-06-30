# Java Collections #
## BitSet ##

1. package `java.util`
2. An array of bits is defined which is represented by boolean values
3. Constructors
	1. `BitSet()` - for empty BitSet object
	2. `BitSet(int no_Of_Bits)` - defines initial size of integer argument (number of bits)

### API ###
1. `void and(BitSet set)` - logical AND of the two bitsets
2. `void andNot(BitSet set)` - clears bits if second bitset has bits set
3. `int cardinality()` - returns number of bits set to true
4. `void clear()` - sets all bits to `false`
5. `void clear(int bitIndex)` - sets bit specified by index to false
6. `void clear(int fromIndex, int toIndex)` - sets bits from specified `fromIndex` (inclusive) to specified `toIndex` (exclusive) to `false`
7. `Object clone()` - new bitset equal to the bitset
8. `boolean equals(Object obj)` - compares object against specified object
9. `void flip(int bitIndex)` - sets to complement of it's current value
10. `void flip(int fromIndex, int toIndex)` - sets bits to complement of their current values
11. `boolean get(int bitIndex)` - returns value of bit with specified index
12. `BitSet get(int fromIndex, int toIndex)` - returns new `BitSet` from `fromIndex` to `toIndex`
13. `int hashCode()` - hash code for the bit set
14. `boolean intersects(BitSet set)` - returns true if `BitSet` has any bits set to `true` that are also set to true in this set
15. `isEmpty()` - return `true` if no bit is set to `true`
16. `length()` - returns logical size of `BitSet` (highest set bit + 1)
17.  `nextClearBit(int fromIndex)` - returns index of first bit set to `false` that occurs on or after specified starting index