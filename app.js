'use strict';
let http = require('http');
let express = require('express');
let app = express();
let port = process.env.PORT || 3000;
let host = process.env.HOST || "0.0.0.0";
app.use(express.static(__dirname + '/public'));
let server = http.Server(app);
let io = require('socket.io')(server);

function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

io.sockets.on('connection', (socket) => {
  setInterval(() => {
    let recData = getRandomInt(50, 100);
		let tataData = getRandomInt(75, 150);
		let gailData = getRandomInt(25, 125);
		io.sockets.emit('tickerData', [
			{rdata: recData},
			{tdata: tataData},
			{gdata: gailData}
		]);
	}, 1000);
});

server.listen(port, host, ()=>{
	console.log("Server is Running at",host+":"+port);
});