var fs = require('fs');
var http = require('http');
var url = require('url');
var ROOT_DIR = 'html';
http.createServer(function(request, response) {
    var urlObj = url.parse(request.url, true, false);
    fs.readFile(ROOT_DIR + urlObj.pathname, function(err, data) {
        if (err) {
            response.writeHead(404);
            response.end(JSON.stringify(err));
            return;
        }
        response.writeHead(200);
        response.end(data);
    });
}).listen(8080, 'localhost', function() {
    console.log('Server Started at: http://localhost:8080');
});