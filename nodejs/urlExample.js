var url = require('url');
var urlStr = 'http://user:pass@host.com:80/resource/path?query=string#hash';
var urlObj = url.parse(urlStr, true, false);
urlString = url.format(urlObj);
console.log(JSON.stringify(urlObj, null, 4));
console.log(JSON.stringify(urlString));

var originalUrl = 'http://user:pass@host.com:80/resource/path?query=string#hash';
var newResource = '/another/path?querynew';
console.log(url.resolve(originalUrl, newResource));

var qstring = require('querystring');
var params = qstring.parse("naem=Brad&color=red&color=blue");
console.log(JSON.stringify(params, null, 4));