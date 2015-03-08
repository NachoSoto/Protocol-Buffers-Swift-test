const express = require('express');
const app = express();

const ProtoBuf = require('protobufjs');
const FOLDER = '../Proto/generated/javascript/';

app.get('/', function (req, res) {
    res.send('Test');
});

const server = app.listen(3000, function () {
    var host = server.address().address;
    var port = server.address().port;

    console.log('Example app listening at http://%s:%s', host, port)
});