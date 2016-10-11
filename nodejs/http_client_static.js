var http = require('http');
var options = {
    hostname: 'localhost',
    port: '8080',
    path: '/static/simple_static_page.html'
};
function handleResponse(response) {
    var serverData = '';
    response.on('data', function (chunk) {
        serverData += chunk;
    });
    response.on('end', function () {
        console.log(serverData);
    });
}
http.request(options, function(response) {
   handleResponse(response); 
}).end();