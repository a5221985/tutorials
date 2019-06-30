# Arrays #
1. `static <T> List<T> asList(T... a)` - returns fixed-size list (backed by the original array)
2. `static int binarySearch(<type>[] a, <type> key)`
3. `static <type>[] copyOf(<type>[] original, int newLength)` - returns a copy (truncates or pads with default value if required until copy has the given length)
4. `static <type> copyOfRange(<type>[] original, int from, int to)` - returns a copy of specified range of elements from the original array
5. `static <type> deepEquals(Object[] a1, Object[] a2)` - returns `true` if two arrays are deeply equal to each other
6. `static int deepHashCode(Object[] a)` - returns hash code based on "deep contents" of the array
7. `static String deepToString(Object[] a)` - returns string representation of "deep contents" of the array
8. `static <type> equals(<type>[] a, <type>[] a2)`
9. `static void fill(<type>[] a, <type> val)` - Assigns specified value to each element of the array
10. `static int hashCode(<type>[] a)`
11. `static void parallelPrefix(<type>[] array, DoubleBinaryOperator op)` - Uses supplied function to cumulate each element in parallel
	1. Example: Input - [2.0, 1.0, 0.0, 3.0], Output - [2.0, 3.0, 3.0, 6.0] (if op is addition)
	2. `DoubleBinaryOperator` - represents operation on two double values and returns a double
		1. `applyAsDouble(double left, double right)` - operation to be implemented

12. `static void parallelSetAll(<type>[] array, IntToDoubleFunction generator)` - set all elements in parallel using provided generator function (used to compute each element)
13. `static void parallelSort(<type>[] a)` - sorts specified array into ascending numerical order
14. `setAll(<type>[] array, IntToDoubleFunction generator)` - Non parallel version of `parallelSetAll`
15. `sort(<type>[] a)` - non parallel version of `parallelSort`
16. `spliterator(<type>[] array)` - Returns `Spliterator.OfDouble` covering all specified array
	1. Iterator used to iterate elements one-by-one from a List implemented object
		1. How is it different from iterator?
			1. Supports parallel programming
			2. Supports both sequential and parallel processing of data
			3. Better performance
			4. Supports both Collection and **Stream** API
			5. Not a universal iterator (unlike iterator)
		2. Example:

				List<String> names = new ArrayList<>(Arrays.asList("A", "B", "C"));

				Spliterator<String> s = names.spliterator();

				s.forEachRemaining(System.out::println);

17. `stream(<type>[] array)` - returns sequential `<Type>Stream` with the `array` as source
18. `toString(<type>[] a)` - returns spring representation of specified array `a`

# Stream API #
1. This contains classes that support functional style operations on streams of elements (map-reduce transformations on collections)
2. Interfaces:
	1. `BaseStream<T, S extends BaseStream<T, S>>` - base interface for streams, supports sequential and parallel aggregate operations
	2. `Collector<T, A, R>` - 