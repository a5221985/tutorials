# Garbage Collection in Java #
https://www.youtube.com/watch?v=UnaNQgzw4zY

1. Before Java
	1. Programmer had to allocate and de-allocate memory
		1. Using
			1. `malloc()`, `realloc()`, `calloc()`
			2. `free()`
			3. `new` and destructors
		2. We are responsible for freeing memory
			1. If not, it causes memory leaks
				1. Programmers need to worry about these things
	2. Java came with automatic memory management
		1. Other modern languages also come with this feature
			1. It works on hypothesis
				1. Most objects soon become unreachable
					1. Objects usually are created in the context of if block or method
						1. These can be garbage collected