var fs = require('fs');
var os = require('os');
fs.writeFile("/tmp/myfile", "Hey there!", function(err) {
    if(err) {
        return console.log(err);
    }

 //   console.log("The file was saved!");
}); 
// Load the http module to create an http server.
var http = require('http');

// Configure our HTTP server to respond with Hello World to all requests.
var server = http.createServer(function (request, response) {
  response.writeHead(200, {"Content-Type": "text/plain"});
  response.end("Hello World from "+os.hostname()+"\n");
});

// Listen on port 8000, IP defaults to 127.0.0.1
server.listen(8000, "192.168.100.30");

// Put a friendly message on the terminal
//console.log("Server running at http://127.0.0.1:8000/");
