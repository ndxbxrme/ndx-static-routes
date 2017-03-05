(function() {
  'use strict';
  module.exports = function(ndx) {
    return setImmediate(function() {
      if ((process.env.NODE_ENV || ndx.settings.NODE_ENV) === 'production') {
        ndx.app.use('/app', ndx["static"]('./dist/app'));
        ndx.app.use('/public', ndx["static"]('./public'));
        return ndx.app.all('/*', function(req, res) {
          return res.sendFile('index.html', {
            root: './dist'
          });
        });
      } else {
        ndx.app.use('/public', ndx["static"]('./public'));
        ndx.app.use('/bower', ndx["static"]('./bower'));
        ndx.app.use('/build/client', ndx["static"]('./build/client'));
        return ndx.app.all('/*', function(req, res) {
          return res.sendFile('index.html', {
            root: './build/client'
          });
        });
      }
    });
  };

}).call(this);

//# sourceMappingURL=index.js.map
