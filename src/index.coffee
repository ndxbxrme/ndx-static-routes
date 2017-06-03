'use strict'

module.exports = (ndx) ->
  setImmediate ->
    if (process.env.NODE_ENV or ndx.settings.NODE_ENV) is 'production'
      ndx.app.use '/app', ndx.static './dist/app'
      ndx.app.use '/public', ndx.static './public'
      ndx.app.all '/*', (req, res) ->
        res.sendFile 'index.html', root: './dist'
    else
      ndx.app.use '/public', ndx.static './public'
      ndx.app.use '/bower_components', ndx.static './bower_components'
      ndx.app.use '/bower', ndx.static './bower'
      ndx.app.use '/build/client', ndx.static './build/client'
      ndx.app.all '/*', (req, res) ->
        res.sendFile 'index.html', root: './build/client'