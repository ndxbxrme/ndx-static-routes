(function() {
  'use strict';
  var express;

  express = require('express');

  module.exports = function(ndx) {
    ndx.app.use('/scripts', express["static"]('./build/client/scripts'));
    ndx.app.use('/images', express["static"]('./build/client/images'));
    ndx.app.use('/styles', express["static"]('./build/client/styles'));
    ndx.app.use('/views', express["static"]('./build/client/views'));
    ndx.app.use('/public', express["static"]('./public'));
    ndx.app.use('/favicon', express["static"]('./favicon'));
    ndx.app.use('/bower', express["static"]('./bower'));
    ndx.app.use('/build/client', express["static"]('./build/client'));
    return ndx.app.all('/*', function(req, res) {
      return res.sendFile('index.html', {
        root: './build/client'
      });
    });
  };

}).call(this);

//# sourceMappingURL=index.js.map
