# socket.io #
## Get Started: Chat application ##
1. No prior knowledge of Node.js or Socket.IO

## Introduction ##
1. Writing chat apps with app stacks like LAMP is hard
	1. Involves polling server for changes
	2. Keeping track of timestamps
	3. It is slower
2. Solution: Sockets
	1. Sockets provide bidirectional communication channel between client and server
		1. Server can push messages to clients
			1. When we write a chat message, server will get it and push it to all other connected clients

## The web framework ##
1. Simple HTML webpage serves out a form and list a few messages
	1. `express`
2. `package.json`
	
		{
			"name": "socket-chat-example",
			"version": "0.0.1",
			"description": "my first socket.io app",
			"dependencies": {}
		}

	1. `npm install --save express@4.15.2`
3. `index.js`

		var app = require('express')();
		var http = require('http').Server(app);

		app.get('/', function (req, res) {
			res.send('<h1>Hello world</h1>');
		});

		http.listen(3000, function () {
			console.log('listening on *:3000');
		});

	1. Express initializes `app` to a function handler that can be supplied to HTTP server
	2. Route handler is defined for `/` that gets called when we hit website home
	3. Make http server listen on port 3000
	4. `node index.js`
		1. `http://localhost:3000`

## Serving HTML ##
1. `index.html` - served using node server

		app.get('/', function (req, res) {
			res.sendFile(__dirname + '/index.html');
		});

		<!doctype html>
		<html>
			<head>
				<title>Socket.IO chat</title>
				<style>
					* { margin: 0; padding: 0; box-sizing: border-box; }
					body { font: 13px Helvetica, Arial; }
					form { background: #000; padding: 3px; position: fixed; bottom: 0; width: 100%; }
					form input { border: 0; padding: 10px; width: 90%; margin-right: .5%; }
					form button { width: 9%; background: rgb(130, 224, 255); border: none; padding: 10px; }
					#messages { list-style-type: none; margin: 0; padding: 0; }
					#messages li { padding: 5px 10px; }
					#messages li:nth-child(odd) { background: #eee; }
				</style>
			</head>
			<body>
				<ul id="messages"></ul>
				<form action="">
					<input id="m" autocomplete="off" /><button>Send</button>
				</form>
			</body>
		</html>

## Integrating Socket.IO ##
1. Socket.IO has two parts
	1. Server that integrates with (or mounts on) Node.JS HTTP Server: `socket.io`
	2. Client library that loads on browser side: `socket.io-client`
2. Installation: `socket.io` serves client automatically for us
	1. `npm install --save socket.io`
3. index.js

		var app = require('express')();
		var http = require('http').Server(app);
		var io = require('socket.io')(http);

		app.get('/', function (req, res) {
			res.sendFile(__dirname + 'index.html');
		});

		io.on('connection', function (socket) {
			console.log('a user connected');
		});

		http.listen(3000, function () {
			console.log('listening on *:3000');
		});

	1. An instance of `socket.io` was created by passing `http` (HTTP server object).
	2. We listen on `connection` event for incoming sockets and log it to console
4. index.html - before `</body>`

		<script src="/socket.io/socket.io.js"></script>
		<script>
			var socket = io();
		</script>

	1. Loads `socket.io-client` and exposes `io` global and then connect
		1. No URL when calling `io()` because it defaults to connecting to host that serves the page
			1. Open multiple tabs to connect multiple times
5. Each socket fires a disconnect event:

		io.on('connection', function (socket) {
			console.log('a user connected');
			socket.on('disconnect', function () {
				console.log('user disconnected');
			});
		});

	1. Refresh the tab several times

## Emitting events ##
1. With `socket.io` we can send and receive any events we want with any data we want
	1. Objects encoded as JSON will do
	2. Binary data is supported
2. Example: When user types in a message, server gets it as a `chat message` event.
	1. index.html

			<script src="/socket.io/socket.io.js"></script>
			<script src="https://code.jquery.com/jquery-1.11.1.js"></script>
			<script>
				$(function () {
					var socket = io();
					$('form').submit(function () {
						socket.emit('chat message', $('#m').val());
						$('#m').val('');
						return false;
					});
				});
			</script>
	
	2. index.js

			io.on('connection', function(socket) {
				socket.on('chat message', function (msg) {
					console.log('message: ' + msg);
				});
			});

## Broadcasting ##
1. `io.emit` - used to send event to everyone

		io.emit('some event', { for: 'everyone' });

2. To send message to everyone except certain socket: `broadcast`

		io.on('connection', function (socket) {
			socket.broadcast.emit('hi');
		});

3. Sending message to everyone including sender (on server):

		io.on('connection', funciton (socket) {
			socket.on('chat message', function (msg) {
				io.emit('chat message', msg);
			});
		});

4. On client side, we can capture `chat message` event

		<script>
			$(function () {
				var socket = io();
				$('form').submit(function () {
					socket.emit('chat message', $('#m').val());
					$('#m').val('');
					return false;
				});
				socket.on('chat message', function (msg) {
					$('#messages').append($('<li>').text(msg));
				});
			});

## Homework ##
1. Ideas to improve the application
	1. Broadcast a message to connected users when someone connects or disconnects
	2. Add support for nicknames
	3. Don't send the same message to the user that sent it himself. Instead, append the message directly as soon as he presses enter
	4. Add "{user} is typing" functionality
	5. Show who's online
	6. Add private messaging
	7. Share your improvements!
 
## Getting this example ##
1. [git clone https://github.com/socketio/chat-example.git](https://github.com/socketio/chat-example.git)

## Applications ##
1. Real-time analytics: Push data to clients that gets represented as real-time counters, chars or logs
2. Binary streaming: Starting in 1.0, it's possible to send any blob back and forth: image, audio, vido.
3. Instant messaging and chat: Socket.IO's "Hello world" is a chat app in just a few lines of code
4. Document collaboration: Allow users to concurrently edit a document and see each other's changes.