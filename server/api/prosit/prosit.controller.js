'use strict';

var _ = require('lodash');
var Prosit = require('./prosit.model');

// Get list of prosits
exports.index = function(req, res) {
  Prosit.find(function (err, prosits) {
    if(err) { return handleError(res, err); }
    return res.json(200, prosits);
  });
};

// Get a single prosit
exports.show = function(req, res) {
  Prosit.findById(req.params.id, function (err, prosit) {
    if(err) { return handleError(res, err); }
    if(!prosit) { return res.send(404); }
    return res.json(prosit);
  });
};

// Creates a new prosit in the DB.
exports.create = function(req, res) {
  Prosit.create(req.body, function(err, prosit) {
    if(err) { return handleError(res, err); }
    return res.json(201, prosit);
  });
};

// Updates an existing prosit in the DB.
exports.update = function(req, res) {
  if(req.body._id) { delete req.body._id; }
  Prosit.findById(req.params.id, function (err, prosit) {
    if (err) { return handleError(res, err); }
    if(!prosit) { return res.send(404); }
    var updated = _.merge(prosit, req.body);
    updated.save(function (err) {
      if (err) { return handleError(res, err); }
      return res.json(200, prosit);
    });
  });
};

// Deletes a prosit from the DB.
exports.destroy = function(req, res) {
  Prosit.findById(req.params.id, function (err, prosit) {
    if(err) { return handleError(res, err); }
    if(!prosit) { return res.send(404); }
    prosit.remove(function(err) {
      if(err) { return handleError(res, err); }
      return res.send(204);
    });
  });
};

function handleError(res, err) {
  return res.send(500, err);
}