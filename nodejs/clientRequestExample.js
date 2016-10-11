var http = require('http');
var options = {
    hostname: 'www.google.com',
    path: '/',
    method: 'GET'
};

var req = http.request(options, function(response) {
    var str = '';
    response.on('data', function(chunk) {
        str += chunk;
    });
    response.on('end', function() {
        console.log(str); 
    });
});