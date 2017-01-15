'use strict'

gzippo = require 'gzippo'



module.exports = (ndx) ->
  ndx.app.use '/scripts', gzippo.staticGzip './build/client/scripts'
  ndx.app.use '/images', gzippo.staticGzip './build/client/images'
  ndx.app.use '/styles', gzippo.staticGzip './build/client/styles'
  ndx.app.use '/views', gzippo.staticGzip './build/client/views'
  ndx.app.use '/public', gzippo.staticGzip './public'
  ndx.app.use '/favicon', gzippo.staticGzip './favicon'
  ndx.app.use '/bower', gzippo.staticGzip './bower'
  ndx.app.use '/build/client', gzippo.staticGzip './build/client'
  ndx.app.all '/*', (req, res) ->
    res.sendFile 'index.html', root: './build/client'