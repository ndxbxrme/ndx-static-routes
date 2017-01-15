(function() {
  'use strict';
  var gzippo;

  gzippo = require('gzippo');

  module.exports = function(ndx) {
    ndx.app.use('/scripts', gzippo.staticGzip('./build/client/scripts'));
    ndx.app.use('/images', gzippo.staticGzip('./build/client/images'));
    ndx.app.use('/styles', gzippo.staticGzip('./build/client/styles'));
    ndx.app.use('/views', gzippo.staticGzip('./build/client/views'));
    ndx.app.use('/swf', gzippo.staticGzip('./build/client/swf'));
    ndx.app.use('/fonts', gzippo.staticGzip('./fonts'));
    ndx.app.use('/favicon', gzippo.staticGzip('./favicon'));
    ndx.app.use('/bower', gzippo.staticGzip('./bower'));
    ndx.app.use('/build/client', gzippo.staticGzip('./build/client'));
    return ndx.app.all('/*', function(req, res) {
      return res.sendFile('index.html', {
        root: './build/client'
      });
    });
  };

}).call(this);

//# sourceMappingURL=index.js.map
