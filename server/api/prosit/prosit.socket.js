/**
 * Broadcast updates to client when the model changes
 */

'use strict';

var Prosit = require('./prosit.model');

exports.register = function (socket) {
    Prosit.schema.post('save', function (doc) {
        onSave(socket, doc);
    });
    Prosit.schema.post('remove', function (doc) {
        onRemove(socket, doc);
    });
};

function onSave(socket, doc, cb) {
    console.log(doc);
    socket.emit('prosit:save', doc);
}

function onRemove(socket, doc, cb) {
    socket.emit('prosit:remove', doc);
}

//function onUpdate(socket, doc, cb) {
//    socket.emit('prosit:update', doc);
//}