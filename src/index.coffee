'use strict'

express = require 'express'



module.exports = (ndx) ->
  ndx.app.use '/scripts', express.static('./build/client/scripts')
  ndx.app.use '/images', express.static('./build/client/images')
  ndx.app.use '/styles', express.static('./build/client/styles')
  ndx.app.use '/views', express.static('./build/client/views')
  ndx.app.use '/public', express.static('./public')
  ndx.app.use '/favicon', express.static('./favicon')
  ndx.app.use '/bower', express.static('./bower')
  ndx.app.use '/build/client', express.static('./build/client')
  ndx.app.all '/*', (req, res) ->
    res.sendFile 'index.html', root: './build/client'