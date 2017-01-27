'use strict'

module.exports = (ndx) ->
  if (process.env.NODE_ENV or ndx.settings.NODE_ENV) is 'live'
    ndx.app.use '/app', ndx.static('./dist/app')
    ndx.app.use '/public', ndx.static('./public')
    ndx.app.use '/favicon', ndx.static('./favicon')
    ndx.app.all '/*', (req, res) ->
      res.sendFile 'index.html', root: './dist'
  else
    ndx.app.use '/scripts', ndx.static('./build/client/scripts')
    ndx.app.use '/images', ndx.static('./build/client/images')
    ndx.app.use '/styles', ndx.static('./build/client/styles')
    ndx.app.use '/views', ndx.static('./build/client/views')
    ndx.app.use '/public', ndx.static('./public')
    ndx.app.use '/favicon', ndx.static('./favicon')
    ndx.app.use '/bower', ndx.static('./bower')
    ndx.app.use '/build/client', ndx.static('./build/client')
    ndx.app.all '/*', (req, res) ->
      res.sendFile 'index.html', root: './build/client'