var http = require('http');
var messages = [
    'Hello World',
    'From a basic Node.js server',
    'Take Luck'
];
http.createServer(function (req, res) {
    res.setHeader("Content-Type", "text/html");
    res.writeHead(200);
    res.write('<html><head><title></title></head>');
    res.write('<body>');
    for (var idx in messages) {
        res.write('\n<h1>' + messages[idx] + '</h1>');
    }
    res.end('\n</body></html>');
}).listen(8080, 'localhost', function () {
    console.log('Server started at: http://localhost:8080');
});