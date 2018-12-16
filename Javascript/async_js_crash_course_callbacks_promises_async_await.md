# Async JS Crash Course - Callbacks, Promises, Async Await #
## Callbacks ##
1. Promises - introduced in ES6
2. Async/Await - introduced in ES7
	1. More elegant
	2. Looks like synchronous programming
3. Promise.All - call all promises at the same time
4. Example:
	1. index.html

			<!DOCTYPE html>
			<html lang="en">	
				<head>
					<meta charset="UTF-8">
					<meta name="viewport" content="width=device-width,initial-scale=1.0">
					<meta http-equiv="X-UA-Compatible" content="ie=edge">
					<title>Async JS</title>
				</head>
				<body>
					<script src="callbacks.js"></script>
				</body>
			</html>
			
	2. callbacks.js

			const posts = [
				{ title: 'Post One', body: 'This is post one' },
				{ title: 'Post Two', body: 'This is post two' }
			];
			
			function getPosts() {
				setTimeout(() => {
					let output = '';
					posts.forEach((post) => {
						output += `<li>${post.title}</li>`;
					});
					document.body.innerHTML = output;
				}, 1000);
			}
			
			function createPost(post) {
				setTimeout(() => {
					posts.push(post);
				}, 2000);
			}
			
			getPosts();
			
			createPost({ title: 'Post Three', body: 'This is post three' });
			
		1. DOM gets painted only once and we may not see post 3
5. Example: Using callback

		function createPost(post, callback) {
			...
			posts.push(post);
			callback();
		}
		...
		createPost(..., getPosts);
		
6. Promises

		function createPost(post) {
			return new Promise((resolve, reject) => {
				setTimeout(() => {
					posts.push(post);
					
					const error = false;
					
					if (!error) {
						resolve();
					} else {
						reject('Error: Something went wrong');
					}
				}, 2000);
			});
		}
		
		createPost(...)
			.then(getPosts)
			.catch(err => console.log(err));
			
		// Promise.all
		const promise1 = Promise.resolve('Hello World');
		const promise2 = 10;
		const promise3 = new Promise((resolve, reject) => setTimeout(resolve, 2000, 'Goodbye'));
		const promise4 = fetch('https://jsonplaceholder.typicode.com/users').then(res => res.json());
		
		Promise.all([promise1, promise2, promise3, promise4]).then((values) => console.log(values)); // takes as long as the longest promise
		
7. Async

		// Async / Await
		async function init() {
			await createPost(...);
			getPosts();
		}
		
		init();
		
		// Async / Await / Fetch
		async function fetchUsers() {
			const res = await fetch('https://jsonplaceholder.typicode.com/users');
			
			const data = await res.json();
			console.log(data);
		}
		
		fetchUsers();